@implementation BRCAppLibrary

- (NSString)logName
{
  return self->_appLibraryID;
}

- (BOOL)isCloudDocsAppLibrary
{
  return -[NSString isEqualToString:](self->_appLibraryID, "isEqualToString:", *MEMORY[0x1E0D10DB0]);
}

- (BOOL)isDesktopAppLibrary
{
  return 0;
}

- (BOOL)isDocumentsAppLibrary
{
  return 0;
}

- (BOOL)isiCloudDesktopAppLibrary
{
  return -[BRCAppLibrary isDesktopAppLibrary](self, "isDesktopAppLibrary")
      || -[BRCAppLibrary isDocumentsAppLibrary](self, "isDocumentsAppLibrary");
}

- (unint64_t)syncedFolderType
{
  return 1;
}

- (BOOL)includesDataScope
{
  return !-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary");
}

- (BOOL)rootRecordCreated
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (void)setNeedsSave:(BOOL)a3
{
  void *v5;
  NSObject *v6;

  if (self->_needsSave != a3)
  {
    if (a3)
    {
      -[BRCPQLConnection forceBatchStart](self->_db, "forceBatchStart");
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary setNeedsSave:].cold.1();

    }
    self->_needsSave = a3;
  }
}

- (NSString)absolutePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[BRCAppLibrary root](self, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absolutePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAppLibrary pathRelativeToRoot](self, "pathRelativeToRoot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] no path for an app library%@", (uint8_t *)&v11, 0xCu);
    }

  }
  return (NSString *)v6;
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[BRCAppLibrary absolutePath](self, "absolutePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v2, 1);
  else
    v3 = 0;

  return (NSURL *)v3;
}

- (BOOL)hasActiveQueries
{
  unint64_t v2;

  v2 = atomic_load(&self->_activeQueries);
  return v2 != 0;
}

- (BOOL)hasActiveRecursiveQueries
{
  unint64_t v2;

  v2 = atomic_load(&self->_activeRecursiveQueries);
  return v2 != 0;
}

- (BRCAppLibrary)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BRCAppLibrary init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (BRCAppLibrary)initWithMangledID:(id)a3 dbRowID:(id)a4 zoneRowID:(id)a5 db:(id)a6 plist:(id)a7 session:(id)a8 initialCreation:(BOOL)a9 createdRootOnDisk:(BOOL)a10 createdCZMMoved:(BOOL)a11 rootFileID:(id)a12 childBasehashSalt:(id)a13 saltingState:(unsigned int)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  BRCAppLibrary *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  brc_task_tracker *tracker;
  NSMutableSet *v32;
  NSMutableSet *XPCClientsUsingUbiquity;
  uint64_t v34;
  NSMutableSet *targetSharedServerZones;
  uint64_t v36;
  NSMutableSet *foregroundClients;
  uint64_t v38;
  NSString *appLibraryID;
  uint64_t v40;
  NSMutableDictionary *pendingFileCoordinators;
  uint64_t v42;
  uint64_t v43;
  unsigned int state;
  int v45;
  id v46;
  int v47;
  int v48;
  int v49;
  const __CFString *v50;
  uint64_t v51;
  NSNumber *deepScanStamp;
  NSString *deepScanReason;
  uint64_t v54;
  BRContainer *containerMetadata;
  id v57;
  id v58;
  void *v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  NSObject *v64;
  id v65;
  id v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id obj;
  id v80;
  id v81;
  id v82;
  objc_super v83;

  v20 = a3;
  v21 = a4;
  obj = a5;
  v22 = a5;
  v82 = a6;
  v23 = a7;
  v81 = a8;
  v80 = a12;
  v24 = a13;
  v25 = v24;
  if (v21)
  {
    if (v22)
      goto LABEL_3;
    goto LABEL_30;
  }
  v74 = v24;
  v57 = v23;
  v58 = v22;
  brc_bread_crumbs();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.1();

  v22 = v58;
  v23 = v57;
  v25 = v74;
  if (!v22)
  {
LABEL_30:
    v75 = v25;
    v61 = v23;
    v62 = v22;
    brc_bread_crumbs();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.4();

    v22 = v62;
    v23 = v61;
    v25 = v75;
  }
LABEL_3:
  if ((objc_msgSend(v20, "isPrivate") & 1) == 0)
  {
    v76 = v25;
    v65 = v23;
    v66 = v22;
    brc_bread_crumbs();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.3();

    v22 = v66;
    v23 = v65;
    v25 = v76;
  }
  v83.receiver = self;
  v83.super_class = (Class)BRCAppLibrary;
  v26 = -[BRCAppLibrary init](&v83, sel_init);
  if (v26)
  {
    v72 = v22;
    v77 = v23;
    if (v23 && a9)
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.2();

    }
    v73 = v25;
    objc_msgSend(v20, "appLibraryOrZoneName", v21);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    brc_task_tracker_create((const char *)objc_msgSend(v29, "UTF8String"));
    v30 = objc_claimAutoreleasedReturnValue();
    tracker = v26->_tracker;
    v26->_tracker = (brc_task_tracker *)v30;

    v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    XPCClientsUsingUbiquity = v26->_XPCClientsUsingUbiquity;
    v26->_XPCClientsUsingUbiquity = v32;

    objc_storeStrong((id *)&v26->_db, a6);
    objc_storeStrong((id *)&v26->_dbRowID, a4);
    objc_storeStrong((id *)&v26->_zoneRowID, obj);
    objc_storeStrong((id *)&v26->_session, a8);
    v34 = objc_opt_new();
    targetSharedServerZones = v26->_targetSharedServerZones;
    v26->_targetSharedServerZones = (NSMutableSet *)v34;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = objc_claimAutoreleasedReturnValue();
    foregroundClients = v26->_foregroundClients;
    v26->_foregroundClients = (NSMutableSet *)v36;

    objc_storeStrong((id *)&v26->_fileID, a12);
    objc_storeStrong((id *)&v26->_mangledID, a3);
    objc_msgSend(v20, "appLibraryOrZoneName");
    v38 = objc_claimAutoreleasedReturnValue();
    appLibraryID = v26->_appLibraryID;
    v26->_appLibraryID = (NSString *)v38;

    v40 = objc_opt_new();
    pendingFileCoordinators = v26->_pendingFileCoordinators;
    v26->_pendingFileCoordinators = (NSMutableDictionary *)v40;

    v42 = brc_current_date_nsec();
    v43 = v42;
    if (a9)
    {
      state = v26->_state;
      v45 = state | 0x140000;
      v26->_state = state | 0x140000;
      v26->_maxLostStamp = v42;
      v46 = a13;
      if (!a10 || a11)
      {
        v47 = state | 0x140800;
        if (a10)
          v48 = v45;
        else
          v48 = v47;
        if (a11)
          v49 = v48 | 0x200000;
        else
          v49 = v48;
        v26->_state = v49;
      }
      v50 = CFSTR("initial creation");
      v21 = v71;
    }
    else
    {
      v21 = v71;
      v46 = a13;
      if (!v71)
      {
        brc_bread_crumbs();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
          -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:].cold.1();

      }
      v23 = v77;
      -[BRCAppLibrary updateWithPlist:](v26, "updateWithPlist:", v77);
      if (v26->_generationID)
        goto LABEL_25;
      v50 = CFSTR("generationID is nil");
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v43);
    v51 = objc_claimAutoreleasedReturnValue();
    deepScanStamp = v26->_deepScanStamp;
    v26->_deepScanStamp = (NSNumber *)v51;

    deepScanReason = v26->_deepScanReason;
    v26->_deepScanReason = &v50->isa;

    v26->_state = v26->_state & 0xFFF7FFFB | 4;
    -[BRCAppLibrary setNeedsSave:](v26, "setNeedsSave:", 1);
    v23 = v77;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0D10E48], "containerForMangledID:", v20);
    v54 = objc_claimAutoreleasedReturnValue();
    containerMetadata = v26->_containerMetadata;
    v26->_containerMetadata = (BRContainer *)v54;

    -[BRCAppLibrary _updateIsInCloudDocsZone](v26, "_updateIsInCloudDocsZone");
    v26->_saltingState = a14;
    objc_storeStrong((id *)&v26->_childBasehashSalt, v46);
    v22 = v72;
    v25 = v73;
  }

  return v26;
}

- (void)updateWithPlist:(id)a3
{
  id v4;
  void *v5;
  NSNumber *v6;
  NSNumber *fileID;
  NSNumber *v8;
  NSNumber *generationID;
  void *v10;
  NSNumber *v11;
  NSNumber *deepScanStamp;
  NSString *v13;
  NSString *deepScanReason;
  NSString *v15;
  NSString *containerMetadataEtag;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_state = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileID"));
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fileID = self->_fileID;
  self->_fileID = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("generationID"));
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  generationID = self->_generationID;
  self->_generationID = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxLostStamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_maxLostStamp = objc_msgSend(v10, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deepScanStamp"));
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  deepScanStamp = self->_deepScanStamp;
  self->_deepScanStamp = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deepScanReason"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  deepScanReason = self->_deepScanReason;
  self->_deepScanReason = v13;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadataChangetag"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  containerMetadataEtag = self->_containerMetadataEtag;
  self->_containerMetadataEtag = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadataNeedsSyncUp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  self->_containerMetadataNeedsSyncUp = objc_msgSend(v17, "BOOLValue");
  -[BRContainer setIsInInitialState:](self->_containerMetadata, "setIsInInitialState:", (-[BRCAppLibrary state](self, "state") >> 18) & 1);
  if (!self->_generationID)
    -[BRCAppLibrary scheduleDeepScanWithReason:](self, "scheduleDeepScanWithReason:", CFSTR("generationID is nil after update"));
}

- (void)associateWithClientZone:(id)a3
{
  -[BRCAppLibrary associateWithClientZone:offline:](self, "associateWithClientZone:offline:", a3, 0);
}

- (void)associateWithClientZone:(id)a3 offline:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  BRCAppLibrary *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  BRCZoneRowID *zoneRowID;

  v4 = a4;
  v6 = a3;
  if (!v4)
    -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if (!v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary associateWithClientZone:offline:].cold.1();

  }
  v9 = self;
  objc_sync_enter(v9);
  if (-[NSMutableSet count](v9->_foregroundClients, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&v9->_defaultClientZone);
    objc_msgSend(WeakRetained, "serverZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeForegroundClient:", v9);

    objc_msgSend(v6, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addForegroundClient:", v9);

  }
  objc_storeWeak((id *)&v9->_defaultClientZone, v6);
  objc_msgSend(v6, "dbRowID");
  v13 = objc_claimAutoreleasedReturnValue();
  zoneRowID = v9->_zoneRowID;
  v9->_zoneRowID = (BRCZoneRowID *)v13;

  objc_sync_exit(v9);
  objc_msgSend(v6, "addAppLibrary:offline:", v9, v4);
  -[BRCAppLibrary _updateIsInCloudDocsZone](v9, "_updateIsInCloudDocsZone");

}

- (BOOL)isDocumentScopePublic
{
  void *v2;
  char v3;

  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDocumentScopePublic");

  return v3;
}

- (NSMutableDictionary)plist
{
  void *v3;
  void *v4;
  NSNumber *fileID;
  NSNumber *generationID;
  void *v7;
  NSNumber *deepScanStamp;
  NSString *deepScanReason;
  NSString *containerMetadataEtag;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("state"));

  fileID = self->_fileID;
  if (fileID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", fileID, CFSTR("fileID"));
  generationID = self->_generationID;
  if (generationID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", generationID, CFSTR("generationID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_maxLostStamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("maxLostStamp"));

  deepScanStamp = self->_deepScanStamp;
  if (deepScanStamp)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", deepScanStamp, CFSTR("deepScanStamp"));
  deepScanReason = self->_deepScanReason;
  if (deepScanReason)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", deepScanReason, CFSTR("deepScanReason"));
  containerMetadataEtag = self->_containerMetadataEtag;
  if (containerMetadataEtag)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", containerMetadataEtag, CFSTR("metadataChangetag"));
  if (self->_containerMetadataNeedsSyncUp)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("metadataNeedsSyncUp"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rootQuotaUsage, CFSTR("rootQuota"));
  return (NSMutableDictionary *)v3;
}

- (void)close
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] closing app library: %@%@", (uint8_t *)&v6, 0x16u);

}

- (BOOL)isAppInstalled
{
  return (self->_state & 0x800000) == 0;
}

- (void)activate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_activated%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4
{
  void *v7;
  unsigned int state;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unsigned int v20;
  void *v21;
  char v22;
  id WeakRetained;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  BRCAccountSession *session;
  NSMutableSet *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  uint8_t v58[128];
  uint8_t buf[4];
  BRCAppLibrary *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 0x1000000 && (a3 & 0x1000000) != 0)
  {
    brc_bread_crumbs();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary _activateState:origState:].cold.3();

  }
  if (self->_state != a3)
  {
    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
    self->_state = a3;
  }
  if (-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary")
    || -[BRCAppLibrary isiCloudDesktopAppLibrary](self, "isiCloudDesktopAppLibrary"))
  {
    state = self->_state & 0xFFFBFFFF;
    self->_state = state;
  }
  else
  {
    state = self->_state;
  }
  v9 = state ^ a4;
  if (state != a4)
  {
    if (self->_needsSave)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        BRCPrettyPrintBitmapWithContext(a4, (uint64_t)&applibrary_state_entries, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v60 = self;
        v61 = 2112;
        v62 = v48;
        v63 = 2112;
        v64 = v10;
        _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ state changed, was %@%@", buf, 0x20u);

      }
    }
    if ((v9 & 0xC) != 0)
    {
      v12 = self->_state & 0xC;
      -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12 == 4)
      {

        if (!v14)
        {
          brc_bread_crumbs();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
            -[BRCAppLibrary _activateState:origState:].cold.2();

        }
        -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scheduleAppLibraryForLostScan:", self);
      }
      else
      {
        objc_msgSend(v13, "unscheduleAppLibraryForLostScan:", self);
      }

    }
    if ((v9 & 0x80000) != 0 && (self->_state & 0x80000) == 0)
      objc_msgSend(v7, "scheduleSyncUp");
    if ((v9 & 0x1800000) != 0x800000)
      goto LABEL_33;
    if ((a4 & 0x800000) != 0)
    {
      if (-[BRCAccountSession hasOptimizeStorageEnabled](self->_session, "hasOptimizeStorageEnabled"))
      {
LABEL_33:
        if ((v9 & 0x40000) != 0)
        {
          v20 = -[BRCAppLibrary state](self, "state");
          -[BRContainer setIsInInitialState:](self->_containerMetadata, "setIsInInitialState:", (v20 >> 18) & 1);
          objc_msgSend(MEMORY[0x1E0D10E48], "postContainerListUpdateNotification");
          if (-[BRContainer isInInitialState](self->_containerMetadata, "isInInitialState"))
          {
            if (-[NSString isEqualToString:](self->_appLibraryID, "isEqualToString:", *MEMORY[0x1E0D10B20]))
            {
              -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "hasCompletedInitialSyncDownOnce");

              if ((v22 & 1) == 0)
                -[BRCAppLibrary addForegroundClient:](self, "addForegroundClient:", self);
            }
          }
          WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);
          v24 = WeakRetained;
          if ((v20 & 0x40000) == 0 && WeakRetained)
          {
            objc_msgSend(WeakRetained, "endObservingChangesWithDelegate:", self);
            objc_storeWeak((id *)&self->_pristineFetchOp, 0);
          }

        }
        if ((v9 & 0x4000000) != 0 && (-[BRCAppLibrary state](self, "state") & 0x4000000) != 0)
        {
          v25 = -[BRCAppLibrary includesDataScope](self, "includesDataScope");
          if ((a4 & 0x1000000) == 0 && v25)
          {
            -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCAppLibrary documentsFolderItemID](self, "documentsFolderItemID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "itemByItemID:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "asDirectory");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "clientZone");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "itemID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "serverItemByItemID:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "st");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v32)
            {
              objc_msgSend(v32, "st");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setType:", objc_msgSend(v35, "type"));

            }
            else
            {
              objc_msgSend(v33, "setType:", 0);
            }

            brc_bread_crumbs();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              -[BRCAppLibrary _activateState:origState:].cold.1();

            objc_msgSend(v29, "saveToDB");
          }
        }
        if ((-[BRCAppLibrary state](self, "state") & 0x4040000) == 0x40000)
          -[BRCAppLibrary fetchPristineness](self, "fetchPristineness");
        if ((v9 & 0x4000000) != 0 && (-[BRCAppLibrary state](self, "state") & 0x14000000) == 0x4000000)
          -[BRCAppLibrary fetchTrashItems](self, "fetchTrashItems");
        if ((a4 & 0x140000) != 0 && (v9 & 0x140000) != 0)
          objc_msgSend(v7, "scheduleSyncUp");
        if ((v9 & 0x200000) != 0 && !-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary"))
        {
          -[BRCAppLibrary zoneDidChangeMovedToCloudDocsState](self, "zoneDidChangeMovedToCloudDocsState");
          if (-[BRCAppLibrary wasMovedToCloudDocs](self, "wasMovedToCloudDocs"))
          {
            -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "didCompleteCrossZoneMigrationForAppLibrary:", self);

          }
        }
        if ((v9 & 0x800) != 0 && (-[BRCAppLibrary state](self, "state") & 0x800) == 0)
        {
          if (-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary"))
          {
            session = self->_session;
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __42__BRCAppLibrary__activateState_origState___block_invoke;
            v57[3] = &unk_1E8760818;
            v57[4] = self;
            -[BRCAccountSession enumerateSharedClientZones:](session, "enumerateSharedClientZones:", v57);
          }
          else
          {
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v40 = self->_targetSharedServerZones;
            v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v54;
              do
              {
                for (i = 0; i != v42; ++i)
                {
                  if (*(_QWORD *)v54 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
                  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler", (_QWORD)v53);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "rescheduleSuspendedJobsMatching:inState:", v45, 22);

                }
                v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
              }
              while (v42);
            }

          }
        }
        goto LABEL_76;
      }
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v60 = self;
        v61 = 2112;
        v62 = v18;
        _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading everything in %@ because the app is now installed%@", buf, 0x16u);
      }

      -[BRCAppLibrary fetchRootItem](self, "fetchRootItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", self->_tracker, 1, 0, 0, 0);
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v60 = self;
        v61 = 2112;
        v62 = v15;
        _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] evicting everything in %@ because the app was removed%@", buf, 0x16u);
      }

      -[BRCAppLibrary fetchRootItem](self, "fetchRootItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "evictInTask:options:error:", self->_tracker, 5, 0);
    }

    goto LABEL_33;
  }
LABEL_76:
  objc_msgSend(v7, "_flushIdleBlocksIfNeeded", (_QWORD)v53);

  return v9;
}

uint64_t __42__BRCAppLibrary__activateState_origState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v3 = a2;
  objc_msgSend(v2, "applyScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rescheduleSuspendedJobsMatching:inState:", v5, 22);
  return 1;
}

- (BOOL)setStateBits:(unsigned int)a3
{
  unsigned int state;
  BOOL v4;

  state = self->_state;
  v4 = (a3 & ~state) != 0;
  -[BRCAppLibrary _activateState:origState:](self, "_activateState:origState:", state | a3);
  return v4;
}

- (void)clearStateBits:(unsigned int)a3
{
  -[BRCAppLibrary _activateState:origState:](self, "_activateState:origState:", self->_state & ~a3);
}

- (void)didUpdateDocumentScopePublic
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[BRCAppLibrary appLibraryID](self, "appLibraryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAppLibrary containerMetadata](self, "containerMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDocumentScopePublic");
    v8 = CFSTR("private");
    v12 = 138412802;
    v13 = v5;
    v14 = 2112;
    if (v7)
      v8 = CFSTR("public");
    v15 = v8;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_INFO, "[INFO] %@ becomes %@%@", (uint8_t *)&v12, 0x20u);

  }
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary scheduleDeepScanWithReason:](self, "scheduleDeepScanWithReason:", CFSTR("state of documentScopePublic changed"));
  -[BRCAccountSession recomputeAppSyncBlockStateForPrivateClientZone:](self->_session, "recomputeAppSyncBlockStateForPrivateClientZone:", v9);
  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDocumentScopePublic"))
  {
    v11 = -[BRCAppLibrary wasMovedToCloudDocs](self, "wasMovedToCloudDocs");

    if (!v11)
      objc_msgSend(v9, "clearAndRefetchRecentAndFavoriteDocuments");
  }
  else
  {

  }
}

- (BOOL)isGreedy
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  void *v12;

  -[BRCAppLibrary session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasOptimizeStorageEnabled");

  if ((v4 & 1) != 0)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", self->_mangledID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "shouldAppLibraryBeGreedy"))
    {
      brc_bread_crumbs();
      v6 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary isGreedy].cold.1();
LABEL_18:

LABEL_19:
      v10 = 1;
      goto LABEL_20;
    }
    if (!-[BRCAppLibrary shouldEvictUploadedItems](self, "shouldEvictUploadedItems"))
    {
      if (!-[BRCAppLibrary hasUbiquityClientsConnected](self, "hasUbiquityClientsConnected"))
      {
        -[BRCAppLibrary session](self, "session");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "isGreedy");

        goto LABEL_20;
      }
      brc_bread_crumbs();
      v6 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary isGreedy].cold.3();
      goto LABEL_18;
    }
    brc_bread_crumbs();
    v8 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary isGreedy].cold.2();

  }
  else
  {
    if (!-[BRCAppLibrary shouldEvictUploadedItems](self, "shouldEvictUploadedItems"))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary isGreedy].cold.5();
      goto LABEL_19;
    }
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary isGreedy].cold.4();
  }

  v10 = 0;
LABEL_20:

  return v10;
}

- (BOOL)isEqualToAppLibrary:(id)a3
{
  _QWORD *v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[BRMangledID isEqualToMangledID:](self->_mangledID, "isEqualToMangledID:", v4[12]);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)hash
{
  return -[BRMangledID hash](self->_mangledID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  BRCAppLibrary *v4;
  BOOL v5;

  v4 = (BRCAppLibrary *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BRCAppLibrary isEqualToAppLibrary:](self, "isEqualToAppLibrary:", v4);
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)-[BRCAppLibrary descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (id)_unwrappedDescriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString *appLibraryID;
  BRCALRowID *dbRowID;
  void *v12;
  void *v13;
  NSNumber *deepScanStamp;
  const __CFString *v15;
  double v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t saltingState;
  const __CFString *v32;
  NSData *childBasehashSalt;
  void *v34;
  void *v35;

  v4 = a3;
  -[BRCAppLibrary transferSyncContextIfExists](self, "transferSyncContextIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[BRCAppLibrary isForeground](self, "isForeground"))
    {
      v6 = CFSTR("foreground");
      v7 = 7;
      goto LABEL_7;
    }
    v6 = CFSTR("background");
  }
  else
  {
    v6 = CFSTR("NA");
  }
  v7 = 2;
LABEL_7:
  +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB37A0]);
  appLibraryID = self->_appLibraryID;
  dbRowID = self->_dbRowID;
  BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&applibrary_state_entries, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@[%@] %@ {s:%@} ino:%@ gen:%@"), appLibraryID, dbRowID, v8, v12, self->_fileID, self->_generationID);

  deepScanStamp = self->_deepScanStamp;
  v15 = CFSTR(" ago");
  if (deepScanStamp)
  {
    -[NSNumber longLongValue](deepScanStamp, "longLongValue");
    brc_current_date_nsec();
    brc_interval_from_nsec();
    if (v16 >= 0.0)
      v15 = &stru_1E8769030;
    else
      v16 = -v16;
    +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" deep-scan:%@%@ -reason:%@"), v17, v15, self->_deepScanReason);

  }
  objc_msgSend(v13, "appendString:", CFSTR(" queries:"));
  if (-[BRCAppLibrary hasActiveQueries](self, "hasActiveQueries"))
    objc_msgSend(v13, "appendString:", CFSTR("q"));
  if (-[BRCAppLibrary hasActiveRecursiveQueries](self, "hasActiveRecursiveQueries"))
    objc_msgSend(v13, "appendString:", CFSTR("r"));
  if (-[BRCAppLibrary hasActiveAliasQueries](self, "hasActiveAliasQueries"))
    objc_msgSend(v13, "appendString:", CFSTR("a"));
  if (-[BRCAppLibrary containerMetadataNeedsSyncUp](self, "containerMetadataNeedsSyncUp"))
    v18 = "needs-sync-up";
  else
    v18 = "idle";
  -[BRCAppLibrary containerMetadataEtag](self, "containerMetadataEtag");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shortDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR(" metadata:%s etag:%@ %@"), v18, v19, v21);

  if ((self->_state & 4) != 0)
  {
    brc_current_date_nsec();
    brc_interval_from_nsec();
    if (v22 >= 0.0)
    {
      v23 = &stru_1E8769030;
    }
    else
    {
      v22 = -v22;
      v23 = CFSTR(" ago");
    }
    +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v4, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" max-lost:%@%@"), v24, v23);

  }
  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v26, "count"))
  {
    objc_msgSend(v26, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", CFSTR(" bundles:{%@}"), v28);

  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "supportsEnhancedDrivePrivacy");

  if (v30)
  {
    saltingState = (int)self->_saltingState;
    if (saltingState > 3)
      v32 = CFSTR("no server item");
    else
      v32 = off_1E8760858[saltingState];
    objc_msgSend(v13, "appendFormat:", CFSTR(" salt-st{%@}"), v32);
    childBasehashSalt = self->_childBasehashSalt;
    if (childBasehashSalt)
    {
      -[NSData brc_truncatedSHA256](childBasehashSalt, "brc_truncatedSHA256");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "brc_hexadecimalString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendFormat:", CFSTR(" child-base-salt-validation{%@}"), v35);

    }
  }

  return v13;
}

- (id)descriptionWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  -[BRCAppLibrary _unwrappedDescriptionWithContext:](self, "_unwrappedDescriptionWithContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("<%@>"), v7);
  return v8;
}

- (void)dumpToContext:(id)a3
{
  id v4;
  void *v5;
  BRCAppLibrary *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAppLibrary descriptionWithContext:](self, "descriptionWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("+ app library: %@"), v5);

  if (-[BRCAppLibrary isForeground](self, "isForeground"))
  {
    objc_msgSend(v4, "pushIndentation");
    objc_msgSend(v4, "writeLineWithFormat:", CFSTR("+ foreground clients:"));
    objc_msgSend(v4, "pushIndentation");
    v6 = self;
    objc_sync_enter(v6);
    v7 = (void *)-[NSMutableSet copy](v6->_foregroundClients, "copy");
    objc_sync_exit(v6);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(v4, "writeLineWithFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "popIndentation");
    objc_msgSend(v4, "popIndentation");

  }
}

- (id)itemsEnumeratorWithRankMin:(unint64_t)a3 rankMax:(unint64_t)a4 namePrefix:(id)a5 withDeadItems:(BOOL)a6 shouldIncludeFolders:(BOOL)a7 shouldIncludeOnlyFolders:(BOOL)a8 shouldIncludeDocumentsScope:(BOOL)a9 shouldIncludeDataScope:(BOOL)a10 shouldIncludeExternalScope:(BOOL)a11 shouldIncludeTrashScope:(BOOL)a12 count:(unint64_t)a13 db:(id)a14
{
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  BRCAppLibrary *v32;
  void *v33;
  void *v34;
  BRCALRowID *dbRowID;
  int v36;
  uint64_t *v37;
  const __CFString *v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v44;
  NSObject *v45;
  void *v46;
  BRCALRowID *v47;
  BRCALRowID *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  id v59;
  _BOOL4 v60;
  _BOOL4 v61;
  _BOOL4 v62;
  _QWORD v64[5];
  id v65;

  v61 = a8;
  v62 = a7;
  v60 = a6;
  v16 = a5;
  v17 = a14;
  if (itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once == -1)
  {
    if (a9)
      goto LABEL_9;
  }
  else
  {
    dispatch_once(&itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__once, &__block_literal_global_17);
    if (a9)
      goto LABEL_9;
  }
  if (a10 || a11)
  {
LABEL_9:
    v57 = a4;
    v58 = a3;
    v59 = v16;
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v16, "br_stringByBackslashEscapingCharactersInString:", CFSTR("\\_%"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%%"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%% %@%%"), v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("AND (item_filename LIKE %@ ESCAPE '\\' OR item_filename LIKE %@ ESCAPE '\\')"), v22, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (a9)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a9)
        goto LABEL_15;
    }
    if (!a10)
    {
      v19 = 0;
      goto LABEL_20;
    }
LABEL_15:
    v24 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
    if (!a9 || !a10)
      v24 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
    if (!a9)
      v24 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
    v19 = (uint64_t)(id)*v24;
LABEL_20:
    v25 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    if (a11)
      v26 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
    else
      v26 = 0;
    v27 = v26;
    if (v19 | v27)
    {
      v28 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12)
        v28 = 0;
      v29 = v28;
      v30 = (void *)MEMORY[0x1E0DE81D0];
      v31 = (void *)v19;
      if (v19)
      {
LABEL_28:
        v32 = self;
        if (v27)
        {
          if (v29)
          {
LABEL_30:
            objc_msgSend(v30, "formatInjection:", CFSTR("AND ((%@) OR (%@) OR (%@))"), v31, v25, v29);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "0", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "0", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "formatInjection:", CFSTR("AND ((%@) OR (%@) OR (%@))"), v31, v25, v34);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = self;
LABEL_33:
        if (v27)
        {
          if (v19)
            goto LABEL_35;
        }
        else
        {

          if (v19)
            goto LABEL_35;
        }

LABEL_35:
        dbRowID = v32->_dbRowID;
        v36 = !v62 || v61;
        if (v60)
        {
          if (v36)
          {
            v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
            if (!v62)
              v37 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
            v53 = v33;
            v55 = a13;
            v49 = v18;
            v51 = *v37;
            v47 = v32->_dbRowID;
            v38 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
LABEL_44:
            v40 = (void *)objc_msgSend(v17, "fetch:", v38, v58, v57, v47, v49, v51, v53, v55);
LABEL_50:
            v64[0] = MEMORY[0x1E0C809B0];
            v64[1] = 3221225472;
            v64[2] = __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_117;
            v64[3] = &unk_1E875E310;
            v64[4] = v32;
            v65 = v17;
            objc_msgSend(v40, "enumerateObjects:", v64);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v59;
            goto LABEL_51;
          }
          objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v33;
          v56 = a13;
          v50 = v18;
          v52 = v41;
          v48 = dbRowID;
          v42 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1, 1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
        }
        else
        {
          if (v36)
          {
            v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
            if (!v62)
              v39 = &itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
            v53 = v33;
            v55 = a13;
            v49 = v18;
            v51 = *v39;
            v47 = v32->_dbRowID;
            v38 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
            goto LABEL_44;
          }
          objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", ", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v33;
          v56 = a13;
          v50 = v18;
          v52 = v41;
          v48 = dbRowID;
          v42 = CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_notifs_rank >= %lld     AND item_notifs_rank < %lld     AND +app_library_rowid = %@     AND item_state IN (0, -1)     %@      %@      %@ ORDER BY item_notifs_rank   LIMIT %lld");
        }
        v40 = (void *)objc_msgSend(v17, "fetch:", v42, v58, v57, v48, v50, v52, v54, v56);

        goto LABEL_50;
      }
    }
    else
    {
      brc_bread_crumbs();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:].cold.1();

      v46 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
      if (!a12)
        v46 = 0;
      v29 = v46;
      v30 = (void *)MEMORY[0x1E0DE81D0];
    }
    objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "0", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
    -[BRCAppLibrary itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:].cold.2();
  v20 = 0;
LABEL_51:

  return v20;
}

void __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "item_type != 3", 14);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("item_scope = 2 AND %@"), v14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope = v0;

  objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("item_scope = 1 AND %@"), v14);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope = v2;

  objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("(%@) OR (%@)"), itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDocumentScope, itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInDataScope);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInEitherScope = v4;

  objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("(   item_scope = 2 OR item_scope = 1) AND item_type = 3"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInExternalScope = v6;

  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "item_scope = 3", 14);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isInTrashScope = v8;

  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "AND item_type IN (1, 2, 8, 5, 6, 7)", 35);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isDocument = v10;

  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", "AND item_type = 0", 17);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder;
  itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db__isFolder = v12;

}

id __234__BRCAppLibrary_itemsEnumeratorWithRankMin_rankMax_namePrefix_withDeadItems_shouldIncludeFolders_shouldIncludeOnlyFolders_shouldIncludeDocumentsScope_shouldIncludeDataScope_shouldIncludeExternalScope_shouldIncludeTrashScope_count_db___block_invoke_117(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)itemsEnumeratorChildOf:(id)a3 withDeadItems:(BOOL)a4 rankMin:(unint64_t)a5 rankMax:(unint64_t)a6 count:(unint64_t)a7 db:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;

  v11 = a4;
  v14 = a8;
  v15 = a3;
  objc_msgSend(v15, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17 = "";
    v18 = 0;
  }
  else
  {
    v17 = "AND item_state IN (0, -1)";
    v18 = 25;
  }
  objc_msgSend(MEMORY[0x1E0DE81E0], "rawInjection:length:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneRowID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v14, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_parent_id = %@      AND item_notifs_rank >= %lld      AND item_notifs_rank < %lld     %@      AND item_parent_zone_rowid = %@ ORDER BY item_notifs_rank   LIMIT %lld"), v16, a5, a6, v19, v20, a7);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke;
  v25[3] = &unk_1E875E310;
  v25[4] = self;
  v26 = v14;
  v22 = v14;
  objc_msgSend(v21, "enumerateObjects:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id __79__BRCAppLibrary_itemsEnumeratorChildOf_withDeadItems_rankMin_rankMax_count_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)enumerateUserVisibleChildrenOfItemGlobalID:(id)a3 sortOrder:(unsigned __int8)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 db:(id)a7
{
  int v10;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;

  v10 = a4;
  v12 = a3;
  v13 = a7;
  if (v10 == 1)
  {
    v14 = (void *)MEMORY[0x1E0DE81E0];
    v15 = "version_mtime DESC";
    v16 = 18;
  }
  else
  {
    if (v10)
    {
      v17 = 0;
      goto LABEL_7;
    }
    v14 = (void *)MEMORY[0x1E0DE81E0];
    v15 = "item_filename";
    v16 = 13;
  }
  objc_msgSend(v14, "rawInjection:length:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(v12, "itemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "zoneRowID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v13, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp    FROM client_items   WHERE item_parent_id = %@      AND item_state IN (0, -1)     AND item_parent_zone_rowid = %@     AND (item_user_visible = 1 OR item_scope = 3) ORDER BY %@   LIMIT  %lld   OFFSET %lld"), v18, v19, v17, a6, a5);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __86__BRCAppLibrary_enumerateUserVisibleChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke;
  v24[3] = &unk_1E875E310;
  v24[4] = self;
  v25 = v13;
  v21 = v13;
  objc_msgSend(v20, "enumerateObjects:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __86__BRCAppLibrary_enumerateUserVisibleChildrenOfItemGlobalID_sortOrder_offset_limit_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (id)enumerateUserVisibleChildrenDirectoriesOfItemGlobalID:(id)a3 db:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp     FROM client_items    WHERE item_parent_id = %@       AND item_state IN (0, -1)      AND item_type = 0      AND item_parent_zone_rowid = %@       AND item_user_visible = 1  ORDER BY item_filename    LIMIT %lld"), v8, v9, 1000);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke;
  v14[3] = &unk_1E875E310;
  v14[4] = self;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v10, "enumerateObjects:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __74__BRCAppLibrary_enumerateUserVisibleChildrenDirectoriesOfItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(a1 + 40), a3);

  return v8;
}

- (void)didRemoveDocumentsFolder
{
  -[BRCAppLibrary setStateBits:](self, "setStateBits:", 0x40000);
}

- (void)didCreateDocumentScopedItem
{
  -[BRCAppLibrary clearStateBits:](self, "clearStateBits:", 0x40000);
}

- (void)didCreateDataScopedItem
{
  -[BRCAppLibrary clearStateBits:](self, "clearStateBits:", 0x100000);
}

- (void)fetchPristineness
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Listing documents folder to fetch pristineness for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)scheduleFullLibraryContentsFetch
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: We shouldn't be scheduling a full app library contents fetch when sync is blocked for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)fetchTrashItems
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Listing trash folder for %@%@");
  OUTLINED_FUNCTION_2();
}

void __32__BRCAppLibrary_fetchTrashItems__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  _QWORD block[9];

  if (!a2)
  {
    block[7] = v2;
    block[8] = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__BRCAppLibrary_fetchTrashItems__block_invoke_2;
    block[3] = &unk_1E875D500;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v5, block);

  }
}

uint64_t __32__BRCAppLibrary_fetchTrashItems__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateBits:", 0x10000000);
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v6;
  BRCListDirectoryContentsOperation **p_pristineFetchOp;
  id WeakRetained;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  p_pristineFetchOp = &self->_pristineFetchOp;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pristineFetchOp);

  if (WeakRetained == v10
    || (p_pristineFetchOp = &self->_trashFetchOp,
        v9 = objc_loadWeakRetained((id *)&self->_trashFetchOp),
        v9,
        v9 == v10))
  {
    objc_storeWeak((id *)p_pristineFetchOp, v6);
  }

}

- (int64_t)throttleHashWithItemID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[BRCAppLibrary appLibraryID](self, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = objc_msgSend(v4, "hash");

  return v7 ^ v6;
}

- (BOOL)hasUbiquitousDocuments
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items  WHERE item_type NOT IN (0, 9, 10, 4)    AND item_state IN (0, -1)    AND app_library_rowid = %@ LIMIT 1"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasLocalChanges
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT auto_document_with_local_changes_count > 0 FROM app_libraries WHERE rowid = %@"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)zoneHasShareAlias
{
  id v2;
  char v3;

  v2 = -[PQLConnection numberWithSQL:](self->_db, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM server_items WHERE zone_rowid = %@ AND item_type = 3 AND item_alias_target like '%%:\\_%%' ESCAPE '\\')"), self->_dbRowID);
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)addForegroundClient:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BRCAppLibrary *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  BRCAppLibrary *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary addForegroundClient:].cold.3();

  }
  v5 = self;
  objc_sync_enter(v5);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v5;
    v27 = 2112;
    v28 = v4;
    v29 = 2112;
    v30 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - adding foreground client %@%@", buf, 0x20u);
  }

  v8 = -[NSMutableSet count](v5->_foregroundClients, "count");
  if (-[NSMutableSet containsObject:](v5->_foregroundClients, "containsObject:", v4))
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary addForegroundClient:].cold.2();

  }
  -[NSMutableSet addObject:](v5->_foregroundClients, "addObject:", v4);
  if (!v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary addForegroundClient:].cold.1();

    -[BRCAppLibrary _resolveTargetSharedClientZonesWhenBecameForeground](v5, "_resolveTargetSharedClientZonesWhenBecameForeground");
    -[BRCAppLibrary defaultClientZone](v5, "defaultClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isCloudDocsZone")
      && (-[BRCAppLibrary mangledID](v5, "mangledID"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "shouldBoostDefaultZone"),
          v14,
          v13,
          (v15 & 1) == 0))
    {
      brc_bread_crumbs();
      v16 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Preventing boosting default server zone%@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v12, "addForegroundClient:", v5);
    }
    -[BRCAppLibrary transferSyncContext](v5, "transferSyncContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addForegroundClient:", v5);
    if (!-[NSMutableSet count](v5->_targetSharedServerZones, "count"))
    {
      -[BRCPQLConnection serialQueue](v5->_db, "serialQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __37__BRCAppLibrary_addForegroundClient___block_invoke;
      v24[3] = &unk_1E875D500;
      v24[4] = v5;
      dispatch_async_with_logs_3(v19, v24);

    }
  }
  objc_sync_exit(v5);

}

void __37__BRCAppLibrary_addForegroundClient___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v1 = (_QWORD *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "zoneHasShareAlias"))
  {
    *(_BYTE *)(*v1 + 129) = 1;
    objc_msgSend(*(id *)(*v1 + 104), "syncContextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sharedMetadataSyncContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addForegroundClient:", *v1);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(v1);

  }
}

- (void)removeForegroundClient:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  BRCAppLibrary *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary addForegroundClient:].cold.3();

  }
  v5 = self;
  objc_sync_enter(v5);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v5;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - removing foreground client %@%@", buf, 0x20u);
  }

  v8 = -[NSMutableSet count](v5->_foregroundClients, "count");
  if ((-[NSMutableSet containsObject:](v5->_foregroundClients, "containsObject:", v4) & 1) == 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary removeForegroundClient:].cold.2();

  }
  -[NSMutableSet removeObject:](v5->_foregroundClients, "removeObject:", v4);
  if (v8 && !-[NSMutableSet count](v5->_foregroundClients, "count"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary removeForegroundClient:].cold.1();

    -[BRCAppLibrary _removeAllTargetSharedServerZonesWhenNoLongerForeground](v5, "_removeAllTargetSharedServerZonesWhenNoLongerForeground");
    -[BRCAppLibrary defaultClientZone](v5, "defaultClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "removeForegroundClient:", v5);
    -[BRCAppLibrary transferSyncContext](v5, "transferSyncContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeForegroundClient:", v5);
    -[BRCAccountSession clientDB](v5->_session, "clientDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serialQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __40__BRCAppLibrary_removeForegroundClient___block_invoke;
    v20[3] = &unk_1E875D500;
    v20[4] = v5;
    dispatch_async_with_logs_3(v15, v20);

  }
  objc_sync_exit(v5);

}

void __40__BRCAppLibrary_removeForegroundClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 129))
  {
    objc_msgSend(*(id *)(v1 + 104), "syncContextProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedMetadataSyncContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeForegroundClient:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 129) = 0;

  }
}

- (BOOL)isForeground
{
  void *v2;
  char v3;

  -[BRCAppLibrary transferSyncContextIfExists](self, "transferSyncContextIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForeground");

  return v3;
}

- (BOOL)integrityCheckBoosting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BRCAppLibrary *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  BOOL v31;
  NSObject *v32;
  const char *v33;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  BRCAppLibrary *v42;
  __int16 v43;
  BRCAppLibrary *v44;
  __int16 v45;
  NSObject *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadataSyncContextIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCAppLibrary transferSyncContextIfExists](self, "transferSyncContextIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableSet count](self->_foregroundClients, "count");
  objc_msgSend(v7, "foregroundClients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", self);

  if (v8)
  {
    if ((v10 & 1) == 0)
    {
      brc_bread_crumbs();
      v15 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary integrityCheckBoosting].cold.4();
      goto LABEL_36;
    }
    objc_msgSend(v6, "foregroundClients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", self);

    if ((v12 & 1) == 0)
    {
      brc_bread_crumbs();
      v15 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary integrityCheckBoosting].cold.3();
      goto LABEL_36;
    }
    v36 = v6;
    -[BRCAppLibrary _targetSharedServerZonesEnumerator](self, "_targetSharedServerZonesEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSMutableSet mutableCopy](self->_targetSharedServerZones, "mutableCopy");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (!v16)
      goto LABEL_14;
    v17 = v16;
    v18 = *(_QWORD *)v38;
    v35 = v7;
LABEL_6:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v18)
        objc_enumerationMutation(v15);
      v20 = *(BRCAppLibrary **)(*((_QWORD *)&v37 + 1) + 8 * v19);
      if ((-[NSObject containsObject:](v14, "containsObject:", v20, v35) & 1) == 0)
        break;
      -[NSObject removeObject:](v14, "removeObject:", v20);
      -[BRCAppLibrary transferSyncContextIfExists](v20, "transferSyncContextIfExists");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "foregroundClients");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", self);

      if ((v23 & 1) == 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          goto LABEL_40;
        goto LABEL_34;
      }
      -[BRCAppLibrary metadataSyncContextIfExists](v20, "metadataSyncContextIfExists");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "foregroundClients");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "containsObject:", self);

      if ((v26 & 1) == 0)
      {
        brc_bread_crumbs();
        v28 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          goto LABEL_34;
LABEL_40:
        *(_DWORD *)buf = 138412802;
        v42 = v20;
        v43 = 2112;
        v44 = self;
        v45 = 2112;
        v46 = v28;
        v33 = "[CRIT] UNREACHABLE: target shared zone %@ of %@ should be boosted%@";
LABEL_41:
        _os_log_fault_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_FAULT, v33, buf, 0x20u);
        goto LABEL_34;
      }
      if (v17 == ++v19)
      {
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        v7 = v35;
        if (v17)
          goto LABEL_6;
LABEL_14:

        if (-[NSObject count](v14, "count"))
        {
          brc_bread_crumbs();
          v27 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            v42 = self;
            v43 = 2112;
            v44 = (BRCAppLibrary *)v14;
            v45 = 2112;
            v46 = v27;
            _os_log_fault_impl(&dword_1CBD43000, v28, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has too many target shared server zones %@%@", buf, 0x20u);
          }
          v6 = v36;
LABEL_35:

LABEL_36:
          v31 = 0;
        }
        else
        {
          v31 = 1;
          v6 = v36;
        }

        goto LABEL_38;
      }
    }
    brc_bread_crumbs();
    v28 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v42 = self;
      v43 = 2112;
      v44 = v20;
      v45 = 2112;
      v46 = v28;
      v33 = "[CRIT] UNREACHABLE: %@ has foreground clients but target shared zone %@ isn't targeted%@";
      goto LABEL_41;
    }
LABEL_34:
    v7 = v35;
    v6 = v36;

    v27 = v15;
    goto LABEL_35;
  }
  if (v10)
  {
    brc_bread_crumbs();
    v15 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary integrityCheckBoosting].cold.1();
    goto LABEL_36;
  }
  objc_msgSend(v6, "foregroundClients");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "containsObject:", self);

  if (v30)
  {
    brc_bread_crumbs();
    v15 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary integrityCheckBoosting].cold.2();
    goto LABEL_36;
  }
  v31 = 1;
LABEL_38:

  return v31;
}

- (BOOL)shouldEvictUploadedItems
{
  return BYTE2(self->_state) >> 7;
}

- (void)recomputeShouldEvictState
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "evicting uploaded items";
  if ((a1 & 1) == 0)
    v1 = "not evicting uploaded items";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v2, v3, "[DEBUG] evict status remains: %s%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

- (BRCSyncContext)transferSyncContextIfExists
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAccountSession syncContextProvider](self->_session, "syncContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferSyncContextForMangledID:createIfNeeded:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCSyncContext *)v5;
}

- (BRCSyncContext)transferSyncContext
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAccountSession syncContextProvider](self->_session, "syncContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferSyncContextForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCSyncContext *)v5;
}

- (void)didReceiveHandoffRequest
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataSyncContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[BRCAppLibrary transferSyncContext](self, "transferSyncContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
    objc_msgSend(v6, "didReceiveHandoffRequest");
  objc_msgSend(v5, "didReceiveHandoffRequest");

}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[BRCAppLibrary mangledID](self, "mangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mangledIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_targetSharedServerZonesEnumerator
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT DISTINCT ci.zone_rowid FROM client_items AS ci INNER JOIN client_zones AS cz ON ci.zone_rowid = cz.rowid WHERE ci.app_library_rowid = %@   AND ci.item_state IN (0, -1)   AND (ci.item_sharing_options & 4) != 0   AND cz.zone_owner != %@"), self->_dbRowID, *MEMORY[0x1E0C94730]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke;
  v6[3] = &unk_1E875E2C8;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjects:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__BRCAppLibrary__targetSharedServerZonesEnumerator__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "numberAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "serverZoneByRowID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asSharedZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isStillTargetingSharedServerZone:(id)a3
{
  id v4;
  BRCPQLConnection *db;
  BRCALRowID *dbRowID;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  BRCAppLibrary *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  db = self->_db;
  dbRowID = self->_dbRowID;
  objc_msgSend(v4, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PQLConnection numberWithSQL:](db, "numberWithSQL:", CFSTR("SELECT rowid FROM client_items WHERE app_library_rowid = %@ AND zone_rowid = %@ AND (item_sharing_options & 4) != 0 AND item_state IN (0, -1) LIMIT 1"), dbRowID, v7);

  v9 = objc_msgSend(v8, "unsignedLongLongValue");
  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      v14 = v9;
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Item with rowid %llu is still targeting %@ for %@%@", buf, 0x2Au);
    }

  }
  return v9 != 0;
}

- (void)_resolveTargetSharedClientZonesWhenBecameForeground
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] resolving target shared zones for app library %@%@");
  OUTLINED_FUNCTION_2();
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  objc_msgSend(v4, "_targetSharedServerZonesEnumerator");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v2;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1D17A6BE8](v11);
        objc_msgSend(*v3, "_addTargetSharedServerZone:", v15, (_QWORD)v19);
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      v12 = v11;
    }
    while (v11);
  }

  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1((uint64_t)v3, (uint64_t)v17, v18);

}

- (void)_removeAllTargetSharedServerZonesWhenNoLongerForeground
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _foregroundClients.count == 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t __72__BRCAppLibrary__removeAllTargetSharedServerZonesWhenNoLongerForeground__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "removeForegroundClient:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeAllObjects");
}

- (void)_addTargetSharedServerZoneForSharedItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke;
  v7[3] = &unk_1E875D470;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_with_logs_3(v5, v7);

}

void __57__BRCAppLibrary__addTargetSharedServerZoneForSharedItem___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serverZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asSharedZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_addTargetSharedServerZone:", v2);

}

- (void)_removeTargetSharedServerZoneIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BRCAppLibrary *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  BRCAppLibrary *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    v17 = 2112;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to remove target server zone %@ from %@%@", buf, 0x20u);
  }

  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke;
  v11[3] = &unk_1E875D448;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v9 = v5;
  v10 = v4;
  dispatch_async_with_logs_3(v8, v11);

}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "containsObject:") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isStillTargetingSharedServerZone:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      brc_bread_crumbs();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v4 = *(_QWORD *)(a1 + 48);
        v9 = 138412802;
        v10 = v4;
        v11 = 2112;
        v12 = v5;
        v13 = 2112;
        v14 = v2;
        v6 = "[DEBUG] not removing target shared zone %@ from %@, because it's still targeting it%@";
LABEL_13:
        _os_log_debug_impl(&dword_1CBD43000, v3, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "count"))
        objc_msgSend(*(id *)(a1 + 32), "removeForegroundClient:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "removeObject:", *(_QWORD *)(a1 + 32));
      brc_bread_crumbs();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(a1 + 48);
        v9 = 138412802;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        v13 = 2112;
        v14 = v2;
        v6 = "[DEBUG] %@ is not a target shared zone of %@ anymore%@";
        goto LABEL_13;
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1(a1, (uint64_t)v2, v3);
  }

}

- (void)_addTargetSharedServerZone:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  BRCAppLibrary *v12;
  __int16 v13;
  BRCAppLibrary *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clientZone");
  v5 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] attempting to add target shared server zone %@ to %@%@", (uint8_t *)&v11, 0x20u);
  }

  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v4)
  {
    if (-[NSMutableSet count](self->_foregroundClients, "count"))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412802;
        v12 = self;
        v13 = 2112;
        v14 = v5;
        v15 = 2112;
        v16 = v9;
        _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Added %@ as foreground client to %@%@", (uint8_t *)&v11, 0x20u);
      }

      objc_msgSend(v4, "addForegroundClient:", self);
    }
    -[NSMutableSet addObject:](self->_targetSharedServerZones, "addObject:", v4);
  }

}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  return -[BRCAccountSession itemIDByRowID:db:](self->_session, "itemIDByRowID:db:", a3, a4);
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return -[BRCAccountSession itemIDByRowID:db:](self->_session, "itemIDByRowID:db:", a3, self->_db);
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  return -[BRCAccountSession itemByRowID:db:](self->_session, "itemByRowID:db:", a3, a4);
}

- (id)itemByRowID:(unint64_t)a3
{
  return -[BRCAccountSession itemByRowID:](self->_session, "itemByRowID:", a3);
}

- (id)containerMetadataFilledWithTCCInfo
{
  void *v2;
  void *v3;

  -[BRCAppLibrary containerMetadata](self, "containerMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCDaemonContainerHelper sharedHelper](BRCDaemonContainerHelper, "sharedHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsCloudSyncTCCDisabled:", objc_msgSend(v3, "cloudSyncTCCDisabledForContainerMeta:", v2));

  return v2;
}

- (BOOL)wasMovedToCloudDocs
{
  return (-[BRCAppLibrary state](self, "state") >> 21) & 1;
}

- (BOOL)shouldSaveContainerMetadataServerside
{
  return !-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary");
}

- (id)documentsFolderItemID
{
  _BOOL4 v3;
  BRCItemID *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = -[BRCAppLibrary includesDataScope](self, "includesDataScope");
  v4 = [BRCItemID alloc];
  -[BRCAppLibrary dbRowID](self, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = -[BRCItemID initAsDocumentsWithAppLibraryRowID:](v4, "initAsDocumentsWithAppLibraryRowID:", v5);
  else
    v6 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:](v4, "_initAsLibraryRootWithAppLibraryRowID:", v5);
  v7 = (void *)v6;

  return v7;
}

- (id)fetchRootItemInDB:(id)a3
{
  void *v4;
  id v5;
  BRCZoneRootItem *v6;
  void *v7;
  NSObject *v8;

  -[BRCAppLibrary dbRowID](self, "dbRowID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:]([BRCItemID alloc], "_initAsLibraryRootWithAppLibraryRowID:", v4);
    v6 = -[BRCZoneRootItem initWithZoneRootItemID:session:]([BRCZoneRootItem alloc], "initWithZoneRootItemID:session:", v5, self->_session);

  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary fetchRootItemInDB:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (id)fetchRootItem
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCAppLibrary db](self, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  -[BRCAppLibrary db](self, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary fetchRootItemInDB:](self, "fetchRootItemInDB:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchDocumentsDirectoryItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary documentsFolderItemID](self, "documentsFolderItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemByItemID:db:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "asDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchDocumentsDirectoryItem
{
  void *v3;
  void *v4;

  -[BRCAppLibrary db](self, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary fetchDocumentsDirectoryItem:](self, "fetchDocumentsDirectoryItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)rootItemID
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;

  -[BRCAppLibrary dbRowID](self, "dbRowID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[BRCItemID _initAsLibraryRootWithAppLibraryRowID:]([BRCItemID alloc], "_initAsLibraryRootWithAppLibraryRowID:", v2);
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary fetchRootItemInDB:].cold.1();

    v3 = 0;
  }

  return v3;
}

- (id)rootItemGlobalID
{
  BRCItemGlobalID *v3;
  void *v4;
  void *v5;
  void *v6;
  BRCItemGlobalID *v7;

  v3 = [BRCItemGlobalID alloc];
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary rootItemID](self, "rootItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v3, "initWithZoneRowID:itemID:", v5, v6);

  return v7;
}

- (void)zoneDidChangeMovedToCloudDocsState
{
  -[BRCAppLibrary _updateIsInCloudDocsZone](self, "_updateIsInCloudDocsZone");
  objc_msgSend(MEMORY[0x1E0D10E48], "postContainerListUpdateNotification");
}

- (void)_updateIsInCloudDocsZone
{
  id v3;

  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BRContainer setIsInCloudDocsZone:](self->_containerMetadata, "setIsInCloudDocsZone:", objc_msgSend(v3, "isCloudDocsZone"));

}

- (void)setContainerMetadataEtag:(id)a3
{
  objc_storeStrong((id *)&self->_containerMetadataEtag, a3);
  -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
}

- (void)setContainerMetadataNeedsSyncUp:(BOOL)a3
{
  self->_containerMetadataNeedsSyncUp = a3;
  -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
}

- (void)scheduleContainerMetadataSyncUp
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] container-metadata needs sync up for %@%@");
  OUTLINED_FUNCTION_2();
}

- (NSString)pathRelativeToRoot
{
  return (NSString *)-[BRMangledID mangledIDString](self->_mangledID, "mangledIDString");
}

- (void)setChildBasehashSalt:(id)a3
{
  NSData *v5;
  NSData *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (NSData *)a3;
  v6 = v5;
  if (self->_childBasehashSalt != v5 && !-[NSData isEqualToData:](v5, "isEqualToData:"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[NSData brc_truncatedSHA256](v6, "brc_truncatedSHA256");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "brc_hexadecimalString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSData brc_truncatedSHA256](self->_childBasehashSalt, "brc_truncatedSHA256");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "brc_hexadecimalString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAppLibrary mangledID](self, "mangledID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v9;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v7;
      _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning new child basehash salt %@ from %@ for %@%@", buf, 0x2Au);

    }
    if (self->_childBasehashSalt)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCAppLibrary setChildBasehashSalt:].cold.1();

    }
    objc_storeStrong((id *)&self->_childBasehashSalt, a3);
    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
  }

}

- (void)setSaltingState:(unsigned int)a3
{
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t saltingState;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_saltingState != a3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      if (a3 > 3)
        v7 = CFSTR("no server item");
      else
        v7 = off_1E8760858[a3];
      saltingState = (int)self->_saltingState;
      if (saltingState > 3)
        v9 = CFSTR("no server item");
      else
        v9 = off_1E8760858[saltingState];
      -[BRCAppLibrary mangledID](self, "mangledID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning salt state %@ from %@ for %@%@", (uint8_t *)&v11, 0x2Au);

    }
    self->_saltingState = a3;
    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
  }
}

- (brc_task_tracker)tracker
{
  return self->_tracker;
}

- (BRCAppLibraryDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (unsigned)state
{
  return self->_state;
}

- (BRCALRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
  objc_storeStrong((id *)&self->_dbRowID, a3);
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (void)setZoneRowID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneRowID, a3);
}

- (NSString)appLibraryID
{
  return self->_appLibraryID;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (NSNumber)deepScanStamp
{
  return self->_deepScanStamp;
}

- (void)setDeepScanStamp:(id)a3
{
  objc_storeStrong((id *)&self->_deepScanStamp, a3);
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_storeStrong((id *)&self->_fileID, a3);
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
  objc_storeStrong((id *)&self->_generationID, a3);
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BRCPrivateClientZone)defaultClientZone
{
  return (BRCPrivateClientZone *)objc_loadWeakRetained((id *)&self->_defaultClientZone);
}

- (void)setDefaultClientZone:(id)a3
{
  objc_storeWeak((id *)&self->_defaultClientZone, a3);
}

- (BRContainer)containerMetadata
{
  return self->_containerMetadata;
}

- (NSString)containerMetadataEtag
{
  return self->_containerMetadataEtag;
}

- (BOOL)containerMetadataNeedsSyncUp
{
  return self->_containerMetadataNeedsSyncUp;
}

- (unint64_t)containerMetadataSyncRequestID
{
  return self->_containerMetadataSyncRequestID;
}

- (void)setContainerMetadataSyncRequestID:(unint64_t)a3
{
  self->_containerMetadataSyncRequestID = a3;
}

- (NSNumber)rootQuotaUsage
{
  return self->_rootQuotaUsage;
}

- (void)setRootQuotaUsage:(id)a3
{
  objc_storeStrong((id *)&self->_rootQuotaUsage, a3);
}

- (NSData)childBasehashSalt
{
  return self->_childBasehashSalt;
}

- (unsigned)saltingState
{
  return self->_saltingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childBasehashSalt, 0);
  objc_storeStrong((id *)&self->_rootQuotaUsage, 0);
  objc_storeStrong((id *)&self->_containerMetadataEtag, 0);
  objc_storeStrong((id *)&self->_containerMetadata, 0);
  objc_storeStrong((id *)&self->_appLibraryID, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_destroyWeak((id *)&self->_trashFetchOp);
  objc_destroyWeak((id *)&self->_pristineFetchOp);
  objc_storeStrong((id *)&self->_foregroundClients, 0);
  objc_storeStrong((id *)&self->_targetSharedServerZones, 0);
  objc_destroyWeak((id *)&self->_defaultClientZone);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_XPCClientsUsingUbiquity, 0);
  objc_storeStrong((id *)&self->_pendingFileCoordinators, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deepScanReason, 0);
  objc_storeStrong((id *)&self->_deepScanStamp, 0);
}

- (void)_updateContainerMetadataFromRecord:(id)a3 stripIcons:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BRCAppLibrary session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "brc_containerMetadataPropertiesData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      if (!-[BRCAppLibrary shouldSaveContainerMetadataServerside](self, "shouldSaveContainerMetadataServerside"))
      {
LABEL_16:
        objc_initWeak((id *)buf, self);
        v21[0] = v11;
        v21[1] = 3221225472;
        v21[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1;
        v21[3] = &unk_1E87611E0;
        objc_copyWeak(&v23, (id *)buf);
        v22 = v6;
        dispatch_async(v9, v21);

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
        goto LABEL_17;
      }
      if (a4)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(v6, "brc_containerMetadataIconPaths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[BRCAppLibrary containerMetadata](self, "containerMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isDocumentScopePublic");

      -[BRCAppLibrary containerMetadata](self, "containerMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateMetadataWithRecordData:iconPaths:", v10, v12);

      -[BRCAppLibrary containerMetadata](self, "containerMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isDocumentScopePublic");

      if (v17 != v20)
      {
        objc_initWeak((id *)buf, self);
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke;
        block[3] = &unk_1E875DC98;
        objc_copyWeak(&v25, (id *)buf);
        dispatch_async(v9, block);
        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v6;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] no data in record %@%@", buf, 0x16u);
      }

    }
    goto LABEL_16;
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[BRCAppLibrary session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v14;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Serial queue for session %@ is nil%@", buf, 0x16u);

  }
LABEL_17:

}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didUpdateDocumentScopePublic");

}

void __102__BRCAppLibrary_BRCContainerMetadataSyncDownAdditions___updateContainerMetadataFromRecord_stripIcons___block_invoke_1(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "recordChangeTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setContainerMetadataEtag:", v2);

}

- (int64_t)maxLostStamp
{
  return self->_maxLostStamp;
}

- (void)setMaxLostStamp:(int64_t)a3
{
  self->_maxLostStamp = a3;
}

- (unint64_t)allocateLostStampAddingBackoff:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  int64_t maxLostStamp;
  unint64_t v7;

  v3 = a3;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
  if (!v3)
  {
    maxLostStamp = self->_maxLostStamp;
    goto LABEL_5;
  }
  v5 = brc_current_date_nsec();
  maxLostStamp = self->_maxLostStamp;
  if (v5 <= maxLostStamp)
  {
LABEL_5:
    v7 = maxLostStamp + 1;
    goto LABEL_6;
  }
  v7 = v5;
LABEL_6:
  self->_maxLostStamp = v7;
  -[BRCAppLibrary setStateBits:](self, "setStateBits:", 4);
  return v7;
}

- (BOOL)markChildrenLostForItemID:(id)a3 inZone:(id)a4 fileID:(id)a5 startingFromRow:(unint64_t)a6 hasMoreWork:(BOOL *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  char v19;
  uint64_t v20;
  char v21;
  BRCPQLConnection *db;
  void *v23;
  id v24;
  int v25;
  uint64_t v26;
  void *v27;
  BRCPQLConnection *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  BOOL *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD *v52;
  uint64_t *v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL *v59;
  _QWORD v60[10];
  int v61;
  char v62;
  char v63;
  BOOL v64;
  _QWORD v65[3];
  int v66;
  _QWORD v67[3];
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  int v72;
  _QWORD v73[5];

  v11 = a3;
  v12 = a4;
  v46 = a5;
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  objc_msgSend(v12, "dbRowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary(LegacyAdditions) markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:].cold.2();

  }
  -[BRCAppLibrary mangledID](self, "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = brc_current_date_nsec();
  objc_msgSend(v15, "readerLostItemBackoff");
  v43 = brc_interval_to_nsec();
  objc_msgSend(v15, "markChildLostBackoff");
  v42 = brc_interval_to_nsec();
  -[BRCAccountSession volume](self->_session, "volume");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "deviceID");

  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v73[3] = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 0;
  v68 = objc_msgSend(v46, "unsignedLongValue");
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = -1;
  v41 = objc_msgSend(v15, "readerMarkChildrenLostBatchSize");
  v18 = -[BRCAppLibrary hasActiveRecursiveQueries](self, "hasActiveRecursiveQueries");
  v40 = a7;
  if (objc_msgSend(v11, "isNonDesktopRoot"))
  {
    v19 = -[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary");
    v20 = 0;
    if (-[BRCAppLibrary isCloudDocsAppLibrary](self, "isCloudDocsAppLibrary"))
      v21 = 2;
    else
      v21 = 1;
  }
  else
  {
    db = self->_db;
    objc_msgSend(v12, "dbRowID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT item_sharing_options, item_user_visible, item_scope FROM client_items WHERE item_id = %@ AND zone_rowid = %@"), v11, v23);

    if (objc_msgSend(v24, "next"))
    {
      v25 = objc_msgSend(v24, "intAtIndex:", 0);
      v19 = objc_msgSend(v24, "BOOLAtIndex:", 1);
      v20 = (int)(v25 & 0xFFFFFFFB);
      if ((objc_msgSend(v11, "isDocumentsFolder") & 1) != 0)
        v21 = 2;
      else
        v21 = objc_msgSend(v24, "intAtIndex:", 2);
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v19 = 0;
    }

  }
  v26 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke;
  v60[3] = &unk_1E8764048;
  v62 = v19;
  v63 = v21;
  v60[6] = &v69;
  v60[7] = v67;
  v64 = v18;
  v60[4] = self;
  v60[5] = v73;
  v60[8] = v65;
  v60[9] = v20;
  v61 = v17;
  v27 = (void *)MEMORY[0x1D17A6DB0](v60);
  if (objc_msgSend(v11, "isNonDesktopRoot") && objc_msgSend(v12, "isSharedZone"))
  {
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary(LegacyAdditions) markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:].cold.1();

  }
  v28 = self->_db;
  v47[0] = v26;
  v47[1] = 3221225472;
  v47[2] = __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3;
  v47[3] = &unk_1E8764070;
  v29 = v27;
  v55 = v42 + v44 - v43;
  v51 = v29;
  v47[4] = self;
  v30 = v12;
  v48 = v30;
  v31 = v11;
  v49 = v31;
  v52 = v65;
  v57 = v41;
  v58 = v55;
  v56 = a6;
  v53 = &v69;
  v32 = v46;
  v50 = v32;
  v54 = v73;
  v59 = v40;
  -[BRCPQLConnection groupInBatch:](v28, "groupInBatch:", v47);
  LOBYTE(v28) = *((_DWORD *)v70 + 6) != 0;

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(v73, 8);

  return (char)v28;
}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  unsigned __int8 v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  const void *v10;
  unsigned int v11;
  int v12;
  const unsigned __int8 *v13;
  int v14;
  int v15;
  unsigned __int8 v16;
  int v17;
  uint64_t v18;
  int HaveChangedByFileName;
  uint64_t v20;
  sqlite3_int64 v21;
  id v22;

  v7 = sqlite3_value_int(*a4);
  v8 = sqlite3_value_int64(a4[2]);
  v9 = sqlite3_value_int64(a4[3]);
  v21 = sqlite3_value_int64(a4[4]);
  v10 = sqlite3_value_blob(a4[5]);
  v11 = sqlite3_value_int(a4[6]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_value_int64(a4[7]);
  v12 = sqlite3_value_type(a4[8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_value_int64(a4[9]));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v13 = sqlite3_value_text(a4[1]);
  v14 = sqlite3_value_int(a4[10]);
  if ((v14 & 4) == 0 && *(_QWORD *)(a1 + 72) != v14)
    goto LABEL_7;
  v20 = v9;
  v15 = sqlite3_value_int(a4[11]) != 0;
  v16 = sqlite3_value_int(a4[12]);
  if (*(unsigned __int8 *)(a1 + 84) != v15
    || *(unsigned __int8 *)(a1 + 85) != v16
    || v7 <= 0xAu && ((1 << v7) & 0x611) != 0)
  {
    goto LABEL_7;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    || v10
    || v12 != 5
    || *(_BYTE *)(a1 + 86)
    || (objc_msgSend(v22, "br_isEqualToNumber:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88)) & 1) == 0)
  {
    goto LABEL_7;
  }
  v18 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if ((_DWORD)v18 == -1)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = BRCOpenByID(*(_DWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 24), 0);
    v18 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if ((v18 & 0x80000000) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_7:
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v17 = -1;
      goto LABEL_8;
    }
  }
  HaveChangedByFileName = BRCFileMightHaveChangedByFileName(v18, (const char *)v13, v8, v20, v21, (__rbit32(v11) >> 24) & 0xC0 | 0x8000, (char)v7);
  if (HaveChangedByFileName)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v17 = HaveChangedByFileName << 31 >> 31;
LABEL_8:
  sqlite3_result_int(a2, v17);

}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  int v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17A6DB0](*(_QWORD *)(a1 + 64));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(*(id *)(a1 + 40), "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "execute:", CFSTR("UPDATE client_items  SET item_state = call_block(%p,   item_type, IFNULL(item_localname, item_filename), item_file_id,   item_generation, version_mtime, item_xattr_signature,   item_mode, rowid, item_min_supported_os_rowid,   app_library_rowid, item_sharing_options, item_user_visible, item_scope),   item_processing_stamp = inc_and_fetch64(%p), app_library_rowid = %@ WHERE item_parent_zone_rowid = %@ AND item_parent_id = %@ AND rowid > %lu AND item_state = 0 AND item_type != 4 ORDER BY rowid LIMIT %lu"), v4, a1 + 96, v5, v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));

  if ((v7 & 1) == 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2();

    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_1();

  }
  v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if ((v12 & 0x80000000) == 0)
  {
    close(v12);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -1;
  }
  v13 = *(_QWORD *)(a1 + 112);
  v14 = *(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 120);
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v30 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v31 = *(_QWORD *)(a1 + 48);
    v32 = CFSTR("not ");
    v33 = *(_QWORD *)(a1 + 32);
    if (v14 == v13)
      v32 = &stru_1E8769030;
    *(_DWORD *)buf = 67110146;
    v35 = v30;
    v36 = 2112;
    v37 = v31;
    v38 = 2112;
    v39 = v33;
    v40 = 2112;
    v41 = v32;
    v42 = 2112;
    v43 = v15;
    _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] marked lost %u children of %@ in %@,  continuation is %@needed%@", buf, 0x30u);
  }

  if (v14 == v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "dbRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v3, "execute:", CFSTR("INSERT OR REPLACE INTO mark_children_lost_progress(zone_rowid, item_parent_id, item_parent_file_id, last_updated_row_id, app_library_rowid) VALUES(%@, %@, %@, %lu, %@)"), v17, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

    if ((v18 & 1) == 0)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2();

      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 40), "dbRowID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM mark_children_lost_progress WHERE zone_rowid = %@ AND item_parent_id = %@ AND last_updated_row_id = %lu"), v23, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 104));

    if ((v24 & 1) == 0)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2();

      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_22;
LABEL_21:
      __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_1();
LABEL_22:

    }
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setStateBits:", 4);
    v27 = *(_QWORD *)(a1 + 96);
    v28 = *(_QWORD *)(a1 + 32);
    if (v27 > *(_QWORD *)(v28 + 32))
    {
      *(_QWORD *)(v28 + 32) = v27;
      objc_msgSend(*(id *)(a1 + 32), "setNeedsSave:", 1);
    }
  }
  v29 = *(_BYTE **)(a1 + 128);
  if (v29)
    *v29 |= v14 == v13;

}

- (void)continueMarkingChildrenLostInZone:(id)a3
{
  id v4;
  BRCPQLConnection *db;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  char v16;

  v4 = a3;
  v16 = 0;
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  if ((-[BRCPQLConnection isBatchSuspended](self->_db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  if (!-[BRCAccountSession isCancelled](self->_session, "isCancelled"))
  {
    db = self->_db;
    objc_msgSend(v4, "dbRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT item_parent_id, item_parent_file_id, last_updated_row_id FROM mark_children_lost_progress WHERE zone_rowid = %@ LIMIT 2"), v6);

    if (objc_msgSend(v7, "next"))
    {
      objc_msgSend(v7, "objectOfClass:atIndex:", objc_opt_class(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "integerAtIndex:", 2);
      if (objc_msgSend(v7, "next"))
      {
        v16 = 1;
        objc_msgSend(v7, "close");
      }
      -[BRCAppLibrary markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:](self, "markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:", v8, v4, v9, v10, &v16);
      if (v16)
      {
        -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke;
        v14[3] = &unk_1E875D470;
        v14[4] = self;
        v15 = v4;
        brc_dispatch_async_autorelease_with_logs(v11, v14);

      }
    }

  }
}

void __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 112);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke_2;
  v4[3] = &unk_1E8760018;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "groupInBatch:", v4);

}

uint64_t __68__BRCAppLibrary_LegacyAdditions__continueMarkingChildrenLostInZone___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueMarkingChildrenLostInZone:", *(_QWORD *)(a1 + 40));
}

- (BOOL)markChildrenLostForItemID:(id)a3 inZone:(id)a4 fileID:(id)a5
{
  id v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  unsigned __int8 v16;

  v8 = a4;
  v16 = 0;
  v9 = -[BRCAppLibrary markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:](self, "markChildrenLostForItemID:inZone:fileID:startingFromRow:hasMoreWork:", a3, v8, a5, 0, &v16);
  v10 = v16;
  if (v16)
  {
    -[BRCPQLConnection serialQueue](self->_db, "serialQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke;
    v14[3] = &unk_1E875D470;
    v14[4] = self;
    v15 = v8;
    brc_dispatch_async_autorelease_with_logs(v11, v14);

    v10 = v16;
  }
  v12 = (v10 | v9) != 0;

  return v12;
}

void __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 112);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke_2;
  v4[3] = &unk_1E8760018;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "groupInBatch:", v4);

}

uint64_t __74__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueMarkingChildrenLostInZone:", *(_QWORD *)(a1 + 40));
}

- (void)scheduleDeepScanWithReason:(id)a3
{
  BRCAppLibrary *v4;
  void *v5;
  __int16 v6;
  NSNumber *v7;
  NSNumber *deepScanStamp;
  void *v9;
  NSObject *v10;
  NSString *deepScanReason;
  NSString *v12;
  NSString *v13;
  void *v14;
  NSObject *v15;
  BRCAppLibrary *v16;
  NSObject *v17;
  int v18;
  BRCAppLibrary *v19;
  __int16 v20;
  BRCAppLibrary *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (BRCAppLibrary *)a3;
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if ((v6 & 0x100) != 0)
  {
    brc_bread_crumbs();
    v16 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Not scheduling deep scan on an app library in a resetting zone%@", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", brc_current_date_nsec());
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    deepScanStamp = self->_deepScanStamp;
    self->_deepScanStamp = v7;

    if (self->_deepScanReason)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        deepScanReason = self->_deepScanReason;
        v18 = 138543874;
        v19 = (BRCAppLibrary *)deepScanReason;
        v20 = 2114;
        v21 = v4;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Replacing deep scan reason %{public}@ with %{public}@%@", (uint8_t *)&v18, 0x20u);
      }

    }
    v12 = (NSString *)-[BRCAppLibrary copy](v4, "copy");
    v13 = self->_deepScanReason;
    self->_deepScanReason = v12;

    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      v18 = 138543874;
      v19 = v4;
      v20 = 2112;
      v21 = self;
      v22 = 2112;
      v23 = v14;
      _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] Container needs deep-scan because %{public}@ - %@%@", (uint8_t *)&v18, 0x20u);
    }

    -[BRCAppLibrary setStateBits:](self, "setStateBits:", 4);
    -[BRCAppLibrary clearStateBits:](self, "clearStateBits:", 0x80000);
  }

}

- (void)computeDocumentEvictableSizeUsageWithDB:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  +[BRCDiskSpaceReclaimer accessTimeDeltaForUrgency:](BRCDiskSpaceReclaimer, "accessTimeDeltaForUrgency:", 3);
  v9 = v8;
  v10 = v8 + 1.0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__BRCAppLibrary_LegacyAdditions__computeDocumentEvictableSizeUsageWithDB_reply___block_invoke;
  v12[3] = &unk_1E8764098;
  v13 = v6;
  v11 = v6;
  -[BRCAppLibrary computeDocumentEvictableSizeUsageWithLowTimeDelta:medTimeDelta:highTimeDelta:db:reply:](self, "computeDocumentEvictableSizeUsageWithLowTimeDelta:medTimeDelta:highTimeDelta:db:reply:", v7, v12, v10, v10, v9);

}

uint64_t __80__BRCAppLibrary_LegacyAdditions__computeDocumentEvictableSizeUsageWithDB_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)computeDocumentEvictableSizeUsageWithLowTimeDelta:(double)a3 medTimeDelta:(double)a4 highTimeDelta:(double)a5 db:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  unint64_t v17;
  void *v18;
  double v19;
  unint64_t v20;
  void *v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BRCAccountSession *session;
  void *v27;
  id v28;

  v12 = a7;
  v13 = a6;
  -[BRCAppLibrary mangledID](self, "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v14);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  v17 = (unint64_t)v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  v20 = (unint64_t)v19;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSince1970");
  v23 = (unint64_t)v22;

  v24 = objc_msgSend(v28, "minAutomaticallyEvictableFilesize");
  v25 = objc_msgSend(v28, "computeEvictableBatchSize");
  session = self->_session;
  objc_msgSend(MEMORY[0x1E0DE81D0], "formatInjection:", CFSTR("AND app_library_rowid = %@"), self->_dbRowID);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession computeDocumentEvictableSizesForLowTime:medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:](session, "computeDocumentEvictableSizesForLowTime:medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:", v17, v20, v23, 0, 0, 0, 0, v24, v25, v27, v13, v12);

}

- (void)recreateDocumentsFolderIfNeededOnDisk
{
  BRCAccountSession *session;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v9 = 0;
  session = self->_session;
  -[BRCAppLibrary mangledID](self, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(session) = -[BRCAccountSession createAppLibraryOnDisk:createdRoot:createdDocuments:rootFileID:](session, "createAppLibraryOnDisk:createdRoot:createdDocuments:rootFileID:", v4, 0, &v9, 0);

  if ((_DWORD)session)
  {
    -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAppLibrary documentsFolderItemID](self, "documentsFolderItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemByItemID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 || !v7)
    {
      -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scanContainerDocumentsIfNeeded:", self);

    }
  }
}

- (void)cancelFileCoordinators
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[BRCPQLConnection assertOnQueue](self->_db, "assertOnQueue");
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCAppLibrary(LegacyAdditions) cancelFileCoordinators].cold.1();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_pendingFileCoordinators, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "cancel");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary removeAllObjects](self->_pendingFileCoordinators, "removeAllObjects");
  -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rescheduleSuspendedJobsMatching:inState:", v12, 26);

}

- (void)cancelWriteCoordinatorForItem:(id)a3
{
  NSMutableDictionary *pendingFileCoordinators;
  void *v4;
  id v5;

  pendingFileCoordinators = self->_pendingFileCoordinators;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "dbRowID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pendingFileCoordinators, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "forRead") & 1) == 0)
    objc_msgSend(v5, "cancel");

}

- (id)coordinatorForItem:(id)a3 forRead:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BRCAccountSession *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  char v14;
  BRCFileCoordinator *v15;
  BRCAccountSession *session;
  id v17;
  BRCFileCoordinator *v18;
  void *v19;
  NSObject *v20;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  BRCAppLibrary *v28;
  BRCAccountSession *v29;
  BOOL v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "dbRowID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_session;
  -[NSMutableDictionary objectForKey:](self->_pendingFileCoordinators, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary(LegacyAdditions) coordinatorForItem:forRead:].cold.1();

    goto LABEL_12;
  }
  if (v4)
  {
    -[BRCAccountSession(LegacyAdditions) fsReader](v8, "fsReader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "startReadCoordinationInAppLibrary:", self);
  }
  else
  {
    -[BRCAccountSession applyScheduler](v8, "applyScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "startWriteCoordinationInAppLibrary:", self);
  }
  v14 = v13;

  if ((v14 & 1) == 0)
  {
    -[BRCAppLibrary freeFileCoordinationSlotsAfterDelayForRead:](self, "freeFileCoordinationSlotsAfterDelayForRead:", v4);
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  v15 = [BRCFileCoordinator alloc];
  session = self->_session;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke;
  v26 = &unk_1E87640C0;
  v30 = v4;
  v17 = v7;
  v27 = v17;
  v28 = self;
  v29 = v8;
  v18 = -[BRCFileCoordinator initWithSession:forRead:doneHandler:](v15, "initWithSession:forRead:doneHandler:", session, v4, &v23);
  -[NSMutableDictionary setObject:forKey:](self->_pendingFileCoordinators, "setObject:forKey:", v18, v17, v23, v24, v25, v26);
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = "write";
    *(_DWORD *)buf = 136315650;
    if (v4)
      v22 = "read";
    v32 = v22;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = v19;
    _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Allocated pending coordinated %s I/O for %@%@", buf, 0x20u);
  }

LABEL_13:
  return v18;
}

uint64_t __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke_cold_1();

  v4 = *(void **)(a1 + 48);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v4, "fsReader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endReadCoordinationInAppLibrary:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "applyScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endWriteCoordinationInAppLibrary:rowID:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void)freeFileCoordinationSlotsAfterDelayForRead:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[BRCAppLibrary mangledID](self, "mangledID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v6, "readerIOsCancelDelay");
  else
    objc_msgSend(v6, "writerIOsCancelDelay");
  v8 = v7;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_pendingFileCoordinators, "objectEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "forRead") == v3)
          objc_msgSend(v14, "cancelAfterDelay:", v8);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (BOOL)isCoordinationPendingForItem:(id)a3
{
  NSMutableDictionary *pendingFileCoordinators;
  void *v4;
  void *v5;

  pendingFileCoordinators = self->_pendingFileCoordinators;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "dbRowID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingFileCoordinators, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(pendingFileCoordinators) = v5 != 0;

  return (char)pendingFileCoordinators;
}

- (void)setRootFileID:(unint64_t)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSNumber *fileID;
  void *v8;
  int v9;
  NSNumber *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSNumber br_isEqualToNumber:](self->_fileID, "br_isEqualToNumber:", v4) & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      fileID = self->_fileID;
      -[BRCAppLibrary appLibraryID](self, "appLibraryID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138413058;
      v10 = fileID;
      v11 = 2112;
      v12 = v4;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] app library root file id changed from %@ to %@ for %@%@", (uint8_t *)&v9, 0x2Au);

    }
    objc_storeStrong((id *)&self->_fileID, v4);
    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
  }

}

- (void)fsrootDidMoveToPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSNumber *fileID;
  NSNumber *generationID;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSNumber *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSNumber *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[BRCAppLibrary isiCloudDesktopAppLibrary](self, "isiCloudDesktopAppLibrary"))
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary(LegacyAdditions) fsrootDidMoveToPath:].cold.2();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "fileID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSNumber br_isEqualToNumber:](self->_fileID, "br_isEqualToNumber:", v5) & 1) != 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCAppLibrary(LegacyAdditions) fsrootDidMoveToPath:].cold.1();

    fileID = self->_fileID;
    self->_fileID = 0;

    generationID = self->_generationID;
    self->_generationID = 0;

    -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
    v10 = CFSTR("fs-root was removed");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fs-root was moved from %@ to %@"), self->_fileID, v5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      -[BRCAppLibrary appLibraryID](self, "appLibraryID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_fileID;
      *(_DWORD *)buf = 138413058;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v11;
      _os_log_error_impl(&dword_1CBD43000, v12, (os_log_type_t)0x90u, "[ERROR] fs-root moved on disk, but this is not the root item %@ is tracking\n tracking: %@, received: %@%@", buf, 0x2Au);

    }
  }
  -[BRCAppLibrary scheduleDeepScanWithReason:](self, "scheduleDeepScanWithReason:", v10);

}

- (void)updateFromFSAtPath:(id)a3
{
  NSNumber *v4;
  void *v5;
  NSObject *v6;
  NSNumber *v7;
  NSNumber *generationID;
  NSNumber *deepScanStamp;
  NSString *deepScanReason;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSNumber *v14;
  NSNumber *fileID;
  NSNumber *v16;
  uint64_t v17[3];
  uint8_t buf[4];
  BRCAppLibrary *v19;
  __int16 v20;
  NSNumber *v21;
  __int16 v22;
  NSNumber *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (NSNumber *)a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCAppLibrary(LegacyAdditions) updateFromFSAtPath:]", 534, v17);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v13 = v17[0];
    -[BRCAppLibrary appLibraryID](self, "appLibraryID");
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v19 = (BRCAppLibrary *)v13;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v5;
    _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx updating %@ from %@%@", buf, 0x2Au);

  }
  -[BRCAppLibrary setRootFileID:](self, "setRootFileID:", -[NSNumber fileID](v4, "fileID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NSNumber fsGenerationID](v4, "fsGenerationID"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  generationID = self->_generationID;
  self->_generationID = v7;

  deepScanStamp = self->_deepScanStamp;
  self->_deepScanStamp = 0;

  deepScanReason = self->_deepScanReason;
  self->_deepScanReason = 0;

  -[BRCAppLibrary setNeedsSave:](self, "setNeedsSave:", 1);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    fileID = self->_fileID;
    v16 = self->_generationID;
    *(_DWORD *)buf = 138413058;
    v19 = self;
    v20 = 2112;
    v21 = fileID;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Done scanning container: %@, fileID:%@ generationID:%@%@", buf, 0x2Au);
  }

  __brc_leave_section(v17);
}

- (void)didFindLostItem:(id)a3 oldAppLibrary:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v5 = a3;
  if ((objc_msgSend(a4, "state") & 4) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary(LegacyAdditions) didFindLostItem:oldAppLibrary:].cold.2();

  }
  if ((objc_msgSend(v5, "needsSyncUp") & 1) != 0)
    goto LABEL_8;
  if (objc_msgSend(v5, "isDirectory"))
  {
    objc_msgSend(v5, "asDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasDeadChildren");

    if (v7)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary(LegacyAdditions) didFindLostItem:oldAppLibrary:].cold.1();

LABEL_8:
      objc_msgSend(v5, "clientZone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scheduleSyncUp");

    }
  }

}

- (BRCRelativePath)documentsPath
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[BRCAppLibrary includesDataScope](self, "includesDataScope");
  -[BRCAppLibrary root](self, "root");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppLibrary pathRelativeToRoot](self, "pathRelativeToRoot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", *MEMORY[0x1E0D10D98]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathWithChildAtPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "pathWithChildAtPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (BRCRelativePath *)v8;
}

- (BRCRelativePath)root
{
  void *v2;
  void *v3;

  -[BRCAppLibrary fsEventsMonitor](self, "fsEventsMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCRelativePath *)v3;
}

- (BRCFSEventsMonitor)fsEventsMonitor
{
  BRCAccountSession *session;
  void *v3;
  void *v4;

  session = self->_session;
  -[BRCAppLibrary appLibraryID](self, "appLibraryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession fsEventsMonitorForAppLibraryID:](session, "fsEventsMonitorForAppLibraryID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCFSEventsMonitor *)v4;
}

- (id)_aliasAppLibraryTargetSQLPrefix
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[BRCAppLibrary mangledID](self, "mangledID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aliasTargetContainerString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_stringByBackslashEscapingCharactersInString:", CFSTR("\\_%"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%%"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)liveAliasesEnumeratorTargetingThisAppLibrary
{
  BRCPQLConnection *db;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  db = self->_db;
  -[BRCAppLibrary _aliasAppLibraryTargetSQLPrefix](self, "_aliasAppLibraryTargetSQLPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCPQLConnection fetch:](db, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp          FROM client_items         WHERE item_type = 3           AND item_state = 0           AND item_alias_target LIKE %@ ESCAPE '\\'"), v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__BRCAppLibrary_LegacyAdditions__liveAliasesEnumeratorTargetingThisAppLibrary__block_invoke;
  v8[3] = &unk_1E875E2C8;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjects:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __78__BRCAppLibrary_LegacyAdditions__liveAliasesEnumeratorTargetingThisAppLibrary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), a3);

  return v8;
}

- (id)aliasByUnsaltedBookmarkData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCAppLibrary(LegacyAdditions) aliasByUnsaltedBookmarkData:].cold.1();

  }
  v5 = -[BRCPQLConnection fetch:](self->_db, "fetch:", CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND app_library_rowid = %@"), v4, self->_dbRowID);
  if ((objc_msgSend(v5, "next") & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__BRCAppLibrary_LegacyAdditions__aliasByUnsaltedBookmarkData___block_invoke;
    v12[3] = &unk_1E875E2C8;
    v12[4] = self;
    objc_msgSend(v5, "object:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "close");
    v7 = v6;
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 12, CFSTR("item not found"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[BRCPQLConnection setLastError:](self->_db, "setLastError:", v7);
    v8 = 0;
  }

  return v8;
}

id __62__BRCAppLibrary_LegacyAdditions__aliasByUnsaltedBookmarkData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newLocalItemFromPQLResultSet:db:error:", v6, v9, a3);

  return v10;
}

- (void)registerQueryWithAliases:(BOOL)a3 isRecursive:(BOOL)a4
{
  unint64_t *p_activeQueries;
  unint64_t v5;
  unint64_t *p_activeRecursiveQueries;
  unint64_t v7;
  unint64_t *p_activeAliasQueries;
  unint64_t v9;

  p_activeQueries = &self->_activeQueries;
  do
    v5 = __ldaxr(p_activeQueries);
  while (__stlxr(v5 + 1, p_activeQueries));
  if (a4)
  {
    p_activeRecursiveQueries = &self->_activeRecursiveQueries;
    do
      v7 = __ldaxr(p_activeRecursiveQueries);
    while (__stlxr(v7 + 1, p_activeRecursiveQueries));
  }
  if (a3)
  {
    p_activeAliasQueries = &self->_activeAliasQueries;
    do
      v9 = __ldaxr(p_activeAliasQueries);
    while (__stlxr(v9 + 1, p_activeAliasQueries));
  }
}

- (void)unregisterQueryWithAliases:(BOOL)a3 isRecursive:(BOOL)a4
{
  unint64_t *p_activeAliasQueries;
  unint64_t v5;
  unint64_t *p_activeRecursiveQueries;
  unint64_t v7;
  unint64_t *p_activeQueries;
  unint64_t v9;

  if (a3)
  {
    p_activeAliasQueries = &self->_activeAliasQueries;
    do
      v5 = __ldaxr(p_activeAliasQueries);
    while (__stlxr(v5 - 1, p_activeAliasQueries));
  }
  if (a4)
  {
    p_activeRecursiveQueries = &self->_activeRecursiveQueries;
    do
      v7 = __ldaxr(p_activeRecursiveQueries);
    while (__stlxr(v7 - 1, p_activeRecursiveQueries));
  }
  p_activeQueries = &self->_activeQueries;
  do
    v9 = __ldaxr(p_activeQueries);
  while (__stlxr(v9 - 1, p_activeQueries));
}

- (BOOL)hasActiveAliasQueries
{
  unint64_t v2;

  v2 = atomic_load(&self->_activeAliasQueries);
  return v2 != 0;
}

- (void)notifyClient:(id)a3 whenFaultingIsDone:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[BRCAppLibrary defaultClientZone](self, "defaultClientZone");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyClient:whenFaultingIsDone:", v7, v6);

}

- (void)addClientUsingUbiquity:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  BRCAppLibrary *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableSet count](v5->_XPCClientsUsingUbiquity, "count"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] First ubiquity client using container, schedule each item for download (client: %@, container: %@).%@", buf, 0x20u);
    }

    -[BRCAppLibrary tracker](v5, "tracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSession clientDB](v5->_session, "clientDB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serialQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke;
    v13[3] = &unk_1E875D500;
    v13[4] = v5;
    brc_task_tracker_async_with_logs(v8, v10, v13, 0);

  }
  if ((-[NSMutableSet containsObject:](v5->_XPCClientsUsingUbiquity, "containsObject:", v4) & 1) == 0)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ forces %@ to be greedy%@", buf, 0x20u);
    }

    -[NSMutableSet addObject:](v5->_XPCClientsUsingUbiquity, "addObject:", v4);
  }
  objc_sync_exit(v5);

}

void __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(*(id *)(a1 + 32), "fetchRootItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDirectory") & 1) == 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "tracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", v3, 0, 0, 0, 0);

}

- (void)removeClientUsingUbiquity:(id)a3
{
  id v4;
  BRCAppLibrary *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  BRCAppLibrary *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[NSMutableSet containsObject:](v5->_XPCClientsUsingUbiquity, "containsObject:", v4))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412802;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ no longer forces %@ to be greedy%@", (uint8_t *)&v10, 0x20u);
    }

    -[NSMutableSet removeObject:](v5->_XPCClientsUsingUbiquity, "removeObject:", v4);
    if (!-[NSMutableSet count](v5->_XPCClientsUsingUbiquity, "count"))
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCAppLibrary(LegacyAdditions) removeClientUsingUbiquity:].cold.1();

    }
  }
  objc_sync_exit(v5);

}

- (BOOL)hasUbiquityClientsConnected
{
  BRCAppLibrary *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableSet count](v2->_XPCClientsUsingUbiquity, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)documentSizeUsageWithDB:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_msgSend(a3, "numberWithSQL:", CFSTR("SELECT auto_aggregate_size FROM app_libraries WHERE rowid = %@"), self->_dbRowID);
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unint64_t)documentCountWithDB:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_msgSend(a3, "numberWithSQL:", CFSTR("SELECT auto_document_count FROM app_libraries WHERE rowid = %@"), self->_dbRowID);
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (void)setNeedsSave:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] container state now needs flush: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] API MISUSE: unexpected parameter%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: mangledID.isPrivate%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: zoneRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)associateWithClientZone:offline:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: associating nil client zone for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_activateState:origState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Updating documents folder to be of server type %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_activateState:origState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _session.fsReader%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_activateState:origState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: state == BRCAppLibraryStateNotActivated || !(state & BRCAppLibraryStateNotActivated)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isGreedy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] greediness enforced because optimize storage is disabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: docsOrDataScopeInjection || externalScopeInjection%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)itemsEnumeratorWithRankMin:rankMax:namePrefix:withDeadItems:shouldIncludeFolders:shouldIncludeOnlyFolders:shouldIncludeDocumentsScope:shouldIncludeDataScope:shouldIncludeExternalScope:shouldIncludeTrashScope:count:db:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: asking for no scopes?%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addForegroundClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ - app library became foreground%@");
  OUTLINED_FUNCTION_2();
}

- (void)addForegroundClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: ![_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addForegroundClient:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: client%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __37__BRCAppLibrary_addForegroundClient___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] %@ - SharedDocs became foreground%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)removeForegroundClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] %@ - app library moved to background%@");
  OUTLINED_FUNCTION_2();
}

- (void)removeForegroundClient:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: [_foregroundClients containsObject:client]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)integrityCheckBoosting
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: %@ has foreground clients but the transfer sync context doesn't contain self%@");
  OUTLINED_FUNCTION_2();
}

void __68__BRCAppLibrary__resolveTargetSharedClientZonesWhenBecameForeground__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412802;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 136);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_8_3(&dword_1CBD43000, a2, a3, "[DEBUG] resolved target shared zones %@ for app library %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
}

void __58__BRCAppLibrary__removeTargetSharedServerZoneIfNecessary___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412802;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_8_3(&dword_1CBD43000, a2, a3, "[DEBUG] not removing target shared zone %@ from %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
}

- (void)fetchRootItemInDB:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: nil dbRowID for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)setChildBasehashSalt:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _childBasehashSalt == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: bad sql statement%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __102__BRCAppLibrary_LegacyAdditions__markChildrenLostForItemID_inZone_fileID_startingFromRow_hasMoreWork___block_invoke_3_cold_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "lastError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_1CBD43000, v2, v3, "[ERROR] %@%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __61__BRCAppLibrary_LegacyAdditions__coordinatorForItem_forRead___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint8_t v5[14];
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_15_0();
  v6 = v0;
  v7 = v1;
  v8 = v2;
  v9 = v1;
  v10 = v3;
  _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] Releasing coordinated %s I/O slot for r:%@ for %@%@", v5, 0x2Au);
}

void __57__BRCAppLibrary_LegacyAdditions__addClientUsingUbiquity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: rootItem.isDirectory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
