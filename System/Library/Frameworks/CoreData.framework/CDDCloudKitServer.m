@implementation CDDCloudKitServer

- (CDDCloudKitServer)initWithListener:(id)a3 configuration:(id)a4
{
  CDDCloudKitServer *v6;
  NSXPCListener *v7;
  id v8;
  CDDCloudKitServerConfiguration *configuration;
  NSString *machServiceName;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CDDCloudKitServer;
  v6 = -[CDDCloudKitServer init](&v12, sel_init);
  if (v6)
  {
    v6->_configuration = (CDDCloudKitServerConfiguration *)objc_msgSend(a4, "copy");
    if (a3)
    {
      v7 = (NSXPCListener *)a3;
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3B58]);
      configuration = v6->_configuration;
      if (configuration)
        machServiceName = configuration->_machServiceName;
      else
        machServiceName = 0;
      v7 = (NSXPCListener *)objc_msgSend(v8, "initWithMachServiceName:", machServiceName);
    }
    v6->_listener = v7;
    -[NSXPCListener setDelegate:](v7, "setDelegate:", v6);
    v6->_initialized = 0;
    v6->_initializationGroup = (OS_dispatch_group *)dispatch_group_create();
    v6->_containerProvider = objc_alloc_init(PFCloudKitContainerProvider);
    v6->_scheduler = (CKScheduler *)(id)objc_msgSend((Class)getCloudKitCKSchedulerClass[0](), "sharedScheduler");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CDDCloudKitServer tearDown](self, "tearDown");

  dispatch_release((dispatch_object_t)self->_initializationGroup);
  self->_lastInitializationError = 0;

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitServer;
  -[CDDCloudKitServer dealloc](&v3, sel_dealloc);
}

- (void)setUp
{
  NSObject *global_queue;
  _QWORD block[5];

  dispatch_group_enter((dispatch_group_t)self->_initializationGroup);
  global_queue = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CDDCloudKitServer_setUp__block_invoke;
  block[3] = &unk_1E1EDD520;
  block[4] = self;
  dispatch_async(global_queue, block);
  -[NSXPCListener resume](self->_listener, "resume");
}

void __26__CDDCloudKitServer_setUp__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    *(_BYTE *)(v3 + 8) = 0;

    *(_QWORD *)(v3 + 48) = 0;
    v4 = +[CDDCloudKitMetadataModel newMetadataModel](CDDCloudKitMetadataModel, "newMetadataModel");
    *(_QWORD *)(v3 + 32) = -[NSPersistentContainer initWithName:managedObjectModel:]([NSPersistentContainer alloc], "initWithName:managedObjectModel:", CFSTR("CDDCloudKitServer"), v4);
    v5 = *(_QWORD *)(v3 + 24);
    if (v5)
      v6 = *(_QWORD *)(v5 + 8);
    else
      v6 = 0;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v8 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 32), "persistentStoreDescriptions"), "lastObject");
    objc_msgSend(v8, "setURL:", objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("cdck.sqlite"), 0));

    v30 = 0;
    objc_opt_self();
    if (+[NSCloudKitMirroringDelegate checkAndCreateDirectoryAtURL:wipeIfExists:error:](NSCloudKitMirroringDelegate, "checkAndCreateDirectoryAtURL:wipeIfExists:error:", v7, 0, &v30))
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 1;
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = *(void **)(v3 + 32);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __32__CDDCloudKitServer__setUpAsync__block_invoke;
      v25[3] = &unk_1E1EDF470;
      v25[5] = v8;
      v25[6] = &v26;
      v25[4] = v15;
      objc_msgSend(v16, "loadPersistentStoresWithCompletionHandler:", v25);
      if (*((_BYTE *)v27 + 24))
      {
        *(_BYTE *)(v3 + 8) = 1;
      }
      else
      {
        _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to load persistent stores for CloudKit integration: %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v15);
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0CB2D68];
        v32[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize storage:\n%@"), objc_msgSend(v15, "description"));
        v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
        *(_QWORD *)(v3 + 48) = objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v24);
      }

      _Block_object_dispose(&v26, 8);
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to create directory for persistent storage: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v30);
      *(_QWORD *)(v3 + 48) = v30;
    }
    dispatch_group_leave(*(dispatch_group_t *)(v3 + 40));
  }
  objc_autoreleasePoolPop(v2);
}

- (void)tearDown
{
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
}

uint64_t __32__CDDCloudKitServer__setUpAsync__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 0;
    return objc_msgSend(*(id *)(result + 32), "setObject:forKey:", a3, objc_msgSend((id)objc_msgSend(*(id *)(result + 40), "URL"), "path"));
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *listener;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  listener = self->_listener;
  if (listener == a3)
  {
    objc_msgSend(a4, "setExportedObject:", self);
    objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF748A0));
    objc_msgSend(a4, "resume");
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Called to accept connection for unknown listener: %@", a4);
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a3;
      _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Called to accept connection for unknown listener: %@", buf, 0xCu);
    }
  }
  return listener == a3;
}

- (void)handleMessage:(id)a3 reply:(id)a4
{
  NSObject *initializationGroup;
  dispatch_time_t v8;
  intptr_t v9;
  void *v10;
  CDDCloudKitResponse *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  CDDCloudKitResponse *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSManagedObjectContext *v52;
  CDDCloudKitResponse *v53;
  stat *v54;
  CDDCloudKitResponse *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSString *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSManagedObjectContext *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  CDDCloudKitResponse *v86;
  void *v87;
  uint64_t v88;
  CDDCloudKitResponse *v89;
  NSString *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  CDDCloudKitServer *v95;
  id v96;
  NSManagedObjectContext *v97;
  stat *v98;
  stat *v99;
  stat v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const __CFString *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const __CFString *v118;
  stat v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  initializationGroup = self->_initializationGroup;
  v8 = dispatch_time(0, 3000000000);
  v9 = dispatch_group_wait(initializationGroup, v8);
  v10 = (void *)MEMORY[0x18D76B4E4]();
  if (v9)
  {
    v11 = [CDDCloudKitResponse alloc];
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v101 = *MEMORY[0x1E0CB2D68];
    v102 = CFSTR("The server was unable to process the request because it timed out waiting for initialization.");
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v11, a3, 0, (void *)objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v13));
LABEL_3:
    v15 = v14;
    goto LABEL_4;
  }
  if (!self->_initialized)
  {
    v39 = [CDDCloudKitResponse alloc];
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v103 = *MEMORY[0x1E0CB2D68];
    v41 = (void *)MEMORY[0x1E0CB3940];
    v90 = (NSString *)-[NSError description](self->_lastInitializationError, "description");
    v104 = objc_msgSend(v41, "stringWithFormat:", CFSTR("The server is not initialized due to: %@"));
    v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v39, a3, 0, (void *)objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v42));
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      v16 = (void *)*((_QWORD *)a3 + 3);
      v17 = (void *)*((_QWORD *)a3 + 4);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    if ((int)objc_msgSend(v16, "fileDescriptor") < 1)
    {
      v60 = (void *)MEMORY[0x1E0CB35C8];
      v111 = *MEMORY[0x1E0CB2D68];
      v112 = CFSTR("Provided file handle is invalid, it doesn't point to the requested store.");
      v61 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
      v22 = objc_msgSend(v60, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v61);
      goto LABEL_44;
    }
    memset(&v119, 0, sizeof(v119));
    v18 = (NSString *)stat((const char *)objc_msgSend(v17, "fileSystemRepresentation"), &v119);
    if ((_DWORD)v18)
    {
      __error();
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *__error();
      v113 = *MEMORY[0x1E0CB2D68];
      v90 = v18;
      v114 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to stat file at url (%d:%d): %@"));
      v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
      v22 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v20, v21);
      goto LABEL_44;
    }
    memset(&v100, 0, sizeof(v100));
    v62 = (NSString *)fstat(objc_msgSend(v16, "fileDescriptor"), &v100);
    if ((_DWORD)v62)
    {
      __error();
      v63 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *__error();
      v115 = *MEMORY[0x1E0CB2D68];
      v65 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "fileDescriptor");
      v90 = v62;
      v116 = objc_msgSend(v65, "stringWithFormat:", CFSTR("Failed to fstat file descriptor (%d:%d): %d"));
      v66 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
      v22 = objc_msgSend(v63, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v64, v66);
      goto LABEL_44;
    }
    if (v119.st_ino != v100.st_ino || v119.st_dev != v100.st_dev)
    {
      v75 = (void *)MEMORY[0x1E0CB35C8];
      v117 = *MEMORY[0x1E0CB2D68];
      v118 = CFSTR("Provided file handle is invalid, it doesn't point to the requested store.");
      v76 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v22 = objc_msgSend(v75, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v76);
LABEL_44:
      v77 = (void *)v22;
      if (!v22)
      {
        v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v78, v79, v80, v81, v82, v83, v84, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/coredatad/CloudKit/CDDCloudKitServer.m");
        v85 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v119.st_dev = 136315394;
          *(_QWORD *)&v119.st_mode = "/Library/Caches/com.apple.xbs/Sources/Persistence/coredatad/CloudKit/CDDCloudKitServer.m";
          WORD2(v119.st_ino) = 1024;
          *(_DWORD *)((char *)&v119.st_ino + 6) = 668;
          _os_log_fault_impl(&dword_18A253000, v85, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", (uint8_t *)&v119, 0x12u);
        }
      }
      v14 = -[CDDCloudKitResponse initWithMessage:success:error:]([CDDCloudKitResponse alloc], a3, 0, v77);
      goto LABEL_3;
    }
    v67 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if (a3)
      v68 = *((_QWORD *)a3 + 4);
    else
      v68 = 0;
    if (!objc_msgSend(v67, "isWritableFileAtPath:", v68))
    {
      v86 = [CDDCloudKitResponse alloc];
      v87 = (void *)MEMORY[0x1E0CB35C8];
      v107 = *MEMORY[0x1E0CB2D68];
      v108 = CFSTR("Provided file handle is invalid, the file is not writable.");
      v88 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
      v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v86, a3, 0, (void *)objc_msgSend(v87, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v88));
      goto LABEL_3;
    }
    *(_QWORD *)&v100.st_dev = 0;
    v100.st_ino = (__darwin_ino64_t)&v100;
    *(_QWORD *)&v100.st_uid = 0x2020000000;
    LOBYTE(v100.st_rdev) = 0;
    *(_QWORD *)&v119.st_dev = 0;
    v119.st_ino = (__darwin_ino64_t)&v119;
    *(_QWORD *)&v119.st_uid = 0x3052000000;
    *(_QWORD *)&v119.st_rdev = __Block_byref_object_copy__22;
    v119.st_atimespec.tv_sec = (__darwin_time_t)__Block_byref_object_dispose__22;
    v119.st_atimespec.tv_nsec = 0;
    v69 = -[NSPersistentContainer newBackgroundContext](self->_metadataContainer, "newBackgroundContext");
    v91 = MEMORY[0x1E0C809B0];
    v92 = 3221225472;
    v93 = (uint64_t)__48__CDDCloudKitServer__handleRegistrationMessage___block_invoke;
    v94 = &unk_1E1EDF498;
    v95 = self;
    v96 = a3;
    v97 = v69;
    v98 = &v119;
    v99 = &v100;
    -[NSManagedObjectContext performBlockAndWait:](v69, "performBlockAndWait:", &v91);

    v70 = *(_QWORD *)(v119.st_ino + 40);
    if (v70)
    {
      v71 = (void *)MEMORY[0x1E0CB35C8];
      v109 = *MEMORY[0x1E0CB2D68];
      if (a3)
        v72 = *((_QWORD *)a3 + 1);
      else
        v72 = 0;
      v110 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to register store for message '%@' due to the following error: %@"), v72, v70);
      v73 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v74 = (void *)objc_msgSend(v71, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v73);
    }
    else
    {
      v74 = 0;
    }
    v89 = [CDDCloudKitResponse alloc];
    v15 = -[CDDCloudKitResponse initWithMessage:success:error:](v89, a3, *(_BYTE *)(v100.st_ino + 24), v74);

    *(_QWORD *)(v119.st_ino + 40) = 0;
    v54 = &v119;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = [CDDCloudKitResponse alloc];
      v56 = (void *)MEMORY[0x1E0CB35C8];
      v105 = *MEMORY[0x1E0CB2D68];
      v57 = (void *)MEMORY[0x1E0CB3940];
      v58 = (objc_class *)objc_opt_class();
      v90 = NSStringFromClass(v58);
      v106 = objc_msgSend(v57, "stringWithFormat:", CFSTR("Unknown message: %@"));
      v59 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v55, a3, 0, (void *)objc_msgSend(v56, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v59));
      goto LABEL_3;
    }
    *(_QWORD *)&v100.st_dev = 0;
    v100.st_ino = (__darwin_ino64_t)&v100;
    *(_QWORD *)&v100.st_uid = 0x3052000000;
    *(_QWORD *)&v100.st_rdev = __Block_byref_object_copy__22;
    v100.st_atimespec.tv_sec = (__darwin_time_t)__Block_byref_object_dispose__22;
    v100.st_atimespec.tv_nsec = 0;
    v91 = 0;
    v92 = (uint64_t)&v91;
    v93 = 0x2020000000;
    LOBYTE(v94) = 0;
    v43 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v44 = 16;
    else
      v44 = __ckLoggingOverride;
    v45 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("%@: Asked to schedule activity for store: %@"));
    _NSCoreDataLog(v44, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]");
    objc_autoreleasePoolPop(v43);
    v52 = -[NSPersistentContainer newBackgroundContext](self->_metadataContainer, "newBackgroundContext");
    *(_QWORD *)&v119.st_dev = MEMORY[0x1E0C809B0];
    v119.st_ino = 3221225472;
    *(_QWORD *)&v119.st_uid = __44__CDDCloudKitServer__handleScheduleMessage___block_invoke;
    *(_QWORD *)&v119.st_rdev = &unk_1E1EDF498;
    v119.st_atimespec.tv_sec = (__darwin_time_t)self;
    v119.st_atimespec.tv_nsec = (uint64_t)a3;
    v119.st_mtimespec.tv_sec = (__darwin_time_t)v52;
    v119.st_mtimespec.tv_nsec = (uint64_t)&v100;
    v119.st_ctimespec.tv_sec = (__darwin_time_t)&v91;
    -[NSManagedObjectContext performBlockAndWait:](v52, "performBlockAndWait:", &v119);

    v53 = [CDDCloudKitResponse alloc];
    v15 = -[CDDCloudKitResponse initWithMessage:success:error:](v53, a3, *(_BYTE *)(v92 + 24), *(void **)(v100.st_ino + 40));

    *(_QWORD *)(v100.st_ino + 40) = 0;
    v54 = (stat *)&v91;
  }
  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v100, 8);
LABEL_4:
  objc_autoreleasePoolPop(v10);
  if (v15)
  {
    if (*((_BYTE *)v15 + 8) || v15[3])
      goto LABEL_18;
  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CloudKit Server is attempting to send back a nil response: %@");
    _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a3);
    v30 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v119.st_dev = 138412290;
      *(_QWORD *)&v119.st_mode = a3;
      _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, "CoreData: CloudKit Server is attempting to send back a nil response: %@", (uint8_t *)&v119, 0xCu);
    }
  }
  v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Bug in CoreData CloudKit Server: Response success == NO but error is also nil.");
  _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)v90);
  v38 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v119.st_dev) = 0;
    _os_log_fault_impl(&dword_18A253000, v38, OS_LOG_TYPE_FAULT, "CoreData: Bug in CoreData CloudKit Server: Response success == NO but error is also nil.", (uint8_t *)&v119, 2u);
    if (!a4)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_18:
  if (a4)
LABEL_19:
    (*((void (**)(id, _QWORD *))a4 + 2))(a4, v15);
LABEL_20:

}

void __48__CDDCloudKitServer__handleRegistrationMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSFetchRequest *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSManagedObject *v11;
  NSManagedObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 32);
  else
    v4 = 0;
  v5 = -[CDDCloudKitServer createRealPathForPath:error:](v2, v4, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[CDDCloudKitRegisteredClient entityName](CDDCloudKitRegisteredClient, "entityName"));
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = *(_QWORD *)(v8 + 16);
      v8 = *(_QWORD *)(v8 + 56);
    }
    else
    {
      v9 = 0;
    }
    -[NSFetchRequest setPredicate:](v7, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleIdentifier = %@ AND storeConfigurationName = %@ AND storePath = %@"), v9, v8, v6));
    v21 = 0;
    v10 = (void *)objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v7, &v21);
    if (!v10)
      goto LABEL_23;
    if (objc_msgSend(v10, "count"))
      goto LABEL_21;
    v11 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[CDDCloudKitRegisteredClient entityName](CDDCloudKitRegisteredClient, "entityName"), *(_QWORD *)(a1 + 48));
    v12 = v11;
    v13 = *(_QWORD *)(a1 + 40);
    v14 = v13 ? *(_QWORD *)(v13 + 16) : 0;
    -[NSManagedObject setBundleIdentifier:](v11, "setBundleIdentifier:", v14);
    -[NSManagedObject setStorePath:](v12, "setStorePath:", v6);
    v15 = *(_QWORD **)(a1 + 40);
    if (!v15)
      goto LABEL_28;
    if (v15[5])
    {
      -[NSManagedObject setFileProtectionType:](v12, "setFileProtectionType:");
      v15 = *(_QWORD **)(a1 + 40);
      if (!v15)
        goto LABEL_28;
    }
    v16 = (void *)v15[7];
    if (!v16)
      goto LABEL_19;
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PF_DEFAULT_CONFIGURATION_NAME"));
    v15 = *(_QWORD **)(a1 + 40);
    if ((v17 & 1) == 0)
    {
      if (v15)
        v18 = v15[7];
      else
        v18 = 0;
      -[NSManagedObject setStoreConfigurationName:](v12, "setStoreConfigurationName:", v18);
      v15 = *(_QWORD **)(a1 + 40);
    }
    if (v15)
LABEL_19:
      v19 = v15[8];
    else
LABEL_28:
      v19 = 0;
    -[NSManagedObject setContainerIdentifier:](v12, "setContainerIdentifier:", v19);
    if (objc_msgSend(*(id *)(a1 + 48), "save:", &v21))
LABEL_21:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    else
LABEL_23:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v21;

  }
  else
  {
    v20 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
}

- (uint64_t)createRealPathForPath:(_QWORD *)a3 error:
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(a2, "UTF8String"), 0);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v4, 4);
  }
  else if (a3)
  {
    v6 = *MEMORY[0x1E0CB28A8];
    v8 = *MEMORY[0x1E0CB2D68];
    v9[0] = CFSTR("Failed to get a real path for the provided store path.");
    v5 = 0;
    *a3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  }
  else
  {
    v5 = 0;
  }
  free(v4);
  return v5;
}

void __44__CDDCloudKitServer__handleScheduleMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSManagedObject *v5;
  NSFetchRequest *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSManagedObject *v18;
  NSManagedObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSManagedObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSManagedObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  NSManagedObject *v88;
  NSManagedObject *v89;
  NSManagedObject *v90;
  NSManagedObject *v91;
  uint64_t v92;
  _QWORD v93[5];
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint8_t v108[128];
  uint8_t buf[4];
  NSManagedObject *v110;
  __int16 v111;
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(void **)(v3 + 24);
  else
    v4 = 0;
  v5 = (NSManagedObject *)-[CDDCloudKitServer createRealPathForPath:error:](v2, v4, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (v5)
  {
    v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[CDDCloudKitRegisteredClient entityName](CDDCloudKitRegisteredClient, "entityName"));
    v91 = v5;
    -[NSFetchRequest setPredicate:](v6, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("storePath = %@"), v5));
    v99 = 0;
    v92 = a1;
    v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "executeFetchRequest:error:", v6, &v99);
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "count"))
      {
        v90 = (NSManagedObject *)objc_msgSend(v8, "lastObject");
        if ((unint64_t)objc_msgSend(v8, "count") >= 2)
        {
          v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Multiple clients registered for the same store path: %@\n%@");
          v87 = v8;
          _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
          v16 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v110 = v91;
            v111 = 2112;
            v112 = v8;
            _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Multiple clients registered for the same store path: %@\n%@", buf, 0x16u);
          }
        }
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v17 = (void *)-[NSManagedObject scheduledActivities](v90, "scheduledActivities");
        v18 = 0;
        v19 = 0;
        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v96;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v96 != v21)
                objc_enumerationMutation(v17);
              v23 = *(NSManagedObject **)(*((_QWORD *)&v95 + 1) + 8 * i);
              v24 = -[NSManagedObject activityType](v23, "activityType");
              if (v24 == 1)
              {
                v18 = v23;
              }
              else if (v24 == 2)
              {
                v19 = v23;
              }
              else
              {
                v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found unknown activity type: %@");
                _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)v23);
                v32 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v110 = v23;
                  _os_log_fault_impl(&dword_18A253000, v32, OS_LOG_TYPE_FAULT, "CoreData: Found unknown activity type: %@", buf, 0xCu);
                }
              }
            }
            v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
          }
          while (v20);
        }
        v33 = objc_msgSend((id)objc_msgSend(*(id *)(v92 + 32), "containerProvider"), "containerWithIdentifier:", -[NSManagedObject containerIdentifier](v90, "containerIdentifier"));
        if (v33)
        {
          v34 = *(_QWORD *)(v92 + 40);
          if (!v34)
            goto LABEL_42;
          v35 = *(_QWORD *)(v34 + 16);
          if (v35 != 2 || v19)
          {
            if (v35 != 1 || v18)
              goto LABEL_42;
            v18 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[CDDCloudKitScheduledActivity entityName](CDDCloudKitScheduledActivity, "entityName"), *(_QWORD *)(v92 + 48));
            -[NSManagedObject setActivityUUID:](v18, "setActivityUUID:", objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"));
            -[NSManagedObject setActivityType:](v18, "setActivityType:", 1);
            -[NSManagedObject setRegisteredClient:](v18, "setRegisteredClient:", v90);
            -[NSManagedObject setScheduledAt:](v18, "setScheduledAt:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
            v46 = objc_msgSend(CFSTR("com.apple.coredatad.cloudkit."), "stringByAppendingString:", objc_msgSend((id)-[NSManagedObject activityUUID](v18, "activityUUID"), "UUIDString"));
            v37 = (void *)objc_msgSend(objc_alloc(getCloudKitCKSchedulerActivityClass()), "initWithIdentifier:container:priority:", v46, v33, 2);
            v106 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C808F8]);
            v107 = MEMORY[0x1E0C81240];
            objc_msgSend(v37, "setAdditionalXPCActivityCriteria:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
            -[NSManagedObject populateFromCriteria:](v18, "populateFromCriteria:", objc_msgSend(v37, "additionalXPCActivityCriteria"));
          }
          else
          {
            v19 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[CDDCloudKitScheduledActivity entityName](CDDCloudKitScheduledActivity, "entityName"), *(_QWORD *)(v92 + 48));
            -[NSManagedObject setActivityUUID:](v19, "setActivityUUID:", objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"));
            -[NSManagedObject setActivityType:](v19, "setActivityType:", 2);
            -[NSManagedObject setRegisteredClient:](v19, "setRegisteredClient:", v90);
            -[NSManagedObject setScheduledAt:](v19, "setScheduledAt:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
            v36 = objc_msgSend(CFSTR("com.apple.coredatad.cloudkit."), "stringByAppendingString:", objc_msgSend((id)-[NSManagedObject activityUUID](v19, "activityUUID"), "UUIDString"));
            v37 = (void *)objc_msgSend(objc_alloc(getCloudKitCKSchedulerActivityClass()), "initWithIdentifier:container:priority:", v36, v33, 2);
          }
          if (v37)
          {
            v47 = (NSManagedObject *)objc_msgSend(*(id *)(v92 + 32), "scheduler");
            v48 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 0x10)
              v49 = 16;
            else
              v49 = __ckLoggingOverride;
            v50 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Scheduling activity: %@ for client: %@ with scheduler: %@"));
            v88 = v90;
            v89 = v47;
            _NSCoreDataLog(v49, v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
            objc_autoreleasePoolPop(v48);
            objc_initWeak((id *)buf, *(id *)(v92 + 32));
            v57 = objc_msgSend(v37, "identifier");
            v93[0] = MEMORY[0x1E0C809B0];
            v93[1] = 3221225472;
            v93[2] = __44__CDDCloudKitServer__handleScheduleMessage___block_invoke_2;
            v93[3] = &unk_1E1EDF4C0;
            objc_copyWeak(&v94, (id *)buf);
            v93[4] = *(_QWORD *)(v92 + 32);
            -[NSManagedObject registerActivityIdentifier:handler:](v47, "registerActivityIdentifier:handler:", v57, v93);
            -[NSManagedObject submitActivity:](v47, "submitActivity:", v37);
            objc_destroyWeak(&v94);
            objc_destroyWeak((id *)buf);
LABEL_46:
            v67 = objc_msgSend(*(id *)(v92 + 48), "hasChanges");
            v68 = (void *)MEMORY[0x18D76B4E4]();
            if ((unint64_t)__ckLoggingOverride >= 0x10)
              v69 = 16;
            else
              v69 = __ckLoggingOverride;
            if (v67)
            {
              v70 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Saving changes for client: %@"));
              _NSCoreDataLog(v69, v70, v71, v72, v73, v74, v75, v76, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
              objc_autoreleasePoolPop(v68);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v92 + 64) + 8) + 24) = objc_msgSend(*(id *)(v92 + 48), "save:", &v99);
              if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v92 + 64) + 8) + 24))
              {
                v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v104 = *MEMORY[0x1E0CB2D68];
                v105 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save changes: %@"), v99, 400, v90, v88, v89);
                v78 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v92 + 56) + 8) + 40) = objc_msgSend(v77, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v78);
              }
            }
            else
            {
              v79 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("No change to save for client: %@"));
              _NSCoreDataLog(v69, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
              objc_autoreleasePoolPop(v68);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v92 + 64) + 8) + 24) = 1;
            }

            goto LABEL_57;
          }
LABEL_42:
          v58 = (void *)MEMORY[0x18D76B4E4]();
          if ((unint64_t)__ckLoggingOverride >= 0x10)
            v59 = 16;
          else
            v59 = __ckLoggingOverride;
          v60 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Already have scheduled activity for client: %@\n%@\n%@"));
          v88 = v19;
          v89 = v18;
          _NSCoreDataLog(v59, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
          objc_autoreleasePoolPop(v58);
          v37 = 0;
          goto LABEL_46;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v102 = *MEMORY[0x1E0CB2D68];
        v44 = (void *)MEMORY[0x1E0CB3940];
        if (-[NSManagedObject containerIdentifier](v90, "containerIdentifier"))
          v45 = -[NSManagedObject containerIdentifier](v90, "containerIdentifier");
        else
          v45 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v103 = objc_msgSend(v44, "stringWithFormat:", CFSTR("Failed to get a container for '%@"), v45, v87);
        v86 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v39 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v86);
      }
      else
      {
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v100 = *MEMORY[0x1E0CB2D68];
        v41 = *(_QWORD *)(v92 + 40);
        if (v41)
          v41 = *(_QWORD *)(v41 + 24);
        v101 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No client is registered for: %@"), v41);
        v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v39 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v42);
      }
    }
    else
    {
      v39 = v99;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v92 + 56) + 8) + 40) = v39;
LABEL_57:
    v5 = v91;
    goto LABEL_58;
  }
  v38 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
LABEL_58:

}

void __44__CDDCloudKitServer__handleScheduleMessage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    -[CDDCloudKitServer runActivity:completionHandler:](*(_QWORD *)(a1 + 32), a2, a3);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Asked to run activity but no server: %@");
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a2);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a2;
      _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Asked to run activity but no server: %@", buf, 0xCu);
    }
  }

}

- (void)runActivity:(uint64_t)a3 completionHandler:
{
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[8];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = *(NSObject **)(a1 + 40);
    v7 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(v6, v7))
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Failed to handle activity because initialization took longer than expected: %@");
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)a2);
      v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = a2;
        _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Failed to handle activity because initialization took longer than expected: %@", buf, 0xCu);
      }
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
    }
    else
    {
      v16 = (void *)MEMORY[0x18D76B4E4]();
      v17 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v18 = 16;
      else
        v18 = __ckLoggingOverride;
      v19 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Asked to run activity: %@"));
      _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]");
      objc_autoreleasePoolPop(v17);
      v26 = (void *)objc_msgSend(*(id *)(a1 + 32), "newBackgroundContext");
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke;
      v27[3] = &unk_1E1EDDC60;
      v27[4] = a2;
      v27[5] = v26;
      v27[6] = a1;
      v27[7] = a3;
      objc_msgSend(v26, "performBlockAndWait:", v27);

      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
      objc_msgSend((id)objc_msgSend((id)a1, "scheduler"), "unregisterActivityIdentifier:", objc_msgSend(a2, "identifier"));
      objc_autoreleasePoolPop(v16);
    }
  }
}

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSFetchRequest *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSPersistentStoreDescription *v35;
  NSPersistentStoreDescription *v36;
  uint64_t v37;
  uint64_t v38;
  NSCloudKitMirroringDelegateOptions *v39;
  void *v40;
  const char *v41;
  NSCloudKitMirroringDelegate *v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  _BOOL8 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  dispatch_time_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSManagedObjectContext *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSPersistentStoreCoordinator *v104;
  _QWORD v105[10];
  _QWORD v106[5];
  _QWORD v107[5];
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const __CFString *v111;
  _BYTE buf[24];
  void (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  uint64_t v115;
  const __CFString *v116;
  _QWORD v117[4];

  v117[1] = *MEMORY[0x1E0C80C00];
  v109 = 0;
  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "identifier"), "substringFromIndex:", objc_msgSend(CFSTR("com.apple.coredatad.cloudkit."), "length")));
  v4 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[CDDCloudKitScheduledActivity entityName](CDDCloudKitScheduledActivity, "entityName"));
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("activityUUID = %@"), v3));
  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v4, &v109);
  v6 = (void *)MEMORY[0x18D76B4E4]();
  if ((unint64_t)__ckLoggingOverride >= 0x10)
    v7 = 16;
  else
    v7 = __ckLoggingOverride;
  v8 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Looking up activities matching the identifier: %@\n%@"));
  objc_msgSend(*v2, "identifier");
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke");
  objc_autoreleasePoolPop(v6);
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      if ((unint64_t)objc_msgSend(v5, "count") >= 2)
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Found more than one scheduled activities matching the identifier '%@': %@");
        v16 = objc_msgSend(*(id *)(a1 + 32), "identifier");
        _NSCoreDataLog(17, v15, v17, v18, v19, v20, v21, v22, v16);
        v23 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v102 = objc_msgSend(*(id *)(a1 + 32), "identifier");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v102;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v5;
          _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Found more than one scheduled activities matching the identifier '%@': %@", buf, 0x16u);
        }
      }
      v24 = (void *)objc_msgSend(v5, "lastObject");
      v25 = (void *)objc_msgSend(v24, "registeredClient");
      v26 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v27 = 16;
      else
        v27 = __ckLoggingOverride;
      v28 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Running scheduled activity: %@\nClient: %@"));
      _NSCoreDataLog(v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke");
      objc_autoreleasePoolPop(v26);
      v35 = [NSPersistentStoreDescription alloc];
      v36 = -[NSPersistentStoreDescription initWithURL:](v35, "initWithURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(v25, "storePath")));
      -[NSPersistentStoreDescription setConfiguration:](v36, "setConfiguration:", objc_msgSend(v25, "storeConfigurationName"));
      v37 = objc_msgSend(v25, "fileProtectionType");
      -[NSPersistentStoreDescription setOption:forKey:](v36, "setOption:forKey:", v37, *MEMORY[0x1E0CB2AD8]);
      -[NSPersistentStoreDescription setOption:forKey:](v36, "setOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentHistoryTrackingKey"));
      v38 = MEMORY[0x1E0C9AAB0];
      -[NSPersistentStoreDescription setOption:forKey:](v36, "setOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreRemoteChangeNotificationOptionKey"));
      v39 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:]([NSCloudKitMirroringDelegateOptions alloc], "initWithContainerIdentifier:", objc_msgSend(v25, "containerIdentifier"));
      v40 = (void *)objc_msgSend(*(id *)(a1 + 48), "containerProvider");
      if (v39)
      {
        objc_setProperty_nonatomic(v39, v41, v40, 80);
        -[NSCloudKitMirroringDelegateOptions setAutomaticallyScheduleImportAndExportOperations:](v39, "setAutomaticallyScheduleImportAndExportOperations:", 0);
        v39->_useDaemon = 0;
      }
      else
      {
        objc_msgSend(0, "setAutomaticallyScheduleImportAndExportOperations:", 0);
      }
      v42 = -[NSCloudKitMirroringDelegate initWithOptions:]([NSCloudKitMirroringDelegate alloc], "initWithOptions:", v39);
      -[NSPersistentStoreDescription setMirroringDelegate:](v36, "setMirroringDelegate:", v42);

      v108 = 0;
      v43 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(v25, "storePath"));
      v116 = CFSTR("NSReadOnlyPersistentStoreOption");
      v117[0] = v38;
      v44 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", v43, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, &v116, 1), &v108);
      if (v44)
      {
        v104 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v44);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3052000000;
        v113 = __Block_byref_object_copy__22;
        v114 = __Block_byref_object_dispose__22;
        v115 = 0;
        v45 = dispatch_semaphore_create(0);
        v46 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v47 = MEMORY[0x1E0C809B0];
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_2;
        v107[3] = &unk_1E1EDF4E8;
        v107[4] = v45;
        v103 = objc_msgSend(v46, "addObserverForName:object:queue:usingBlock:", CFSTR("PFCloudKitDidSetupNotificationName"), v42, 0, v107);
        v106[0] = v47;
        v106[1] = 3221225472;
        v106[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_102;
        v106[3] = &unk_1E1EDF510;
        v106[4] = buf;
        v48 = -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](v104, "addPersistentStoreWithDescription:completionHandler:", v36, v106);
        LODWORD(v47) = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
        v49 = (void *)MEMORY[0x18D76B4E4](v48);
        v50 = __ckLoggingOverride;
        if ((_DWORD)v47)
        {
          v76 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Store initialized waiting for the mirroring delegate to set up."));
          if (v50 >= 0x10)
            v83 = 16;
          else
            v83 = v50;
          _NSCoreDataLog(v83, v76, v77, v78, v79, v80, v81, v82, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
          objc_autoreleasePoolPop(v49);
          v84 = dispatch_time(0, 30000000000);
          if (dispatch_semaphore_wait(v45, v84))
          {
            v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v110 = *MEMORY[0x1E0CB2D68];
            v111 = CFSTR("Timed out waiting for the mirroring delegate to set up.");
            v86 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
            v87 = objc_msgSend(v85, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v86);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v87;
          }
          else
          {
            v88 = (void *)MEMORY[0x18D76B4E4]();
            v89 = __ckLoggingOverride;
            v90 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Mirroring delegate initialized."));
            v97 = MEMORY[0x1E0C809B0];
            if (v89 >= 0x10)
              v98 = 16;
            else
              v98 = v89;
            _NSCoreDataLog(v98, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
            objc_autoreleasePoolPop(v88);
            v99 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
            -[NSManagedObjectContext setPersistentStoreCoordinator:](v99, "setPersistentStoreCoordinator:", v104);
            -[NSManagedObjectContext setTransactionAuthor:](v99, "setTransactionAuthor:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend(v25, "bundleIdentifier"), objc_msgSend((id)objc_msgSend(v24, "activityUUID"), "UUIDString"), v24, v25));
            v105[0] = v97;
            v105[1] = 3221225472;
            v105[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_3;
            v105[3] = &unk_1E1EDF560;
            v101 = *(_QWORD *)(a1 + 40);
            v100 = *(_QWORD *)(a1 + 48);
            v105[4] = v104;
            v105[5] = v100;
            v105[6] = v24;
            v105[7] = v101;
            v105[8] = v99;
            v105[9] = buf;
            -[NSManagedObjectContext performBlockAndWait:](v99, "performBlockAndWait:", v105);

          }
        }
        else
        {
          v51 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to load persistent store for client: %@\n%@"));
          _NSCoreDataLog(v50 != 0, v51, v52, v53, v54, v55, v56, v57, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
          objc_autoreleasePoolPop(v49);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", v103);

        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
        _Block_object_dispose(buf, 8);
      }
      else
      {
        v67 = (void *)MEMORY[0x18D76B4E4]();
        v68 = __ckLoggingOverride != 0;
        v69 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to load managed object model for registered client: %@\n%@"));
        _NSCoreDataLog(v68, v69, v70, v71, v72, v73, v74, v75, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
        objc_autoreleasePoolPop(v67);
      }

    }
    else
    {
      v58 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v59 = 16;
      else
        v59 = __ckLoggingOverride;
      v60 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("No activity registered with identifier: %@"));
      _NSCoreDataLog(v59, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
      objc_autoreleasePoolPop(v58);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

intptr_t __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint8_t buf[2];

  v3 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKeyedSubscript:", CFSTR("result"));
  if ((objc_msgSend(v3, "success") & 1) != 0)
  {
    if (objc_msgSend(v3, "error"))
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Error was non-nil, but expected nil");
      _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v22);
      v11 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        v12 = "CoreData: Error was non-nil, but expected nil";
        v13 = (uint8_t *)&v22;
LABEL_8:
        _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, v12, v13, 2u);
      }
    }
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Success was NO but expected YES");
    _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v22);
    v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "CoreData: Success was NO but expected YES";
      v13 = buf;
      goto LABEL_8;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
{
  id result;

  result = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_3(uint64_t a1)
{
  NSCloudKitMirroringExportRequest *v2;
  __int128 v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;

  v2 = [NSCloudKitMirroringExportRequest alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_4;
  v13[3] = &unk_1E1EDF538;
  v3 = *(_OWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 32);
  v15 = v3;
  if (!objc_msgSend(*(id *)(a1 + 64), "executeRequest:error:", -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](v2, "initWithOptions:completionBlock:", 0, v13), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v4 = (void *)MEMORY[0x18D76B4E4](*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v5 = __ckLoggingOverride != 0;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to execute export request: %@\n%@"));
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_3");
    objc_autoreleasePoolPop(v4);
  }
}

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = *(id *)(a1 + 32);
  if ((objc_msgSend(a2, "success") & 1) == 0)
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    v5 = __ckLoggingOverride != 0;
    v6 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Backup export failed: %@"));
    objc_msgSend(a2, "error");
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_4");
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishedActivity:withResult:inManagedObjectContext:", *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56));

}

- (void)finishedActivity:(id)a3 withResult:(id)a4 inManagedObjectContext:(id)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke;
  v5[3] = &unk_1E1EDE7A8;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = a5;
  v5[7] = self;
  objc_msgSend(a5, "performBlock:", v5);
}

void __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[5];
  id v62;
  id location;

  if (objc_msgSend(a1[4], "success"))
  {
    v2 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v3 = 16;
    else
      v3 = __ckLoggingOverride;
    v4 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Successfully finished activity, pruning: %@"));
    _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v2);
    objc_msgSend(a1[6], "deleteObject:", a1[5]);
    location = 0;
    if ((objc_msgSend(a1[6], "save:", &location) & 1) == 0)
    {
      v11 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v12 = 16;
      else
        v12 = __ckLoggingOverride;
      v13 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to prune activity after successful execution: %@"));
      _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
LABEL_10:
      objc_autoreleasePoolPop(v11);
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a1[4], "error"), "code") == 134410
         && (v20 = (void *)objc_msgSend((id)objc_msgSend(a1[4], "error"), "domain"),
             objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB28A8])))
  {
    v21 = (void *)MEMORY[0x18D76B4E4]();
    v22 = __ckLoggingOverride != 0;
    v23 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Execution of activity encountered a fatal error, it will not be retried: %@\n%@"));
    objc_msgSend(a1[4], "error");
    _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v21);
    objc_msgSend(a1[6], "deleteObject:", a1[5]);
    location = 0;
    if ((objc_msgSend(a1[6], "save:", &location) & 1) == 0)
    {
      v11 = (void *)MEMORY[0x18D76B4E4]();
      if ((unint64_t)__ckLoggingOverride >= 0x10)
        v30 = 16;
      else
        v30 = __ckLoggingOverride;
      v31 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Failed to prune activity after fatal error: %@"));
      _NSCoreDataLog(v30, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
      goto LABEL_10;
    }
  }
  else
  {
    v38 = (void *)MEMORY[0x18D76B4E4]();
    v39 = __ckLoggingOverride != 0;
    v40 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Execution of activity failed: %@\n%@"));
    objc_msgSend(a1[4], "error");
    _NSCoreDataLog(v39, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v38);
    v47 = objc_msgSend((id)objc_msgSend(a1[7], "containerProvider"), "containerWithIdentifier:", objc_msgSend((id)objc_msgSend(a1[5], "registeredClient"), "containerIdentifier"));
    v48 = objc_msgSend(CFSTR("com.apple.coredatad.cloudkit."), "stringByAppendingString:", objc_msgSend((id)objc_msgSend(a1[5], "activityUUID"), "UUIDString"));
    v49 = (void *)objc_msgSend(objc_alloc(getCloudKitCKSchedulerActivityClass()), "initWithIdentifier:container:priority:", v48, v47, 2);
    objc_msgSend(v49, "setAdditionalXPCActivityCriteria:", objc_msgSend(a1[5], "xpcActivityCriteria"));
    v50 = (void *)objc_msgSend(a1[7], "scheduler");
    v51 = (void *)MEMORY[0x18D76B4E4]();
    if ((unint64_t)__ckLoggingOverride >= 0x10)
      v52 = 16;
    else
      v52 = __ckLoggingOverride;
    v53 = objc_msgSend(CFSTR("CoreData+CloudKit: %s(%d): "), "stringByAppendingString:", CFSTR("Scheduling activity: %@ for client: %@ with scheduler: %@"));
    objc_msgSend(a1[5], "registeredClient");
    _NSCoreDataLog(v52, v53, v54, v55, v56, v57, v58, v59, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v51);
    objc_initWeak(&location, a1[7]);
    v60 = objc_msgSend(v49, "identifier");
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke_2;
    v61[3] = &unk_1E1EDF4C0;
    objc_copyWeak(&v62, &location);
    v61[4] = a1[7];
    objc_msgSend(v50, "registerActivityIdentifier:handler:", v60, v61);
    objc_msgSend(v50, "submitActivity:", v49);

    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }
}

void __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    -[CDDCloudKitServer runActivity:completionHandler:](*(_QWORD *)(a1 + 32), a2, a3);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Asked to run activity but no server: %@");
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a2);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a2;
      _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Asked to run activity but no server: %@", buf, 0xCu);
    }
  }

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (CDDCloudKitServerConfiguration)configuration
{
  return self->_configuration;
}

- (PFCloudKitContainerProvider)containerProvider
{
  return self->_containerProvider;
}

- (CKScheduler)scheduler
{
  return self->_scheduler;
}

@end
