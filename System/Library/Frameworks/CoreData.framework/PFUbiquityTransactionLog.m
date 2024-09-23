@implementation PFUbiquityTransactionLog

- (PFUbiquityTransactionLog)init
{
  char *v2;
  PFUbiquityTransactionLog *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityTransactionLog;
  v2 = -[PFUbiquityTransactionLog init](&v5, sel_init);
  v3 = (PFUbiquityTransactionLog *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 10) = 0;
    *(_DWORD *)(v2 + 89) = 0;
    *(_WORD *)(v2 + 93) = 0;
    v2[88] = 1;
    *((_QWORD *)v2 + 12) = objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v3->_knowledgeVector = 0;
  }
  return v3;
}

- (PFUbiquityTransactionLog)initWithTransactionLogURL:(id)a3 ubiquityRootLocation:(id)a4 andLocalPeerID:(id)a5
{
  _BYTE *v7;
  PFUbiquityTransactionLog *v8;

  v7 = +[PFUbiquityLocation createUbiquityLocationForURL:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, a3, a4);
  v8 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:](self, "initWithTransactionLogLocation:andLocalPeerID:", v7, a5);

  return v8;
}

- (PFUbiquityTransactionLog)initWithTransactionLogLocation:(id)a3 andLocalPeerID:(id)a4
{
  PFUbiquityTransactionLog *v6;
  PFUbiquityTransactionLog *v7;
  int v8;
  PFUbiquityLocation *v9;
  PFUbiquityLocation *v10;
  PFUbiquityLocation *transactionLogLocation;
  PFUbiquityLocation *v12;
  void *v13;
  uint64_t v14;
  PFUbiquityLocation *v15;
  PFUbiquityLocation *v16;
  PFUbiquityLocation *v17;
  NSString *filename;
  NSArray *v19;
  _BOOL4 v20;

  v6 = -[PFUbiquityTransactionLog init](self, "init");
  v7 = v6;
  if (!v6)
    return v7;
  if (!a3)
    goto LABEL_17;
  v8 = *((_DWORD *)a3 + 6);
  if (v8 == 21)
  {
    *(_WORD *)&v6->_inTemporaryLocation = 1;
    v6->_inPermanentLocation = 0;
    v12 = (PFUbiquityLocation *)a3;
    v7->_temporaryTransactionLogLocation = v12;
    objc_opt_self();
    transactionLogLocation = (PFUbiquityLocation *)-[PFUbiquityLocation copy](v12, "copy");
    -[PFUbiquityLocation setUbiquityLocationType:](transactionLogLocation, "setUbiquityLocationType:", 22);
    -[PFUbiquityLocation updateHash](transactionLogLocation);
    v7->_transactionLogLocation = transactionLogLocation;
    goto LABEL_8;
  }
  if (v8 == 26)
  {
    *(_WORD *)&v6->_inTemporaryLocation = 256;
    v6->_inPermanentLocation = 0;
    v15 = (PFUbiquityLocation *)a3;
    v7->_stagingTransactionLogLocation = v15;
    objc_opt_self();
    v16 = (PFUbiquityLocation *)-[PFUbiquityLocation copy](v15, "copy");
    -[PFUbiquityLocation setUbiquityLocationType:](v16, "setUbiquityLocationType:", 22);
    -[PFUbiquityLocation updateHash](v16);
    v7->_transactionLogLocation = v16;
    objc_opt_self();
    v13 = (void *)-[PFUbiquityLocation copy](v16, "copy");
    objc_msgSend(v13, "setUbiquityLocationType:", 21);
    v14 = 32;
    goto LABEL_10;
  }
  if (v8 != 22)
  {
LABEL_17:

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Core Data: Ubiquity: Unable to process transaction log location: %@, doesn't appear to actually represent a transaction log location.\n"), a3), 0));
  }
  *(_WORD *)&v6->_inTemporaryLocation = 0;
  v6->_inPermanentLocation = 1;
  v9 = (PFUbiquityLocation *)a3;
  v7->_transactionLogLocation = v9;
  objc_opt_self();
  v10 = (PFUbiquityLocation *)-[PFUbiquityLocation copy](v9, "copy");
  -[PFUbiquityLocation setUbiquityLocationType:](v10, "setUbiquityLocationType:", 21);
  -[PFUbiquityLocation updateHash](v10);
  v7->_temporaryTransactionLogLocation = v10;
  transactionLogLocation = v7->_transactionLogLocation;
LABEL_8:
  objc_opt_self();
  v13 = (void *)-[PFUbiquityLocation copy](transactionLogLocation, "copy");
  objc_msgSend(v13, "setUbiquityLocationType:", 26);
  v14 = 40;
LABEL_10:
  -[PFUbiquityLocation updateHash](v13);
  *(Class *)((char *)&v7->super.isa + v14) = (Class)v13;
  v7->_useTemporaryLogLocation = 0;
  v7->_contents = 0;
  v17 = v7->_transactionLogLocation;
  objc_opt_self();
  if (v17)
    filename = v17->_filename;
  else
    filename = 0;
  v19 = -[NSString componentsSeparatedByString:](filename, "componentsSeparatedByString:", CFSTR("."));
  v20 = -[NSArray count](v19, "count") == 3
     && objc_msgSend(-[NSArray objectAtIndex:](v19, "objectAtIndex:", 1), "intValue") == 1;
  v7->_transactionLogType = v20;
  v7->_localPeerID = (NSString *)a4;
  v7->_saveSnapshot = -[PFUbiquitySaveSnapshot initWithTransactionLog:]([PFUbiquitySaveSnapshot alloc], "initWithTransactionLog:", v7);
  return v7;
}

- (PFUbiquityTransactionLog)initWithStoreName:(id)a3 andSaveSnapshot:(id)a4 andRootLocation:(id)a5
{
  PFUbiquityTransactionLog *v8;
  PFUbiquityTransactionLog *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  PFUbiquityLocation *v15;
  PFUbiquityLocation *v16;
  PFUbiquityLocation *transactionLogLocation;
  PFUbiquityLocation *v18;

  v8 = -[PFUbiquityTransactionLog init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_useTemporaryLogLocation = 0;
    *(_WORD *)&v8->_inTemporaryLocation = 0;
    v8->_inPermanentLocation = 0;
    v8->_saveSnapshot = (PFUbiquitySaveSnapshot *)a4;
    if (a4)
    {
      v9->_localPeerID = (NSString *)*((id *)a4 + 4);
      v10 = objc_msgSend(*((id *)a4 + 5), "objectForKey:", a3);
    }
    else
    {
      v10 = 0;
      v9->_localPeerID = 0;
    }
    v9->_transactionLogType = 1;
    objc_opt_self();
    objc_opt_self();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%d.%@"), +[_PFRoutines _getUUID](), 1, CFSTR("cdt"));
    if (v10)
      v12 = *(void **)(v10 + 160);
    else
      v12 = 0;
    v9->_knowledgeVector = (PFUbiquityKnowledgeVector *)v12;
    if (a4)
    {
      v14 = *((_QWORD *)a4 + 2);
      v13 = *((_QWORD *)a4 + 3);
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    v15 = (PFUbiquityLocation *)+[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v13, (uint64_t)a3, v14, (uint64_t)v11, a5);
    v9->_transactionLogLocation = v15;
    objc_opt_self();
    v16 = (PFUbiquityLocation *)-[PFUbiquityLocation copy](v15, "copy");
    -[PFUbiquityLocation setUbiquityLocationType:](v16, "setUbiquityLocationType:", 21);
    -[PFUbiquityLocation updateHash](v16);
    v9->_temporaryTransactionLogLocation = v16;
    transactionLogLocation = v9->_transactionLogLocation;
    objc_opt_self();
    v18 = (PFUbiquityLocation *)-[PFUbiquityLocation copy](transactionLogLocation, "copy");
    -[PFUbiquityLocation setUbiquityLocationType:](v18, "setUbiquityLocationType:", 26);
    -[PFUbiquityLocation updateHash](v18);
    v9->_stagingTransactionLogLocation = v18;

    v9->_fileProtectionOption = 0;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->_transactionLogLocation = 0;
  self->_stagingTransactionLogLocation = 0;

  self->_temporaryTransactionLogLocation = 0;
  self->_contents = 0;

  self->_saveSnapshot = 0;
  self->_knowledgeVector = 0;

  self->_contentsLock = 0;
  self->_localPeerID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityTransactionLog;
  -[PFUbiquityTransactionLog dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  PFUbiquityLocation *transactionLogLocation;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityTransactionLog;
  v4 = -[PFUbiquityTransactionLog description](&v7, sel_description);
  if (self)
    transactionLogLocation = self->_transactionLogLocation;
  else
    transactionLogLocation = 0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\ttransactionLogLocation: %@\n\ttransactionNumber: %@\n"), v4, transactionLogLocation, -[PFUbiquityTransactionLog transactionNumber](self));
}

- (_QWORD)transactionNumber
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result[9];
    v2 = result[3];
    if (v2)
    {
      v3 = *(_QWORD *)(v2 + 40);
      if (v1)
        goto LABEL_4;
    }
    else
    {
      v3 = 0;
      if (v1)
      {
LABEL_4:
        result = (_QWORD *)objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v3);
        if (result)
          return (_QWORD *)result[15];
        return result;
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)releaseInsertedObjects
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 96), "lock");
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
      v3 = *(_QWORD *)(v2 + 40);
    else
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 72);
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v3);
      v6 = v5;
      if (v5)
      {
        v7 = *(void **)(v5 + 88);
        if (v7)
        {

          *(_QWORD *)(v6 + 88) = objc_msgSend(0, "mutableCopy");
        }
      }
    }
    *(_BYTE *)(v1 + 91) = 0;
    return objc_msgSend(*(id *)(v1 + 96), "unlock", v3);
  }
  return result;
}

- (uint64_t)releaseUpdatedObjects
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 96), "lock");
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
      v3 = *(_QWORD *)(v2 + 40);
    else
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 72);
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v3);
      v6 = v5;
      if (v5)
      {
        v7 = *(void **)(v5 + 96);
        if (v7)
        {

          *(_QWORD *)(v6 + 96) = objc_msgSend(0, "mutableCopy");
        }
      }
    }
    *(_BYTE *)(v1 + 92) = 0;
    return objc_msgSend(*(id *)(v1 + 96), "unlock", v3);
  }
  return result;
}

- (uint64_t)releaseDeletedObjects
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 96), "lock");
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
      v3 = *(_QWORD *)(v2 + 40);
    else
      v3 = 0;
    v4 = *(_QWORD *)(v1 + 72);
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v3);
      v6 = v5;
      if (v5)
      {
        v7 = *(void **)(v5 + 104);
        if (v7)
        {

          *(_QWORD *)(v6 + 104) = objc_msgSend(0, "mutableCopy");
        }
      }
    }
    *(_BYTE *)(v1 + 93) = 0;
    return objc_msgSend(*(id *)(v1 + 96), "unlock", v3);
  }
  return result;
}

- (BOOL)releaseContents:(uint64_t)a1
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 96), "lock");

    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 94) = 0;
    -[PFUbiquityTransactionLog releaseInsertedObjects](a1);
    -[PFUbiquityTransactionLog releaseUpdatedObjects](a1);
    -[PFUbiquityTransactionLog releaseDeletedObjects](a1);
    objc_msgSend(*(id *)(a1 + 96), "unlock");
  }
  return a1 != 0;
}

- (uint64_t)loadContents:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  PFUbiquityFileCoordinator *v8;
  PFUbiquityFileCoordinator *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  char v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t *v83;
  uint64_t v84;
  id v85;
  _BYTE v86[12];
  __int16 v87;
  int v88;
  _BYTE v89[24];
  void *v90;
  uint64_t v91;
  _BYTE *v92;
  _BYTE *v93;
  _BYTE v94[24];
  void (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  uint64_t v97;
  _BYTE buf[24];
  void (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 96), "lock");
  if (*(_BYTE *)(a1 + 94))
  {
    objc_msgSend(*(id *)(a1 + 96), "unlock");
    return 1;
  }
  if (*(_BYTE *)(a1 + 58))
  {
    v5 = 24;
LABEL_10:
    v6 = *(_QWORD *)(a1 + v5);
    goto LABEL_11;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = 32;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 57))
  {
    v5 = 40;
    goto LABEL_10;
  }
  v6 = 0;
LABEL_11:
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v85 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v99 = __Block_byref_object_copy__53;
  v100 = __Block_byref_object_dispose__53;
  v101 = 0;
  objc_opt_self();
  v8 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, v6, *(_QWORD *)(a1 + 80));
  v9 = v8;
  if (!v8)
  {

    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
    v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setup assistant was torn down.  Error reading the log file at location: %@"), v6);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquityTransactionLog loadPlistAtLocation:withError:]", 561, v24);
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v24, CFSTR("reason"));
    v15 = (void *)objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134302, v26);
    if (v15)
      goto LABEL_24;
    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    v34 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_DWORD *)v89 = 136315394;
    *(_QWORD *)&v89[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs"
                         "/PFUbiquityTransactionLog.m";
    *(_WORD *)&v89[12] = 1024;
    *(_DWORD *)&v89[14] = 563;
    v83 = v89;
    goto LABEL_63;
  }
  *(_QWORD *)v94 = 0;
  *(_QWORD *)&v94[8] = v94;
  *(_QWORD *)&v94[16] = 0x3052000000;
  v95 = __Block_byref_object_copy__53;
  v96 = __Block_byref_object_dispose__53;
  v97 = 0;
  v10 = *(unsigned __int8 *)(a1 + 88);
  *(_QWORD *)v89 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v89[8] = 3221225472;
  *(_QWORD *)&v89[16] = __58__PFUbiquityTransactionLog_loadPlistAtLocation_withError___block_invoke;
  v90 = &unk_1E1EE1788;
  v91 = v6;
  v92 = v94;
  v93 = buf;
  -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v8, v6, 1, v10, &v85, (uint64_t)v89);

  v11 = *(_QWORD *)(*(_QWORD *)&v94[8] + 40);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_msgSend(*(id *)(*(_QWORD *)&v94[8] + 40), "userInfo");
    v14 = objc_msgSend(v12, "stringWithFormat:", CFSTR("Error encountered trying to read data inside coordinated accessor: %@\nuserInfo: %@, local error: %@\nuserInfo: %@"), v11, v13, v85, objc_msgSend(v85, "userInfo"));
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquityTransactionLog loadPlistAtLocation:withError:]", 605, v14);

    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
    v15 = *(void **)(*(_QWORD *)&v94[8] + 40);
    if (!v15)
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v86 = 136315394;
        *(_QWORD *)&v86[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        v87 = 1024;
        v88 = 608;
        _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v86, 0x12u);
      }
    }
    _Block_object_dispose(v94, 8);
    goto LABEL_24;
  }
  _Block_object_dispose(v94, 8);
  v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (!v37 || v85)
  {
    v62 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error reading the log file at location: %@\nuserInfo: %@"), v85, objc_msgSend(v85, "userInfo"));
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquityTransactionLog loadPlistAtLocation:withError:]", 615, v62);
    v63 = (void *)MEMORY[0x1E0CB35C8];
    v64 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v62, CFSTR("reason"));
    v15 = (void *)objc_msgSend(v63, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134302, v64);
    if (!v15)
    {
      v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v65, v66, v67, v68, v69, v70, v71, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v72 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v94 = 136315394;
        *(_QWORD *)&v94[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        *(_WORD *)&v94[12] = 1024;
        *(_DWORD *)&v94[14] = 617;
        _os_log_fault_impl(&dword_18A253000, v72, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v94, 0x12u);
      }
    }

    v35 = 0;
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
    goto LABEL_25;
  }
  v38 = (id)-[_PFZipFileArchive contentsForEntryName:](v37, (uint64_t)CFSTR("contents"));
  *(_QWORD *)v86 = 0;
  v84 = 0;
  if (v38)
  {
    v35 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v38, 0, &v84, v86);
    if (*(_QWORD *)v86)
    {
      v39 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error during property list parsing during import or opening of log file at location: %@, error: %@"), v6, *(_QWORD *)v86);
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v39, CFSTR("reason"));
      v15 = (void *)objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134302, v41);
      if (!v15)
      {
        v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
        v49 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v94 = 136315394;
          *(_QWORD *)&v94[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transactio"
                               "n Logs/PFUbiquityTransactionLog.m";
          *(_WORD *)&v94[12] = 1024;
          *(_DWORD *)&v94[14] = 632;
          _os_log_fault_impl(&dword_18A253000, v49, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v94, 0x12u);
        }
      }
      *(_QWORD *)v86 = 0;
    }
    else
    {
      v15 = 0;
    }

    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
    goto LABEL_25;
  }
  v73 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error getting data during property list parsing during import or opening of log file at location: %@"), v6);
  v74 = (void *)MEMORY[0x1E0CB35C8];
  v75 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v73, CFSTR("reason"));
  v15 = (void *)objc_msgSend(v74, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134302, v75);
  if (!v15)
  {
    v76 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v76, v77, v78, v79, v80, v81, v82, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    v34 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
LABEL_23:
      v15 = 0;
      goto LABEL_24;
    }
    *(_DWORD *)v94 = 136315394;
    *(_QWORD *)&v94[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs"
                         "/PFUbiquityTransactionLog.m";
    *(_WORD *)&v94[12] = 1024;
    *(_DWORD *)&v94[14] = 637;
    v83 = v94;
LABEL_63:
    _os_log_fault_impl(&dword_18A253000, v34, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v83, 0x12u);
    goto LABEL_23;
  }
LABEL_24:
  v35 = 0;
LABEL_25:
  _Block_object_dispose(buf, 8);
  v4 = 1;
  v36 = objc_msgSend(v35, "mutableCopy");
  *(_QWORD *)(a1 + 8) = v36;
  if (!v36)
  {
    if (!v15)
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134327, 0);
    v4 = 0;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered while trying to load the comparison metadata for transaction log: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityTransactionLog loadContents:]", 345, a1, v15, objc_msgSend(v15, "userInfo"));
  }
  *(_BYTE *)(a1 + 94) = v4;
  objc_msgSend(*(id *)(a1 + 96), "unlock");
  if (v15)
    v50 = v4;
  else
    v50 = 1;
  if ((v50 & 1) == 0)
    v51 = v15;
  objc_msgSend(v7, "drain");
  if ((v4 & 1) == 0)
  {
    v52 = v15;
    if (v15)
    {
      if (a2)
        *a2 = v15;
    }
    else
    {
      v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v53, v54, v55, v56, v57, v58, v59, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v60 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 371;
        _os_log_fault_impl(&dword_18A253000, v60, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v4;
}

- (uint64_t)loadComparisonMetadataWithError:(uint64_t)a1
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PFUbiquityKnowledgeVector *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 89))
    return 1;
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v29 = 0;
  if (-[PFUbiquityTransactionLog loadContents:](a1, &v29))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("peerStates"));
    v7 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("peerIDs"));
    v8 = (char *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("transactionNumber"));
    v9 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("transactionDate"));
    if (!v9
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMissing transaction date from contents: %@"), "-[PFUbiquityTransactionLog loadComparisonMetadataWithError:]", 398, a1, *(_QWORD *)(a1 + 8));
    }
    v10 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v9, "doubleValue");
    v12 = (void *)objc_msgSend(v10, "initWithTimeIntervalSince1970:");
    v13 = *(void **)(a1 + 72);
    if (v13)
      objc_setProperty_nonatomic(v13, v11, v12, 8);

    v14 = *(_QWORD *)(a1 + 24);
    if (v14)
      v15 = *(_QWORD *)(v14 + 40);
    else
      v15 = 0;
    v16 = *(_QWORD *)(a1 + 72);
    if (v16)
      v17 = (PFUbiquityKnowledgeVector *)objc_msgSend(*(id *)(v16 + 40), "objectForKey:", v15);
    else
      v17 = 0;
    -[PFUbiquityStoreSaveSnapshot setTransactionNumber:peerStates:andPeerIDs:]((id *)&v17->super.isa, v8, v6, v7);
    *(_QWORD *)(a1 + 64) = -[PFUbiquityStoreSaveSnapshot createKnowledgeVectorFromPeerStates](v17);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  if (v29)
    v18 = v29;
  objc_msgSend(v5, "drain");
  if ((v3 & 1) != 0)
  {
    *(_BYTE *)(a1 + 89) = 1;
  }
  else
  {
    v19 = v29;
    if (v29)
    {
      if (a2)
        *a2 = v29;
    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquity"
              "TransactionLog.m";
        v32 = 1024;
        v33 = 429;
        _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v3;
}

- (uint64_t)loadImportMetadataWithError:(uint64_t)a1
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 90))
    return 1;
  v25 = 0;
  v3 = -[PFUbiquityTransactionLog loadComparisonMetadataWithError:](a1, &v25);
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("entityNames"));
    v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("compressedGlobalIDs"));
    v7 = objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("primaryKeys"));
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 24);
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 40);
      if (v8)
        goto LABEL_7;
    }
    else
    {
      v10 = 0;
      if (v8)
      {
LABEL_7:
        v11 = (void *)objc_msgSend(*(id *)(v8 + 40), "objectForKey:", v10);
        v9 = *(_QWORD *)(a1 + 24);
        if (v9)
        {
LABEL_8:
          v12 = *(_QWORD *)(v9 + 40);
          goto LABEL_9;
        }
LABEL_22:
        v12 = 0;
LABEL_9:
        -[PFUbiquityStoreSaveSnapshot setEntityNames:globalObjectIDs:primaryKeys:forStoreName:withRootLocation:]((uint64_t)v11, v5, v6, v7, v12);
        v14 = *(_QWORD *)(a1 + 24);
        if (v14)
        {
          v15 = *(void **)(v14 + 32);
          if (!v11)
          {
LABEL_12:
            *(_BYTE *)(a1 + 90) = 1;
            return v3;
          }
        }
        else
        {
          v15 = 0;
          if (!v11)
            goto LABEL_12;
        }
        objc_setProperty_nonatomic(v11, v13, v15, 128);
        goto LABEL_12;
      }
    }
    v11 = 0;
    if (v9)
      goto LABEL_8;
    goto LABEL_22;
  }
  if (v25)
  {
    if (a2)
      *a2 = v25;
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    v23 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m";
      v28 = 1024;
      v29 = 445;
      _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  return v3;
}

- (uint64_t)loadInsertedObjectsDataWithError:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (result)
  {
    v2 = result;
    if (*(_BYTE *)(result + 91))
      return 1;
    result = -[PFUbiquityTransactionLog loadContents:](result, a2);
    if ((_DWORD)result)
    {
      v3 = (void *)objc_msgSend(*(id *)(v2 + 8), "objectForKey:", CFSTR("inserted"));
      v4 = *(_QWORD *)(v2 + 72);
      v5 = *(_QWORD *)(v2 + 24);
      if (v5)
      {
        v6 = *(_QWORD *)(v5 + 40);
        if (v4)
          goto LABEL_7;
      }
      else
      {
        v6 = 0;
        if (v4)
        {
LABEL_7:
          v7 = objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v6);
          if (v7)
          {
            v8 = v7;
            v9 = *(void **)(v7 + 88);
            if (v9 != v3)
            {

              *(_QWORD *)(v8 + 88) = objc_msgSend(v3, "mutableCopy");
            }
          }
        }
      }
      result = 1;
      *(_BYTE *)(v2 + 91) = 1;
    }
  }
  return result;
}

- (uint64_t)loadUpdatedObjectsDataWithError:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (result)
  {
    v2 = result;
    if (*(_BYTE *)(result + 92))
      return 1;
    result = -[PFUbiquityTransactionLog loadContents:](result, a2);
    if ((_DWORD)result)
    {
      v3 = (void *)objc_msgSend(*(id *)(v2 + 8), "objectForKey:", CFSTR("updated"));
      v4 = *(_QWORD *)(v2 + 72);
      v5 = *(_QWORD *)(v2 + 24);
      if (v5)
      {
        v6 = *(_QWORD *)(v5 + 40);
        if (v4)
          goto LABEL_7;
      }
      else
      {
        v6 = 0;
        if (v4)
        {
LABEL_7:
          v7 = objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v6);
          if (v7)
          {
            v8 = v7;
            v9 = *(void **)(v7 + 96);
            if (v9 != v3)
            {

              *(_QWORD *)(v8 + 96) = objc_msgSend(v3, "mutableCopy");
            }
          }
        }
      }
      result = 1;
      *(_BYTE *)(v2 + 92) = 1;
    }
  }
  return result;
}

- (uint64_t)loadDeletedObjectsDataWithError:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (result)
  {
    v2 = result;
    if (*(_BYTE *)(result + 93))
      return 1;
    result = -[PFUbiquityTransactionLog loadContents:](result, a2);
    if ((_DWORD)result)
    {
      v3 = (void *)objc_msgSend(*(id *)(v2 + 8), "objectForKey:", CFSTR("deleted"));
      v4 = *(_QWORD *)(v2 + 72);
      v5 = *(_QWORD *)(v2 + 24);
      if (v5)
      {
        v6 = *(_QWORD *)(v5 + 40);
        if (v4)
          goto LABEL_7;
      }
      else
      {
        v6 = 0;
        if (v4)
        {
LABEL_7:
          v7 = objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v6);
          if (v7)
          {
            v8 = v7;
            v9 = *(void **)(v7 + 104);
            if (v9 != v3)
            {

              *(_QWORD *)(v8 + 104) = objc_msgSend(v3, "mutableCopy");
            }
          }
        }
      }
      result = 1;
      *(_BYTE *)(v2 + 93) = 1;
    }
  }
  return result;
}

void __58__PFUbiquityTransactionLog_loadPlistAtLocation_withError___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = (void *)objc_msgSend(a2, "path");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v3) & 1) != 0)
  {
    v4 = -[_PFZipFileArchive initWithPath:options:error:]([_PFZipFileArchive alloc], v3, 0, *(_QWORD *)(a1[5] + 8) + 40);
    v5 = a1[6];
LABEL_10:
    *(_QWORD *)(*(_QWORD *)(v5 + 8) + 40) = v4;
    return;
  }
  v6 = (_DWORD *)a1[4];
  if (!v6 || v6[6] != 21)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB28A8];
    v11 = (void *)MEMORY[0x1E0C99D80];
    if (!v3)
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 4, objc_msgSend(v11, "dictionaryWithObject:forKey:", v3, CFSTR("missingFile")));
    v5 = a1[5];
    goto LABEL_10;
  }
  objc_opt_self();
  v15 = (id)objc_msgSend(v6, "copy");
  objc_msgSend(v15, "setUbiquityLocationType:", 22);
  -[PFUbiquityLocation updateHash](v15);
  v7 = -[PFUbiquityLocation createFullPath]((uint64_t)v15);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v7))
  {
    v8 = (id)-[PFUbiquityLocation createFullURL]((uint64_t)v15);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB28A8];
    v14 = (void *)MEMORY[0x1E0C99D80];
    if (!v7)
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 4, objc_msgSend(v14, "dictionaryWithObject:forKey:", v7, CFSTR("missingFile")));
  }

}

void __57__PFUbiquityTransactionLog_cleanupExternalDataReferences__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a2, &v3) & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Encountered an error attempting to remove external data reference (%@): %@\nuserInfo: %@\n"), "-[PFUbiquityTransactionLog cleanupExternalDataReferences]_block_invoke", 674, *(_QWORD *)(a1 + 32), v3, objc_msgSend(v3, "userInfo"));
  }
}

- (BOOL)deleteLogFileWithError:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  PFUbiquityFileCoordinator *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__53;
  v25 = __Block_byref_object_dispose__53;
  v26 = 0;
  if (*(_BYTE *)(a1 + 58))
  {
    v4 = 24;
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    v4 = 32;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 57))
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = 40;
  }
  v5 = *(_QWORD *)(a1 + v4);
LABEL_9:
  v6 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, v5, *(_QWORD *)(a1 + 80));
  v7 = (void *)-[PFUbiquityLocation createFullURL](v5);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__PFUbiquityTransactionLog_deleteLogFileWithError___block_invoke;
  v20[3] = &unk_1E1EE0A98;
  v20[4] = &v21;
  -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v6, "coordinateWritingItemAtURL:options:error:byAccessor:", v7, 1, v22 + 5, v20);

  v8 = v22[5];
  v9 = v8 == 0;
  if (v8)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error deleting log file: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquityTransactionLog deleteLogFileWithError:]", 700, a1, v22[5], objc_msgSend((id)v22[5], "userInfo"));
    v10 = v22[5];
    if (v10)
    {
      if (a2)
        *a2 = v10;
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v18 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquity"
              "TransactionLog.m";
        v29 = 1024;
        v30 = 701;
        _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v21, 8);
  return v9;
}

uint64_t __51__PFUbiquityTransactionLog_deleteLogFileWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

- (BOOL)moveFileToPermanentLocationWithError:(uint64_t)a1
{
  int v3;
  PFUbiquityFileCoordinator *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL8 v32;
  void *v34;
  void *v35;
  PFUbiquityFileCoordinator *v36;
  _QWORD v37[7];
  _QWORD v38[7];
  _QWORD v39[5];
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  id v51;
  BOOL v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v51 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v3 = 1;
  v50 = 1;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3052000000;
  v44 = __Block_byref_object_copy__53;
  v45 = __Block_byref_object_dispose__53;
  v46 = 0;
  if (*(_BYTE *)(a1 + 58))
  {
    v34 = 0;
    v35 = 0;
    v4 = 0;
    v52 = 1;
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v6 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 24));
      v7 = -[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 32));
    }
    else
    {
      if (*(_BYTE *)(a1 + 20))
        v6 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 32));
      else
        v6 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 24));
      v7 = -[PFUbiquityLocation createFullURL](*(_QWORD *)(a1 + 40));
    }
    v34 = (void *)v7;
    v35 = v6;
    v36 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 80));
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3052000000;
    v39[3] = __Block_byref_object_copy__53;
    v39[4] = __Block_byref_object_dispose__53;
    v40 = 0;
    v40 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v9 = 0;
    v10 = v48;
    v11 = MEMORY[0x1E0C809B0];
    while (1)
    {
      *((_BYTE *)v10 + 24) = 0;
      v38[0] = v11;
      v38[1] = 3221225472;
      v38[2] = __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke;
      v38[3] = &unk_1E1EE18B0;
      v38[4] = &v47;
      v38[5] = v39;
      v38[6] = &v41;
      -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](v36, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v34, 2, v6, 8, &v51, v38);
      if ((v9 & 1) != 0 || objc_msgSend(v51, "code") != 4 && objc_msgSend((id)v42[5], "code") != 4)
        break;
      v37[0] = v11;
      v37[1] = 3221225472;
      v37[2] = __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke_2;
      v37[3] = &unk_1E1EE1928;
      v37[4] = v39;
      v37[5] = &v47;
      v37[6] = &v41;
      -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v36, "coordinateWritingItemAtURL:options:error:byAccessor:", v8, 8, &v51, v37);
      v10 = v48;
      if (!*((_BYTE *)v48 + 24))
        break;
      v51 = 0;
      v42[5] = 0;
      v9 = 1;
    }
    if (*((_BYTE *)v48 + 24))
    {
      *(_BYTE *)(a1 + 57) = 0;
      v12 = *(_BYTE *)(a1 + 20);
      *(_BYTE *)(a1 + 56) = v12;
      *(_BYTE *)(a1 + 58) = v12 ^ 1;
      v13 = *(_QWORD *)(a1 + 24);
      objc_opt_self();
      if (v13)
      {
        v14 = v13;
        while (*(_DWORD *)(v14 + 24) != 1)
        {
          v14 = *(_QWORD *)(v14 + 8);
          if (!v14)
            goto LABEL_21;
        }
        v15 = *(void **)(v14 + 16);
      }
      else
      {
LABEL_21:
        v15 = 0;
      }
      v16 = -[PFUbiquityLocation createRelativePath](v13);
      v17 = (void *)objc_msgSend((id)objc_msgSend(v16, "stringByDeletingLastPathComponent"), "pathComponents");
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v54 != v19)
              objc_enumerationMutation(v17);
            v15 = (void *)objc_msgSend(v15, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
            if (utimes((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0) < 0)
            {
              v21 = *__error();
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered while updating the modification time for file (%d): %@"), "+[PFUbiquityTransactionLog updateModificationTimesForLocation:]", 1347, v21, v15);
              }
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
        }
        while (v18);
      }

      v3 = 0;
    }
    else
    {
      v22 = v51;
      if (!v51)
      {
        v22 = (id)v42[5];
        if (v22)
          v51 = (id)v42[5];
      }
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: Ubiquity: Error writing export log to file: %@\nerror: %@\nuserInfo: %@"), v6, v22, objc_msgSend(v22, "userInfo"));
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]", 773, v23);
      if (v51)
      {
        if (a2)
          *a2 = v51;
      }
      else
      {
        v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
        v31 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiqui"
                "tyTransactionLog.m";
          v59 = 1024;
          v60 = 774;
          _os_log_fault_impl(&dword_18A253000, v31, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v52 = *((_BYTE *)v48 + 24) != 0;
      v3 = 1;
    }
    _Block_object_dispose(v39, 8);
    v4 = v36;
  }

  if (v3)
    v32 = v52;
  else
    v32 = *((_BYTE *)v48 + 24) != 0;
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v32;
}

uint64_t __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "moveItemAtURL:toURL:error:", a2, a3, *(_QWORD *)(a1[6] + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __65__PFUbiquityTransactionLog_moveFileToPermanentLocationWithError___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a2, 1, 0, *(_QWORD *)(a1[6] + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  }
  return result;
}

- (BOOL)writeToDiskWithError:(void *)a3 andUpdateFilenameInTransactionEntries:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PFUbiquityKnowledgeVector *v10;
  id v11;
  void *v12;
  Class isa;
  PFUbiquityKnowledgeVector *v14;
  id v15;
  id v16;
  void *hash;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *kv;
  Class v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSDictionary *storeKVDict;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  PFUbiquityFileCoordinator *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  _BOOL8 v87;
  uint64_t v89;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[11];
  _QWORD v97[9];
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  void (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  char v107;
  BOOL v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  char v117;
  _BYTE buf[24];
  void (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  uint64_t v121;
  uint8_t v122[32];
  __int128 v123;
  __int128 v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v104 = 0;
  v105 = &v104;
  v106 = 0x2020000000;
  v107 = 1;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3052000000;
  v101 = __Block_byref_object_copy__53;
  v102 = __Block_byref_object_dispose__53;
  v103 = 0;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[PFUbiquityLocation createFullURL](v5);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 24);
  if (v8)
    v9 = *(_QWORD *)(v8 + 40);
  else
    v9 = 0;
  v91 = (void *)v6;
  if (v7)
    v10 = (PFUbiquityKnowledgeVector *)objc_msgSend(*(id *)(v7 + 40), "objectForKey:", v9);
  else
    v10 = 0;

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 94) = 1;
  objc_msgSend(v11, "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), CFSTR("cdVersion"));
  v12 = *(void **)(a1 + 8);
  if (v10)
  {
    objc_msgSend(v12, "setObject:forKey:", v10->_kv, CFSTR("entityNames"));
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v10->_storeKVDict, CFSTR("peerIDs"));
    isa = v10[1].super.isa;
  }
  else
  {
    objc_msgSend(v12, "setObject:forKey:", 0, CFSTR("entityNames"));
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", 0, CFSTR("peerIDs"));
    isa = 0;
  }
  objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", isa, CFSTR("primaryKeys"));
  v14 = -[PFUbiquityStoreSaveSnapshot createKnowledgeVectorFromPeerStates](v10);
  v15 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString]((uint64_t)v14);
  objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v15, CFSTR("kvStr"));

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v123 = 0u;
  v124 = 0u;
  memset(v122, 0, sizeof(v122));
  if (v10)
    hash = (void *)v10->_hash;
  else
    hash = 0;
  v18 = objc_msgSend(hash, "countByEnumeratingWithState:objects:count:", v122, buf, 16);
  if (v18)
  {
    v19 = **(_QWORD **)&v122[16];
    do
    {
      v20 = 0;
      do
      {
        if (**(_QWORD **)&v122[16] != v19)
          objc_enumerationMutation(hash);
        if (v10)
        {
          v22 = v10[2].super.isa;
          kv = v10[2]._kv;
          v23 = (void *)v10[1]._hash;
        }
        else
        {
          kv = 0;
          v23 = 0;
          v22 = 0;
        }
        v24 = -[PFUbiquityGlobalObjectID createCompressedStringWithEntityNameToIndex:primaryKeyToIndex:peerIDToIndex:](*(_QWORD **)(*(_QWORD *)&v122[8] + 8 * v20), v23, kv, v22);
        objc_msgSend(v16, "addObject:", v24);

        ++v20;
      }
      while (v18 != v20);
      v25 = objc_msgSend(hash, "countByEnumeratingWithState:objects:count:", v122, buf, 16);
      v18 = v25;
    }
    while (v25);
  }
  objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v16, CFSTR("compressedGlobalIDs"));

  v26 = *(void **)(a1 + 8);
  if (v10)
  {
    objc_msgSend(v26, "setObject:forKey:", v10[2]._hash, CFSTR("inserted"));
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v10[3].super.isa, CFSTR("updated"));
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v10[3]._kv);
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v10[3]._storeKVDict, CFSTR("peerStates"));
    v27 = v10[3]._hash;
  }
  else
  {
    objc_msgSend(v26, "setObject:forKey:", 0, CFSTR("inserted"));
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", 0, CFSTR("updated"));
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", 0);
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", 0, CFSTR("peerStates"));
    v27 = 0;
  }
  objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v27, CFSTR("transactionNumber"));
  v28 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v29 = *(_QWORD *)(a1 + 72);
  if (v29)
    v30 = *(void **)(v29 + 8);
  else
    v30 = 0;
  objc_msgSend(v30, "timeIntervalSince1970");
  v31 = (void *)objc_msgSend(v28, "initWithDouble:");
  objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v31, CFSTR("transactionDate"));

  v32 = *(_QWORD *)(a1 + 72);
  if (v32)
    v33 = *(_QWORD *)(v32 + 16);
  else
    v33 = 0;
  objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v33, CFSTR("modelVersionHash"));
  if (v10)
  {
    storeKVDict = v10[4]._storeKVDict;
    if (storeKVDict)
    {
      v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v37 = -[NSDictionary countByEnumeratingWithState:objects:count:](storeKVDict, "countByEnumeratingWithState:objects:count:", &v109, &v114, 16);
      v89 = v5;
      if (v37)
      {
        v38 = *(_QWORD *)v110;
        do
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v110 != v38)
              objc_enumerationMutation(storeKVDict);
            v40 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * v39);
            if (v40)
              v41 = *(_QWORD *)(v40 + 56);
            else
              v41 = 0;
            objc_msgSend(v36, "addObject:", v41);
            ++v39;
          }
          while (v37 != v39);
          v42 = -[NSDictionary countByEnumeratingWithState:objects:count:](storeKVDict, "countByEnumeratingWithState:objects:count:", &v109, &v114, 16);
          v37 = v42;
        }
        while (v42);
      }
      objc_msgSend(v35, "setObject:forKey:", v36, CFSTR("inserted"));
      v5 = v89;

      v43 = v10[4]._hash;
      if (!v43)
        goto LABEL_46;
      if (v35)
      {
LABEL_45:
        objc_msgSend(v35, "setObject:forKey:", v43, CFSTR("deleted"));
LABEL_46:
        if (v35)
          objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v35, CFSTR("externalDataReferencesInfo"));
        goto LABEL_49;
      }
LABEL_44:
      v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      goto LABEL_45;
    }
    v43 = v10[4]._hash;
    if (v43)
      goto LABEL_44;
  }
  v35 = 0;
LABEL_49:

  v44 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", *(_QWORD *)(a1 + 8), 200, 0, v99 + 5);
  if (v44)
  {
    v45 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
    v114 = 0;
    v115 = &v114;
    v116 = 0x2020000000;
    v117 = 0;
    if (v5)
    {
      v46 = *(_QWORD *)(v5 + 32);
      if (*(_DWORD *)(v5 + 24) != 1)
        v5 = *(_QWORD *)(v5 + 8);
    }
    else
    {
      v46 = 0;
    }
    v47 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v46, (void *)v5);
    v48 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v47);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v119 = __Block_byref_object_copy__53;
    v120 = __Block_byref_object_dispose__53;
    v121 = 0;
    v121 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v49 = MEMORY[0x1E0C809B0];
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke;
    v97[3] = &unk_1E1EE18D8;
    v97[4] = a1;
    v97[5] = &v114;
    v97[6] = buf;
    v97[7] = &v104;
    v97[8] = &v98;
    -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v45, "coordinateWritingItemAtURL:options:error:byAccessor:", v48, 0, v99 + 5, v97);

    v50 = v105;
    if (*((_BYTE *)v115 + 24) && *((_BYTE *)v105 + 24))
    {
      *((_BYTE *)v115 + 24) = 0;
      v96[0] = v49;
      v96[1] = 3221225472;
      v96[2] = __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke_2;
      v96[3] = &unk_1E1EE1900;
      v96[6] = &v114;
      v96[7] = buf;
      v96[8] = &v104;
      v96[9] = &v98;
      v96[10] = 1;
      v96[4] = v44;
      v96[5] = a1;
      -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v45, "coordinateWritingItemAtURL:options:error:byAccessor:", v91, 8, v99 + 5, v96);
      v50 = v105;
    }
    if (*((_BYTE *)v50 + 24))
    {
      *(_BYTE *)(a1 + 58) = 0;
      *(_WORD *)(a1 + 56) = 256;
      v51 = *(_QWORD *)(a1 + 24);
      if (v51)
        v52 = *(_QWORD *)(v51 + 40);
      else
        v52 = 0;
      v53 = *(_QWORD *)(a1 + 72);
      if (v53 && (v54 = objc_msgSend(*(id *)(v53 + 40), "objectForKey:", v52)) != 0)
        v55 = *(void **)(v54 + 160);
      else
        v55 = 0;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v57 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v92, v113, 16);
      if (v57)
      {
        v58 = *(_QWORD *)v93;
        do
        {
          v59 = 0;
          do
          {
            if (*(_QWORD *)v93 != v58)
              objc_enumerationMutation(a3);
            v60 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v59);
            v61 = *(_QWORD **)(a1 + 24);
            if (v60)
            {
              objc_setProperty_nonatomic(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v59), v56, v61, 48);
              v61 = *(_QWORD **)(a1 + 24);
            }
            if (v61)
              v61 = (_QWORD *)v61[5];
            v62 = *(_QWORD *)(a1 + 72);
            if (v62 && (v63 = objc_msgSend(*(id *)(v62 + 40), "objectForKey:", v61)) != 0)
              v64 = *(_QWORD *)(v63 + 120);
            else
              v64 = 0;
            objc_msgSend(v60, "setTransactionNumber:", v64);
            if (v60)
              objc_setProperty_nonatomic(v60, v56, v55, 56);
            ++v59;
          }
          while (v57 != v59);
          v65 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v92, v113, 16);
          v57 = v65;
        }
        while (v65);
      }
      v66 = 0;
    }
    else
    {
      v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: Ubiquity: Error writing export log to file (%d:%d): %@\nerror: %@\nuserInfo: %@"), *((unsigned __int8 *)v115 + 24), 0, v91, v99[5], objc_msgSend((id)v99[5], "userInfo"));
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]", 904, v69);
      v70 = v99[5];
      if (v70)
      {
        if (a2)
          *a2 = v70;
      }
      else
      {
        v79 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
        v86 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v122 = 136315394;
          *(_QWORD *)&v122[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transacti"
                                "on Logs/PFUbiquityTransactionLog.m";
          *(_WORD *)&v122[12] = 1024;
          *(_DWORD *)&v122[14] = 905;
          _os_log_fault_impl(&dword_18A253000, v86, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v122, 0x12u);
        }
      }
      v108 = *((_BYTE *)v105 + 24) != 0;
      v66 = 1;
    }
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v114, 8);
  }
  else
  {
    v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: Ubiquity: Error creating data for export: %@\nuserInfo: %@\n from transaction log: %@"), v99[5], objc_msgSend((id)v99[5], "userInfo"), a1);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:]", 828, v67);
    v68 = v99[5];
    if (v68)
    {
      if (a2)
        *a2 = v68;
    }
    else
    {
      v71 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v71, v72, v73, v74, v75, v76, v77, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v78 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction "
                             "Logs/PFUbiquityTransactionLog.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 829;
        _os_log_fault_impl(&dword_18A253000, v78, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v45 = 0;
    v108 = 0;
    v66 = 1;
  }
  _Block_object_dispose(&v98, 8);

  if (v66)
    v87 = v108;
  else
    v87 = *((_BYTE *)v105 + 24) != 0;
  _Block_object_dispose(&v104, 8);
  return v87;
}

uint64_t __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v4 = a1[4];
  if (v4)
  {
    v5 = *(_QWORD *)(v4 + 24);
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 32);
      v7 = *(_QWORD *)(v5 + 40);
      v8 = *(_QWORD *)(v5 + 48);
      if (*(_DWORD *)(v5 + 24) != 1)
        v5 = *(_QWORD *)(v5 + 8);
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v5 = 0;
  }
  v9 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v6, v7, v8, (void *)v5);
  v10 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v9);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "fileExistsAtPath:", objc_msgSend(v10, "path")) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a2, 1, 0, *(_QWORD *)(a1[8] + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  }
  return result;
}

void __87__PFUbiquityTransactionLog_writeToDiskWithError_andUpdateFilenameInTransactionEntries___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v4 = (void *)objc_msgSend(a2, "URLByDeletingLastPathComponent");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "fileExistsAtPath:", objc_msgSend(v4, "path")) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, *(_QWORD *)(a1[9] + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a1[4], CFSTR("contents"), 0);
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("contents"), 0);
    v6 = (void *)-[_PFZipFileArchive initWithEntryNames:contents:properties:options:]((uint64_t)[_PFZipFileArchive alloc], v8, v5, 0);
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = -[_PFZipFileArchive writeToFile:options:error:]((uint64_t)v6, (void *)objc_msgSend(a2, "path"), a1[10], *(_QWORD *)(a1[9] + 8) + 40);
    if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
    {
      v7 = a1[5];
      objc_msgSend(a2, "path");
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v7 != 0;
    }

  }
}

- (uint64_t)rewriteToDiskWithError:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v16 = 0;
    if ((*(_BYTE *)(result + 91)
       || -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:](result, &v16))
      && (*(_BYTE *)(v3 + 92) || -[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:](v3, &v16))
      && (*(_BYTE *)(v3 + 93) || -[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:](v3, &v16)))
    {

      *(_QWORD *)(v3 + 8) = 0;
      *(_BYTE *)(v3 + 94) = 0;
      v4 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(v3 + 24));
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      if (objc_msgSend(v5, "fileExistsAtPath:", v4)
        && (objc_msgSend(v5, "removeItemAtPath:error:", v4, &v16) & 1) == 0
        && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError deleting existing log file: %@"), "-[PFUbiquityTransactionLog rewriteToDiskWithError:]", 1003, v3, v16);
      }

      v6 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(v3 + 32));
      if (objc_msgSend(v5, "fileExistsAtPath:", v6)
        && (objc_msgSend(v5, "removeItemAtPath:error:", v6, &v16) & 1) == 0
        && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError deleting existing log file (t): %@"), "-[PFUbiquityTransactionLog rewriteToDiskWithError:]", 1011, v3, v16);
      }

      v7 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(v3 + 40));
      if (objc_msgSend(v5, "fileExistsAtPath:", v7)
        && (objc_msgSend(v5, "removeItemAtPath:error:", v7, &v16) & 1) == 0)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError deleting existing log file (s): %@"), "-[PFUbiquityTransactionLog rewriteToDiskWithError:]", 1020, v3, v16);
      }

      if (-[PFUbiquityTransactionLog writeToDiskWithError:andUpdateFilenameInTransactionEntries:](v3, &v16, 0))
        return 1;
    }
    if (v16)
    {
      if (a2)
      {
        result = 0;
        *a2 = v16;
        return result;
      }
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
      v15 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315394;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m";
      v19 = 1024;
      v20 = 1030;
      _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  return result;
}

+ (void)truncateLogFilesBeforeBaselineMetadata:(void *)a3 withLocalPeerID:(void *)a4 andUbiquityRootLocation:
{
  __objc2_class **p_superclass;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD *v10;
  _BYTE *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  PFUbiquityFileCoordinator *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  p_superclass = &OBJC_METACLASS____PFCachedNumber.superclass;
  if (a2)
  {
    v47 = *(void **)(a2 + 8);
    v7 = *(_QWORD *)(a2 + 40);
  }
  else
  {
    v47 = 0;
    v7 = 0;
  }
  objc_opt_self();
  v70 = 0;
  objc_opt_self();
  v57 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, a3, v47, a4, &v70);
  if (!v57)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Log file truncation failed to get a stack: %@\nuserInfo: %@"), "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1088, v70, objc_msgSend(v70, "userInfo"));
    v49 = 0;
    v50 = 0;
    v57 = 0;
    v40 = 0;
    goto LABEL_83;
  }
  objc_opt_self();
  v8 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v47, (uint64_t)a3);
  v9 = v8;
  if (v8)
  {
    v10 = (_QWORD *)*((_QWORD *)v8 + 11);
    if (v10)
      v10 = (_QWORD *)v10[10];
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (v11 && v11[64])
    -[_PFUbiquityRecordsExporter moveLogsFromTempDirectory]((uint64_t)v11);

  v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  if (v7)
  {
    obj = (id)objc_msgSend(*(id *)(v7 + 8), "allKeys");
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  }
  else
  {
    obj = 0;
    v12 = objc_msgSend(0, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  }
  if (!v12)
  {
    v49 = 0;
    v50 = 0;
    goto LABEL_82;
  }
  v42 = v12;
  v43 = *(_QWORD *)v67;
  v46 = *MEMORY[0x1E0CB28A8];
  v51 = v7;
  v52 = a3;
LABEL_14:
  v48 = 0;
  while (1)
  {
    if (*(_QWORD *)v67 != v43)
      objc_enumerationMutation(obj);
    v13 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v48);
    v14 = +[PFUbiquityLocation createPeerStoreLocationForPeerID:andStoreName:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, (uint64_t)v13, (uint64_t)v47, a4);
    v49 = -[PFUbiquityLocation createFullPath]((uint64_t)v14);
    v50 = v14;
    if (v7)
      v15 = objc_msgSend(*(id *)(v7 + 8), "objectForKey:", v13);
    else
      v15 = 0;
    if (v15)
      v16 = v15;
    else
      v16 = v44;
    v56 = v16;
    v17 = (void *)+[PFUbiquityTransactionEntry transactionEntriesForPeerID:beforeTransacationNumber:forStoreNamed:inManagedObjectContext:]((uint64_t)PFUbiquityTransactionEntry, v13, v16, v47, v57[1]);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v63 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(v57[1], "deleteObject:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
      }
      while (v18);
    }
    if (objc_msgSend(v57[1], "save:", &v70))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Successfully deleted transaction entries before %@ for peer %@"), "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1120, v56, v13);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error deleting transaction entries before %@ for peer %@\nError: %@\nuserInfo: %@"), "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1122, v56, v13, v70, objc_msgSend(v70, "userInfo"));
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v49) & 1) == 0)
    {

      v22 = 0;
      v23 = 0;
      goto LABEL_67;
    }
    v21 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v50, (uint64_t)&v70);
    if (!v70)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v59;
        v53 = *(_QWORD *)v59;
        v54 = v21;
        do
        {
          v26 = 0;
          v55 = v24;
          do
          {
            if (*(_QWORD *)v59 != v25)
              objc_enumerationMutation(v21);
            v27 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v26);
            if (v27 && *(_DWORD *)(v27 + 24) == 22)
            {
              v28 = objc_msgSend(objc_alloc((Class)(p_superclass + 394)), "initWithTransactionLogLocation:andLocalPeerID:", v27, a3);
              -[PFUbiquityTransactionLog loadComparisonMetadataWithError:](v28, &v70);
              if (!v70
                && objc_msgSend(-[PFUbiquityTransactionLog transactionNumber]((_QWORD *)v28), "compare:", v56) == -1)
              {
                if (v28)
                {
                  v29 = (void *)objc_msgSend(*(id *)(v28 + 8), "objectForKey:", CFSTR("externalDataReferencesInfo"));
                  if (v29)
                  {
                    v30 = (void *)objc_msgSend(v29, "objectForKey:", CFSTR("deleted"));
                    v74 = 0u;
                    v75 = 0u;
                    v72 = 0u;
                    v73 = 0u;
                    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
                    if (v31)
                    {
                      v32 = *(_QWORD *)v73;
                      do
                      {
                        for (j = 0; j != v31; ++j)
                        {
                          if (*(_QWORD *)v73 != v32)
                            objc_enumerationMutation(v30);
                          v34 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
                          v35 = +[PFUbiquityLocation createUbiquityExternalDataReferenceFileLocationForUUID:andLog:]((uint64_t)PFUbiquityLocation, v34, v28);
                          v36 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquitousExternalDataReferenceLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v35);
                          v37 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v35);

                          v71[0] = MEMORY[0x1E0C809B0];
                          v71[1] = 3221225472;
                          v71[2] = __57__PFUbiquityTransactionLog_cleanupExternalDataReferences__block_invoke;
                          v71[3] = &unk_1E1EE1888;
                          v71[4] = v34;
                          -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v36, "coordinateWritingItemAtURL:options:error:byAccessor:", v37, 1, 0, v71);

                        }
                        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
                      }
                      while (v31);
                    }
                  }
                }
                -[PFUbiquityTransactionLog deleteLogFileWithError:](v28, &v70);
                v7 = v51;
                a3 = v52;
                p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
                v25 = v53;
                v21 = v54;
                v24 = v55;
                if (v70
                  && (objc_msgSend(v70, "code") != 4
                   || (objc_msgSend((id)objc_msgSend(v70, "domain"), "isEqual:", v46) & 1) == 0)
                  && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error encountered attempting to delete an old log file after the baseline rolled: %@\nuserInfo: %@"), "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1161, v70, objc_msgSend(v70, "userInfo"));
                }
              }

            }
            ++v26;
          }
          while (v26 != v24);
          v38 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
          v24 = v38;
        }
        while (v38);
      }

      v22 = 0;
      v23 = 0;
      goto LABEL_67;
    }
    if (objc_msgSend(v70, "code") != 4)
      break;
    v23 = v49;
    v22 = v50;
LABEL_67:
    if (++v48 == v42)
    {
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      v42 = v39;
      if (!v39)
      {
        v49 = v23;
        v50 = v22;
        goto LABEL_82;
      }
      goto LABEL_14;
    }
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error trying to inspect log files after baseline roll at location: %@\nError: %@\nuserInfo: %@"), "+[PFUbiquityTransactionLog truncateLogFilesForPeerID:storeName:modelVersionHash:beforeKnowledgeVector:withLocalPeerID:andUbiquityRootLocation:]", 1138, v50, v70, objc_msgSend(v70, "userInfo"));
LABEL_82:
  v40 = (void *)v44;
LABEL_83:

}

+ (uint64_t)pruneTemporaryLogDirectoryForPeerRootLocation:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  PFUbiquityTransactionLog *v12;
  uint64_t v13;
  PFUbiquityTransactionLog *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v27 = objc_opt_self();
  v32 = 0;
  v5 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, a2, (uint64_t)&v32);
  v6 = v5;
  if (v5)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (!v7)
      goto LABEL_25;
    v26 = a3;
    v8 = *(_QWORD *)v29;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        if (v11 && *(_DWORD *)(v11 + 24) == 21)
        {
          v12 = [PFUbiquityTransactionLog alloc];
          if (a2)
            v13 = *(_QWORD *)(a2 + 32);
          else
            v13 = 0;
          v14 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:](v12, "initWithTransactionLogLocation:andLocalPeerID:", v11, v13);
          if (!-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v14, &v32))
          {
            v9 = 0;
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError moving transaction log from temporary location: %@ to permanent location:\n%@\n"), "+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]", 1202, v27, v11, v14);
            }
          }

        }
        ++v10;
      }
      while (v7 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      v7 = v15;
    }
    while (v15);
    if ((v9 & 1) != 0)
    {
LABEL_25:
      v16 = 1;
      goto LABEL_29;
    }
  }
  else
  {
    v26 = a3;
  }
  if (!v32)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m");
    v24 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Transaction Logs/PFUbiquityTransactionLog.m";
      v35 = 1024;
      v36 = 1211;
      _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  if (!v26)
  {
LABEL_28:
    v16 = 0;
    goto LABEL_29;
  }
  v16 = 0;
  *v26 = v32;
LABEL_29:

  return v16;
}

@end
