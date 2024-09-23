@implementation PFUbiquitySetupAssistant

- (PFUbiquitySetupAssistant)init
{
  char *v2;
  PFUbiquitySetupAssistant *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquitySetupAssistant;
  v2 = -[PFUbiquitySetupAssistant init](&v5, sel_init);
  v3 = (PFUbiquitySetupAssistant *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 7) = 0;
    *((_QWORD *)v2 + 9) = 0;
    v2[80] = 0;
    *((_WORD *)v2 + 148) = 0;
    v2[298] = 0;
    *((_QWORD *)v2 + 38) = 0;
    *((_WORD *)v2 + 156) = 0;
    *((_QWORD *)v2 + 40) = 0;
    v2[328] = 0;
    *((_QWORD *)v2 + 1) = 0;
    *((_QWORD *)v2 + 2) = 0;
    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 5) = 0;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 196) = 0u;
    *((_QWORD *)v2 + 27) = 0;
    *((_QWORD *)v2 + 28) = 0;
    *((_WORD *)v2 + 116) = 0;
    *((_OWORD *)v2 + 15) = 0u;
    *((_OWORD *)v2 + 16) = 0u;
    *((_WORD *)v2 + 136) = 0;
    *((_QWORD *)v2 + 42) = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3->_gidToRid = (NSMutableDictionary *)objc_opt_new();
    v3->_entityNameToGidSet = (NSMutableDictionary *)objc_opt_new();
    v3->_initialSyncSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v3->_initialSyncComplete = 0;
    v3->_queryLocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_notifyAboutSetupProgress = 0;
    v3->_numSetupTries = 0;
    v3->_retryDelaySec = 60;
    v3->_failSetup = 0;
    v3->_failSetupError = 0;
    v3->_gotAccountChange = 0;
  }
  return v3;
}

- (PFUbiquitySetupAssistant)initWithPersistentStoreCoordinator:(id)a3 andStoreOptions:(id)a4 forPersistentStoreOfType:(id)a5 atURL:(id)a6
{
  PFUbiquitySetupAssistant *v10;

  v10 = -[PFUbiquitySetupAssistant init](self, "init");
  if (v10)
  {
    v10->_options = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a4);
    v10->_psc = (NSPersistentStoreCoordinator *)a3;
    v10->_storeURL = (NSURL *)a6;
    v10->_storeType = (NSString *)a5;
  }
  return v10;
}

- (void)dealloc
{
  SEL v3;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_options = 0;
  self->_psc = 0;

  self->_storeType = 0;
  self->_storeURL = 0;

  self->_actualStoreFileURL = 0;
  self->_storeKV = 0;

  self->_storeMetadataDict = 0;
  self->_localPeerID = 0;

  self->_ubiquityName = 0;
  self->_ubiquityContainerIdentifier = 0;

  self->_ubiquityIdentityToken = 0;
  self->_ubiquityRootURL = 0;

  self->_ubiquityRootSubpath = 0;
  self->_ubiquityRootLocation = 0;

  self->_localRootLocation = 0;
  self->_modelVersionHash = 0;

  self->_stack = 0;
  self->_storeMetadata = 0;
  self->_localPeerState = 0;

  self->_metaKV = 0;
  self->_localPeerReceipt = 0;

  self->_receiptKV = 0;
  self->_containerIdentifier = 0;

  self->_preStoreContainerUUID = 0;
  self->_migrationAssistant = 0;

  self->_migrationManager = 0;
  self->_baseline = 0;

  self->_logLocationsExportedDuringSideLoad = 0;
  self->_gidToRid = 0;

  self->_entityNameToGidSet = 0;
  self->_entry = 0;

  self->_previousModelVersionHash = 0;
  self->_seedStoreURL = 0;

  self->_baselineKV = 0;
  self->_queryLocations = 0;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_initialSyncSemaphore);
  dispatch_release((dispatch_object_t)self->_initialSyncSemaphore);
  objc_setProperty_nonatomic(self, v3, 0, 416);
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySetupAssistant;
  -[PFUbiquitySetupAssistant dealloc](&v4, sel_dealloc);
}

- (void)longDescription
{
  void *v2;
  objc_super v4;

  v4.receiver = (id)a1;
  v4.super_class = (Class)PFUbiquitySetupAssistant;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", objc_msgSendSuper2(&v4, sel_description));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\toptions: %@"), *(_QWORD *)(a1 + 8));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tpsc: %@"), *(_QWORD *)(a1 + 16));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tstore: %@"), *(_QWORD *)(a1 + 24));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tstoreURL: %@"), *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tactualStoreURL: %@"), *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tstoreMetadata: %@"), *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tstoreKV: %@"), *(_QWORD *)(a1 + 72));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tstoreFileExists: %d"), *(unsigned __int8 *)(a1 + 227));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tstoreFileIsReadOnly: %d"), *(unsigned __int8 *)(a1 + 228));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tubiquityEnabled: %d"), *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tubiquityIdentityToken: %@"), *(_QWORD *)(a1 + 88));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tubiquityRootURL: %@"), *(_QWORD *)(a1 + 96));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tubiquityRootSubpath: %@"), *(_QWORD *)(a1 + 104));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tubiquityName: %@"), *(_QWORD *)(a1 + 112));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tubiquityContainerIdentifier: %@"), *(_QWORD *)(a1 + 120));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tlocalPeerID: %@"), *(_QWORD *)(a1 + 128));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tmodelVersionHash: %@"), *(_QWORD *)(a1 + 136));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tubiquityRootLocation: %@"), *(_QWORD *)(a1 + 152));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tlocalRootLocation: %@"), *(_QWORD *)(a1 + 160));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tmetaKV: %@"), *(_QWORD *)(a1 + 192));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tbaseline: %@"), *(_QWORD *)(a1 + 200));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tbaselineFileExists: %d"), *(unsigned __int8 *)(a1 + 208));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\thasUploadingBaseline: %d"), *(unsigned __int8 *)(a1 + 209));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tmonitorBaslineUploadAsync: %d"), *(unsigned __int8 *)(a1 + 210));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tdidBaselineCopy: %d"), *(unsigned __int8 *)(a1 + 211));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tbaselineKV: %@"), *(_QWORD *)(a1 + 216));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\thasStoreMetadataFile: %d"), *(unsigned __int8 *)(a1 + 229));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\thasStoreMetadataEntry: %d"), *(unsigned __int8 *)(a1 + 230));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\thasContainerUUID: %d"), *(unsigned __int8 *)(a1 + 231));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\thasContainerUUIDInStore: %d"), *(unsigned __int8 *)(a1 + 232));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tneedsMetadataRecovery: %d"), *(unsigned __int8 *)(a1 + 233));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tlocalPeerReceipt: %@"), *(_QWORD *)(a1 + 240));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\treceiptKV: %@"), *(_QWORD *)(a1 + 248));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tcontainerIdentifier: %@"), *(_QWORD *)(a1 + 256));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tpreStoreContainerUUID: %@"), *(_QWORD *)(a1 + 264));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tusedExistingUUIDMapping: %d"), *(unsigned __int8 *)(a1 + 272));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\thasLocalTransactionLogs: %d"), *(unsigned __int8 *)(a1 + 273));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tvotedOffIsland: %d"), *(unsigned __int8 *)(a1 + 224));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\treapUbiquitousLogs: %d"), *(unsigned __int8 *)(a1 + 225));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\trespondToBaselineRoll: %d"), *(unsigned __int8 *)(a1 + 226));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\thasMigrationOptions: %d"), *(unsigned __int8 *)(a1 + 274));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tdidMigrateBaseline: %d"), *(unsigned __int8 *)(a1 + 275));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tstoreWasMigrated: %d"), *(unsigned __int8 *)(a1 + 276));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\treplayLogsSynchronously: %d"), *(unsigned __int8 *)(a1 + 296));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tuseLocalAccount: %d"), *(unsigned __int8 *)(a1 + 297));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tabortSetup: %d"), *(unsigned __int8 *)(a1 + 313));
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\tgotExportNotification: %d"), *(unsigned __int8 *)(a1 + 328));
  return v2;
}

- (uint64_t)validateOptionsWithError:(uint64_t)a1
{
  uint64_t v4;
  id v6;
  __objc2_class **p_superclass;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  id v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  uint64_t v59;
  int v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  __objc2_class **v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _BYTE v100[128];
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint8_t buf[4];
  const char *v114;
  __int16 v115;
  int v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v97 = 0;
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSUbiquityImporterPrivateStoreKey")), "BOOLValue") & 1) != 0|| (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreRemoveUbiquitousMetadataOption")), "BOOLValue") & 1) != 0)
  {
    return 1;
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  *(_QWORD *)(a1 + 112) = v6;
  if (!v6)
  {
    *(_BYTE *)(a1 + 80) = 0;
    if (!objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentURLKey")))
      return 1;
    v17 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134311, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("No value for NSPersistentStoreUbiquitousContentNameKey was given however there is a value for NSPersistentStoreUbiquitousContentURLKey, did you forget to pass the value for NSPersistentStoreUbiquitousContentNameKey to the options dictionary for this store?"), *MEMORY[0x1E0CB2D50]));
    if (v17)
      goto LABEL_26;
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v25 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
    v115 = 1024;
    v116 = 373;
    goto LABEL_58;
  }
  p_superclass = &OBJC_METACLASS____PFCachedNumber.superclass;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(".")), "count") >= 2
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Invalid option: the value for NSPersistentStoreUbiquitousContentNameKey should not contain periods: %@"), "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 358, *(_QWORD *)(a1 + 112));
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFSTR("SQLite")) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB28A8];
    v28 = (void *)MEMORY[0x1E0C99D80];
    v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The %@ persistent store type does not support iCloud integration."), *(_QWORD *)(a1 + 32));
    v17 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 134080, objc_msgSend(v28, "dictionaryWithObject:forKey:", v29, *MEMORY[0x1E0CB2D50]));
    if (v17)
    {
LABEL_26:
      if (a2)
      {
        v4 = 0;
        *a2 = v17;
        return v4;
      }
      return 0;
    }
    v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v25 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
    v115 = 1024;
    v116 = 364;
LABEL_58:
    _os_log_fault_impl(&dword_18A253000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  *(_QWORD *)(a1 + 120) = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContainerIdentifierKey"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousPeerTokenOption"));
  v9 = v8;
  if (!v8)
  {
LABEL_30:
    v16 = 1;
    goto LABEL_31;
  }
  if (!objc_msgSend(v8, "isNSString") || !objc_msgSend(v9, "length"))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Invalid value for NSPersistentStoreUbiquitousPeerTokenOption: %@"), "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 408, v9);
    goto LABEL_30;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  if (!objc_msgSend(v9, "length"))
    goto LABEL_46;
  v11 = 0;
  v12 = *MEMORY[0x1E0CB28A8];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = 1;
  do
  {
    if ((objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11)) & 1) == 0)
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSPersistentStoreUbiquitousPeerTokenOption must be an alpha numeric string, %@ has invalid characters"), v9);
      v111 = v13;
      v112 = v15;
      v97 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v12, 134311, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1));
      v11 = objc_msgSend(v9, "length");
      v14 = 0;
    }
    ++v11;
  }
  while (v11 < objc_msgSend(v9, "length"));
  p_superclass = (__objc2_class **)(&OBJC_METACLASS____PFCachedNumber + 8);
  if ((v14 & 1) != 0)
  {
LABEL_46:
    v48 = +[PFUbiquitySetupAssistant createDefaultLocalPeerID]();
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v48);
    objc_msgSend(v49, "appendFormat:", CFSTR("~%@"), objc_msgSend(v9, "lowercaseString"));
    *(_QWORD *)(a1 + 128) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v49);

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
LABEL_31:
  v30 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("PFSetupLocationSentinelOverrideKey"));
  if (v30)
  {
    objc_opt_self();
    v31 = (id)_PFUbiquityLocationSentinel;
    _PFUbiquityLocationSentinel = objc_msgSend(v30, "copy");
  }

  v32 = *(_QWORD *)(a1 + 128);
  if (v32)
  {
    if (v32 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      goto LABEL_35;
LABEL_43:
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB28A8];
    v46 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Unable to generate a peer ID for this peer."), *MEMORY[0x1E0CB2D50]);
LABEL_56:
    v51 = 0;
    v97 = objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 134311, v46);
    goto LABEL_61;
  }
  v45 = +[PFUbiquitySetupAssistant createDefaultLocalPeerID]();
  *(_QWORD *)(a1 + 128) = v45;
  if (!v45)
    goto LABEL_43;
LABEL_35:

  if (!v16)
  {
    v47 = (_QWORD *)(a1 + 40);
    if ((objc_msgSend(*(id *)(a1 + 40), "isFileURL") & 1) != 0)
      goto LABEL_95;
LABEL_82:
    v61 = (void *)MEMORY[0x1E0CB35C8];
    v62 = *MEMORY[0x1E0CB28A8];
    v101 = *MEMORY[0x1E0CB2D50];
    v102 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a valid file URL"), *v47);
    v63 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v64 = 134080;
    v65 = v61;
    v66 = v62;
    goto LABEL_83;
  }
  v9 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentURLKey"));
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40)))
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB28A8];
        v109 = *MEMORY[0x1E0CB2D50];
        v110 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The value passed for NSPersistentStoreUbiquitousContentURLKey cannot be the same as the store URL.\nNSPersistentStoreUbiquitousContentNameKey: %@\nstoreURL: %@"), v9, *(_QWORD *)(a1 + 40));
        v35 = (void *)MEMORY[0x1E0C99D80];
        v36 = &v110;
        v37 = &v109;
LABEL_55:
        v46 = objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, 1);
        goto LABEL_56;
      }
      if (objc_msgSend((id)objc_msgSend(v9, "path"), "rangeOfString:", CFSTR(".nosync")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB28A8];
        v107 = *MEMORY[0x1E0CB2D50];
        v108 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The value passed for NSPersistentStoreUbiquitousContentURLKey cannot be inside a .nosync, nothing will ever sync.\n%@"), v9);
        v35 = (void *)MEMORY[0x1E0C99D80];
        v36 = &v108;
        v37 = &v107;
        goto LABEL_55;
      }
      v50 = v9;
      *(_QWORD *)(a1 + 96) = v50;
      *(_QWORD *)(a1 + 152) = +[PFUbiquityLocation createUbiquityLocationForRootURL:]((uint64_t)PFUbiquityLocation, v50);
    }
    else
    {
      if (!objc_msgSend(v9, "isNSString"))
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB28A8];
        v103 = *MEMORY[0x1E0CB2D50];
        v104 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a valid value for NSPersistentStoreUbiquitousContentURLKey, it must be an instance of NSString or NSURL."), v9);
        v35 = (void *)MEMORY[0x1E0C99D80];
        v36 = &v104;
        v37 = &v103;
        goto LABEL_55;
      }
      if (objc_msgSend(v9, "length"))
      {
        if (objc_msgSend(v9, "characterAtIndex:", 0) == 47)
        {
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v34 = *MEMORY[0x1E0CB28A8];
          v105 = *MEMORY[0x1E0CB2D50];
          v106 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a valid value for NSPersistentStoreUbiquitousContentURLKey, it must be a relative path."), v9);
          v35 = (void *)MEMORY[0x1E0C99D80];
          v36 = &v106;
          v37 = &v105;
          goto LABEL_55;
        }
        *(_QWORD *)(a1 + 104) = v9;
      }
    }
  }
  v51 = 1;
LABEL_61:

  v47 = (_QWORD *)(a1 + 40);
  if ((objc_msgSend(*(id *)(a1 + 40), "isFileURL") & 1) == 0)
    goto LABEL_82;
  if (v51)
  {
    *(_BYTE *)(a1 + 228) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption")), "BOOLValue");
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v52 = (void *)objc_msgSend(*(id *)(a1 + 16), "persistentStores");
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v94;
      while (2)
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v94 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")), "isEqualToString:", *(_QWORD *)(a1 + 112)))
          {
            v68 = p_superclass;
            v69 = (void *)MEMORY[0x1E0CB35C8];
            v70 = *MEMORY[0x1E0CB28A8];
            v71 = (void *)MEMORY[0x1E0C99D80];
            v72 = *(_QWORD *)(a1 + 112);
            if (!v72)
              v72 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v73 = *MEMORY[0x1E0CB2D50];
            v74 = objc_msgSend(v57, "URL");
            v67 = objc_msgSend(v69, "errorWithDomain:code:userInfo:", v70, 134311, objc_msgSend(v71, "dictionaryWithObjectsAndKeys:", v72, CFSTR("NSPersistentStoreUbiquitousContentNameKey"), CFSTR("The provided ubiquity name is already in use."), v73, v74, *MEMORY[0x1E0CB3308], 0));
            v97 = v67;
            p_superclass = v68;
            goto LABEL_96;
          }
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
        if (v54)
          continue;
        break;
      }
    }
    *(_QWORD *)(a1 + 304) = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousSeedStoreURLKey"));
    v58 = *(void **)(a1 + 40);
    if (v58 && (objc_msgSend(v58, "isFileURL") & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("SQLite")) & 1) != 0)
      {
        v59 = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, (void *)objc_msgSend(*(id *)(a1 + 16), "managedObjectModel"));
        *(_QWORD *)(a1 + 136) = v59;
        if (v59)
        {
          if (*(_BYTE *)(a1 + 228)
            || (v83 = *(void **)(a1 + 96)) == 0
            || +[PFUbiquitySetupAssistant doBasicSanityCheckForUbiquityRootURL:withError:]((uint64_t)PFUbiquitySetupAssistant, v83, &v97))
          {
            v60 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSInferMappingModelAutomaticallyOption")), "BOOLValue");
            if (v60)
              LOBYTE(v60) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSMigratePersistentStoresAutomaticallyOption")), "BOOLValue");
            *(_BYTE *)(a1 + 274) = v60;
            if (!*(_BYTE *)(a1 + 384))
              *(_BYTE *)(a1 + 384) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("PFUbiquitySetupNotifyAboutProgressKey")), "BOOLValue");
            *(_BYTE *)(a1 + 80) = *(_QWORD *)(a1 + 112) != 0;
            if ((-[PFUbiquitySetupAssistant doPostValidationInit:](a1, &v97) & 1) != 0)
            {
              v4 = 1;
              goto LABEL_102;
            }
          }
          goto LABEL_95;
        }
        v80 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get a model version hash from this coordinator's managed object model: %@"), *(_QWORD *)(a1 + 16));
        if (objc_msgSend(p_superclass + 319, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  No model version hash for coordinator: %@\nModel: %@"), "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 519, *(_QWORD *)(a1 + 16), objc_msgSend(*(id *)(a1 + 16), "managedObjectModel"));
        v81 = (void *)MEMORY[0x1E0CB35C8];
        v82 = *MEMORY[0x1E0CB28A8];
        v98 = *MEMORY[0x1E0CB2D50];
        v99 = v80;
        v63 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
        v64 = 134060;
        v65 = v81;
        v66 = v82;
LABEL_83:
        v67 = objc_msgSend(v65, "errorWithDomain:code:userInfo:", v66, v64, v63);
        v97 = v67;
        goto LABEL_96;
      }
      v75 = (void *)MEMORY[0x1E0CB35C8];
      v76 = *MEMORY[0x1E0CB28A8];
      v77 = (void *)MEMORY[0x1E0C99D80];
      v78 = *MEMORY[0x1E0CB2D50];
      v79 = CFSTR("Core Data Ubiquity integration can only be enabled on SQLite stores, you must pass store type NSSQLiteStoreType to -addPersistentStoreWithType:configuration:URL:storeURL:options:error:.");
    }
    else
    {
      v75 = (void *)MEMORY[0x1E0CB35C8];
      v76 = *MEMORY[0x1E0CB28A8];
      v77 = (void *)MEMORY[0x1E0C99D80];
      v78 = *MEMORY[0x1E0CB2D50];
      v79 = CFSTR("Received a nil or non file URL value for the store URL.");
    }
    v63 = objc_msgSend(v77, "dictionaryWithObject:forKey:", v79, v78);
    v65 = v75;
    v66 = v76;
    v64 = 134311;
    goto LABEL_83;
  }
LABEL_95:
  v67 = v97;
LABEL_96:
  if (v67)
  {
    if (a2)
    {
      v4 = 0;
      *a2 = v67;
      goto LABEL_102;
    }
  }
  else
  {
    v84 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v84, v85, v86, v87, v88, v89, v90, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v91 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v115 = 1024;
      v116 = 550;
      _os_log_fault_impl(&dword_18A253000, v91, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  v4 = 0;
LABEL_102:
  if (objc_msgSend(p_superclass + 319, "canLogMessageAtLevel:", 3))
  {
    v92 = -[PFUbiquitySetupAssistant longDescription](a1);
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 552, v92);
  }
  return v4;
}

+ (void)createDefaultLocalPeerID
{
  NSString *v0;
  NSString *v1;
  const __CFString *v2;
  void *v3;
  Class v4;
  void *v5;
  void *v6;
  __CFString *v7;
  int v8;
  const __CFAllocator *v9;
  const __CFUUID *v10;
  __CFString *v11;
  _QWORD v13[2];
  CFUUIDBytes v14;

  objc_opt_self();
  v0 = NSUserName();
  if (v0 && (v1 = v0, -[NSString length](v0, "length")))
    v2 = -[NSString lowercaseString](v1, "lowercaseString");
  else
    v2 = CFSTR("nobody");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v2);
  objc_msgSend(v3, "appendString:", CFSTR("~"));
  objc_opt_self();
  *(_QWORD *)&v14.byte0 = 0;
  *(_QWORD *)&v14.byte8 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v4 = NSClassFromString((NSString *)CFSTR("UIDevice"));
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  processName: %@"), "+[PFUbiquitySetupAssistant generateMachineUUIDString]", 2083, v5);
  if (v4
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("kbd")) & 1) == 0
    && (v6 = (void *)objc_msgSend((id)-[objc_class currentDevice](v4, "currentDevice"), "identifierForVendor")) != 0)
  {
    v7 = (__CFString *)objc_msgSend(v6, "UUIDString");
  }
  else
  {
    v8 = MEMORY[0x18D76AE60](&v14, v13);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Returning private sys id"), "+[PFUbiquitySetupAssistant generateMachineUUIDString]", 2093);
    if (v8 == -1)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  gethostuuid returned -1. Giving up now."), "+[PFUbiquitySetupAssistant generateMachineUUIDString]", 2108);
      goto LABEL_19;
    }
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
    v10 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], v14);
    v11 = (__CFString *)CFUUIDCreateString(v9, v10);
    CFMakeCollectable(v11);
    CFRelease(v10);
    v7 = v11;
  }
  if (!v7)
  {
LABEL_19:

    return 0;
  }
  objc_msgSend(v3, "appendString:", v7);
  return v3;
}

+ (uint64_t)doBasicSanityCheckForUbiquityRootURL:(uint64_t *)a3 withError:
{
  void *v5;
  uint64_t result;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  uint64_t v24;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v58 = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  result = objc_msgSend(a2, "path");
  if (!result)
    return result;
  v7 = result;
  if ((objc_msgSend(v5, "fileExistsAtPath:", result) & 1) == 0
    && (objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a2, 1, 0, &v58) & 1) == 0)
  {
    v15 = v58;
    if (!v58)
    {
      v34 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v23 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315394;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v61 = 1024;
      v62 = 2740;
      goto LABEL_26;
    }
    goto LABEL_15;
  }
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", v7, &v58);
  if (!v8)
  {
    v15 = v58;
    if (!v58)
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v23 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315394;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v61 = 1024;
      v62 = 2747;
      goto LABEL_26;
    }
    goto LABEL_15;
  }
  v9 = v8;
  v10 = objc_msgSend(v8, "filePosixPermissions");
  if ((objc_msgSend(v9, "fileIsImmutable") & 1) != 0
    || (v24 = objc_msgSend(v9, "fileType"), v24 != *MEMORY[0x1E0CB2B20])
    || v10 <= 0x17F)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB28A8];
    v13 = (void *)MEMORY[0x1E0C99D80];
    if (!a2)
      a2 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 134327, objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", a2, CFSTR("affectedDirectory"), v9, CFSTR("fileAttributes"), CFSTR("CoreData: Ubiquity: must be able to write to the affected path as a directory."), CFSTR("reason"), 0));
    v58 = v14;
    if (!v14)
    {
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v23 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315394;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v61 = 1024;
      v62 = 2756;
      goto LABEL_26;
    }
    goto LABEL_9;
  }
  v25 = (void *)objc_msgSend(v5, "attributesOfFileSystemForPath:error:", v7, &v58);
  if (v25)
  {
    v26 = v25;
    if (objc_msgSend((id)objc_msgSend(v25, "valueForKey:", *MEMORY[0x1E0CB2B00]), "longLongValue") >= 0x100000)
      return 1;
    v48 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB28A8];
    v50 = (void *)MEMORY[0x1E0C99D80];
    if (!a2)
      a2 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, 134327, objc_msgSend(v50, "dictionaryWithObjectsAndKeys:", a2, CFSTR("affectedDirectory"), v26, CFSTR("fileAttributes"), CFSTR("CoreData: Ubiquity: requires at least 1mb of free space to allocate it's metadata storage."), CFSTR("reason"), 0));
    v58 = v14;
    if (!v14)
    {
      v51 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v51, v52, v53, v54, v55, v56, v57, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v23 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if ((_DWORD)result)
      {
        *(_DWORD *)buf = 136315394;
        v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        v61 = 1024;
        v62 = 2772;
        goto LABEL_26;
      }
      return result;
    }
LABEL_9:
    if (a3)
    {
      v15 = v14;
LABEL_16:
      result = 0;
      *a3 = v15;
      return result;
    }
    return 0;
  }
  v15 = v58;
  if (v58)
  {
LABEL_15:
    if (a3)
      goto LABEL_16;
    return 0;
  }
  v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
  _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
  v23 = __pflogFaultLog;
  result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    *(_DWORD *)buf = 136315394;
    v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
    v61 = 1024;
    v62 = 2763;
LABEL_26:
    _os_log_fault_impl(&dword_18A253000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  return result;
}

- (uint64_t)doPostValidationInit:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "ubiquityIdentityToken");
  if (!v4)
    v4 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSUbiquityIdentityTokenOverrideKey"));
  *(_QWORD *)(a1 + 88) = v4;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Current identity token: %@"), "-[PFUbiquitySetupAssistant doPostValidationInit:]", 564, *(_QWORD *)(a1 + 88));
  v5 = *(_QWORD *)(a1 + 88);
  *(_BYTE *)(a1 + 297) = v5 == 0;
  if (v5)
  {
    v6 = (__CFString *)(id)+[PFUbiquitySetupAssistant findContainerIDForToken:storeName:haveExistingMappings:]((uint64_t)PFUbiquitySetupAssistant, v5, *(_QWORD *)(a1 + 112), (BOOL *)(a1 + 312));
    *(_QWORD *)(a1 + 264) = v6;
    if (v6)
    {
      *(_BYTE *)(a1 + 272) = 1;
    }
    else
    {
      v7 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
      *(_QWORD *)(a1 + 264) = v7;
      +[PFUbiquitySetupAssistant setContainerIdentifierUUID:forIdentityToken:forStoreName:]((uint64_t)PFUbiquitySetupAssistant, (uint64_t)v7, *(void **)(a1 + 88), *(_QWORD *)(a1 + 112));
      v6 = *(__CFString **)(a1 + 264);
    }
  }
  else
  {
    v6 = CFSTR("local");
    *(_QWORD *)(a1 + 264) = v6;
  }
  v8 = +[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]((uint64_t)PFUbiquitySetupAssistant, *(void **)(a1 + 40), *(_QWORD *)(a1 + 128), v6, *(_QWORD *)(a1 + 112));
  *(_QWORD *)(a1 + 48) = v8;
  v9 = objc_msgSend((id)objc_msgSend(v8, "path"), "stringByDeletingLastPathComponent");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if ((objc_msgSend(v10, "fileExistsAtPath:", v9) & 1) != 0
    || objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v37))
  {
    *(_BYTE *)(a1 + 227) = objc_msgSend(v10, "fileExistsAtPath:", objc_msgSend(*(id *)(a1 + 48), "path"));
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nStore file exists: %d - %@"), "-[PFUbiquitySetupAssistant doPostValidationInit:]", 592, a1, *(unsigned __int8 *)(a1 + 227), *(_QWORD *)(a1 + 48));
    if (*(_BYTE *)(a1 + 227)
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSPersistentStoreRebuildFromUbiquitousContentOption")), "BOOLValue"))
    {
      if (objc_msgSend(*(id *)(a1 + 16), "_destroyPersistentStoreAtURL:withType:options:error:", *(_QWORD *)(a1 + 48), CFSTR("SQLite"), *(_QWORD *)(a1 + 8), &v37))
      {
        *(_BYTE *)(a1 + 227) = 0;
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to destroy persistent store: %@\n%@"), "-[PFUbiquitySetupAssistant doPostValidationInit:]", 600, *(_QWORD *)(a1 + 48), v37);
      }
    }
    *(_QWORD *)(a1 + 160) = +[PFUbiquityLocation createLocalContainerRootLocationWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(const __CFString **)(a1 + 264), *(_QWORD *)(a1 + 112), *(void **)(a1 + 40));
    objc_opt_self();
    v11 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 128));
    v12 = v11;
    if (v11)
    {
      v13 = *((_QWORD *)v11 + 11);
      if (v13)
        v14 = *(void **)(v13 + 48);
      else
        v14 = 0;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", objc_msgSend(v18, "URL")) & 1) == 0
              && (objc_msgSend(*(id *)(a1 + 48), "isEqual:", objc_msgSend(v18, "URL")) & 1) == 0)
            {
              v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The store name: %@ is already in use.\n\tStore URL: %@\n\tIn Use Store URL: %@\n"), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 40), objc_msgSend(v18, "URL"));
              v19 = (void *)MEMORY[0x1E0CB35C8];
              v20 = (void *)MEMORY[0x1E0C99D80];
              v21 = *(_QWORD *)(a1 + 112);
              if (!v21)
                v21 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v22 = objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, CFSTR("NSPersistentStoreUbiquitousContentNameKey"), v15, *MEMORY[0x1E0CB2D50], 0);
              v37 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134311, v22);
              LOBYTE(v15) = 1;
              goto LABEL_38;
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          if (v15)
            continue;
          break;
        }
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
LABEL_38:

    if ((v15 & 1) == 0)
    {
      v23 = 1;
      goto LABEL_46;
    }
  }
  if (!v37)
  {
    v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v31 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v40 = 1024;
      v41 = 649;
      _os_log_fault_impl(&dword_18A253000, v31, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_45;
  }
  if (!a2)
  {
LABEL_45:
    v23 = 0;
    goto LABEL_46;
  }
  v23 = 0;
  *a2 = v37;
LABEL_46:

  return v23;
}

+ (uint64_t)findContainerIDForToken:(uint64_t)a3 storeName:(BOOL *)a4 haveExistingMappings:
{
  void *v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
    return 0;
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", a3);
  if (a4)
    *a4 = v7 != 0;
  v8 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("PFUbiquitySetupTokenAndIDArray"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v10 = result;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v13, "objectForKey:", CFSTR("token")), "isEqual:", a2))
          return objc_msgSend(v13, "objectForKey:", CFSTR("cid"));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      result = 0;
      if (v10)
        continue;
      break;
    }
  }
  return result;
}

+ (void)setContainerIdentifierUUID:(void *)a3 forIdentityToken:(uint64_t)a4 forStoreName:
{
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = objc_opt_self();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a2, CFSTR("cid"), a3, CFSTR("token"), 0);
  v18 = a4;
  v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", a4), "mutableCopy");
  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = (void *)v7;
  v9 = (id)objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("PFUbiquitySetupTokenAndIDArray")), "mutableCopy");
  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = (void *)objc_msgSend(v15, "objectForKey:", CFSTR("token"));
        if (!objc_msgSend(v16, "isNSString") || !objc_msgSend(a3, "isNSString"))
        {
          if (!objc_msgSend(v16, "isEqual:", a3))
            continue;
LABEL_15:
          objc_msgSend(v10, "addObject:", v15);
          continue;
        }
        if ((objc_msgSend(v16, "isEqualToString:", a3) & 1) != 0)
          goto LABEL_15;
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }
  objc_msgSend(v9, "removeObjectsInArray:", v10);

  objc_msgSend(v9, "addObject:", v19);
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("PFUbiquitySetupTokenAndIDArray"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setObject:forKey:", v8, v18);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "synchronize") & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUser Defaults didn't synchronize"), "+[PFUbiquitySetupAssistant setContainerIdentifierUUID:forIdentityToken:forStoreName:]", 4088, v17);
  }

}

+ (id)createActualStoreURLForStoreURL:(uint64_t)a3 localPeerID:(const __CFString *)a4 containerIdentifier:(uint64_t)a5 andStoreName:
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_opt_self();
  v9 = objc_msgSend((id)objc_msgSend(a2, "path"), "rangeOfString:", CFSTR("CoreDataUbiquitySupport"));
  v10 = a2;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v9;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Looks like we were passed the full URL, not the store file URL: %@\n%@"), "+[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]", 4018, a5, a2);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", objc_msgSend(a2, "path"));
    objc_msgSend(v12, "deleteCharactersInRange:", v11, objc_msgSend(v12, "length") - v11);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 1);

    v10 = (void *)objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(a2, "lastPathComponent"), 0);
  }
  v14 = +[PFUbiquityLocation createLocalStoresPathWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, a3, a4, a5, v10);
  if ((_BYTE)dword_1ECD8DE18)
  {
    objc_msgSend(v14, "appendString:", objc_msgSend(a2, "lastPathComponent"));
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v14);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Created actual store url: %@\nfor url: %@"), "+[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]", 4044, v15, a2);
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Using the original store URL (linked on or after 10.9 / 7.0): %@"), "+[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]", 4046, a2);
    v15 = a2;
  }

  return v15;
}

- (uint64_t)performCoordinatorPostStoreSetup:(_QWORD *)a3 error:
{
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSSaveChangesRequest *v28;
  void *v29;
  _QWORD v30[6];
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v31 = 0;
  if (!*(_BYTE *)(a1 + 80) || (objc_msgSend(a2, "isReadOnly") & 1) != 0)
    return 1;
  *(_QWORD *)(a1 + 24) = a2;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    v8 = -[PFUbiquitySetupAssistant longDescription](a1);
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquitySetupAssistant performCoordinatorPostStoreSetup:error:]", 667, v8);
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel_ubiquityIdentityTokenChanged_, *MEMORY[0x1E0CB3370], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_coordinatorWillRemoveStore_, CFSTR("NSPersistentStoreCoordinatorWillRemoveStoreNotification"), a2);
  objc_opt_self();
  v10 = _sharedSwitchboard;
  if (-[PFUbiquitySwitchboard registerUbiquitizedPersistentStore:withURL:forLocalPeerID:withLocalRootLocation:andUbiquityRootLocation:error:](_sharedSwitchboard, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 128), *(void **)(a1 + 160), *(_QWORD *)(a1 + 152), &v31))
  {
    -[NSPersistentStoreCoordinator _setIsRegisteredWithUbiquity:](*(_QWORD *)(a1 + 16), 1);
    v11 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](v10, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 128));
    *(_QWORD *)(a1 + 320) = v11;
    if (v11)
      v11 = (_QWORD *)v11[11];
    -[PFUbiquitySwitchboardEntryMetadata setUseLocalAccount:]((uint64_t)v11, *(unsigned __int8 *)(a1 + 297) != 0);
    v12 = (void *)objc_msgSend((id)objc_msgSend(a2, "metadata"), "mutableCopy");
    *(_QWORD *)(a1 + 56) = v12;
    *(_BYTE *)(a1 + 64) = 0;
    if (!objc_msgSend(v12, "objectForKey:", CFSTR("PFUbiquitySetupOriginalStoreURLAbsoluteStringKey")))
    {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"), CFSTR("PFUbiquitySetupOriginalStoreURLAbsoluteStringKey"));
      *(_BYTE *)(a1 + 64) = 1;
    }
    v13 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("com.apple.coredata.ubiquity.ubiquitized"));
    if (!v13 || (objc_msgSend(v13, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", &unk_1E1F4B870, CFSTR("com.apple.coredata.ubiquity.ubiquitized"));
      *(_BYTE *)(a1 + 64) = 1;
    }
    if (*(_BYTE *)(a1 + 297))
    {
      v14 = *(_QWORD *)(a1 + 320);
      if (v14)
        v15 = *(_QWORD *)(v14 + 64);
      else
        v15 = 0;
      v16 = -[PFUbiquityContainerMonitor startMonitor:](v15, &v31);
      if (*(_BYTE *)(a1 + 64) && (objc_msgSend(a2, "isReadOnly") & 1) == 0)
      {
        objc_msgSend(a2, "setMetadata:", *(_QWORD *)(a1 + 56));
        v28 = objc_alloc_init(NSSaveChangesRequest);
        objc_msgSend(a2, "executeRequest:withContext:error:", v28, 0, 0);

        if ((v16 & 1) != 0)
        {
LABEL_32:
          v6 = 1;
          goto LABEL_33;
        }
      }
      else if ((v16 & 1) != 0)
      {
        goto LABEL_32;
      }
    }
    else if (-[PFUbiquitySetupAssistant initializeStoreKnowledgeVectorFromStore:error:](a1, a2))
    {
      v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("PFUbiquitySetupSynchronousSideLoadKey")), "BOOLValue");
      v18 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)a2);
      v19 = *(_QWORD *)(a1 + 320);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __67__PFUbiquitySetupAssistant_performCoordinatorPostStoreSetup_error___block_invoke;
      v30[3] = &unk_1E1EDD430;
      v30[4] = a1;
      v30[5] = v18;
      if (-[PFUbiquitySwitchboardEntry finishSetupForStore:withSetupAssistant:synchronously:error:finishBlock:](v19, (uint64_t)v18, (_QWORD *)a1, v17, &v31, (uint64_t)v30))
      {
        goto LABEL_32;
      }
    }
  }
  if (v31)
  {
    if (a3)
    {
      v6 = 0;
      *a3 = v31;
      goto LABEL_33;
    }
  }
  else
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v27 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v34 = 1024;
      v35 = 723;
      _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  v6 = 0;
LABEL_33:
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    v29 = -[PFUbiquitySetupAssistant longDescription](a1);
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquitySetupAssistant performCoordinatorPostStoreSetup:error:]", 726, v29);
  }
  return v6;
}

- (uint64_t)initializeStoreKnowledgeVectorFromStore:(uint64_t)a1 error:(void *)a2
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  PFUbiquityKnowledgeVector *v8;
  _QWORD v10[7];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v2 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (id)objc_msgSend(a2, "persistentStoreCoordinator");
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__65;
    v16 = __Block_byref_object_dispose__65;
    v17 = 0;
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke;
    v11[3] = &unk_1E1EDD618;
    v11[4] = a2;
    v11[5] = &v12;
    objc_msgSend(v4, "performBlockAndWait:", v11);
    v6 = (id)v13[5];
    if (!objc_msgSend((id)v13[5], "objectForKey:", *(_QWORD *)(v2 + 128)))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 0);
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke_2;
      v10[3] = &unk_1E1EDD790;
      v10[4] = a2;
      v10[5] = v2;
      v10[6] = v7;
      objc_msgSend(v4, "performBlockAndWait:", v10);

    }
    v8 = [PFUbiquityKnowledgeVector alloc];
    *(_QWORD *)(v2 + 72) = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:](v8, "initWithStoreKnowledgeVectorDictionary:", v13[5]);
    v2 = 1;

    _Block_object_dispose(&v12, 8);
  }
  return v2;
}

void __67__PFUbiquitySetupAssistant_performCoordinatorPostStoreSetup_error___block_invoke(uint64_t a1)
{
  -[PFUbiquitySetupAssistant finishSetupWithRetry:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)finishSetupWithRetry:(uint64_t)a1
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
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
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  _QWORD v72[6];
  _QWORD v73[6];
  id v74;
  char v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  int v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 && (v4 = objc_loadWeakRetained((id *)(a2 + 8))) != 0)
    {
      v71 = v4;
      if (objc_msgSend(v4, "persistentStoreCoordinator"))
      {
        if (!*(_BYTE *)(a1 + 313))
        {
          v74 = 0;
          WeakRetained = objc_loadWeakRetained((id *)(a2 + 8));
          v6 = objc_msgSend(WeakRetained, "persistentStoreCoordinator");
          if (!*(_BYTE *)(a1 + 80) || *(_BYTE *)(a1 + 297) || *(_BYTE *)(a1 + 228))
          {
            v7 = 1;
            v75 = 1;
            goto LABEL_10;
          }
          if (WeakRetained && (v10 = v6) != 0)
          {
            if (!*(_BYTE *)(a1 + 313))
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                v11 = -[PFUbiquitySetupAssistant longDescription](a1);
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 894, v11);
              }
              ++*(_QWORD *)(a1 + 392);
              if (*(_BYTE *)(a1 + 384))
              {
                v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a1, CFSTR("setupAssistant"), 0);
                objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("PFUbiquitySetupWillFinishNotification"), v10, v12);

              }
              if (*(_BYTE *)(a1 + 313))
                goto LABEL_23;
              if (!-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:](a1, &v74))
                goto LABEL_49;
              if (*(_BYTE *)(a1 + 313)
                || (objc_msgSend(*(id *)(a1 + 112), "isEqualToString:", CFSTR("UserDictionary")) & 1) == 0
                && !objc_msgSend(*(id *)(a1 + 112), "hasPrefix:", CFSTR("PhraseLearning_zh_Han")))
              {
LABEL_23:
                v13 = 0;
                goto LABEL_50;
              }
              if (*(_BYTE *)(a1 + 227) && !*(_BYTE *)(a1 + 296))
              {
                if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("PFUbiquitySetupCheckForFork")), "BOOLValue") & 1) != 0)
                {
                  v15 = 1;
                  goto LABEL_45;
                }
                v14 = 0;
              }
              else
              {
                v14 = 1;
              }
              if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("PFUbiquitySetupDoFork")), "BOOLValue") & 1) == 0)
              {
                v16 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("com.apple.CoreData.ForceUbiquityForkRecovery"));
                if (!v16 || !objc_msgSend(v16, "BOOLValue"))
                {
                  v15 = 0;
LABEL_41:
                  if (!v14)
                    goto LABEL_46;
LABEL_45:
                  if (-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:](a1, v15, WeakRetained, &v74))
                  {
LABEL_46:
                    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("PFUbiquitySetupDoFork")), "BOOLValue"))objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("PFUbiquitySetupDoFork"));
                    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("PFUbiquitySetupCheckForFork"));
                    goto LABEL_23;
                  }
LABEL_49:
                  v13 = 1;
LABEL_50:
                  if (*(_BYTE *)(a1 + 384))
                  {
                    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PFUbiquitySetupWillInitializeReceiptNotification"), a1);
                    if (v13)
                    {
                      v17 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
                      if (v17)
                      {
                        v18 = -[PFUbiquitySetupAssistant longDescription](a1);
                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to read the ubiquity root location.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 949, v18, v74);
LABEL_55:
                        v17 = 0;
                      }
LABEL_58:
                      v19 = *(unsigned __int8 *)(a1 + 384);
                      if (!*(_BYTE *)(a1 + 384) || v17)
                      {
                        if (!v17)
                        {
LABEL_66:
                          if (v19 && !v17)
                          {
                            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                            {
                              v21 = -[PFUbiquitySetupAssistant longDescription](a1);
                              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the container identifier.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 969, v21, v74);
                            }
                            goto LABEL_70;
                          }
                          if (!v17)
                          {
                            v22 = 0;
                            if (!v19)
                              goto LABEL_82;
                            v23 = 1;
                            goto LABEL_76;
                          }
                          if (!*(_BYTE *)(a1 + 313))
                          {
                            if (!-[PFUbiquitySetupAssistant initializeStack:](a1, (uint64_t *)&v74))
                            {
LABEL_70:
                              v22 = 0;
                              v23 = 1;
                              goto LABEL_75;
                            }
                            if (objc_msgSend(*(id *)(a1 + 176), "isInserted"))
                              -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](*(void **)(a1 + 176), WeakRetained, *(_QWORD *)(a1 + 152));
                            v23 = 0;
LABEL_74:
                            v22 = 1;
LABEL_75:
                            if (!*(_BYTE *)(a1 + 384))
                            {
                              if ((v23 & 1) != 0)
                                goto LABEL_82;
                              goto LABEL_81;
                            }
LABEL_76:
                            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PFUbiquitySetupWillInitializeBaselineNotification"), a1);
                            if (v23)
                            {
                              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                              {
                                v24 = -[PFUbiquitySetupAssistant longDescription](a1);
                                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the metadata stack.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 985, v24, v74);
                              }
                              goto LABEL_82;
                            }
LABEL_81:
                            if (!*(_BYTE *)(a1 + 313))
                            {
                              if (-[PFUbiquitySetupAssistant initializeBaselineForStore:error:](a1, WeakRetained, &v74))
                              {
                                v28 = *(_QWORD *)(a1 + 320);
                                if (v28)
                                {
                                  v29 = *(_QWORD *)(v28 + 88);
                                  if (v29)
                                  {
                                    v30 = *(void **)(v29 + 120);
                                    if (!v30
                                      || (objc_setProperty_nonatomic(v30, v27, *(id *)(a1 + 72), 88),
                                          (v31 = *(_QWORD *)(a1 + 320)) != 0)
                                      && (v29 = *(_QWORD *)(v31 + 88)) != 0)
                                    {
                                      v32 = *(void **)(v29 + 120);
                                      if (v32)
                                        objc_setProperty_nonatomic(v32, v27, *(id *)(a1 + 216), 80);
                                    }
                                  }
                                }
                                if (!*(_BYTE *)(a1 + 384))
                                  goto LABEL_89;
                                v22 = 1;
                                goto LABEL_85;
                              }
                              v22 = 0;
                              if (*(_BYTE *)(a1 + 384))
                              {
LABEL_85:
                                objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PFUbiquitySetupWillCheckReceiptNotificaton"), a1);
                                if (!v22)
                                {
                                  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                  {
                                    v25 = -[PFUbiquitySetupAssistant longDescription](a1);
                                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the baseline.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1005, v25, v74);
                                    v26 = 0;
                                    goto LABEL_106;
                                  }
                                  goto LABEL_105;
                                }
LABEL_89:
                                if (*(_BYTE *)(a1 + 313))
                                  v26 = 1;
                                else
                                  v26 = -[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:](a1, WeakRetained, &v74);
LABEL_106:
                                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                                {
                                  v33 = -[PFUbiquitySetupAssistant longDescription](a1);
                                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1015, v33);
                                }
                                if (*(_BYTE *)(a1 + 384))
                                {
                                  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PFUbiquitySetupWillSideLoadStoreNotification"), a1);
                                  if (!v26)
                                  {
                                    v34 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
                                    if (v34)
                                    {
                                      v35 = -[PFUbiquitySetupAssistant longDescription](a1);
                                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to check the knowledge vectors.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1020, v35, v74);
                                      v34 = 0;
                                    }
                                    goto LABEL_120;
                                  }
                                }
                                else if (!v26)
                                {
                                  v34 = 0;
                                  goto LABEL_131;
                                }
                                if (!*(_BYTE *)(a1 + 313))
                                {
                                  if (*(_BYTE *)(a1 + 296))
                                  {
                                    v34 = -[PFUbiquitySetupAssistant sideLoadStore:error:](a1, WeakRetained, &v74);
                                    goto LABEL_120;
                                  }
                                  if (*(_BYTE *)(a1 + 226))
                                  {
                                    v34 = -[PFUbiquitySetupAssistant respondToBaselineRoll:](a1, &v74);
                                    goto LABEL_120;
                                  }
                                }
                                v34 = 1;
LABEL_120:
                                if (*(_BYTE *)(a1 + 384)
                                  && (*(_BYTE *)(a1 + 408) ? (v36 = 1) : (v36 = v34), (v36 & 1) == 0))
                                {
                                  v34 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
                                  if (v34)
                                  {
                                    v37 = -[PFUbiquitySetupAssistant longDescription](a1);
                                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to side load the store.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1043, v37, v74);
                                    v34 = 0;
                                  }
                                }
                                else if (v34)
                                {
                                  if (*(_BYTE *)(a1 + 313))
                                    goto LABEL_175;
                                  if (!*(_BYTE *)(a1 + 233))
                                    goto LABEL_137;
                                  v34 = -[PFUbiquitySetupAssistant attemptMetadataRecoveryForStore:error:](a1, (uint64_t)WeakRetained, (uint64_t *)&v74);
                                }
LABEL_131:
                                if (*(_BYTE *)(a1 + 384) && !v34)
                                {
                                  v34 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
                                  if (v34)
                                  {
                                    v38 = -[PFUbiquitySetupAssistant longDescription](a1);
                                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting metadata recovery.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1055, v38, v74);
                                    v34 = 0;
                                  }
                                  goto LABEL_139;
                                }
                                if (!v34)
                                {
LABEL_139:
                                  if (*(_BYTE *)(a1 + 384) && !v34)
                                  {
                                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                    {
                                      v39 = -[PFUbiquitySetupAssistant longDescription](a1);
                                      v40 = 0;
                                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to cache the metadata entry.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1068, v39, v74);
                                      goto LABEL_155;
                                    }
LABEL_154:
                                    v40 = 0;
LABEL_155:
                                    if (!v40 && *(_BYTE *)(a1 + 384))
                                    {
                                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                      {
                                        v44 = -[PFUbiquitySetupAssistant longDescription](a1);
                                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to finish setup.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1133, v44, v74);
                                        v45 = 0;
                                        goto LABEL_168;
                                      }
LABEL_167:
                                      v45 = 0;
                                      goto LABEL_168;
                                    }
                                    if (!v40)
                                      goto LABEL_167;
                                    if (!*(_BYTE *)(a1 + 313))
                                    {
                                      v46 = *(_QWORD *)(a1 + 168);
                                      if (v46)
                                        v47 = *(void **)(v46 + 8);
                                      else
                                        v47 = 0;
                                      if (objc_msgSend(v47, "hasChanges"))
                                      {
                                        v48 = *(_QWORD *)(a1 + 168);
                                        if (v48)
                                          v49 = *(void **)(v48 + 8);
                                        else
                                          v49 = 0;
                                        v45 = objc_msgSend(v49, "save:", &v74);
                                      }
                                      else
                                      {
                                        v45 = 1;
                                      }
                                      if (*(_BYTE *)(a1 + 298))
                                      {
                                        if (*(_BYTE *)(a1 + 384))
                                          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("PFUbiquitySetupWillSeedStoreNotification"), a1, 0);
                                        v45 = -[PFUbiquitySetupAssistant seedStore:error:](a1, WeakRetained, (uint64_t *)&v74);
                                        if (*(_BYTE *)(a1 + 384))
                                          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("PFUbiquitySetupDidSeedStoreNotification"), a1, 0);
                                      }
LABEL_168:
                                      if (!*(_BYTE *)(a1 + 313) && *(_BYTE *)(a1 + 384))
                                      {
                                        if (!v45
                                          && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                        {
                                          v50 = -[PFUbiquitySetupAssistant longDescription](a1);
                                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to save the metadata changes.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1159, v50, v74);
                                        }
                                        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("PFUbiquitySetupDidFinishNotification"), a1, 0);
                                      }
                                      if (!v45)
                                      {
                                        v7 = 0;
                                        goto LABEL_177;
                                      }
                                    }
LABEL_175:
                                    -[PFUbiquitySwitchboardEntry setupFinished](*(_QWORD *)(a1 + 320));
                                    v7 = 0;
LABEL_10:
                                    if (!*(_BYTE *)(a1 + 424))
                                    {
                                      v8 = 0;
                                      v9 = 1;
                                      goto LABEL_190;
                                    }
LABEL_177:
                                    v8 = v74;
                                    if (!v74)
                                    {
                                      v51 = (void *)MEMORY[0x1E0CB35C8];
                                      if (*(_BYTE *)(a1 + 313))
                                      {
                                        v80 = CFSTR("failed finishing setup for store during asynchronous iCloud initialization");
                                        v52 = objc_msgSend(WeakRetained, "URL");
                                        if (!v52)
                                          v52 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                        v81 = v52;
                                        v53 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
                                        v54 = 134326;
                                      }
                                      else
                                      {
                                        v82 = CFSTR("failed finishing setup for store during asynchronous iCloud initialization");
                                        v55 = objc_msgSend(WeakRetained, "URL");
                                        if (!v55)
                                          v55 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                        v83 = v55;
                                        v53 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
                                        v54 = 134080;
                                      }
                                      v8 = (id)objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v54, v53);
                                      v74 = v8;
                                      if (!v8)
                                      {
                                        v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                                        _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
                                        v63 = __pflogFaultLog;
                                        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                                        {
                                          *(_DWORD *)buf = 136315394;
                                          v77 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ub"
                                                "iquity/Setup/PFUbiquitySetupAssistant.m";
                                          v78 = 1024;
                                          v79 = 1197;
                                          _os_log_fault_impl(&dword_18A253000, v63, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                                        }
                                        v8 = 0;
                                      }
                                    }
                                    v9 = 0;
LABEL_190:

                                    if ((v7 | 2) == 2)
                                    {
                                      if ((v9 & 1) != 0)
                                        goto LABEL_206;
                                    }
                                    else if ((v75 & 1) != 0)
                                    {
                                      goto LABEL_206;
                                    }
                                    if (!*(_BYTE *)(a1 + 313))
                                    {
                                      if (v8
                                        && objc_msgSend(v8, "code") == 4
                                        && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                      {
                                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Setup failed because of a missing file, retrying(%ld): %@"), "-[PFUbiquitySetupAssistant finishSetupWithRetry:]", 850, *(_QWORD *)(a1 + 392), v8);
                                      }
                                      goto LABEL_201;
                                    }
                                    if (*(_BYTE *)(a1 + 424))
                                    {
                                      *(_BYTE *)(a1 + 424) = 0;
LABEL_201:
                                      if (*(_QWORD *)(a1 + 400) && *(_QWORD *)(a1 + 392) == 1)
                                      {
                                        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                        {
                                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@: Retrying after delay: %ld\n%@"), "-[PFUbiquitySetupAssistant finishSetupWithRetry:]", 860, a1, 1, v8);
                                        }
                                        v64 = *(_QWORD *)(a1 + 320);
                                        v72[0] = MEMORY[0x1E0C809B0];
                                        v72[1] = 3221225472;
                                        v72[2] = __49__PFUbiquitySetupAssistant_finishSetupWithRetry___block_invoke;
                                        v72[3] = &unk_1E1EDD430;
                                        v72[4] = a1;
                                        v72[5] = a2;
                                        -[PFUbiquitySwitchboardEntry afterDelay:executeBlockOnPrivateQueue:](v64, (uint64_t)v72, 1.0);
                                      }
                                    }
LABEL_206:

                                    return;
                                  }
                                  if (!v34)
                                    goto LABEL_154;
LABEL_144:
                                  if (*(_BYTE *)(a1 + 313))
                                    goto LABEL_175;
                                  if (*(_BYTE *)(a1 + 209) && !*(_BYTE *)(a1 + 210))
                                  {
                                    v40 = 1;
                                    if ((objc_msgSend(*(id *)(a1 + 200), "waitForFileToUpload:", &v74) & 1) == 0)
                                    {
                                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                      {
                                        v65 = -[PFUbiquitySetupAssistant longDescription](a1);
                                        v40 = 0;
                                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after waiting for the baseline file to upload.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1081, v65, v74);
                                      }
                                      else
                                      {
                                        v40 = 0;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v40 = 1;
                                  }
                                  v41 = *(_QWORD *)(a1 + 320);
                                  if (v41)
                                    v42 = *(_QWORD *)(v41 + 88);
                                  else
                                    v42 = 0;
                                  -[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:](v42, 0);
                                  v43 = *(void **)(a1 + 16);
                                  v73[0] = MEMORY[0x1E0C809B0];
                                  v73[1] = 3221225472;
                                  v73[2] = __54__PFUbiquitySetupAssistant_finishSetupForStore_error___block_invoke;
                                  v73[3] = &unk_1E1EDD430;
                                  v73[4] = a1;
                                  v73[5] = WeakRetained;
                                  objc_msgSend(v43, "performBlockAndWait:", v73);
                                  if (!*(_BYTE *)(a1 + 313))
                                  {
                                    if (-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:](a1, (uint64_t *)&v74))
                                    {
                                      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                                      {
                                        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMoved local log files."), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1101, a1);
                                      }
                                    }
                                    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                    {
                                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError moving local log files to the ubiquity directory: %@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1103, a1, v74);
                                    }
                                    if (!*(_BYTE *)(a1 + 313))
                                    {
                                      if (-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:](a1, &v74))
                                      {
                                        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                                        {
                                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nPruned staging directory"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1109, a1);
                                        }
                                      }
                                      else
                                      {
                                        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                        {
                                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError prungin the staging directory: %@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1112, a1, v74);
                                        }
                                        v74 = 0;
                                      }
                                      if (!*(_BYTE *)(a1 + 313))
                                      {
                                        v66 = *(_QWORD *)(a1 + 320);
                                        if (v66)
                                          v67 = *(_QWORD *)(v66 + 64);
                                        else
                                          v67 = 0;
                                        if (-[PFUbiquityContainerMonitor startMonitor:](v67, &v74))
                                        {
                                          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                                          {
                                            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nStarted Monitor"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1119, a1);
                                          }
                                        }
                                        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                                        {
                                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError starting monitor: %@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1121, a1, v74);
                                        }
                                        if (!*(_BYTE *)(a1 + 313))
                                        {
                                          v68 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                                          v69 = *(_QWORD *)(a1 + 152);
                                          v84 = CFSTR("PFLogLocationsKey");
                                          v70 = *(_QWORD *)(a1 + 376);
                                          if (!v70)
                                            v70 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                                          v85[0] = v70;
                                          objc_msgSend(v68, "postNotificationName:object:userInfo:", CFSTR("PFUbiquityFilePresenterAddPathsNotification"), v69, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1));
                                        }
                                      }
                                    }
                                  }
                                  goto LABEL_155;
                                }
                                if (*(_BYTE *)(a1 + 313))
                                  goto LABEL_175;
LABEL_137:
                                objc_opt_self();
                                if (-[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](_sharedFactory, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 152)))
                                {
                                  goto LABEL_144;
                                }
                                objc_opt_self();
                                v34 = -[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v74);
                                goto LABEL_139;
                              }
LABEL_105:
                              v26 = 0;
                              goto LABEL_106;
                            }
LABEL_82:
                            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                            {
                              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError encountered while preparing store metadata: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 999, a1, v74, objc_msgSend(v74, "userInfo"));
                            }
                            if (*(_BYTE *)(a1 + 384))
                              goto LABEL_85;
                            if (v22)
                              goto LABEL_89;
                            goto LABEL_105;
                          }
LABEL_73:
                          v23 = 0;
                          goto LABEL_74;
                        }
                        if (*(_BYTE *)(a1 + 313))
                          goto LABEL_73;
                        v17 = -[PFUbiquitySetupAssistant initializeContainerIdentifierWithStore:error:](a1, (uint64_t)WeakRetained);
                      }
                      else
                      {
                        v17 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0);
                        if (v17)
                        {
                          v20 = -[PFUbiquitySetupAssistant longDescription](a1);
                          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the receipt file.\n%@"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 959, v20, v74);
                          v17 = 0;
                        }
                      }
                      v19 = *(unsigned __int8 *)(a1 + 384);
                      goto LABEL_66;
                    }
                  }
                  else if ((v13 & 1) != 0)
                  {
                    goto LABEL_55;
                  }
                  if (*(_BYTE *)(a1 + 313))
                    goto LABEL_73;
                  v17 = -[PFUbiquitySetupAssistant initializeReceiptFile:](a1, &v74);
                  goto LABEL_58;
                }
                objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "removeObjectForKey:", CFSTR("com.apple.CoreData.ForceUbiquityForkRecovery"));
                if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "synchronize") & 1) == 0
                  && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUser Defaults didn't synchronize fork removal"), "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 926, a1);
                }
              }
              v15 = 1;
              goto LABEL_41;
            }
          }
          else
          {
            *(_BYTE *)(a1 + 313) = 1;
          }
          v75 = 0;
          v7 = 1;
          goto LABEL_10;
        }
LABEL_14:

        return;
      }
    }
    else
    {
      v71 = 0;
    }
    *(_BYTE *)(a1 + 313) = 1;
    goto LABEL_14;
  }
}

- (uint64_t)initializeContainerIdentifierWithStore:(uint64_t)a1 error:(uint64_t)a2
{
  PFUbiquityContainerIdentifier *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;

  v31 = 0;
  v4 = -[PFUbiquityContainerIdentifier initWithLocalPeerID:storeName:andUbiquityRootLocation:]([PFUbiquityContainerIdentifier alloc], "initWithLocalPeerID:storeName:andUbiquityRootLocation:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 152));
  *(_QWORD *)(a1 + 256) = v4;
  if (-[PFUbiquityContainerIdentifier identifyContainer:]((uint64_t)v4, &v31))
  {
    v5 = *(_QWORD *)(a1 + 256);
    if (v5)
      LOBYTE(v5) = *(_BYTE *)(v5 + 56) != 0;
    *(_BYTE *)(a1 + 231) = v5;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__65;
    v29 = __Block_byref_object_dispose__65;
    v30 = 0;
    v30 = objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("PFUbiquitySetupContainerIdentifierKey"));
    v6 = (void *)v26[5];
    if (v6 && objc_msgSend(v6, "length"))
    {
      v7 = 1;
    }
    else
    {
      v9 = *(void **)(a1 + 16);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __73__PFUbiquitySetupAssistant_initializeContainerIdentifierWithStore_error___block_invoke;
      v24[3] = &unk_1E1EDD618;
      v24[4] = a2;
      v24[5] = &v25;
      objc_msgSend(v9, "performBlockAndWait:", v24);
      v10 = (id)v26[5];
      v11 = (void *)v26[5];
      if (v11 && objc_msgSend(v11, "length"))
      {
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v26[5], CFSTR("PFUbiquitySetupContainerIdentifierKey"));
        v7 = 1;
        *(_BYTE *)(a1 + 64) = 1;
      }
      else
      {
        v7 = 0;
      }
    }
    *(_BYTE *)(a1 + 232) = v7;
    v12 = *(_QWORD *)(a1 + 256);
    if (v12)
    {
      v13 = *(void **)(a1 + 264);
      if (v13 == *(void **)(v12 + 32))
      {
        v14 = 1;
        goto LABEL_18;
      }
    }
    else
    {
      v13 = *(void **)(a1 + 264);
      if (!v13)
      {
        v14 = 1;
        goto LABEL_22;
      }
    }
    v14 = objc_msgSend(v13, "isEqualToString:");
    v12 = *(_QWORD *)(a1 + 256);
    if (!v12)
    {
LABEL_22:
      v15 = 0;
      v16 = (void *)v26[5];
      if (!v16)
        goto LABEL_23;
      goto LABEL_19;
    }
LABEL_18:
    v15 = *(void **)(v12 + 32);
    v16 = (void *)v26[5];
    if (v16 == v15)
    {
LABEL_23:
      v17 = 1;
LABEL_24:
      if (v15 == *(void **)(a1 + 264))
      {
        if ((v14 & v17 & 1) == 0)
          goto LABEL_31;
      }
      else
      {
        v18 = objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 264));
        if ((v14 & v17 & v18 & 1) == 0)
        {
          if (!v18)
          {
            if (!v17)
            {
              if (v14)
              {
                objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", *(_QWORD *)(a1 + 264), CFSTR("PFUbiquitySetupContainerIdentifierKey"));
                v8 = 1;
                *(_BYTE *)(a1 + 64) = 1;
                goto LABEL_46;
              }
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
              {
                v21 = *(_QWORD *)(a1 + 256);
                if (v21)
                  v21 = *(_QWORD *)(v21 + 32);
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nNo one agrees\n\tcontainer: %@\n\tpreStore: %@\n\tstore: %@\n"), "-[PFUbiquitySetupAssistant initializeContainerIdentifierWithStore:error:]", 804, a1, v21, *(_QWORD *)(a1 + 264), v26[5]);
              }
              v22 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "ubiquityIdentityToken");
              if (!v22)
                v22 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSUbiquityIdentityTokenOverrideKey"));
              if (!objc_msgSend(v22, "isEqual:", *(_QWORD *)(a1 + 88)))
              {
LABEL_45:
                v8 = 0;
                goto LABEL_46;
              }
            }
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", *(_QWORD *)(a1 + 264), CFSTR("PFUbiquitySetupContainerIdentifierKey"));
            *(_BYTE *)(a1 + 64) = 1;
            v19 = -[PFUbiquityContainerIdentifier replaceIdentifierWithUUID:error:](*(_QWORD *)(a1 + 256), *(void **)(a1 + 264), &v31);
            goto LABEL_35;
          }
LABEL_31:
          v20 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "ubiquityIdentityToken");
          if (!v20)
            v20 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", CFSTR("NSUbiquityIdentityTokenOverrideKey"));
          if (!objc_msgSend(v20, "isEqual:", *(_QWORD *)(a1 + 88)))
            goto LABEL_45;
          v19 = -[PFUbiquityContainerIdentifier replaceIdentifierWithUUID:error:](*(_QWORD *)(a1 + 256), *(void **)(a1 + 264), &v31);
LABEL_35:
          v8 = v19;
          goto LABEL_46;
        }
      }
      v8 = 1;
LABEL_46:
      _Block_object_dispose(&v25, 8);
      return v8;
    }
LABEL_19:
    v17 = objc_msgSend(v16, "isEqualToString:");
    v15 = (void *)v26[5];
    goto LABEL_24;
  }
  v8 = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCouldn't identify container: %@"), "-[PFUbiquitySetupAssistant initializeContainerIdentifierWithStore:error:]", 817, a1, v31);
    return 0;
  }
  return v8;
}

id __73__PFUbiquitySetupAssistant_initializeContainerIdentifierWithStore_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLCore ubiquityTableValueForKey:](*(void **)(a1 + 32), (uint64_t)CFSTR("containerId"));
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

void __49__PFUbiquitySetupAssistant_finishSetupWithRetry___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_8;

  *(_QWORD *)(v2 + 120) = 0;
  *(_QWORD *)(v2 + 264) = 0;

  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 160) = 0;

  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 152) = 0;

  *(_QWORD *)(v2 + 256) = 0;
  *(_QWORD *)(v2 + 200) = 0;
  *(_WORD *)(v2 + 208) = 0;

  *(_QWORD *)(v2 + 216) = 0;
  *(_QWORD *)(v2 + 168) = 0;
  *(_QWORD *)(v2 + 176) = 0;
  *(_QWORD *)(v2 + 184) = 0;

  *(_QWORD *)(v2 + 192) = 0;
  *(_QWORD *)(v2 + 240) = 0;

  *(_QWORD *)(v2 + 248) = 0;
  *(_QWORD *)(v2 + 256) = 0;

  *(_QWORD *)(v2 + 280) = 0;
  *(_QWORD *)(v2 + 288) = 0;

  *(_QWORD *)(v2 + 376) = objc_opt_new();
  *(_QWORD *)(v2 + 144) = 0;
  if (-[PFUbiquitySetupAssistant doPostValidationInit:](v2, &v3))
  {
    -[PFUbiquitySetupAssistant finishSetupWithRetry:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
LABEL_8:
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCouldn't clean up from failed setup, giving up until the next time -addPersistentStore is called: %@"), "-[PFUbiquitySetupAssistant finishSetupWithRetry:]_block_invoke", 866, *(_QWORD *)(a1 + 32), v3);
  }
}

- (uint64_t)canReadFromUbiquityRootLocation:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t k;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  PFUbiquityLocation *v18;
  int v19;
  PFUbiquityLocation *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *global_queue;
  NSObject *v24;
  dispatch_time_t v25;
  intptr_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unsigned int *v34;
  unsigned int v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  int v50;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  const char *v72;
  PFUbiquityFileCoordinator *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[7];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  _QWORD v89[5];
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  _BYTE v100[128];
  uint64_t v101;
  uint8_t v102[128];
  _BYTE buf[24];
  void (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  uint64_t v106;
  _QWORD v107[2];
  _QWORD v108[2];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v99 = 0;
  v3 = *(_QWORD *)(a1 + 152);
  if (v3)
  {
    v4 = (id)-[PFUbiquityLocation createFullURL](v3);
    v5 = 0;
    if (!+[PFUbiquitySetupAssistant doBasicSanityCheckForUbiquityRootURL:withError:]((uint64_t)PFUbiquitySetupAssistant, v4, (uint64_t *)&v99))goto LABEL_92;
LABEL_20:
    if (*(_BYTE *)(a1 + 425))
    {
      objc_opt_self();
      -[PFUbiquitySwitchboard cacheFilePresenterForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 128));
    }
    v73 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 128));
    v94 = 0;
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isUbiquitousItemAtURL:", *(_QWORD *)(a1 + 96));
    if (v19)
    {
      if (v5
        || (v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "URLForUbiquityContainerIdentifier:", *(_QWORD *)(a1 + 120))) != 0)
      {
        v20 = +[PFUbiquityLocation createUbiquityLocationForRootURL:]((uint64_t)PFUbiquityLocation, v5);
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke;
        v89[3] = &unk_1E1EE0A98;
        v89[4] = &v90;
        -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v73, (uint64_t)v20, 1, 1, &v94, (uint64_t)v89);

      }
    }
    else
    {
      *((_BYTE *)v91 + 24) = 1;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    {
      v72 = "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]";
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Read finished: %d"));
    }
    if (*((_BYTE *)v91 + 24))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      {
        v72 = "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]";
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Read finished: %d / %d / %@"));
      }
      if (v19)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3052000000;
        v104 = __Block_byref_object_copy__65;
        v105 = __Block_byref_object_dispose__65;
        v106 = 0;
        v85 = 0;
        v86 = &v85;
        v87 = 0x3020000000;
        v88 = 0;
        v21 = MEMORY[0x1E0C809B0];
        while (!*(_DWORD *)(a1 + 368) && !*((_DWORD *)v86 + 10))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          {
            v72 = "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]";
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Blocking for initial sync: %@"));
          }
          v22 = *(_QWORD *)(a1 + 120);
          global_queue = dispatch_get_global_queue(0, 0);
          v84[0] = v21;
          v84[1] = 3221225472;
          v84[2] = __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_2;
          v84[3] = &unk_1E1EE1CA0;
          v84[4] = a1;
          v84[5] = &v85;
          v84[6] = buf;
          +[PFUbiquityFilePresenter registerInitialSyncHandlerForURL:andContainerID:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, (uint64_t)v5, v22, global_queue, (uint64_t)v84);
          v24 = *(NSObject **)(a1 + 360);
          v25 = dispatch_time(0, 90000000000);
          v26 = dispatch_semaphore_wait(v24, v25);
          __dmb(0xBu);
          if (!v26)
          {
            if (!*(_QWORD *)(a1 + 360))
            {
              v34 = (unsigned int *)(v86 + 5);
              do
                v35 = __ldaxr(v34);
              while (__stlxr(v35 + 1, v34));
            }
            break;
          }
          _NSCoreDataLog(1, (uint64_t)CFSTR(" iCloud: Error: failed to receive initial sync notification call back in 90 seconds"), v27, v28, v29, v30, v31, v32, (uint64_t)v72);
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Initial sync complete: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1503, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v36 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v36 || *((_DWORD *)v86 + 10))
        {
          v37 = v36;
          v99 = v37;
          if (!v37)
          {
            v37 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, 0);
            v99 = v37;
          }
          _NSCoreDataLog(1, (uint64_t)CFSTR(" iCloud: Error: initial sync notification returned an error (%@)"), v38, v39, v40, v41, v42, v43, (uint64_t)v37);
          v33 = 0;
        }
        else
        {
          v33 = 1;
        }
        _Block_object_dispose(&v85, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        v33 = 1;
      }
      v44 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 152), (uint64_t)&v99);
      if (objc_msgSend(v44, "count"))
      {
        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
        if (v46)
        {
          v47 = *(_QWORD *)v81;
          do
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v81 != v47)
                objc_enumerationMutation(v44);
              v49 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
              if (v49)
              {
                v50 = *(_DWORD *)(v49 + 24);
                if (v50 == 22 || v50 == 10)
                {
                  objc_msgSend(*(id *)(a1 + 376), "addObject:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
                  v50 = *(_DWORD *)(v49 + 24);
                }
                if (v50 == 15)
                {
                  v52 = (void *)-[PFUbiquityLocation createFullURL](v49);
                  if (objc_msgSend((id)objc_msgSend(v52, "path"), "rangeOfString:", CFSTR("ubRoot")) == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Found Peer: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1534, v52);
                    }
                    objc_msgSend(v45, "addObject:", v52);
                  }

                }
              }
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
          }
          while (v46);
        }
        if (objc_msgSend(v45, "count"))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Starting download of all known peers: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1541, v45);
          v53 = dispatch_get_global_queue(0, 0);
          +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v45, v53, (uint64_t)&__block_literal_global_38);
        }

      }
      else if (!v44
             && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to scan root location: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1550, a1, v99);
      }

      v54 = *(_QWORD *)(a1 + 152);
      if (v54
        && *(_BYTE *)(v54 + 88)
        && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAll the faults are live"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1555, a1);
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Store file exists: %d"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1558, *(unsigned __int8 *)(a1 + 227));
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error attempting to read ubiquity root url: %@.\nError: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1560, *(_QWORD *)(a1 + 96), v94, objc_msgSend(v94, "userInfo"));
      v33 = 0;
      v99 = v94;
    }

    _Block_object_dispose(&v90, 8);
    if (v33)
    {
      objc_opt_self();
      if (_usesCloudDocs == 1)
      {
        v55 = *(void **)(a1 + 96);
        if (v55)
        {
          if (objc_msgSend((id)objc_msgSend(v55, "path"), "rangeOfString:", CFSTR("ubRoot")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Starting download on root URL: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1572, *(_QWORD *)(a1 + 96));
            }
            v101 = *(_QWORD *)(a1 + 96);
            v56 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
            v57 = dispatch_get_global_queue(0, 0);
            v79[0] = MEMORY[0x1E0C809B0];
            v79[1] = 3221225472;
            v79[2] = __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_4;
            v79[3] = &unk_1E1EDDB58;
            v79[4] = a1;
            +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v56, v57, (uint64_t)v79);
          }
        }
      }
      v58 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 152), (uint64_t)a2);
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
      if (v59)
      {
        v60 = *(_QWORD *)v76;
        while (2)
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v76 != v60)
              objc_enumerationMutation(v58);
            v62 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j);
            if (v62
              && (*(_DWORD *)(v62 + 24) - 21) <= 1
              && objc_msgSend(*(id *)(v62 + 32), "isEqualToString:", *(_QWORD *)(a1 + 128))
              && objc_msgSend(*(id *)(v62 + 40), "isEqualToString:", *(_QWORD *)(a1 + 112)))
            {
              *(_BYTE *)(a1 + 273) = 1;
              goto LABEL_112;
            }
          }
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
          if (v59)
            continue;
          break;
        }
      }
LABEL_112:

      v16 = 1;
    }
    else
    {
LABEL_92:
      v16 = 0;
    }
    goto LABEL_113;
  }
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "URLForUbiquityContainerIdentifier:", *(_QWORD *)(a1 + 120));
  if (v6)
  {
    v5 = (void *)v6;
    v7 = *(void **)(a1 + 104);
    if (v7)
    {
      v8 = (void *)objc_msgSend(v7, "pathComponents");
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
      v4 = v5;
      if (v9)
      {
        v10 = *(_QWORD *)v96;
        v4 = v5;
        do
        {
          for (k = 0; k != v9; ++k)
          {
            if (*(_QWORD *)v96 != v10)
              objc_enumerationMutation(v8);
            v4 = (id)objc_msgSend(v4, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * k));
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
        }
        while (v9);
        if (!v4)
          goto LABEL_20;
      }
    }
    else
    {
      v4 = (id)objc_msgSend((id)objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("CoreData")), "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 112));
      if (!v4)
        goto LABEL_20;
    }
    objc_msgSend(*(id *)(a1 + 176), "setUbiquityRootURLString:", objc_msgSend(v4, "absoluteString"));
    v17 = v4;
    *(_QWORD *)(a1 + 96) = v17;
    v18 = +[PFUbiquityLocation createUbiquityLocationForRootURL:]((uint64_t)PFUbiquityLocation, v17);
    *(_QWORD *)(a1 + 152) = v18;
    -[PFUbiquitySwitchboardEntry setUbiquityRootLocation:](*(_QWORD *)(a1 + 320), v18);
    goto LABEL_20;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v108[0] = CFSTR("Didn't get a container URL back from URLForUbiquityContainerIdentifier:, giving up now. Please ensure the application is signed with the proper entitlements to read from the container.");
  v107[0] = CFSTR("Reason");
  v107[1] = CFSTR("NSPersistentStoreUbiquitousContainerIdentifierKey");
  v13 = *(_QWORD *)(a1 + 120);
  if (!v13)
    v13 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v108[1] = v13;
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
  v15 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134080, v14);
  v16 = 0;
  v99 = (id)v15;
LABEL_113:
  if (*(_BYTE *)(a1 + 425))
  {
    objc_opt_self();
    -[PFUbiquitySwitchboard removeFilePresenterCachedForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 128));
  }
  if ((v16 & 1) == 0)
  {
    if (v99)
    {
      if (a2)
        *a2 = v99;
    }
    else
    {
      v63 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v63, v64, v65, v66, v67, v68, v69, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v70 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiq"
                             "uitySetupAssistant.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1601;
        _os_log_fault_impl(&dword_18A253000, v70, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v16;
}

- (BOOL)detectAndFixForkedContainer:(void *)a3 store:(id *)a4 error:
{
  const __CFString *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PFUbiquityTransactionLog *v14;
  PFUbiquityLocation *transactionLogLocation;
  NSString *storeName;
  PFUbiquitySaveSnapshot *saveSnapshot;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  PFUbiquityLocation *v24;
  NSString *v25;
  PFUbiquitySaveSnapshot *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  PFUbiquityLocation *v33;
  NSString *v34;
  PFUbiquitySaveSnapshot *v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  _BOOL8 v45;
  PFUbiquityFileCoordinator *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  BOOL v59;
  PFUbiquityBaseline *v60;
  PFUbiquityBaseline *v61;
  PFUbiquityBaseline *v62;
  PFUbiquityBaseline *v63;
  void *v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSManagedObject *v75;
  void *v76;
  uint64_t v77;
  uint64_t ii;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSManagedObject *v84;
  void *v85;
  void *v86;
  id v87;
  PFUbiquityKnowledgeVector *v88;
  PFUbiquityKnowledgeVector *v89;
  void *v90;
  void *v91;
  PFUbiquityKnowledgeVector *v92;
  void *v93;
  PFUbiquityKnowledgeVector *v94;
  uint64_t v95;
  void *v96;
  PFUbiquityFileCoordinator *v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  PFUbiquityLocation *v112;
  int v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  NSManagedObjectContext *v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  id v128;
  id v129;
  id obj;
  id objb;
  id obja;
  void *v133;
  _QWORD v134[7];
  _QWORD v135[6];
  _QWORD v136[8];
  uint64_t v137;
  _QWORD v138[8];
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  char v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE buf[24];
  void (*v165)(uint64_t, uint64_t);
  void (*v166)(uint64_t);
  uint64_t v167;
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  void (*v175)(uint64_t, uint64_t);
  void (*v176)(uint64_t);
  uint64_t v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
  {
    if (a2)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Detecting Fork and is force:%@"), "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2127, v6);
  }
  v159 = 0;
  v115 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v122 = a1;
  if ((objc_msgSend(*(id *)(a1 + 112), "hasPrefix:", CFSTR("UserDictionary")) & 1) != 0)
  {
    v7 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 112), "hasPrefix:", CFSTR("PhraseLearning_zh_Han")))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  v117 = (void *)objc_opt_new();
  v116 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v133 = (void *)objc_opt_new();
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  obj = *(id *)(a1 + 376);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
  v120 = a2;
  if (v9)
  {
    v123 = 0;
    v10 = *(_QWORD *)v156;
    v125 = *(_QWORD *)v156;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v156 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * v11);
        if (v12
          && *(_DWORD *)(v12 + 24) == 22
          && objc_msgSend(*(id *)(v12 + 48), "isEqualToString:", *(_QWORD *)(v122 + 136))
          && objc_msgSend(*(id *)(v12 + 40), "isEqualToString:", *(_QWORD *)(v122 + 112)))
        {
          v127 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v13 = (void *)objc_msgSend(v117, "objectForKey:", *(_QWORD *)(v12 + 32));
          if (!v13)
          {
            v13 = (void *)objc_opt_new();
            objc_msgSend(v117, "setObject:forKey:", v13, *(_QWORD *)(v12 + 32));

          }
          v14 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", v12, *(_QWORD *)(v122 + 128));
          objc_msgSend(v116, "addObject:", v12);
          if (!-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v14, &v159))
          {
            v45 = 0;
            goto LABEL_152;
          }
          if (objc_msgSend(v13, "objectForKey:", -[PFUbiquityTransactionLog transactionNumber](v14)))
            v123 = 1;
          else
            objc_msgSend(v13, "setObject:forKey:", v14, -[PFUbiquityTransactionLog transactionNumber](v14));
          if (-[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v14, &v159))
          {
            if (v14
              && ((transactionLogLocation = v14->_transactionLogLocation) == 0
                ? (storeName = 0)
                : (storeName = transactionLogLocation->_storeName),
                  (saveSnapshot = v14->_saveSnapshot) != 0))
            {
              v18 = (_QWORD *)-[NSMutableDictionary objectForKey:](saveSnapshot->_storeNameToStoreSaveSnapshots, "objectForKey:", storeName);
              if (v18)
                v18 = (_QWORD *)v18[11];
            }
            else
            {
              v18 = 0;
            }
            v153 = 0u;
            v154 = 0u;
            v151 = 0u;
            v152 = 0u;
            v19 = (void *)objc_msgSend(v18, "allValues");
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
            if (v20)
            {
              v21 = *(_QWORD *)v152;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v152 != v21)
                    objc_enumerationMutation(v19);
                  v23 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * i);
                  if (v7)
                    -[PFUbiquitySetupAssistant updateDictionary:withPhraseLearningSnapshot:](v8, v23);
                  else
                    -[PFUbiquitySetupAssistant updateDictionary:withShortcutSnapshot:](v8, v23);
                }
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
              }
              while (v20);
            }
          }
          -[PFUbiquityTransactionLog releaseInsertedObjects]((uint64_t)v14);
          if (-[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v14, &v159))
          {
            if (v14
              && ((v24 = v14->_transactionLogLocation) == 0 ? (v25 = 0) : (v25 = v24->_storeName),
                  (v26 = v14->_saveSnapshot) != 0))
            {
              v27 = (_QWORD *)-[NSMutableDictionary objectForKey:](v26->_storeNameToStoreSaveSnapshots, "objectForKey:", v25);
              if (v27)
                v27 = (_QWORD *)v27[12];
            }
            else
            {
              v27 = 0;
            }
            v149 = 0u;
            v150 = 0u;
            v147 = 0u;
            v148 = 0u;
            v28 = (void *)objc_msgSend(v27, "allValues");
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
            if (v29)
            {
              v30 = *(_QWORD *)v148;
              do
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v148 != v30)
                    objc_enumerationMutation(v28);
                  v32 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * j);
                  if (v7)
                    -[PFUbiquitySetupAssistant updateDictionary:withPhraseLearningSnapshot:](v8, v32);
                  else
                    -[PFUbiquitySetupAssistant updateDictionary:withShortcutSnapshot:](v8, v32);
                }
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
              }
              while (v29);
            }
          }
          -[PFUbiquityTransactionLog releaseUpdatedObjects]((uint64_t)v14);
          if (-[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v14, &v159))
          {
            if (v14
              && ((v33 = v14->_transactionLogLocation) == 0 ? (v34 = 0) : (v34 = v33->_storeName),
                  (v35 = v14->_saveSnapshot) != 0))
            {
              v36 = (_QWORD *)-[NSMutableDictionary objectForKey:](v35->_storeNameToStoreSaveSnapshots, "objectForKey:", v34);
              if (v36)
                v36 = (_QWORD *)v36[13];
            }
            else
            {
              v36 = 0;
            }
            v145 = 0u;
            v146 = 0u;
            v143 = 0u;
            v144 = 0u;
            v37 = (void *)objc_msgSend(v36, "allValues");
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
            if (v38)
            {
              v39 = *(_QWORD *)v144;
              do
              {
                for (k = 0; k != v38; ++k)
                {
                  if (*(_QWORD *)v144 != v39)
                    objc_enumerationMutation(v37);
                  if (v7)
                  {
                    v41 = objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * k), "objectForKey:", CFSTR("reading"));
                    if (v41)
                      objc_msgSend(v8, "removeObjectForKey:", v41);
                  }
                  else
                  {
                    -[PFUbiquitySetupAssistant updateDictionary:withShortcutSnapshot:](v133, *(void **)(*((_QWORD *)&v143 + 1) + 8 * k));
                  }
                }
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
              }
              while (v38);
            }
          }
          -[PFUbiquityTransactionLog releaseContents:]((uint64_t)v14);
          v10 = v125;
          v42 = v159;

          objc_msgSend(v127, "drain");
          v43 = v159;
        }
        ++v11;
      }
      while (v11 != v9);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
      v9 = v44;
    }
    while (v44);
  }
  else
  {
    v123 = 0;
  }
  if ((v123 & 1) != 0 || v120)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Fork detected, will fork now"), "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2264);
    v46 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(v122 + 152));
    v47 = -[PFUbiquityLocation createFullPath](*(_QWORD *)(v122 + 152));
    v48 = +[PFUbiquityLocation createStringByAppendingSubpath:toPath:]((uint64_t)PFUbiquityLocation, (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fork~%@"), *(_QWORD *)(v122 + 128)), objc_msgSend(v47, "stringByDeletingLastPathComponent"));
    v112 = +[PFUbiquityLocation createUbiquityLocationForRootPath:]((uint64_t)PFUbiquityLocation, v48);

    v49 = (void *)-[PFUbiquityLocation createFullURL](*(_QWORD *)(v122 + 152));
    v50 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v112);
    v139 = 0;
    v140 = &v139;
    v141 = 0x2020000000;
    v142 = 1;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3052000000;
    v165 = __Block_byref_object_copy__65;
    v166 = __Block_byref_object_dispose__65;
    v167 = 0;
    v138[0] = MEMORY[0x1E0C809B0];
    v138[1] = 3221225472;
    v138[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke;
    v138[3] = &unk_1E1EE1CC8;
    v138[4] = v116;
    v138[5] = v112;
    v138[6] = buf;
    v138[7] = &v139;
    -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](v46, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v49, 2, v50, 8, &v159, v138);

    if (!*((_BYTE *)v140 + 24) && *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      v159 = *(id *)(*(_QWORD *)&buf[8] + 40);
    objc_opt_self();
    -[PFUbiquitySwitchboard cacheFilePresenterForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v112, *(_QWORD *)(v122 + 128));
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v51 = (void *)objc_msgSend(v133, "allKeys");
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v160, &v172, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v161;
      do
      {
        for (m = 0; m != v52; ++m)
        {
          if (*(_QWORD *)v161 != v53)
            objc_enumerationMutation(v51);
          v55 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * m);
          v56 = (void *)objc_msgSend(v8, "objectForKey:", v55);
          if (v56)
          {
            v57 = (void *)objc_msgSend(v56, "objectForKey:", CFSTR("timestamp"));
            v58 = objc_msgSend((id)objc_msgSend(v133, "objectForKey:", v55), "objectForKey:", CFSTR("timestamp"));
            v59 = !v58 || v57 == 0;
            if (!v59 && (unint64_t)(objc_msgSend(v57, "compare:", v58) + 1) <= 1)
              objc_msgSend(v8, "removeObjectForKey:", v55);
          }
        }
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v160, &v172, 16);
      }
      while (v52);
    }
    v60 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", *(_QWORD *)(v122 + 128), *(_QWORD *)(v122 + 152), *(_QWORD *)(v122 + 112), objc_msgSend(*(id *)(v122 + 16), "managedObjectModel"));
    v61 = v60;
    if (v60
      && -[PFUbiquityBaseline loadFileFromLocation:error:](v60, "loadFileFromLocation:error:", v60->super._currentLocation, &v159))
    {
      -[PFUbiquitySafeSaveFile removeFileFromLocation:error:](v61, v61->super._currentLocation, &v159);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to load baseline from %@"), "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2338, v112);
    }

    v137 = 0;
    v62 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", *(_QWORD *)(v122 + 128), *(_QWORD *)(v122 + 152), *(_QWORD *)(v122 + 112), objc_msgSend(*(id *)(v122 + 16), "managedObjectModel"));
    v63 = v62;
    if (v62)
      -[PFUbiquityBaseline loadFileFromLocation:error:](v62, "loadFileFromLocation:error:", v62->super._currentLocation, &v137);
    -[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]((_BOOL8)v63, a3, *(_QWORD *)(v122 + 128), &v137);
    -[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]((uint64_t)v63, &v137);
    -[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v63, 0, 1, &v137);
    -[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](v63, objc_msgSend(a3, "identifier"));

    v124 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
    -[NSManagedObjectContext setUndoManager:](v124, "setUndoManager:", 0);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v124, "setPersistentStoreCoordinator:", *(_QWORD *)(v122 + 16));
    -[NSManagedObjectContext _setDelegate:](v124, "_setDelegate:", v122);
    -[NSManagedObjectContext setMergePolicy:](v124, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
    if (v7)
    {
      v160 = 0uLL;
      v161 = 0uLL;
      v162 = 0uLL;
      v163 = 0uLL;
      v64 = (void *)objc_msgSend(v8, "allValues");
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v160, &v172, 16);
      if (v65)
      {
        v118 = v64;
        v119 = *(_QWORD *)v161;
        do
        {
          v121 = v65;
          for (n = 0; n != v121; ++n)
          {
            if (*(_QWORD *)v161 != v119)
              objc_enumerationMutation(v118);
            v67 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * n);
            v68 = objc_msgSend(v67, "objectForKey:", CFSTR("defaultReading"));
            v69 = objc_msgSend(v67, "objectForKey:", CFSTR("extraInteger1"));
            v70 = objc_msgSend(v67, "objectForKey:", CFSTR("extraInteger2"));
            v71 = objc_msgSend(v67, "objectForKey:", CFSTR("extraString1"));
            v72 = objc_msgSend(v67, "objectForKey:", CFSTR("extraString2"));
            v73 = objc_msgSend(v67, "objectForKey:", CFSTR("frequency"));
            v74 = objc_msgSend(v67, "objectForKey:", CFSTR("reading"));
            objb = (id)objc_msgSend(v67, "objectForKey:", CFSTR("seed"));
            v128 = (id)objc_msgSend(v67, "objectForKey:", CFSTR("surface"));
            v126 = objc_msgSend(v67, "objectForKey:", CFSTR("syllables"));
            v75 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("LearningDictionaryEntry"), v124);
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v68, CFSTR("defaultReading"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v69, CFSTR("extraInteger1"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v70, CFSTR("extraInteger2"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v71, CFSTR("extraString1"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v72, CFSTR("extraString2"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v73, CFSTR("frequency"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v74, CFSTR("reading"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", objb, CFSTR("seed"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v128, CFSTR("surface"));
            -[NSManagedObject setValue:forKey:](v75, "setValue:forKey:", v126, CFSTR("syllables"));
          }
          v65 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v160, &v172, 16);
        }
        while (v65);
      }
    }
    else
    {
      v160 = 0uLL;
      v161 = 0uLL;
      v162 = 0uLL;
      v163 = 0uLL;
      v76 = (void *)objc_msgSend(v8, "allValues");
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v160, &v172, 16);
      if (v77)
      {
        v129 = v76;
        obja = *(id *)v161;
        do
        {
          for (ii = 0; ii != v77; ++ii)
          {
            if (*(id *)v161 != obja)
              objc_enumerationMutation(v129);
            v79 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * ii);
            v80 = objc_msgSend(v79, "objectForKey:", CFSTR("phrase"));
            v81 = objc_msgSend(v79, "objectForKey:", CFSTR("partOfSpeech"));
            v82 = objc_msgSend(v79, "objectForKey:", CFSTR("shortcut"));
            v83 = objc_msgSend(v79, "objectForKey:", CFSTR("timestamp"));
            v84 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("UserDictionaryEntry"), v124);
            -[NSManagedObject setValue:forKey:](v84, "setValue:forKey:", v82, CFSTR("shortcut"));
            -[NSManagedObject setValue:forKey:](v84, "setValue:forKey:", v80, CFSTR("phrase"));
            -[NSManagedObject setValue:forKey:](v84, "setValue:forKey:", v81, CFSTR("partOfSpeech"));
            if (v83)
              -[NSManagedObject setValue:forKey:](v84, "setValue:forKey:", v83, CFSTR("timestamp"));
          }
          v77 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v160, &v172, 16);
        }
        while (v77);
      }
    }
    *(_QWORD *)&v160 = 0;
    *((_QWORD *)&v160 + 1) = &v160;
    *(_QWORD *)&v161 = 0x2020000000;
    BYTE8(v161) = 0;
    v172 = 0;
    v173 = &v172;
    v174 = 0x3052000000;
    v175 = __Block_byref_object_copy__65;
    v176 = __Block_byref_object_dispose__65;
    v177 = 0;
    v85 = *(void **)(v122 + 16);
    v136[0] = MEMORY[0x1E0C809B0];
    v136[1] = 3221225472;
    v136[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_2;
    v136[3] = &unk_1E1EE1A70;
    v136[4] = v122;
    v136[5] = v124;
    v136[6] = &v160;
    v136[7] = &v172;
    objc_msgSend(v85, "performBlockAndWait:", v136);
    v114 = *(unsigned __int8 *)(*((_QWORD *)&v160 + 1) + 24);
    v86 = (void *)v173[5];
    if (v86)
    {
      v87 = v86;
      v159 = (id)v173[5];
    }
    -[NSManagedObjectContext reset](v124, "reset");

    v88 = [PFUbiquityKnowledgeVector alloc];
    v89 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:](v88, "initWithKnowledgeVectorString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:1"), *(_QWORD *)(v122 + 128)));
    v90 = *(void **)(v122 + 16);
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_3;
    v135[3] = &unk_1E1EDD430;
    v135[4] = a3;
    v135[5] = v89;
    objc_msgSend(v90, "performBlockAndWait:", v135);
    v91 = *(void **)(v122 + 72);
    if (v91)
    {

      *(_QWORD *)(v122 + 72) = 0;
    }
    v92 = v89;
    *(_QWORD *)(v122 + 72) = v92;
    v93 = *(void **)(v122 + 216);
    if (v93)
    {

      *(_QWORD *)(v122 + 216) = 0;
      v92 = *(PFUbiquityKnowledgeVector **)(v122 + 72);
    }
    v94 = v92;
    v95 = v122;
    *(_QWORD *)(v122 + 216) = v94;
    v96 = *(void **)(v122 + 192);
    if (v96)
    {

      v95 = v122;
      *(_QWORD *)(v122 + 192) = 0;
    }
    *(_QWORD *)(v122 + 192) = *(id *)(v95 + 72);

    if (v114)
    {
      v97 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v112);
      v98 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v112);
      *((_BYTE *)v140 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
      v134[0] = MEMORY[0x1E0C809B0];
      v134[1] = 3221225472;
      v134[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_4;
      v134[3] = &unk_1E1EE1788;
      v134[4] = v122;
      v134[5] = buf;
      v134[6] = &v139;
      -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](v97, "coordinateWritingItemAtURL:options:error:byAccessor:", v98, 1, &v159, v134);
      if (!*((_BYTE *)v140 + 24)
        && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to delete forked contents: %@"), "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2428, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      }

    }
    objc_opt_self();
    -[PFUbiquitySwitchboard removeFilePresenterCachedForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v112, *(_QWORD *)(v122 + 128));

    _Block_object_dispose(&v172, 8);
    _Block_object_dispose(&v160, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v139, 8);
    v14 = 0;
    v45 = v114 != 0;
  }
  else
  {
    v14 = 0;
    v45 = 1;
  }
LABEL_152:

  v99 = v159;
  objc_msgSend(v115, "drain");
  v100 = 0;
  v101 = v159;
  if (!v45)
  {
    if (v159)
    {
      if (a4)
        *a4 = v159;
    }
    else
    {
      v102 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v102, v103, v104, v105, v106, v107, v108, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v109 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiq"
                             "uitySetupAssistant.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2455;
        _os_log_fault_impl(&dword_18A253000, v109, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v45;
}

- (uint64_t)initializeReceiptFile:(uint64_t)a1
{
  PFUbiquityPeerReceipt *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  _BOOL4 v9;
  _QWORD *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v40 = 0;
  v4 = -[PFUbiquityPeerReceipt initWithLocalPeerID:receiptPeerID:storeName:modelVersionHash:andUbiquityRootLocation:]([PFUbiquityPeerReceipt alloc], "initWithLocalPeerID:receiptPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 152));
  *(_QWORD *)(a1 + 240) = v4;
  if (!-[PFUbiquitySafeSaveFile existsInCloud](v4))
  {
    if (-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:](*(_QWORD *)(a1 + 240), 1, 0, &v40))
    {
      v14 = *(_QWORD *)(a1 + 240);
      if (v14)
      {
        v15 = -[PFUbiquitySafeSaveFile removeFileFromLocation:error:]((_QWORD *)v14, *(void **)(v14 + 24), &v40);

        *(_QWORD *)(a1 + 240) = 0;
        *(_QWORD *)(a1 + 248) = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", 0);
        if (!v15)
          goto LABEL_61;
        return 1;
      }
      *(_QWORD *)(a1 + 240) = 0;
    }
    *(_QWORD *)(a1 + 248) = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", 0);
    goto LABEL_61;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nLocal peer receipt exists in cloud: %@"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1291, a1, *(_QWORD *)(a1 + 240));
  if (-[PFUbiquitySafeSaveFile isFileUploaded:](*(_QWORD *)(a1 + 240), (uint64_t)&v40))
  {
    v5 = *(_QWORD *)(a1 + 240);
    if (v5)
    {
      v6 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(_QWORD *)(v5 + 8), *(_QWORD *)(v5 + 32), 0);
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 240);
      if (v8)
      {
        v9 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 32), 0);
        if (!v7)
        {
          if (!v9)
            return 1;
LABEL_56:
          v27 = *(_QWORD *)(a1 + 240);
          if (v27)
          {
            v28 = -[PFUbiquitySafeSaveFile removeFileFromLocation:error:]((_QWORD *)v27, *(void **)(v27 + 24), &v40);

            *(_QWORD *)(a1 + 240) = 0;
            if (v28)
              return 1;
          }
          else
          {
            *(_QWORD *)(a1 + 240) = 0;
          }
LABEL_61:
          if (v40)
          {
            if (a2)
            {
              v18 = 0;
              *a2 = v40;
              return v18;
            }
          }
          else
          {
            v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
            v36 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/"
                                   "PFUbiquitySetupAssistant.m";
              v42 = 1024;
              v43 = 1375;
              _os_log_fault_impl(&dword_18A253000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
          }
          return 0;
        }
        if (v9)
        {
          v10 = *(_QWORD **)(a1 + 240);
          if (v10)
            v11 = (void *)v10[2];
          else
            v11 = 0;
          v12 = -[PFUbiquitySafeSaveFile removeFileFromLocation:error:](v10, v11, &v40);
          v13 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3);
          if (v12)
          {
            if (v13)
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRemoved dangling temporary peer receipt: %@"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1299, a1, *(_QWORD *)(a1 + 240));
          }
          else
          {
            if (v13)
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError attempting to remove dangling temporary peer receipt: %@\nError: %@\nUserInfo: %@\n"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1301, a1, *(_QWORD *)(a1 + 240), v40, objc_msgSend(v40, "userInfo"));
            v40 = 0;
          }
        }
        v22 = *(_QWORD *)(a1 + 240);
        if (v22)
        {
          v23 = *(_QWORD *)(v22 + 8);
LABEL_42:
          v24 = (void *)-[PFUbiquityLocation createFullURL](v23);
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3648], "unresolvedConflictVersionsOfItemAtURL:", v24), "count"))
          {
            *(_QWORD *)buf = 0;
            if (objc_msgSend(MEMORY[0x1E0CB3648], "removeOtherVersionsOfItemAtURL:error:", v24, buf))
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRemoved conflicting versions of receipt file: %@"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1314, a1, *(_QWORD *)(a1 + 240), v38, v39);
              }
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError attempting to remove conflicts for the receipt file: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1317, a1, *(_QWORD *)(a1 + 240), *(_QWORD *)buf, objc_msgSend(*(id *)buf, "userInfo"));
            }
          }

          v25 = *(_QWORD **)(a1 + 240);
          if (v25 && objc_msgSend(v25, "loadFileFromLocation:error:", v25[3], &v40))
          {
            v26 = *(_QWORD **)(a1 + 240);
            if (v26)
              v26 = (_QWORD *)v26[11];
            *(_QWORD *)(a1 + 248) = v26;
            return 1;
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError reading receipt file, will remove so it can be replaced later: %@"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1328, a1, v40);
          v40 = 0;
          goto LABEL_56;
        }
      }
      else if (!v6)
      {
        return 1;
      }
      v23 = 0;
      goto LABEL_42;
    }
    return 1;
  }
  if (!v40)
  {
    v19 = *(_QWORD *)(a1 + 240);
    if (!v19
      || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(_QWORD *)(v19 + 16), *(_QWORD *)(v19 + 32), 0))
    {
      return 1;
    }
    if (objc_msgSend(*(id *)(a1 + 240), "waitForFileToUpload:", &v40))
    {
      v20 = *(_QWORD **)(a1 + 240);
      if (v20)
        v21 = (void *)v20[2];
      else
        v21 = 0;
      if (!-[PFUbiquitySafeSaveFile removeFileFromLocation:error:](v20, v21, &v40))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing peer receipt from safe save location: %@"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1354, a1, v40);
        v40 = 0;
      }

      *(_QWORD *)(a1 + 240) = 0;
      return 1;
    }
    goto LABEL_61;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError checking receipt file status: %@\n%@"), "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1340, a1, *(_QWORD *)(a1 + 240), v40);
  v16 = *(_QWORD *)(a1 + 240);
  if (!v16)
    goto LABEL_61;
  if (!-[PFUbiquitySafeSaveFile removeFileFromLocation:error:]((_QWORD *)v16, *(void **)(v16 + 24), &v40))
    goto LABEL_61;
  v17 = *(_QWORD *)(a1 + 240);
  v18 = 1;
  if ((-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:](v17, 1, 0, &v40) & 1) == 0)
    goto LABEL_61;
  return v18;
}

- (BOOL)initializeStack:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PFUbiquityFileCoordinator *v11;
  char v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PFUbiquityStoreMetadata *v22;
  uint64_t v23;
  uint64_t v24;
  PFUbiquityStoreMetadata *v25;
  PFUbiquityKnowledgeVector *v26;
  _BOOL8 result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t v55[4];
  const char *v56;
  __int16 v57;
  int v58;
  _BYTE buf[24];
  void *v60;
  void *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 1;
  v46 = &v45;
  v47 = 0x3052000000;
  v48 = __Block_byref_object_copy__65;
  v49 = __Block_byref_object_dispose__65;
  v50 = 0;
  v4 = *(void **)(a1 + 152);
  objc_opt_self();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "setUbiquityLocationType:", 36);
  -[PFUbiquityLocation updateHash](v5);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 96), "URLByAppendingPathComponent:", CFSTR(".cdmetadata.nosync"));
  v7 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v5);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 96), "URLByAppendingPathComponent:", CFSTR(".cdmetadata"));
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (!objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(v6, "path")))
    goto LABEL_11;
  if ((objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(v8, "path")) & 1) != 0)
  {
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, v46 + 5);
    *((_BYTE *)v52 + 24) = v10;
    if (!v10)
    {
LABEL_9:
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Metadata migration failed: %@"), "-[PFUbiquitySetupAssistant migrateMetadataRoot:]", 2819, v46[5]);
      goto LABEL_11;
    }
  }
  else if (!*((_BYTE *)v52 + 24))
  {
    goto LABEL_9;
  }
  v11 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 128));
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __48__PFUbiquitySetupAssistant_migrateMetadataRoot___block_invoke;
  v60 = &unk_1E1EE1D30;
  v61 = v9;
  v62 = &v45;
  v63 = &v51;
  -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](v11, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v6, 2, v7, 8, v46 + 5, buf);

  if (!*((_BYTE *)v52 + 24))
    goto LABEL_9;
  if (objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(v6, "path")))
  {
    v12 = objc_msgSend(v9, "removeItemAtURL:error:", v6, v46 + 5);
    *((_BYTE *)v52 + 24) = v12;
  }
LABEL_11:

  if (*((_BYTE *)v52 + 24))
  {
LABEL_12:
    v13 = 0;
    goto LABEL_15;
  }
  v13 = v46[5];
  if (!v13)
  {
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v43 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v55 = 136315394;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v57 = 1024;
      v58 = 2827;
      _os_log_fault_impl(&dword_18A253000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v55, 0x12u);
    }
    goto LABEL_12;
  }
  v44 = v46[5];
LABEL_15:
  v14 = *((unsigned __int8 *)v52 + 24);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  if (!v14)
    goto LABEL_32;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = +[PFUbiquityLocation createMetadataStoreFileLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(void **)(a1 + 152));
  v17 = -[PFUbiquityLocation createFullPath]((uint64_t)v16);
  *(_BYTE *)(a1 + 229) = objc_msgSend(v15, "fileExistsAtPath:", v17);

  objc_opt_self();
  if ((-[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v44) & 1) == 0)
  {
    v13 = v44;
LABEL_32:
    if (v13)
    {
      if (a2)
      {
        result = 0;
        *a2 = v13;
        return result;
      }
    }
    else
    {
      v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v35 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiqui"
                           "tySetupAssistant.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2907;
      _os_log_fault_impl(&dword_18A253000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  objc_opt_self();
  v18 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v44);
  *(_QWORD *)(a1 + 168) = v18;
  if (v18)
  {
    v19 = (void *)+[PFUbiquityStoreMetadata storeMetadatasWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, *(void **)(a1 + 112), v18[1]);
    v20 = v19;
    if (v19 && objc_msgSend(v19, "count"))
    {
      v21 = objc_msgSend(v20, "lastObject");
      *(_QWORD *)(a1 + 176) = v21;
      if (v21)
        *(_BYTE *)(a1 + 230) = 1;
      if ((unint64_t)objc_msgSend(v20, "count") >= 2)
        *(_BYTE *)(a1 + 233) = 1;
    }
    if (!*(_BYTE *)(a1 + 230))
    {
      v22 = [PFUbiquityStoreMetadata alloc];
      v23 = *(_QWORD *)(a1 + 168);
      if (v23)
        v24 = *(_QWORD *)(v23 + 8);
      else
        v24 = 0;
      v25 = -[PFUbiquityStoreMetadata initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:](v22, "initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 152), v24);
      *(_QWORD *)(a1 + 176) = v25;

    }
    *(_QWORD *)(a1 + 192) = 0;
    v26 = -[_PFUbiquityStack createMetadataStoreKnowledgeVector:](*(_QWORD *)(a1 + 168), &v44);
    *(_QWORD *)(a1 + 192) = v26;
    if (v26)
      goto LABEL_43;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError fetching metadata store knowledge vector, metadata will be recovered: %@"), "-[PFUbiquitySetupAssistant initializeStack:]", 2886, a1, v44);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError trying to open metadata store: %@"), "-[PFUbiquitySetupAssistant initializeStack:]", 2892, a1, v44);
  }
  *(_BYTE *)(a1 + 233) = 1;
LABEL_43:
  if (!*(_BYTE *)(a1 + 229) || !*(_BYTE *)(a1 + 230))
    return 1;
  result = 1;
  if (!*(_BYTE *)(a1 + 227))
    *(_BYTE *)(a1 + 233) = 1;
  return result;
}

- (uint64_t)initializeBaselineForStore:(_QWORD *)a3 error:
{
  id v6;
  void *v7;
  id v8;
  PFUbiquityBaseline *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  id v19;
  PFUbiquityBaseline *v20;
  PFUbiquityBaseline *v21;
  PFUbiquityLocation *permanentLocation;
  void *v23;
  void *v24;
  char v25;
  int v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  PFUbiquityBaseline *v30;
  PFUbiquityBaseline *v31;
  NSSaveChangesRequest *v32;
  uint64_t v33;
  PFUbiquityMigrationManager *v34;
  int v35;
  NSPersistentStoreCoordinator *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  int v62;
  _QWORD *v63;
  _QWORD *v64;
  PFUbiquityStoreMetadata *v66;
  uint64_t v67;
  uint64_t v68;
  PFUbiquityStoreMetadata *v69;
  void *v70;
  _QWORD *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  int v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v76 = 0;
  v6 = (id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("PFUbiquitySetupPreviousModelVersionHashKey"));
  *(_QWORD *)(a1 + 144) = v6;
  if (v6)
    goto LABEL_9;
  if (!*(_BYTE *)(a1 + 227))
    goto LABEL_6;
  if (!objc_msgSend(*(id *)(a1 + 176), "modelVersionHashString"))
  {
    *(_BYTE *)(a1 + 233) = 1;
LABEL_6:
    v7 = *(void **)(a1 + 136);
    goto LABEL_7;
  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 176), "modelVersionHashString");
LABEL_7:
  v8 = v7;
  *(_QWORD *)(a1 + 144) = v8;
  if (!v8)
    goto LABEL_135;
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v8, CFSTR("PFUbiquitySetupPreviousModelVersionHashKey"));
  *(_BYTE *)(a1 + 64) = 1;
LABEL_9:
  v9 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 112), objc_msgSend(*(id *)(a1 + 16), "managedObjectModel"));
  *(_QWORD *)(a1 + 200) = v9;
  *(_BYTE *)(a1 + 208) = -[PFUbiquitySafeSaveFile existsInCloud](v9);
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nBaseline exists: %d"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1639, a1, *(unsigned __int8 *)(a1 + 208));
  if (!*(_BYTE *)(a1 + 276) && objc_msgSend(*(id *)(a1 + 144), "isEqualToString:", *(_QWORD *)(a1 + 136)))
  {
    if (*(_BYTE *)(a1 + 227))
      goto LABEL_35;
    v70 = a2;
    v71 = a3;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v12 = *(void **)(a1 + 376);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v73 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
          if (v17)
          {
            v18 = *(_DWORD *)(v17 + 24);
            if (v18 == 22)
            {
              if (objc_msgSend(*(id *)(v17 + 32), "isEqualToString:", *(_QWORD *)(a1 + 128)))
              {
                v19 = (id)objc_msgSend(v11, "objectForKey:", *(_QWORD *)(v17 + 48));
                if (!v19)
                {
                  v19 = (id)objc_opt_new();
                  objc_msgSend(v11, "setObject:forKey:", v19, *(_QWORD *)(v17 + 48));
                }
                objc_msgSend(v19, "addObject:", v17);

              }
            }
            else if (v18 == 10 && (objc_msgSend(*(id *)(v17 + 48), "isEqualToString:", *(_QWORD *)(a1 + 136)) & 1) == 0)
            {
              objc_msgSend(v10, "addObject:", v17);
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      }
      while (v14);
    }
    a2 = v70;
    a3 = v71;
    if (!objc_msgSend(v10, "count"))
    {
LABEL_34:

LABEL_35:
      if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("PFUbiquitySetupMigrateTransactionLogsKey")), "BOOLValue"))goto LABEL_73;
      goto LABEL_61;
    }
    if (*(_BYTE *)(a1 + 208))
    {
      if (!objc_msgSend(v11, "count")
        || objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *(_QWORD *)(a1 + 136)), "count"))
      {
        goto LABEL_34;
      }
      v20 = +[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]((uint64_t)PFUbiquitySetupAssistant, v10, *(_QWORD *)(a1 + 128), (uint64_t *)&v76);
      if (v20)
        goto LABEL_41;
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to find a previous baseline file to use for migration. %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1702, a1, v76);
    }
    else
    {
      v20 = +[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]((uint64_t)PFUbiquitySetupAssistant, v10, *(_QWORD *)(a1 + 128), (uint64_t *)&v76);
      if (v20)
      {
LABEL_41:
        v21 = v20;

        permanentLocation = v21->super._permanentLocation;
        if (permanentLocation)
          permanentLocation = (PFUbiquityLocation *)permanentLocation->_modelVersionHash;
        *(_QWORD *)(a1 + 144) = permanentLocation;
        goto LABEL_47;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to find a previous baseline file to use for migration. %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1685, a1, v76);
    }
    v21 = 0;
LABEL_47:

  }
  v23 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 6, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 144), 0, *(void **)(a1 + 152));
  v24 = -[PFUbiquityLocation createFullPath]((uint64_t)v23);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v24) & 1) != 0)
  {
    v25 = 1;
    v26 = 1;
  }
  else
  {
    v27 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144), *(void **)(a1 + 152));
    v28 = -[PFUbiquityLocation createFullPath]((uint64_t)v27);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v28))
    {
      v29 = a3;
      v30 = -[PFUbiquityBaseline initWithBaselineLocation:andLocalPeerID:]([PFUbiquityBaseline alloc], "initWithBaselineLocation:andLocalPeerID:", v27, *(_QWORD *)(a1 + 128));
      v31 = v30;
      if (v30
        && -[PFUbiquityBaseline loadFileFromLocation:error:](v30, "loadFileFromLocation:error:", v30->super._currentLocation, &v76))
      {
        v25 = -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v31, &v76);
        v26 = 1;
      }
      else
      {
        v26 = 0;
        v25 = 1;
      }

      a3 = v29;
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCan't perform migration because there is no previous baseline file from which to get the managed object model: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1734, a1, v27);
      v25 = 0;
      v26 = 1;
    }

  }
  if ((v25 & 1) == 0)
  {
    if (!v26)
      goto LABEL_135;
LABEL_73:
    if (*(_BYTE *)(a1 + 208))
      goto LABEL_74;
LABEL_67:
    if (-[PFUbiquityKnowledgeVector isZeroVector](*(_QWORD *)(a1 + 72)))
    {
      v36 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", objc_msgSend(*(id *)(a1 + 16), "managedObjectModel"));
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", *(_QWORD *)(a1 + 8));
      objc_msgSend(v37, "setObject:forKey:", &unk_1E1F4B870, CFSTR("NSUbiquityImporterPrivateStoreKey"));
      v38 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", NSTemporaryDirectory()), "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
      v39 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      if (objc_msgSend(v39, "fileExistsAtPath:", objc_msgSend(v38, "path")))
      {
        if (objc_msgSend(v39, "removeItemAtURL:error:", v38, &v76))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nPurged temporary store directory.\n%@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1853, a1, v38);
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to remove temporary store directory: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1856, a1, v76);
        }
      }
      if (objc_msgSend(v39, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v38, 1, 0, &v76))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nCreated temporary store directory: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1861, a1, v38);
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to create temproary store directory: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1863, a1, v76);
      }
      v57 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v36, "addPersistentStoreWithType:configuration:URL:options:error:", *(_QWORD *)(a1 + 32), 0, objc_msgSend(v38, "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a2, "URL"), "lastPathComponent")), v37, &v76);
      if (v57)
      {
        v58 = (void *)v57;
        v59 = *(_QWORD *)(a1 + 200);
        v60 = *(_QWORD *)(a1 + 128);
      }
      else
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to create store for baseline: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1872, a1, v76);
        v59 = *(_QWORD *)(a1 + 200);
        v60 = *(_QWORD *)(a1 + 128);
        v58 = a2;
      }
      v61 = -[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:](v59, v58, v60, &v76);

      *(_QWORD *)(a1 + 216) = *(id *)(a1 + 72);
      if (!v61)
        goto LABEL_135;
    }
    else if (!-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:](*(_QWORD *)(a1 + 200), a2, *(_QWORD *)(a1 + 128), &v76))
    {
      goto LABEL_135;
    }
    if (-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:](*(_QWORD *)(a1 + 200), &v76))
    {
      v62 = -[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:](*(_QWORD *)(a1 + 200), 1, 1, &v76);
      *(_BYTE *)(a1 + 209) = 0;
      if (v62)
      {
        if (-[PFUbiquityBaseline makeCurrentBaselineWithError:](*(_QWORD *)(a1 + 200), &v76))
        {
          v63 = *(_QWORD **)(a1 + 200);
          if (v63)
          {
            v63 = (_QWORD *)v63[12];
            if (v63)
              v63 = (_QWORD *)v63[6];
          }
          v64 = v63;

          *(_QWORD *)(a1 + 216) = v64;
          if (-[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](*(_QWORD **)(a1 + 200), objc_msgSend(a2, "identifier")))
          {
            return 1;
          }
        }
      }
    }
LABEL_135:
    v48 = v76;
    if (v76)
    {
LABEL_136:
      if (a3)
      {
        v45 = 0;
        *a3 = v48;
        return v45;
      }
      return 0;
    }
LABEL_108:
    v49 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v49, v50, v51, v52, v53, v54, v55, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v56 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v79 = 1024;
      v80 = 1908;
      _os_log_fault_impl(&dword_18A253000, v56, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
LABEL_61:
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupMigrateTransactionLogsKey"));
  *(_BYTE *)(a1 + 64) = 1;
  if ((objc_msgSend(a2, "isReadOnly") & 1) == 0)
  {
    objc_msgSend(a2, "setMetadata:", *(_QWORD *)(a1 + 56));
    v32 = objc_alloc_init(NSSaveChangesRequest);
    objc_msgSend(a2, "executeRequest:withContext:error:", v32, 0, 0);

  }
  v33 = objc_msgSend(*(id *)(a1 + 16), "managedObjectModel");
  v34 = *(PFUbiquityMigrationManager **)(a1 + 288);
  if (!v34)
  {
    v34 = -[PFUbiquityMigrationManager initWithDestinationModel:storeName:previousModelVersionHash:ubiquityRootLocation:localPeerID:]([PFUbiquityMigrationManager alloc], "initWithDestinationModel:storeName:previousModelVersionHash:ubiquityRootLocation:localPeerID:", v33, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 128));
    *(_QWORD *)(a1 + 288) = v34;
    if (!v34)
    {
      v48 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Failed to migrate baseline, unable to create ubiquity migration manager"), CFSTR("reason"), 0));
      v76 = v48;
      if (v48)
        goto LABEL_136;
      goto LABEL_108;
    }
  }
  if ((-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:](v34, 1, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 128), &v76) & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Baseline migration failed for store with ubiquity name: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1773, *(_QWORD *)(a1 + 112), v76, objc_msgSend(v76, "userInfo"));
    goto LABEL_135;
  }
  *(_BYTE *)(a1 + 275) = 1;
  objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", CFSTR("PFUbiquitySetupMigrateTransactionLogsKey"));
  *(_BYTE *)(a1 + 64) = 1;
  *(_BYTE *)(a1 + 296) = 1;
  v35 = -[PFUbiquitySafeSaveFile existsInCloud](*(_QWORD **)(a1 + 200));
  *(_BYTE *)(a1 + 208) = v35;
  if (!v35)
    goto LABEL_67;
LABEL_74:
  objc_opt_self();
  if ((_usesCloudDocs & 1) != 0
    || -[PFUbiquityBaseline isUploaded:](*(_QWORD *)(a1 + 200), (uint64_t)&v76))
  {
    v40 = *(_QWORD **)(a1 + 200);
    if (!v40 || v40[3] == v40[2])
    {
      v41 = objc_msgSend(v40, "moveToPermanentLocation:", &v76);
      goto LABEL_91;
    }
  }
  else
  {
    *(_BYTE *)(a1 + 209) = 1;
    v42 = *(_QWORD *)(a1 + 200);
    if (v42)
    {
      v43 = *(_QWORD *)(v42 + 8);
      if (v43)
        LOBYTE(v43) = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v43, 0, 0);
    }
    else
    {
      LOBYTE(v43) = 0;
    }
    *(_BYTE *)(a1 + 210) = v43;
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
    {
      v44 = *(_QWORD *)(a1 + 200);
      if (v44)
        v44 = *(_QWORD *)(v44 + 24);
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nFound existing baseline file that needs to upload (%d, %d): %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1799, a1, *(unsigned __int8 *)(a1 + 209), *(unsigned __int8 *)(a1 + 210), v44);
    }
  }
  v41 = 1;
LABEL_91:
  if (*(_BYTE *)(a1 + 209))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nBaseline file is still uploading: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1803, a1, *(_QWORD *)(a1 + 200));

    *(_QWORD *)(a1 + 216) = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", &stru_1E1EE23F0);
    if ((v41 & 1) != 0)
      return 1;
    goto LABEL_135;
  }
  if (!v41)
    goto LABEL_135;
  if (!-[PFUbiquitySafeSaveFile downloadLatestVersion:error:](*(_QWORD *)(a1 + 200), 1, (uint64_t *)&v76))
  {
    v45 = 1;
    if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      return v45;
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nThe baseline file exists but could not be downloaded: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1837, a1, *(_QWORD *)(a1 + 200), v76, objc_msgSend(v76, "userInfo"));
    return 1;
  }
  v46 = *(_QWORD **)(a1 + 200);
  if (!v46 || !objc_msgSend(v46, "loadFileFromLocation:error:", v46[3], &v76))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nThe baseline file exists, but could not be read: %@\nError: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1834, a1, *(_QWORD *)(a1 + 200), v76, objc_msgSend(v76, "userInfo"));
    goto LABEL_135;
  }

  v47 = *(_QWORD **)(a1 + 200);
  if (v47)
  {
    v47 = (_QWORD *)v47[12];
    if (v47)
      v47 = (_QWORD *)v47[6];
  }
  *(_QWORD *)(a1 + 216) = v47;
  if (*(_BYTE *)(a1 + 227))
  {
    v45 = 1;
    if ((-[PFUbiquityBaseline metadataMatchesCurrentMetadata:](*(_QWORD *)(a1 + 200)) & 1) == 0 && !v76)
      *(_BYTE *)(a1 + 226) = 1;
  }
  else
  {
    if (!*(_QWORD *)(a1 + 176) && !*(_BYTE *)(a1 + 233))
    {
      v66 = [PFUbiquityStoreMetadata alloc];
      v67 = *(_QWORD *)(a1 + 168);
      if (v67)
        v68 = *(_QWORD *)(v67 + 8);
      else
        v68 = 0;
      v69 = -[PFUbiquityStoreMetadata initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:](v66, "initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 152), v68);
      *(_QWORD *)(a1 + 176) = v69;

      -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](*(void **)(a1 + 176), a2, *(_QWORD *)(a1 + 152));
    }
    v45 = 1;
    *(_BYTE *)(a1 + 296) = 1;
  }
  return v45;
}

- (BOOL)checkKnowledgeVectorsAndBaselineWithStore:(_QWORD *)a3 error:
{
  PFUbiquityStoreMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  PFUbiquityStoreMetadata *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PFUbiquityPeerReceipt *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL8 result;
  _QWORD *v21;
  PFUbiquityPeerReceipt *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  PFUbiquityBaseline *v39;
  char v40;
  _BYTE *v41;
  uint64_t v42;
  id v43;
  stat buf;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  if (!*(_QWORD *)(a1 + 176))
  {
    v6 = [PFUbiquityStoreMetadata alloc];
    v7 = *(_QWORD *)(a1 + 168);
    if (v7)
      v8 = *(_QWORD *)(v7 + 8);
    else
      v8 = 0;
    v9 = -[PFUbiquityStoreMetadata initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:](v6, "initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 152), v8);
    *(_QWORD *)(a1 + 176) = v9;
    -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v9, a2, *(_QWORD *)(a1 + 152));

  }
  if (!*(_QWORD *)(a1 + 248) && *(_QWORD *)(a1 + 192))
  {

    *(_QWORD *)(a1 + 240) = 0;
    *(_QWORD *)(a1 + 240) = -[PFUbiquityPeerReceipt initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:]([PFUbiquityPeerReceipt alloc], "initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 192), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 152));
    *(_QWORD *)(a1 + 248) = *(id *)(a1 + 192);
    v21 = *(_QWORD **)(a1 + 240);
    if (v21 && objc_msgSend(v21, "writeFileToLocation:error:", v21[3], &v43))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote peer receipt file: %@"), "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3685, a1, *(_QWORD *)(a1 + 240));
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError writing local peer receipt file to disk: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3687, a1, v43, objc_msgSend(v43, "userInfo"));
    }
  }
  if (objc_msgSend(*(id *)(a1 + 72), "isEqual:", *(_QWORD *)(a1 + 248)))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nLocal store knowledge vector matches receipt knowledge vector."), "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3693, a1);
    v10 = *(id **)(a1 + 72);
    if (*(_BYTE *)(a1 + 208))
    {
      v11 = *(_QWORD *)(a1 + 200);
      if (v11 && (v12 = *(_QWORD *)(v11 + 96)) != 0)
        v13 = *(_QWORD *)(v12 + 48);
      else
        v13 = 0;
      if (!-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v10, v13))
        goto LABEL_49;
    }
    else if (!-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)v10) || !*(_BYTE *)(a1 + 273))
    {
      goto LABEL_49;
    }
    *(_BYTE *)(a1 + 296) = 1;
    goto LABEL_49;
  }
  if (!-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](*(id **)(a1 + 72), *(_QWORD *)(a1 + 248)))
  {

    *(_QWORD *)(a1 + 240) = 0;
    v22 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:]([PFUbiquityPeerReceipt alloc], "initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 152));
    *(_QWORD *)(a1 + 240) = v22;
    if (v22
      && -[PFUbiquityPeerReceipt writeFileToLocation:error:](v22, "writeFileToLocation:error:", v22->super._currentLocation, &v43))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote peer receipt file: %@"), "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3731, a1, *(_QWORD *)(a1 + 240), v42);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError writing local peer receipt file to disk: %@\nuserInfo: %@"), "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3733, a1, v43, objc_msgSend(v43, "userInfo"));
    }
LABEL_49:
    if (*(_BYTE *)(a1 + 296))
      return 1;
    v31 = (void *)objc_msgSend((id)objc_msgSend(a2, "metadata"), "objectForKey:", CFSTR("com.apple.coredata.ubiquity.baseline.timestamp"));
    v32 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(void **)(a1 + 152));
    v33 = -[PFUbiquityLocation createFullPath]((uint64_t)v32);
    memset(&buf, 0, sizeof(buf));
    if (stat((const char *)objc_msgSend(v33, "fileSystemRepresentation"), &buf) < 0)
    {
      if (*__error() == 2)
      {

        v35 = 0;
LABEL_69:

        return 1;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        v38 = __error();
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to get the mod time for baseline (%d): %@"), "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3757, a1, *v38, v33);
      }

      v35 = 0;
    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v35 = (void *)objc_msgSend(v34, "initWithLong:", buf.st_mtimespec.tv_sec);
      v36 = objc_msgSend(v31, "longValue");
      v37 = objc_msgSend(v35, "longValue");

      if (v36 == v37)
        goto LABEL_69;
    }
    v39 = -[PFUbiquityBaseline initWithBaselineLocation:andLocalPeerID:]([PFUbiquityBaseline alloc], "initWithBaselineLocation:andLocalPeerID:", v32, *(_QWORD *)(a1 + 128));
    if (-[PFUbiquitySafeSaveFile existsInCloud](v39))
    {
      if (!-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v39, 0, (uint64_t *)&v43))
      {
        v41 = (_BYTE *)(a1 + 226);
        goto LABEL_65;
      }
      if (v39)
      {
        if (-[PFUbiquityBaseline loadFileFromLocation:error:](v39, "loadFileFromLocation:error:", v39->super._currentLocation, &v43))
        {
          v40 = -[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:](v39, *(id **)(a1 + 72));
          *(_BYTE *)(a1 + 226) = 1;
          if ((v40 & 1) != 0)
          {
            v41 = (_BYTE *)(a1 + 296);
LABEL_65:
            *v41 = 1;
          }
        }
      }
    }

    if (v35)
    {
      if ((objc_msgSend(a2, "isReadOnly") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v35, CFSTR("com.apple.coredata.ubiquity.baseline.timestamp"));
        *(_BYTE *)(a1 + 64) = 1;
      }
    }
    goto LABEL_69;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nLocal store file is behind receipt.\nStore: %@\nReceipt: %@"), "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3705, a1, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 192));
  *(_BYTE *)(a1 + 296) = 1;

  v14 = -[PFUbiquityPeerReceipt initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:]([PFUbiquityPeerReceipt alloc], "initWithLocalPeerID:andKnowledgeVector:forPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 152));
  *(_QWORD *)(a1 + 240) = v14;
  if (v14)
    v15 = -[PFUbiquityPeerReceipt writeFileToLocation:error:](v14, "writeFileToLocation:error:", v14->super._currentLocation, &v43);
  else
    v15 = 0;
  -[PFUbiquityStoreMetadata updatePeerStatesToMatchKnowledgeVector:](*(void **)(a1 + 176), *(_QWORD *)(a1 + 72));

  *(_QWORD *)(a1 + 192) = 0;
  v16 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](*(_QWORD *)(a1 + 72));
  *(_QWORD *)(a1 + 192) = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:]([PFUbiquityKnowledgeVector alloc], "initWithKnowledgeVectorString:", v16);

  v17 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary](*(_QWORD *)(a1 + 72));
  v18 = *(_QWORD *)(a1 + 168);
  if (v18)
    v19 = *(void **)(v18 + 8);
  else
    v19 = 0;
  +[PFUbiquityTransactionEntry deleteTransactionEntriesAfterPeerState:forStoreName:inManagedObjectContext:]((uint64_t)PFUbiquityTransactionEntry, v17, *(_QWORD *)(a1 + 112), v19);
  if (v15)
    goto LABEL_49;
  if (v43)
  {
    if (a3)
    {
      result = 0;
      *a3 = v43;
      return result;
    }
  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v30 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    buf.st_dev = 136315394;
    *(_QWORD *)&buf.st_mode = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbi"
                              "quitySetupAssistant.m";
    WORD2(buf.st_ino) = 1024;
    *(_DWORD *)((char *)&buf.st_ino + 6) = 3800;
    _os_log_fault_impl(&dword_18A253000, v30, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", (uint8_t *)&buf, 0x12u);
  }
  return 0;
}

- (uint64_t)sideLoadStore:(_QWORD *)a3 error:
{
  _QWORD *v6;
  NSPersistentStoreCoordinator *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  const char *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  PFUbiquityStoreMetadata *v29;
  uint64_t v30;
  uint64_t v31;
  PFUbiquityStoreMetadata *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  PFUbiquitySwitchboardCacheWrapper *v38;
  PFUbiquitySwitchboardCacheWrapper *v39;
  const char *v40;
  _BOOL4 v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  id Property;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  id v73;
  _BYTE buf[12];
  __int16 v75;
  int v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v73 = 0;
  objc_opt_self();
  v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 128));
  if (v6 != *(_QWORD **)(a1 + 320))
  {
    v7 = 0;
LABEL_121:
    v26 = 0;
    goto LABEL_122;
  }
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", NSTemporaryDirectory()), "URLByAppendingPathComponent:", CFSTR("CoreDataStores")), "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 112));
  v9 = *(_QWORD *)(a1 + 256);
  if (v9)
    v10 = *(_QWORD *)(v9 + 32);
  else
    v10 = 0;
  v11 = (void *)objc_msgSend((id)objc_msgSend(v8, "URLByAppendingPathComponent:", v10), "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 128));
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("sideLoad.store"));
  v7 = +[_PFUbiquityRecordsImporter createPrivateCoordinatorForStore:error:]((uint64_t)_PFUbiquityRecordsImporter, a2);
  v14 = v7 != 0;
  if (objc_msgSend(v12, "fileExistsAtPath:", objc_msgSend(v11, "path")))
  {
    if (v7
      && -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:](v7, "destroyPersistentStoreAtURL:withType:options:error:", v13, objc_msgSend(a2, "type"), objc_msgSend(a2, "options"), &v73))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Cleared out store for side-load: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2951, v13);
      v15 = -[NSPersistentStoreCoordinator persistentStoreForURL:](v7, "persistentStoreForURL:", v13);
      if (v15
        && !-[NSPersistentStoreCoordinator removePersistentStore:error:](v7, "removePersistentStore:error:", v15, &v73)
        && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing side-load store %@: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2954, a1, v15, v73);
      }
      v14 = 1;
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing side-load store: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2958, a1, v73);
      v14 = 0;
    }
    if (objc_msgSend(v12, "removeItemAtURL:error:", v11, &v73))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Cleared out directory for side-load: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2961, v11);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError removing side-load directory: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2963, a1, v73);
    }
  }
  if (objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v73))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Created directory for side-load: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2968, v11);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError creating side-load directory: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2970, a1, v73);
  }
  if (*(_BYTE *)(a1 + 208))
  {
    v16 = *(_QWORD **)(a1 + 200);
    if (!v16)
      goto LABEL_121;
    if (v16[18])
    {
      if (!v14)
        goto LABEL_121;
    }
    else if (!objc_msgSend(v16, "loadFileFromLocation:error:", v16[3], &v73))
    {
      goto LABEL_121;
    }
    if (!-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:](*(_QWORD *)(a1 + 200), v13, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 168), v7, &v73))goto LABEL_121;
    *(_BYTE *)(a1 + 211) = 1;
    *(_BYTE *)(a1 + 233) = 1;
  }
  else if (!v14)
  {
    goto LABEL_121;
  }
  v17 = (void *)+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]((uint64_t)_PFUbiquityRecordsImporter, a2, v7, v13, (uint64_t *)&v73);
  if (!v17)
    goto LABEL_121;
  if (*(_BYTE *)(a1 + 211))
  {
    v18 = *(_QWORD **)(a1 + 200);
    if (v18)
    {
      v18 = (_QWORD *)v18[12];
      if (v18)
        v18 = (_QWORD *)v18[6];
    }
    v19 = v18;

    *(_QWORD *)(a1 + 216) = v19;
    v21 = *(_QWORD *)(a1 + 320);
    if (v21)
    {
      v22 = *(_QWORD *)(v21 + 88);
      if (v22)
      {
        v23 = *(void **)(v22 + 120);
        if (v23)
          objc_setProperty_nonatomic(v23, v20, v19, 80);
      }
    }
    v24 = +[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, v17, *(_QWORD *)(a1 + 128));
  }
  else
  {
    v24 = 1;
  }
  v26 = -[_PFUbiquityRecordsImporter initWithLocalPeerID:ubiquityRootLocation:storeName:andPrivateStore:]([_PFUbiquityRecordsImporter alloc], *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 152), *(void **)(a1 + 112), v17);
  if (!v24)
    goto LABEL_122;
  if (v6)
  {
    v27 = v6[11];
    if (v27)
    {
      v28 = *(void **)(v27 + 88);
      if (v28)
        objc_setProperty_atomic(v28, v25, *(id *)(a1 + 216), 72);
    }
  }
  if (-[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:](*(_QWORD *)(a1 + 168), &v73))
  {
    v29 = [PFUbiquityStoreMetadata alloc];
    v30 = *(_QWORD *)(a1 + 168);
    v31 = v30 ? *(_QWORD *)(v30 + 8) : 0;
    v32 = -[PFUbiquityStoreMetadata initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:](v29, "initWithUbiquityName:andUbiquityRootLocation:insertIntoManagedObjectContext:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 152), v31);
    *(_QWORD *)(a1 + 176) = v32;
    -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v32, a2, *(_QWORD *)(a1 + 152));

    v33 = *(_QWORD *)(a1 + 168);
    v34 = v33 ? *(void **)(v33 + 8) : 0;
    v35 = objc_msgSend(v34, "save:", &v73);
    *(_BYTE *)(a1 + 233) = v35 ^ 1;
  }
  else
  {
    v35 = 0;
  }
  *(_QWORD *)(a1 + 176) = 0;

  *(_QWORD *)(a1 + 168) = 0;
  if (!v35)
  {
LABEL_122:
    if (v73)
    {
      if (a3)
      {
        v63 = 0;
        *a3 = v73;
        goto LABEL_128;
      }
    }
    else
    {
      v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v64, v65, v66, v67, v68, v69, v70, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v71 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiq"
                             "uitySetupAssistant.m";
        v75 = 1024;
        v76 = 3112;
        _os_log_fault_impl(&dword_18A253000, v71, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v63 = 0;
    goto LABEL_128;
  }
  v36 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(void **)(a1 + 160));
  if (+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v36, &v73))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nPruned local root directory: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3037, a1, v36);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError pruning local root directory: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3039, a1, v36);
  }

  v37 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(void **)(a1 + 152));
  if (+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v37, &v73))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nPruned ubiquity root directory: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3045, a1, v37);
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError pruning ubiquity root directory: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3047, a1, v37);
  }

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_exportedLog_, CFSTR("PFUbiquityLocationWasExportedNotification"), *(_QWORD *)(a1 + 152));
  v38 = -[PFUbiquitySwitchboardCacheWrapper initWithStoreName:privateStore:forLocalPeerID:andUbiquityRootLocation:]([PFUbiquitySwitchboardCacheWrapper alloc], "initWithStoreName:privateStore:forLocalPeerID:andUbiquityRootLocation:", *(_QWORD *)(a1 + 112), v17, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 152));
  v39 = v38;
  if (v38)
    v38 = (PFUbiquitySwitchboardCacheWrapper *)v38->_peerRangeCache;
  if (-[PFUbiquityPeerRangeCache cachePeerRanges:]((uint64_t)v38))
  {
    if (v26)
      objc_setProperty_nonatomic(v26, v40, v39, 88);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import started (Side load)"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3061);
    v41 = -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:](v26, 1u, &v73);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Import finished (Side load)"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3063);
    if (v41)
    {
      v42 = -[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:](a1, a2, (uint64_t)v26);
      goto LABEL_90;
    }
    if (v73)
    {
      if (objc_msgSend(v73, "code") == 134302)
      {
        v43 = objc_msgSend(v73, "domain");
        if (v43 == *MEMORY[0x1E0CB28A8])
        {
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PFUbiquitySetupDoFork"));
          *(_QWORD *)buf = 0;
          if (-[NSPersistentStoreCoordinator removePersistentStore:error:](v7, "removePersistentStore:error:", v17, buf))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Failed to remove sideload store: %@\n%@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3073, v17, *(_QWORD *)buf);
            }
          }
        }
      }
    }
  }
  v42 = 0;
LABEL_90:

  if (!v42)
    goto LABEL_122;
  if (!*(_BYTE *)(a1 + 313))
  {
    v44 = *(_QWORD *)(a1 + 320);
    if (v44 && (v45 = *(_QWORD *)(v44 + 88)) != 0 && (v46 = *(_QWORD *)(v45 + 88)) != 0)
      v47 = *(_QWORD *)(v46 + 48);
    else
      v47 = 0;
    -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](v47, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 152));
    v48 = *(_QWORD *)(a1 + 320);
    if (v48 && (v49 = *(_QWORD *)(v48 + 88)) != 0 && (v50 = *(_QWORD *)(v49 + 88)) != 0)
      v51 = *(_QWORD *)(v50 + 48);
    else
      v51 = 0;
    -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](v51, *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 160));
    v52 = *(_QWORD *)(a1 + 320);
    if (v52 && (v53 = *(_QWORD *)(v52 + 88)) != 0 && (v54 = *(_QWORD *)(v53 + 88)) != 0)
      v55 = *(_QWORD *)(v54 + 32);
    else
      v55 = 0;
    -[PFUbiquityGlobalObjectIDCache purgeCache](v55);
    v56 = *(_QWORD *)(a1 + 320);
    if (v56 && (v57 = *(_QWORD *)(v56 + 88)) != 0 && (v58 = *(_QWORD *)(v57 + 88)) != 0)
      v59 = *(_QWORD *)(v58 + 56);
    else
      v59 = 0;
    if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v59, 0))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nPurged history cache"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3092, a1);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError purging history cache: %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3095, a1, v73);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    {
      v61 = *(_QWORD *)(a1 + 72);
      if (v26)
      {
        Property = (id)v26[11];
        if (Property)
          Property = objc_getProperty(Property, v60, 64, 1);
      }
      else
      {
        Property = 0;
      }
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Side load finish: %@ / %@"), "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3107, v61, Property);
    }
  }
  v63 = 1;
LABEL_128:

  return v63;
}

- (uint64_t)respondToBaselineRoll:(uint64_t)a1
{
  _QWORD *v4;
  char v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v4 = *(_QWORD **)(a1 + 200);
  if (!v4)
    goto LABEL_14;
  if (v4[18] && v4[12])
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "loadFileFromLocation:error:", v4[3], &v20);
    v4 = *(_QWORD **)(a1 + 200);
    v5 = v6 ^ 1;
    if (!v4)
    {
LABEL_14:
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Couldn't load baseline metadata from baseline: %@\n%@"), "-[PFUbiquitySetupAssistant respondToBaselineRoll:]", 3961, *(_QWORD *)(a1 + 200), v20);
      v9 = 0;
LABEL_17:
      if (v20)
      {
        if (a2)
        {
          v10 = 0;
          *a2 = v20;
          goto LABEL_23;
        }
      }
      else
      {
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
        v18 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
          v23 = 1024;
          v24 = 3975;
          _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v10 = 0;
      goto LABEL_23;
    }
  }
  v7 = v4[12];
  if (!v7 || !objc_msgSend(*(id *)(v7 + 8), "length"))
    goto LABEL_14;
  v8 = *(_QWORD **)(a1 + 200);
  if (v8)
    v8 = (_QWORD *)v8[12];
  v9 = v8;
  if ((v5 & 1) != 0 || !-[PFUbiquityBaseline makeCurrentBaselineWithError:](*(_QWORD *)(a1 + 200), &v20))
    goto LABEL_17;
  +[PFUbiquityTransactionLog truncateLogFilesBeforeBaselineMetadata:withLocalPeerID:andUbiquityRootLocation:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v9, *(void **)(a1 + 128), *(void **)(a1 + 152));
  v10 = 1;
LABEL_23:

  return v10;
}

- (uint64_t)attemptMetadataRecoveryForStore:(uint64_t *)a3 error:
{
  id **v6;
  uint64_t v7;
  PFUbiquityStoreMetadataMedic *v8;
  id *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v6 = (id **)(a1 + 168);
  v7 = 1;

  *v6 = 0;
  v6[1] = 0;
  v8 = -[PFUbiquityStoreMetadataMedic initWithStore:localPeerID:andUbiquityRootLocation:]([PFUbiquityStoreMetadataMedic alloc], "initWithStore:localPeerID:andUbiquityRootLocation:", a2, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 152));
  if (-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]((void **)&v8->super.isa, &v23))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nSuccessfully recovered metadata"), "-[PFUbiquitySetupAssistant attemptMetadataRecoveryForStore:error:]", 2040, a1);
    *(_BYTE *)(a1 + 296) = 1;
    objc_opt_self();
    if (!-[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v23)|| ((objc_opt_self(), v9 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v23), (*v6 = v9) == 0)? (v10 = 0): (v10 = v9[1]), v11 = +[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, *(void **)(a1 + 112), v10),
          (*(_QWORD *)(a1 + 176) = v11) == 0))
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v7 = 0;
      v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Store metadata recovery appears to have failed, please try adding the store to the coordinator again. If that is unsuccessful, migrate the data to a new ubiquitized persistent store."), *MEMORY[0x1E0CB2D50]);
      v23 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134312, v13);
    }
  }
  else
  {
    v7 = 0;
  }

  if ((v7 & 1) == 0)
  {
    if (v23)
    {
      if (a3)
        *a3 = v23;
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        v26 = 1024;
        v27 = 2060;
        _os_log_fault_impl(&dword_18A253000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v7;
}

void __54__PFUbiquitySetupAssistant_finishSetupForStore_error___block_invoke(uint64_t a1)
{
  NSSaveChangesRequest *v2;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isReadOnly") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setMetadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
      v2 = objc_alloc_init(NSSaveChangesRequest);
      objc_msgSend(*(id *)(a1 + 40), "executeRequest:withContext:error:", v2, 0, 0);

    }
  }
}

- (uint64_t)moveLocalLogFilesToUbiquityLocation:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
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
  NSObject *v26;
  void *v29;
  void *v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(void **)(a1 + 152));
  v5 = -[PFUbiquityLocation createFullPath]((uint64_t)v4);
  v29 = v4;
  if ((objc_msgSend(v3, "fileExistsAtPath:", v5) & 1) != 0)
  {
LABEL_2:
    v6 = 0;
    v7 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v36))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Created ubiquity peer log directory: %@"), "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3175, v5);
    goto LABEL_2;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to write to peer transaction log directory: %@\nError: %@\n"), "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3178, a1, v5, v36);
  v7 = 0;
  v6 = 1;
LABEL_9:

  if ((v6 & 1) != 0)
  {
    v8 = 0;
LABEL_11:
    v9 = 0;
    goto LABEL_32;
  }
  v8 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(void **)(a1 + 160));
  v10 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v8, (uint64_t)&v36);
  v9 = v10;
  if (v10)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v11)
    {
      v31 = v7;
      v30 = v8;
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (v14 && *(_DWORD *)(v14 + 24) == 22)
          {
            v15 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(_QWORD *)(v14 + 56), *(void **)(a1 + 152));
            v16 = -[PFUbiquityLocation createFullPath](v14);
            v17 = -[PFUbiquityLocation createFullPath]((uint64_t)v15);
            if (objc_msgSend(v3, "moveItemAtPath:toPath:error:", v16, v17, &v36))
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMoved local log: %@ to %@"), "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3196, a1, v16, v17);
              }
            }
            else
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError moving local log: %@ to %@\nError: %@"), "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3198, a1, v16, v17, v36);
              }
              v31 = 0;
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v11);
      v8 = v30;
      v7 = v31;
    }
  }
  else
  {
    if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      goto LABEL_11;
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError trying to read peer version directory: %@"), "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3208, a1, v36);
    v9 = 0;
  }
LABEL_32:
  if ((v7 & 1) != 0)
  {
    v18 = 1;
    goto LABEL_40;
  }
  if (!v36)
  {
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v26 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v39 = 1024;
      v40 = 3213;
      _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_39;
  }
  if (!a2)
  {
LABEL_39:
    v18 = 0;
    goto LABEL_40;
  }
  v18 = 0;
  *a2 = v36;
LABEL_40:

  return v18;
}

- (uint64_t)pruneStagingDirectoryForStore:(uint64_t)a1 error:(_QWORD *)a2
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  PFUbiquityTransactionLog *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v4 = *(_QWORD *)(a1 + 72);
  if (v4)
    v5 = (void *)objc_msgSend(*(id *)(v4 + 8), "objectForKey:", *(_QWORD *)(a1 + 128));
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v7 = +[PFUbiquityLocation createStagingPeerStoreVersionLocationForExportingPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(void **)(a1 + 152));
  v8 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v7, (uint64_t)&v31);
  v9 = v8;
  v26 = v7;
  if (!v8)
  {
    v10 = v7;
    if (v31)
    {
      if (a2)
      {
        v16 = 0;
        v9 = 0;
        *a2 = v31;
        goto LABEL_36;
      }
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        v34 = 1024;
        v35 = 3895;
        _os_log_fault_impl(&dword_18A253000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v16 = 0;
    v9 = 0;
    goto LABEL_36;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v14 && *(_DWORD *)(v14 + 24) == 26)
        {
          v15 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", v14, *(_QWORD *)(a1 + 128));
          if (-[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)v15, &v31)
            && objc_msgSend(-[PFUbiquityTransactionLog transactionNumber](v15), "compare:", v6) != 1)
          {
            if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v15, &v31))
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Moved orphaned log to sync'd directory: %@"), "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3873, v15);
              }
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to move log to permanent location: %@"), "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3875, a1, v31);
            }
          }
          else if (-[PFUbiquityTransactionLog deleteLogFileWithError:]((uint64_t)v15, &v31))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Deleted orphaned log: %@"), "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3880, v15);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to delete log: %@"), "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3882, a1, v31);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v11);
    v16 = 1;
    v10 = v26;
  }
  else
  {
    v16 = 1;
  }
LABEL_36:

  return v16;
}

- (uint64_t)seedStore:(uint64_t *)a3 error:
{
  NSPersistentStoreCoordinator *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  unsigned __int8 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v6 = (NSPersistentStoreCoordinator *)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  if (v6
    && (v6 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v6)) != 0&& (v7 = objc_msgSend(a2, "type"), v8 = *(_QWORD *)(a1 + 304), v31 = CFSTR("NSReadOnlyPersistentStoreOption"), v32[0] = &unk_1E1F4B870, (v9 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v6, "addPersistentStoreWithType:configuration:URL:options:error:", v7, 0, v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1), &v23)) != 0)&& -[NSPersistentStoreCoordinator migratePersistentStore:toURL:options:withType:error:](v6, "migratePersistentStore:toURL:options:withType:error:", v9,
         objc_msgSend(a2, "URL"),
         objc_msgSend(a2, "options"),
         CFSTR("SQLite"),
         &v23))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Successfully migrated seed store: %@"), "-[PFUbiquitySetupAssistant seedStore:error:]", 3921, v9);
  }
  else
  {
    v10 = v23;
    if (v23)
      goto LABEL_12;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v29 = CFSTR("failed to seed store during asynchronous iCloud setup");
    v12 = *(_QWORD *)(a1 + 304);
    if (!v12)
      v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = v12;
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v10 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134080, v13);
    v23 = v10;
    if (v10)
    {
LABEL_12:
      if (a3)
        *a3 = v10;
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        v27 = 1024;
        v28 = 3936;
        _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v24;
}

id __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32));
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

void __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke_2(uint64_t *a1)
{
  -[NSSQLCore updateUbiquityKnowledgeForPeerWithID:andTransactionNumber:](a1[4], *(_QWORD *)(a1[5] + 128), a1[6]);
}

void __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Coordinated read finished for ubiquity root url: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke", 1452, a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

intptr_t __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;

  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Initial sync handler called, %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke_2", 1472, a2);
  __dmb(0xBu);
  v4 = a1[4];
  if (!*(_DWORD *)(v4 + 368))
  {
    if (a2)
    {
      v5 = (unsigned int *)(*(_QWORD *)(a1[5] + 8) + 40);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 + 1, v5));
      v7 = (unsigned int *)(a1[4] + 368);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 + 1, v7));
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = a2;
      v4 = a1[4];
    }
    else
    {
      v9 = (unsigned int *)(v4 + 368);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 360));
}

void __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Attempting to download Peers hit a serious error for peers to download %@ with userInfo %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke_3", 1544, a2, objc_msgSend(a2, "userInfo"));
  }
}

void __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Attempting to download root URL (%@) hit a serious error: %@ with userInfo: %@"), "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke_4", 1575, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), a2, objc_msgSend(a2, "userInfo"));
  }
}

+ (PFUbiquityBaseline)createBaselineFromMostRecentLocation:(uint64_t)a3 localPeerID:(uint64_t *)a4 error:
{
  uint64_t v7;
  PFUbiquityBaseline *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PFUbiquityBaseline *v13;
  PFUbiquityBaseline *v14;
  PFUbiquityBaselineMetadata *metadata;
  id *p_isa;
  PFUbiquityBaselineMetadata *v17;
  uint64_t kv;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = objc_opt_self();
  v35 = 0;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (!v7)
    return 0;
  v29 = a4;
  v8 = 0;
  v9 = 1;
  v10 = *(_QWORD *)v32;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(a2);
      v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v11);
      if (-[PFUbiquityLocation fileAtLocationIsUploaded:](v12, (uint64_t)&v35))
      {
        v13 = -[PFUbiquityBaseline initWithBaselineLocation:andLocalPeerID:]([PFUbiquityBaseline alloc], "initWithBaselineLocation:andLocalPeerID:", v12, a3);
        v14 = v13;
        if (!v13
          || !-[PFUbiquityBaseline loadFileFromLocation:error:](v13, "loadFileFromLocation:error:", v13->super._currentLocation, &v35))
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to load baseline: %@"), "+[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]", 4127, v35);

          goto LABEL_33;
        }
        if (v8)
        {
          metadata = v8->_metadata;
          if (metadata)
            p_isa = (id *)&metadata->_kv->super.isa;
          else
            p_isa = 0;
          v17 = v14->_metadata;
          if (v17)
            kv = (uint64_t)v17->_kv;
          else
            kv = 0;
          if (!-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](p_isa, kv))
            goto LABEL_17;

        }
        v8 = v14;
LABEL_17:
        v9 = 1;
        goto LABEL_23;
      }
      if (v35)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError checking uploaded status of baseline file: %@"), "+[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]", 4132, v30, v35);
        v14 = 0;
        v9 = 0;
      }
      else
      {
        v14 = 0;
      }
LABEL_23:

      ++v11;
    }
    while (v7 != v11);
    v19 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    v7 = v19;
    if (v19)
      continue;
    break;
  }
  if ((v9 & 1) != 0)
    return v8;
LABEL_33:
  if (v35)
  {
    if (v29)
      *v29 = v35;
  }
  else
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v27 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      v38 = 1024;
      v39 = 4140;
      _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }

  return 0;
}

- (void)updateDictionary:(void *)a1 withShortcutSnapshot:(void *)a2
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = objc_msgSend(a2, "objectForKey:", CFSTR("shortcut"));
  v5 = objc_msgSend(a2, "objectForKey:", CFSTR("phrase"));
  v6 = objc_msgSend(a2, "objectForKey:", CFSTR("partOfSpeech"));
  v7 = objc_msgSend(a2, "objectForKey:", CFSTR("timestamp"));
  if (v4 && v5)
  {
    v8 = (void *)v7;
    v9 = (id)objc_msgSend(a1, "objectForKey:", v4);
    if (!v9)
    {
      v11 = (id)objc_opt_new();
      objc_msgSend(a1, "setObject:forKey:", v11, v4);
      v9 = v11;
    }
    v12 = v9;
    v10 = objc_msgSend(v9, "objectForKey:", CFSTR("timestamp"));
    if (!v10 || objc_msgSend(v8, "compare:", v10) == 1)
    {
      objc_msgSend(v12, "setObject:forKey:", v5, CFSTR("phrase"));
      objc_msgSend(v12, "setObject:forKey:", v4, CFSTR("shortcut"));
      if (v8)
        objc_msgSend(v12, "setObject:forKey:", v8, CFSTR("timestamp"));
    }
    objc_opt_self();
    if (v6)
      objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("partOfSpeech"));
    else
      objc_msgSend(v12, "removeObjectForKey:", CFSTR("partOfSpeech"));

  }
}

- (void)updateDictionary:(void *)a1 withPhraseLearningSnapshot:(void *)a2
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v4 = objc_msgSend(a2, "objectForKey:", CFSTR("defaultReading"));
  v5 = objc_msgSend(a2, "objectForKey:", CFSTR("extraInteger1"));
  v6 = objc_msgSend(a2, "objectForKey:", CFSTR("extraInteger2"));
  v7 = objc_msgSend(a2, "objectForKey:", CFSTR("extraString1"));
  v8 = objc_msgSend(a2, "objectForKey:", CFSTR("extraString2"));
  v9 = objc_msgSend(a2, "objectForKey:", CFSTR("frequency"));
  v10 = objc_msgSend(a2, "objectForKey:", CFSTR("reading"));
  v15 = objc_msgSend(a2, "objectForKey:", CFSTR("seed"));
  v11 = objc_msgSend(a2, "objectForKey:", CFSTR("surface"));
  v12 = objc_msgSend(a2, "objectForKey:", CFSTR("syllables"));
  if (v10 && v11)
  {
    v13 = v12;
    v14 = (id)objc_msgSend(a1, "objectForKey:", v10);
    if (!v14)
    {
      v16 = (id)objc_opt_new();
      objc_msgSend(a1, "setObject:forKey:", v16, v10);
      v14 = v16;
    }
    v17 = v14;
    objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("reading"));
    objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("surface"));
    objc_opt_self();
    if (v4)
      objc_msgSend(v17, "setObject:forKey:", v4, CFSTR("defaultReading"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("defaultReading"));
    objc_opt_self();
    if (v5)
      objc_msgSend(v17, "setObject:forKey:", v5, CFSTR("extraInteger1"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("extraInteger1"));
    objc_opt_self();
    if (v6)
      objc_msgSend(v17, "setObject:forKey:", v6, CFSTR("extraInteger2"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("extraInteger2"));
    objc_opt_self();
    if (v7)
      objc_msgSend(v17, "setObject:forKey:", v7, CFSTR("extraString1"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("extraString1"));
    objc_opt_self();
    if (v8)
      objc_msgSend(v17, "setObject:forKey:", v8, CFSTR("extraString2"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("extraString2"));
    objc_opt_self();
    if (v9)
      objc_msgSend(v17, "setObject:forKey:", v9, CFSTR("frequency"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("frequency"));
    objc_opt_self();
    objc_msgSend(v17, "setObject:forKey:", v10, CFSTR("reading"));
    objc_opt_self();
    if (v15)
      objc_msgSend(v17, "setObject:forKey:", v15, CFSTR("seed"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("seed"));
    objc_opt_self();
    objc_msgSend(v17, "setObject:forKey:", v11, CFSTR("surface"));
    objc_opt_self();
    if (v13)
      objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("syllables"));
    else
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("syllables"));

  }
}

void __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (objc_msgSend(v5, "removeItemAtURL:error:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
  {
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Removed old fork directory: %@"), "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]_block_invoke", 2282, a3);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        if (v11)
        {
          v12 = v11[4];
          v13 = v11[5];
          v14 = v11[6];
          v15 = v11[7];
        }
        else
        {
          v14 = 0;
          v12 = 0;
          v13 = 0;
          v15 = 0;
        }
        v16 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v12, v13, v14, v15, *(void **)(a1 + 40));
        v17 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v11);
        v18 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v16);
        if ((objc_msgSend(v5, "moveItemAtURL:toURL:error:", v17, v18, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) & 1) == 0)
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "code") == 4)
          {
            if (objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(v18, "URLByDeletingLastPathComponent"), 1, 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
            {
              if ((objc_msgSend(v5, "moveItemAtURL:toURL:error:", v17, v18, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) & 1) != 0)goto LABEL_23;
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
              {
                v19 = 2297;
                goto LABEL_21;
              }
LABEL_22:
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
              goto LABEL_23;
            }
            if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))goto LABEL_22;
            v19 = 2301;
          }
          else
          {
            if (!+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))goto LABEL_22;
            v19 = 2305;
          }
LABEL_21:
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error moving log: %@"), "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]_block_invoke", v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          goto LABEL_22;
        }
LABEL_23:

        ++v10;
      }
      while (v8 != v10);
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v8 = v20;
    }
    while (v20);
  }

}

id __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "persistentStores"), "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "save:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

void __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary](*(_QWORD *)(a1 + 40));
  -[NSSQLCore replaceUbiquityKnowledgeVector:](v1, (uint64_t)v2);
}

uint64_t __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_msgSend(a2, "URLByDeletingLastPathComponent");
  v6 = objc_msgSend(v5, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fork~%@.nosync"), *(_QWORD *)(a1[4] + 128)));
  result = objc_msgSend(v4, "moveItemAtURL:toURL:error:", a2, v6, *(_QWORD *)(a1[5] + 8) + 40);
  if ((_DWORD)result)
  {
    result = objc_msgSend(v4, "removeItemAtURL:error:", v6, *(_QWORD *)(a1[5] + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  }
  return result;
}

uint64_t __48__PFUbiquitySetupAssistant_migrateMetadataRoot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(a3, "URLByDeletingLastPathComponent"), 1, 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "moveItemAtURL:toURL:error:", a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

- (uint64_t)tryToReplaceLocalStore:(uint64_t)a3 withStoreSideLoadedByImporter:
{
  uint64_t *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  PFUbiquityKnowledgeVector *v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  PFUbiquityTransactionLog *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  unint64_t v94;
  unint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  PFUbiquityGlobalObjectID *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  PFUbiquityGlobalObjectID *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t k;
  void *v121;
  uint64_t v122;
  const char *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t m;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t n;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t ii;
  uint64_t v139;
  uint64_t v140;
  uint64_t v142;
  void *v143;
  uint64_t *v144;
  unint64_t v146;
  id *v147;
  void *v148;
  uint64_t v150;
  os_unfair_lock_s *lock;
  uint64_t v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  PFUbiquityFileCoordinator *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  id obj;
  int v166;
  _QWORD v167[2];
  void (*v168)(uint64_t);
  void *v169;
  uint64_t v170;
  void *v171;
  _QWORD v172[12];
  _QWORD block[2];
  uint64_t (*v174)(uint64_t);
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  uint64_t *v179;
  uint64_t v180;
  void (*v181)(uint64_t, uint64_t);
  void (*v182)(uint64_t);
  uint64_t v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  char v187;
  _QWORD v188[7];
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t v195;
  char v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  _QWORD v237[8];
  uint64_t v238;
  uint64_t *v239;
  uint64_t v240;
  void (*v241)(uint64_t, uint64_t);
  void (*v242)(uint64_t);
  uint64_t v243;
  uint64_t v244;
  uint64_t *v245;
  uint64_t v246;
  void (*v247)(uint64_t, uint64_t);
  void (*v248)(uint64_t);
  uint64_t v249;
  id v250;
  uint8_t v251[128];
  _BYTE buf[24];
  void (*v253)(uint64_t, uint64_t);
  void (*v254)(uint64_t);
  uint64_t v255;
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _QWORD v263[16];
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  uint8_t v268[4];
  const char *v269;
  __int16 v270;
  int v271;
  uint64_t v272;

  v272 = *MEMORY[0x1E0C80C00];
  v184 = 0;
  v185 = &v184;
  v186 = 0x2020000000;
  v187 = 0;
  v178 = 0;
  v179 = &v178;
  v180 = 0x3052000000;
  v181 = __Block_byref_object_copy__65;
  v182 = __Block_byref_object_dispose__65;
  v183 = 0;
  v143 = (void *)objc_msgSend((id)objc_msgSend(a2, "identifier"), "copy");
  v4 = v179;
  v5 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 136), *(void **)(a1 + 160));
  v263[0] = 0;
  obj = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v5, (uint64_t)v263);
  v7 = v6;
  if (v6)
  {
    v267 = 0u;
    v266 = 0u;
    v265 = 0u;
    v264 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v264, v268, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v265;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v265 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v264 + 1) + 8 * i);
          if (v11 && *(_DWORD *)(v11 + 24) == 22)
            objc_msgSend(obj, "addObject:");
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v264, v268, 16);
      }
      while (v8);
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError reading local log directory: %@"), "-[PFUbiquitySetupAssistant createSetOfLocalLogLocations:]", 3141, a1, v263[0]);
    if (v263[0])
    {
      v4[5] = v263[0];
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v268 = 136315394;
        v269 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        v270 = 1024;
        v271 = 3142;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v268, 0x12u);
      }
    }

    obj = 0;
  }

  v150 = 0;
  lock = (os_unfair_lock_s *)(a1 + 332);
  v152 = *MEMORY[0x1E0CB28A8];
  do
  {
    os_unfair_lock_lock(lock);
    if (*(_BYTE *)(a1 + 328))
    {
      *(_BYTE *)(a1 + 328) = 0;
      v20 = *(id *)(a1 + 336);
      v21 = *(void **)(a1 + 336);
      *(_QWORD *)(a1 + 336) = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v22 = v20;
    }
    else
    {
      v22 = 0;
      v21 = 0;
    }
    os_unfair_lock_unlock(lock);

    objc_msgSend(obj, "unionSet:", v22);
    if (objc_msgSend(obj, "count"))
    {
      if (a3)
        v23 = *(void **)(a3 + 72);
      else
        v23 = 0;
      v144 = v179;
      v250 = 0;
      v244 = 0;
      v245 = &v244;
      v246 = 0x3052000000;
      v247 = __Block_byref_object_copy__65;
      v248 = __Block_byref_object_dispose__65;
      v249 = 0;
      v24 = (id)objc_msgSend(v23, "persistentStoreCoordinator");
      v238 = 0;
      v239 = &v238;
      v240 = 0x3052000000;
      v241 = __Block_byref_object_copy__65;
      v242 = __Block_byref_object_dispose__65;
      v243 = 0;
      v148 = v24;
      if (!objc_msgSend(obj, "count"))
      {
        v147 = 0;
        v164 = 0;
        v34 = 0;
        goto LABEL_127;
      }
      v25 = objc_msgSend(v23, "model");
      if (v25)
        v26 = *(_QWORD *)(v25 + 40);
      else
        v26 = 0;
      v237[0] = MEMORY[0x1E0C809B0];
      v237[1] = 3221225472;
      v237[2] = __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke;
      v237[3] = &unk_1E1EDD7B8;
      v237[4] = v23;
      v237[5] = v26;
      v237[6] = &v244;
      v237[7] = &v238;
      objc_msgSend(v24, "performBlockAndWait:", v237);
      v27 = (id)v239[5];
      v28 = [PFUbiquityKnowledgeVector alloc];
      v29 = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:](v28, "initWithStoreKnowledgeVectorDictionary:", v239[5]);
      v147 = v29;
      if (v29)
        v29 = (id *)objc_msgSend(v29[1], "objectForKey:", *(_QWORD *)(a1 + 128));
      v146 = objc_msgSend(v29, "unsignedIntegerValue");
      v164 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
      if (!v146)
      {
        v34 = 0;
        LOBYTE(v166) = 1;
LABEL_69:
        v43 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v160 = +[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, *(_QWORD *)(a1 + 152));
        v44 = (void *)objc_opt_new();
        v193 = 0;
        v194 = &v193;
        v195 = 0x2020000000;
        v196 = 0;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3052000000;
        v253 = __Block_byref_object_copy__65;
        v254 = __Block_byref_object_dispose__65;
        v255 = 0;
        v189 = 0u;
        v190 = 0u;
        v191 = 0u;
        v192 = 0u;
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v189, v251, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v190;
          while (2)
          {
            v47 = 0;
            do
            {
              if (*(_QWORD *)v190 != v46)
                objc_enumerationMutation(obj);
              v48 = *(_QWORD **)(*((_QWORD *)&v189 + 1) + 8 * v47);
              if (v48)
              {
                v49 = v48[4];
                v50 = v48[5];
                v51 = v48[6];
                v52 = v48[7];
              }
              else
              {
                v51 = 0;
                v49 = 0;
                v50 = 0;
                v52 = 0;
              }
              v53 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v49, v50, v51, v52, *(void **)(a1 + 152));
              objc_msgSend(v44, "addObject:", v53);
              v54 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v48);
              v55 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v53);
              v188[0] = MEMORY[0x1E0C809B0];
              v188[1] = 3221225472;
              v188[2] = __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_4;
              v188[3] = &unk_1E1EE1D30;
              v188[5] = &v193;
              v188[4] = v43;
              v188[6] = buf;
              -[PFUbiquityFileCoordinator coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:](v160, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v54, 2, v55, 8, &v250, v188);
              if (!*((_BYTE *)v194 + 24))
              {
                LOBYTE(v166) = 0;
                if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
                  v250 = *(id *)(*(_QWORD *)&buf[8] + 40);
                goto LABEL_124;
              }

              ++v47;
            }
            while (v45 != v47);
            v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v189, v251, 16);
            v45 = v56;
            if (v56)
              continue;
            break;
          }
        }
        if ((v166 & 1) != 0)
        {
          objc_msgSend(obj, "removeAllObjects");
          objc_msgSend(obj, "unionSet:", v44);
        }
LABEL_124:

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v193, 8);
        if ((v166 & 1) == 0)
          goto LABEL_125;
LABEL_127:
        v80 = 1;
LABEL_128:
        objc_msgSend(*(id *)(a1 + 352), "removeAllObjects");

        v245[5] = 0;
        _Block_object_dispose(&v238, 8);
        _Block_object_dispose(&v244, 8);
        if (v80)
        {
          if (a3)
            v81 = *(_QWORD *)(a3 + 80);
          else
            v81 = 0;
          -[PFUbiquityRecordsImporterSchedulingContext addPendingLogLocations:](v81, (uint64_t)obj);
          if (-[_PFUbiquityRecordsImporter schedulePendingLogs:error:](a3, 1u, v179 + 5))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nImported local logs: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3533, a1, obj);
            }

            obj = objc_alloc_init(MEMORY[0x1E0C99E20]);
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError side loading local logs: %@\nError: %@\n"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3537, a1, obj, v179[5]);
          }
        }
        goto LABEL_260;
      }
      v235 = 0u;
      v236 = 0u;
      v233 = 0u;
      v234 = 0u;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v233, v268, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v234;
        LOBYTE(v166) = 1;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v234 != v31)
              objc_enumerationMutation(obj);
            v33 = -[PFUbiquityTransactionLog initWithTransactionLogLocation:andLocalPeerID:]([PFUbiquityTransactionLog alloc], "initWithTransactionLogLocation:andLocalPeerID:", *(_QWORD *)(*((_QWORD *)&v233 + 1) + 8 * j), *(_QWORD *)(a1 + 128));
            if (-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v33, &v250))
              objc_msgSend(v164, "addObject:", v33);
            else
              LOBYTE(v166) = 0;

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v233, v268, 16);
        }
        while (v30);
        if ((v166 & 1) == 0)
        {
          v34 = 0;
          goto LABEL_68;
        }
      }
      else
      {
        LOBYTE(v166) = 1;
      }
      objc_msgSend(v164, "sortUsingComparator:", &__block_literal_global_556);
      v34 = (id)objc_msgSend(v164, "objectAtIndex:", 0);
      if (objc_msgSend(-[PFUbiquityTransactionLog transactionNumber](v34), "unsignedIntegerValue") <= v146)
      {
        v142 = objc_msgSend(-[PFUbiquityTransactionLog transactionNumber](v34), "unsignedIntegerValue");
        v231 = 0u;
        v232 = 0u;
        v229 = 0u;
        v230 = 0u;
        v57 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v229, &v264, 16);
        if (v57)
        {
          v157 = *(_QWORD *)v230;
          do
          {
            v58 = 0;
            v155 = v57;
            do
            {
              if (*(_QWORD *)v230 != v157)
                objc_enumerationMutation(v164);
              v59 = *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * v58);
              v166 = -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:](v59, &v250);
              if (!v166)
              {
                LOBYTE(v166) = 0;
                goto LABEL_144;
              }
              if (v59
                && ((v60 = *(_QWORD *)(v59 + 24)) == 0 ? (v61 = 0) : (v61 = *(_QWORD *)(v60 + 40)),
                    (v62 = *(_QWORD *)(v59 + 72)) != 0))
              {
                v63 = (void *)objc_msgSend(*(id *)(v62 + 40), "objectForKey:", v61);
              }
              else
              {
                v63 = 0;
              }
              v64 = v63;
              v65 = v64;
              if (v64)
                v66 = (void *)*((_QWORD *)v64 + 11);
              else
                v66 = 0;
              v67 = (void *)objc_msgSend(v66, "allKeys");
              v161 = v58;
              v227 = 0u;
              v228 = 0u;
              v225 = 0u;
              v226 = 0u;
              v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v225, v263, 16);
              if (v68)
              {
                v69 = *(_QWORD *)v226;
                do
                {
                  v70 = 0;
                  do
                  {
                    if (*(_QWORD *)v226 != v69)
                      objc_enumerationMutation(v67);
                    v71 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:]((uint64_t)v65, *(void **)(*((_QWORD *)&v225 + 1) + 8 * v70));
                    v72 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "managedObjectModel"), "entitiesByName");
                    if (v71)
                      v73 = *(_QWORD *)(v71 + 16);
                    else
                      v73 = 0;
                    v74 = objc_msgSend(v72, "objectForKey:", v73);
                    if (v74)
                    {
                      if ((*(_BYTE *)(v74 + 120) & 4) != 0)
                      {
                        v75 = *(void **)(v74 + 72);
                      }
                      else
                      {
                        do
                        {
                          v75 = (void *)v74;
                          v74 = objc_msgSend((id)v74, "superentity");
                        }
                        while (v74);
                      }
                    }
                    else
                    {
                      v75 = 0;
                    }
                    v76 = objc_msgSend(v75, "name");
                    v77 = (id)objc_msgSend(*(id *)(a1 + 352), "objectForKey:", v76);
                    if (!v77)
                    {
                      v77 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                      objc_msgSend(*(id *)(a1 + 352), "setObject:forKey:", v77, v76);
                    }
                    objc_msgSend(v77, "addObject:", v71);

                    ++v70;
                  }
                  while (v70 != v68);
                  v78 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v225, v263, 16);
                  v68 = v78;
                }
                while (v78);
              }

              v58 = v161 + 1;
            }
            while (v161 + 1 != v155);
            v79 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v229, &v264, 16);
            v57 = v79;
          }
          while (v79);
        }
LABEL_144:
        v223 = 0u;
        v224 = 0u;
        v221 = 0u;
        v222 = 0u;
        v153 = *(id *)(a1 + 352);
        v90 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v221, v262, 16);
        if (v90)
        {
          v156 = *(_QWORD *)v222;
          do
          {
            v91 = 0;
            v154 = v90;
            do
            {
              if (*(_QWORD *)v222 != v156)
                objc_enumerationMutation(v153);
              v92 = *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * v91);
              v93 = (id)objc_msgSend(*(id *)(a1 + 352), "objectForKey:", v92);
              v94 = objc_msgSend((id)objc_msgSend((id)v245[5], "objectForKey:", v92), "integerValue");
              v95 = objc_msgSend(v93, "count") + v94;
              v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v95);
              objc_msgSend((id)v245[5], "setObject:forKey:", v96, v92);

              if (objc_msgSend(v93, "count"))
              {
                v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", objc_msgSend(v93, "allObjects"), 0);
                objc_msgSend(v97, "sortUsingComparator:", &__block_literal_global_557);
                v98 = objc_msgSend(v97, "objectAtIndex:", 0);
                v158 = v97;
                v162 = v91;
                if (!v98 || *(_QWORD *)(v98 + 56) <= v94)
                {
                  v219 = 0u;
                  v220 = 0u;
                  v217 = 0u;
                  v218 = 0u;
                  v99 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v217, v261, 16);
                  if (v99)
                  {
                    v100 = *(_QWORD *)v218;
                    do
                    {
                      v101 = 0;
                      do
                      {
                        if (*(_QWORD *)v218 != v100)
                          objc_enumerationMutation(v93);
                        v102 = *(_QWORD **)(*((_QWORD *)&v217 + 1) + 8 * v101);
                        if (!objc_msgSend(*(id *)(a1 + 344), "objectForKey:", v102))
                        {
                          if (v102 && v102[7] > v95)
                          {
                            objc_msgSend(*(id *)(a1 + 344), "setObject:forKey:", v102, v102);
                          }
                          else
                          {
                            v103 = [PFUbiquityGlobalObjectID alloc];
                            if (v102)
                            {
                              v104 = v102[1];
                              v105 = v102[2];
                              v106 = v102[4];
                            }
                            else
                            {
                              v105 = 0;
                              v104 = 0;
                              v106 = 0;
                            }
                            v107 = -[PFUbiquityGlobalObjectID initWithStoreName:entityName:primaryKeyInteger:andPeerID:](v103, "initWithStoreName:entityName:primaryKeyInteger:andPeerID:", v104, v105, ++v94, v106);
                            objc_msgSend(*(id *)(a1 + 344), "setObject:forKey:", v107, v102);

                          }
                        }
                        ++v101;
                      }
                      while (v99 != v101);
                      v108 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v217, v261, 16);
                      v99 = v108;
                    }
                    while (v108);
                  }
                }

                v90 = v154;
                v91 = v162;
              }

              ++v91;
            }
            while (v91 != v90);
            v90 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v221, v262, 16);
          }
          while (v90);
        }
        v215 = 0u;
        v216 = 0u;
        v213 = 0u;
        v214 = 0u;
        v109 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v213, v260, 16);
        if (v109)
        {
          v159 = *(_QWORD *)v214;
          do
          {
            v110 = 0;
            do
            {
              if (*(_QWORD *)v214 != v159)
                objc_enumerationMutation(v164);
              v111 = *(_QWORD *)(*((_QWORD *)&v213 + 1) + 8 * v110);
              if (v111
                && ((v112 = *(_QWORD *)(v111 + 24)) == 0 ? (v113 = 0) : (v113 = *(_QWORD *)(v112 + 40)),
                    (v114 = *(_QWORD *)(v111 + 72)) != 0))
              {
                v115 = objc_msgSend(*(id *)(v114 + 40), "objectForKey:", v113);
              }
              else
              {
                v115 = 0;
              }
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Rewriting save snapshot (%@)\n%@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3360, v111, v115);
              }
              if (v115)
              {
                objc_msgSend(*(id *)(v115 + 32), "removeAllObjects");
                objc_msgSend(*(id *)(v115 + 72), "removeAllObjects");
              }
              v211 = 0u;
              v212 = 0u;
              v209 = 0u;
              v210 = 0u;
              v116 = *(void **)(a1 + 344);
              v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v209, v259, 16);
              v163 = v111;
              v118 = v109;
              if (v117)
              {
                v119 = *(_QWORD *)v210;
                do
                {
                  for (k = 0; k != v117; ++k)
                  {
                    if (*(_QWORD *)v210 != v119)
                      objc_enumerationMutation(v116);
                    -[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:](v115, *(_QWORD *)(*((_QWORD *)&v209 + 1) + 8 * k), objc_msgSend(*(id *)(a1 + 344), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v209 + 1) + 8 * k)));
                  }
                  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v209, v259, 16);
                }
                while (v117);
              }
              -[PFUbiquityStoreSaveSnapshot finishGlobalIDReplacement](v115);
              v109 = v118;
              if (v115)
                v121 = *(void **)(v115 + 120);
              else
                v121 = 0;
              v122 = objc_msgSend(v121, "integerValue");
              v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v146 - v142 + 1 + v122);
              if (v115)
                objc_setProperty_nonatomic((id)v115, v123, v124, 120);

              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Finished rewriting save snapshot (%@)\n%@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3374, v163, v115);
              }
              if (-[PFUbiquityTransactionLog rewriteToDiskWithError:](v163, (uint64_t *)&v250))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Rewrote log: %@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3377, a1, v163);
                }
              }
              else
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Error rewriting log: %@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3379, a1, v250);
                }
                LOBYTE(v166) = 0;
              }
              ++v110;
            }
            while (v110 != v118);
            v125 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v213, v260, 16);
            v109 = v125;
          }
          while (v125);
        }
        if ((v166 & 1) != 0)
        {
          v207 = 0u;
          v208 = 0u;
          v205 = 0u;
          v206 = 0u;
          v126 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v205, v258, 16);
          if (!v126)
            goto LABEL_227;
          v127 = *(_QWORD *)v206;
          do
          {
            for (m = 0; m != v126; ++m)
            {
              if (*(_QWORD *)v206 != v127)
                objc_enumerationMutation(v164);
              v129 = *(_QWORD *)(*((_QWORD *)&v205 + 1) + 8 * m);
              if (v129)
                *(_BYTE *)(v129 + 20) = 1;
              if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:](v129, &v250))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMoved log to temporary location: %@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3389, a1, v129);
                }
              }
              else
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
                {
                  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\n Error moving log: %@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3391, a1, v250);
                }
                LOBYTE(v166) = 0;
              }
            }
            v126 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v205, v258, 16);
          }
          while (v126);
          if ((v166 & 1) != 0)
          {
LABEL_227:
            v130 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v203 = 0u;
            v204 = 0u;
            v201 = 0u;
            v202 = 0u;
            v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v201, v257, 16);
            if (v131)
            {
              v132 = *(_QWORD *)v202;
              do
              {
                for (n = 0; n != v131; ++n)
                {
                  if (*(_QWORD *)v202 != v132)
                    objc_enumerationMutation(obj);
                  v134 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * n);
                  v135 = -[PFUbiquityLocation createFullPath](v134);
                  if (objc_msgSend(v130, "removeItemAtPath:error:", v135, &v250))
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRemoved old local log: %@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3404, a1, v134);
                    }
                  }
                  else if (objc_msgSend((id)objc_msgSend(v250, "domain"), "isEqualToString:", v152)
                         && objc_msgSend(v250, "code") == 4)
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nFile went missing: %@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3406, a1, v134);
                    }
                  }
                  else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                  {
                    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError deleting old local log: %@\n%@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3408, a1, v134, v250);
                  }

                }
                v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v201, v257, 16);
              }
              while (v131);
            }
            v199 = 0u;
            v200 = 0u;
            v197 = 0u;
            v198 = 0u;
            v136 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v197, v256, 16);
            if (v136)
            {
              v137 = *(_QWORD *)v198;
              do
              {
                for (ii = 0; ii != v136; ++ii)
                {
                  if (*(_QWORD *)v198 != v137)
                    objc_enumerationMutation(v164);
                  v139 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * ii);
                  if (v139)
                    *(_BYTE *)(v139 + 20) = 0;
                  if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:](v139, &v250))
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nMoved log file to local directory: %@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3419, a1, v139);
                    }
                  }
                  else
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
                    {
                      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError moving log file to local directory: %@\n%@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3421, a1, v139, v250);
                    }
                    LOBYTE(v166) = 0;
                  }
                }
                v136 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v197, v256, 16);
              }
              while (v136);
            }
          }
        }
      }
LABEL_68:
      if ((v166 & 1) == 0)
      {
LABEL_125:
        if (v250)
        {
          v80 = 0;
          v144[5] = (uint64_t)v250;
        }
        else
        {
          v82 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v82, v83, v84, v85, v86, v87, v88, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
          v89 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PF"
                                 "UbiquitySetupAssistant.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 3485;
            _os_log_fault_impl(&dword_18A253000, v89, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
          v80 = 0;
        }
        goto LABEL_128;
      }
      goto LABEL_69;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v174 = __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke;
    v175 = &unk_1E1EDD430;
    v176 = a1;
    v177 = a2;
    if (pthread_main_np()
      || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("kbd")) & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("keyboardservicesd")))
    {
      v174((uint64_t)block);
    }
    else
    {
      dispatch_sync(MEMORY[0x1E0C80D38], block);
    }
    if (*(_BYTE *)(a1 + 328))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Looks like the store was changed in will change, trying again: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3553, a2);
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      {
        v35 = a3;
        if (a3)
          v35 = *(_QWORD *)(a3 + 72);
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAttempting to replace store: %@ with store: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3555, a1, a2, v35);
      }
      if (a3)
        v36 = *(void **)(a3 + 72);
      else
        v36 = 0;
      v37 = objc_msgSend(v36, "URL");
      if (a3)
        v38 = *(void **)(a3 + 72);
      else
        v38 = 0;
      v39 = objc_msgSend(v38, "options");
      v40 = *(void **)(a1 + 16);
      v172[0] = MEMORY[0x1E0C809B0];
      v172[1] = 3221225472;
      v172[2] = __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_2;
      v172[3] = &unk_1E1EE1960;
      v172[4] = a3;
      v172[5] = v143;
      v172[6] = a1;
      v172[7] = v37;
      v172[10] = &v178;
      v172[11] = &v184;
      v172[8] = v39;
      v172[9] = a2;
      objc_msgSend(v40, "performBlockAndWait:", v172);
      v41 = (id)v179[5];
      if (*((_BYTE *)v185 + 24))
      {
        v42 = *(id *)(a1 + 16);
        v167[0] = MEMORY[0x1E0C809B0];
        v167[1] = 3221225472;
        v168 = __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_3;
        v169 = &unk_1E1EDD430;
        v170 = a1;
        v171 = a2;
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("kbd")) & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName"), "isEqualToString:", CFSTR("keyboardservicesd")))
        {
          v168((uint64_t)v167);
        }
        else
        {
          dispatch_async(MEMORY[0x1E0C80D38], v167);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to replace %@ with side loaded store: %@\nError: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3622, a1, *(_QWORD *)(a1 + 48), v37, v179[5]);
      }
    }
LABEL_260:
    if (*((_BYTE *)v185 + 24))
      break;
    ++v150;
  }
  while (v150 != 100);

  v140 = *((unsigned __int8 *)v185 + 24);
  _Block_object_dispose(&v178, 8);
  _Block_object_dispose(&v184, 8);
  return v140;
}

id __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "createMapOfEntityNameToPKMaxForEntities:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(v2, "mutableCopy");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32));
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
}

uint64_t __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  if (!a2)
  {
    v3 = 0;
    if (!a3)
      return objc_msgSend(v3, "compare:", a3);
    goto LABEL_3;
  }
  v3 = *(void **)(a2 + 64);
  if (a3)
LABEL_3:
    a3 = *(_QWORD *)(a3 + 64);
  return objc_msgSend(v3, "compare:", a3);
}

uint64_t __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "moveItemAtURL:toURL:error:", a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error moving local log: %@\n%@\n%@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]_block_invoke_4", 3450, a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Tried deleting file: %@\n%@"), "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]_block_invoke_4", 3453, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
    result = objc_msgSend(*(id *)(a1 + 32), "moveItemAtURL:toURL:error:", a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = CFSTR("added");
  v8[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v7[1] = CFSTR("removed");
  v5 = *(_QWORD *)(a1 + 40);
  v8[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v7[2] = CFSTR("NSPersistentStoreUbiquitousTransitionTypeKey");
  v8[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  return objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorStoresWillChangeNotification"), v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
}

id __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSSaveChangesRequest *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v23 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 72);
  else
    v3 = 0;
  if ((objc_msgSend((id)objc_msgSend(v3, "identifier"), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = *(void **)(v4 + 72);
    else
      v5 = 0;
    objc_msgSend(v5, "setIdentifier:", *(_QWORD *)(a1 + 40));
    v6 = objc_alloc_init(NSSaveChangesRequest);
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 72);
    else
      v8 = 0;
    objc_msgSend(v8, "executeRequest:withContext:error:", v6, 0, 0);

  }
  if (+[NSSQLCore _replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:](NSSQLCore, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nReplaced %@ with %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3577, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_QWORD *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 72), "setURL:", objc_msgSend(*(id *)(a1 + 72), "URL"));
    objc_msgSend(*(id *)(a1 + 72), "setReadOnly:", 0);
    if ((objc_msgSend(*(id *)(a1 + 72), "loadMetadata:", &v23) & 1) == 0
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error loading new store metadata after side load: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3583, v23);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72) = 0;
    if (-[PFUbiquitySetupAssistant initializeStoreKnowledgeVectorFromStore:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 72)))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUpdated store knowledge vector to: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3590, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72));
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(v10 + 320);
      if (!v11)
        goto LABEL_43;
      v12 = *(void **)(v10 + 72);
      v13 = *(_QWORD *)(v11 + 88);
      if (v13)
      {
        v14 = *(void **)(v13 + 88);
        if (v14)
        {
          objc_setProperty_atomic(v14, v9, v12, 64);
          v15 = *(_QWORD *)(a1 + 48);
          v11 = *(_QWORD *)(v15 + 320);
          if (!v11)
            goto LABEL_43;
          v12 = *(void **)(v15 + 72);
        }
      }
      v16 = *(_QWORD *)(v11 + 88);
      if (!v16
        || (v17 = *(void **)(v16 + 120)) == 0
        || (objc_setProperty_nonatomic(v17, v9, v12, 88), (v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 320)) != 0))
      {
        v18 = *(_QWORD *)(v11 + 88);
        if (v18)
        {
          v19 = *(_QWORD *)(v18 + 88);
          if (v19)
          {
            v20 = *(_QWORD *)(v19 + 40);
            goto LABEL_29;
          }
        }
      }
LABEL_43:
      v20 = 0;
LABEL_29:
      if (-[PFUbiquityPeerRangeCache refreshPeerRangeCache:](v20))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 320);
          if (v21)
          {
            v21 = *(_QWORD *)(v21 + 88);
            if (v21)
              v21 = *(_QWORD *)(v21 + 88);
          }
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nRefreshed peer range cache: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3596, *(_QWORD *)(a1 + 48), v21);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nError refreshing peer range cache: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3598, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      }
      return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nUnable to reinitialize store knowledge vector: %@"), "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3601, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
}

void __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = CFSTR("added");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v6[1] = CFSTR("removed");
  v4 = *(_QWORD *)(a1 + 40);
  v7[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 1);
  v6[2] = CFSTR("NSPersistentStoreUbiquitousTransitionTypeKey");
  v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorStoresDidChangeNotification"), v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3));

}

- (void)exportedLog:(id)a3
{
  os_unfair_lock_s *p_sideLoadLock;

  p_sideLoadLock = (os_unfair_lock_s *)&self->_sideLoadLock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_sideLoadLock);
  self->_gotExportNotification = 1;
  -[NSMutableSet addObjectsFromArray:](self->_logLocationsExportedDuringSideLoad, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("PFLogLocationsKey")));
  os_unfair_lock_unlock(p_sideLoadLock);
}

+ (uint64_t)removeUbiquityMetadataFromStore:(uint64_t)a1
{
  void *v3;
  _QWORD v5[5];

  objc_opt_self();
  v3 = (void *)objc_msgSend(a2, "_persistentStoreCoordinator");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PFUbiquitySetupAssistant_removeUbiquityMetadataFromStore___block_invoke;
  v5[3] = &unk_1E1EDD520;
  v5[4] = a2;
  return objc_msgSend(v3, "performBlockAndWait:", v5);
}

void __60__PFUbiquitySetupAssistant_removeUbiquityMetadataFromStore___block_invoke(uint64_t a1)
{
  -[NSSQLCore removeUbiquityMetadata](*(void **)(a1 + 32));
}

- (void)ubiquityIdentityTokenChanged:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  if (!v4 || objc_msgSend(v4, "isEqualToString:", self->_ubiquityName))
  {
    self->_abortSetup = 1;
    self->_gotAccountChange = 1;
  }
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  if ((NSPersistentStore *)objc_msgSend(a3, "object") == self->_store)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 2))
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nAborting setup because store removed from coordinator. %@"), "-[PFUbiquitySetupAssistant coordinatorWillRemoveStore:]", 4179, self, a3);
    self->_abortSetup = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_initialSyncSemaphore);
  }
}

@end
