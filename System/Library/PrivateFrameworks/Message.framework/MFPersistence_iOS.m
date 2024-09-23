@implementation MFPersistence_iOS

- (id)messageChangeManager
{
  return objc_getProperty(self, a2, 248, 1);
}

- (id)conversationPersistence
{
  return objc_getProperty(self, a2, 200, 1);
}

- (id)threadPersistence
{
  return objc_getProperty(self, a2, 288, 1);
}

- (id)searchableIndexManager
{
  return objc_getProperty(self, a2, 272, 1);
}

- (id)messagePersistence
{
  return objc_getProperty(self, a2, 256, 1);
}

- (id)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (id)remoteContentPersistence
{
  return objc_getProperty(self, a2, 312, 1);
}

- (id)remoteContentManager
{
  return objc_getProperty(self, a2, 304, 1);
}

- (id)remoteContentCacheConfiguration
{
  return self->_remoteContentCacheConfiguration;
}

- (void)setUpWithMailboxProvider:(id)a3 remoteSearchProvider:(id)a4
{
  MFMailboxPersistence_iOS *v6;
  void *v7;
  void *v8;
  EDMailboxPersistence *v9;
  EDMailboxPersistence *mailboxPersistence;
  MFMessagePersistence_iOS *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EDMessagePersistence *v19;
  EDMessagePersistence *messagePersistence;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  EDPersistenceDatabase *database;
  void *v31;
  EDReadLaterPersistence *v32;
  EDReadLaterPersistence *readLaterPersistence;
  id v34;
  EDMessagePersistence *v35;
  void *v36;
  EDBIMIManager *v37;
  EDBIMIManager *bimiManager;
  MFMessageChangeManager_iOS *v39;
  void *v40;
  EDMessagePersistence *v41;
  void *v42;
  void *v43;
  void *v44;
  EDBIMIManager *v45;
  void *v46;
  void *v47;
  EDMessageChangeManager *v48;
  EDMessageChangeManager *messageChangeManager;
  EDAttachmentPersistenceManager *v50;
  EDAttachmentPersistenceManager *attachmentPersistenceManager;
  id v52;
  EDMessagePersistence *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  EDThreadPersistence *v59;
  EDThreadPersistence *threadPersistence;
  id v61;
  void *v62;
  EDMessagePersistence *v63;
  void *v64;
  EDRemindMeNotificationController *v65;
  EDRemindMeNotificationController *remindMeNotificationController;
  id v67;
  EDPersistenceDatabase *v68;
  EDMessagePersistence *v69;
  void *v70;
  EDDataDetectionPersistence *v71;
  EDDataDetectionPersistence *dataDetectionPersistence;
  void *v73;
  void *v74;
  EDSearchProvider *v75;
  EDSearchProvider *searchProvider;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;

  v80 = a3;
  v81 = a4;
  v6 = [MFMailboxPersistence_iOS alloc];
  -[MFPersistence_iOS database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MFMailboxPersistence_iOS initWithMailboxProvider:database:library:](v6, "initWithMailboxProvider:database:library:", v80, v7, v8);
  mailboxPersistence = self->_mailboxPersistence;
  self->_mailboxPersistence = v9;

  v11 = [MFMessagePersistence_iOS alloc];
  -[MFPersistence_iOS mailboxPersistence](self, "mailboxPersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS userProfileProvider](self, "userProfileProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence blockedSenderManager](self, "blockedSenderManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence vipManager](self, "vipManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence hookRegistry](self, "hookRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS library](self, "library");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MFMessagePersistence_iOS initWithMailboxPersistence:database:userProfileProvider:blockedSenderManager:vipReader:hookRegistry:library:](v11, "initWithMailboxPersistence:database:userProfileProvider:blockedSenderManager:vipReader:hookRegistry:library:", v12, v13, v14, v15, v16, v17, v18);
  messagePersistence = self->_messagePersistence;
  self->_messagePersistence = v19;

  v21 = objc_alloc(MEMORY[0x1E0D1EB38]);
  -[MFPersistence_iOS database](self, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "schema");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS database](self, "database");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "protectedSchema");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS accountsProvider](self, "accountsProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence vipManager](self, "vipManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v21, "initWithSchema:protectedSchema:accountsProvider:vipManager:messagePersistence:mailboxPersistence:", v23, v25, v26, v27, self->_messagePersistence, self->_mailboxPersistence);

  v79 = (void *)v28;
  -[EDMessagePersistence setQueryParser:](self->_messagePersistence, "setQueryParser:", v28);
  v29 = objc_alloc(MEMORY[0x1E0D1EBA0]);
  database = self->_database;
  -[EDPersistence hookRegistry](self, "hookRegistry");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (EDReadLaterPersistence *)objc_msgSend(v29, "initWithDatabase:hookRegistry:", database, v31);
  readLaterPersistence = self->_readLaterPersistence;
  self->_readLaterPersistence = v32;

  v34 = objc_alloc(MEMORY[0x1E0D1EAA0]);
  v35 = self->_messagePersistence;
  -[MFPersistence_iOS remoteContentURLSession](self, "remoteContentURLSession");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (EDBIMIManager *)objc_msgSend(v34, "initWithMessagePersistence:urlSession:", v35, v36);
  bimiManager = self->_bimiManager;
  self->_bimiManager = v37;

  v39 = [MFMessageChangeManager_iOS alloc];
  -[MFPersistence_iOS library](self, "library");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS database](self, "database");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS localActionPersistence](self, "localActionPersistence");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = self->_messagePersistence;
  -[MFPersistence_iOS serverMessagePersistenceFactory](self, "serverMessagePersistenceFactory");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS readLaterPersistence](self, "readLaterPersistence");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS categoryPersistence](self, "categoryPersistence");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self->_bimiManager;
  -[EDPersistence hookRegistry](self, "hookRegistry");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence hookRegistry](self, "hookRegistry");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[MFMessageChangeManager_iOS initWithLibrary:database:localActionPersistence:messagePersistence:serverMessagePersistenceFactory:readLaterPersistence:categoryPersistence:bimiManager:hookResponder:hookRegistry:](v39, "initWithLibrary:database:localActionPersistence:messagePersistence:serverMessagePersistenceFactory:readLaterPersistence:categoryPersistence:bimiManager:hookResponder:hookRegistry:", v78, v77, v40, v41, v42, v43, v44, v45, v46, v47);
  messageChangeManager = self->_messageChangeManager;
  self->_messageChangeManager = v48;

  v50 = (EDAttachmentPersistenceManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EA98]), "initWithDatabase:messagePersistence:", self->_database, self->_messagePersistence);
  attachmentPersistenceManager = self->_attachmentPersistenceManager;
  self->_attachmentPersistenceManager = v50;

  v52 = objc_alloc(MEMORY[0x1E0D1EC78]);
  v53 = self->_messagePersistence;
  -[MFPersistence_iOS categoryPersistence](self, "categoryPersistence");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPersistence_iOS database](self, "database");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence hookRegistry](self, "hookRegistry");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence vipManager](self, "vipManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPersistence blockedSenderManager](self, "blockedSenderManager");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (EDThreadPersistence *)objc_msgSend(v52, "initWithMessagePersistence:categoryPersistence:database:hookRegistry:vipManager:blockedSenderManager:", v53, v54, v55, v56, v57, v58);
  threadPersistence = self->_threadPersistence;
  self->_threadPersistence = v59;

  v61 = objc_alloc(MEMORY[0x1E0D1EBA8]);
  -[EDPersistence hookRegistry](self, "hookRegistry");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = self->_messagePersistence;
  -[EDPersistence alarmScheduler](self, "alarmScheduler");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (EDRemindMeNotificationController *)objc_msgSend(v61, "initWithHookRegistry:messagePersistence:alarmScheduler:", v62, v63, v64);
  remindMeNotificationController = self->_remindMeNotificationController;
  self->_remindMeNotificationController = v65;

  -[MFPersistence_iOS _configureAttachmentPersistenceManager](self, "_configureAttachmentPersistenceManager");
  v67 = objc_alloc(MEMORY[0x1E0D1EAD8]);
  v68 = self->_database;
  v69 = self->_messagePersistence;
  -[EDPersistence hookRegistry](self, "hookRegistry");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (EDDataDetectionPersistence *)objc_msgSend(v67, "initWithDatabase:messagePersistence:hookResponder:", v68, v69, v70);
  dataDetectionPersistence = self->_dataDetectionPersistence;
  self->_dataDetectionPersistence = v71;

  -[EDPersistence hookRegistry](self, "hookRegistry");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "registerMessageChangeHookResponder:", self->_dataDetectionPersistence);

  -[MFPersistence_iOS _configureSearchableIndexManagerIfNecessary](self, "_configureSearchableIndexManagerIfNecessary");
  if (v81 && self->_searchableIndexManager)
  {
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EC28]), "initWithSearchableIndexManager:", self->_searchableIndexManager);
    v75 = (EDSearchProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EBE8]), "initWithLocalSearchProvider:remoteSearchProvider:", v74, v81);
    searchProvider = self->_searchProvider;
    self->_searchProvider = v75;

  }
}

- (id)database
{
  return objc_getProperty(self, a2, 208, 1);
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (MFMailMessageLibrary)library
{
  return (MFMailMessageLibrary *)objc_loadWeakRetained((id *)&self->_library);
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (id)serverMessagePersistenceFactory
{
  return objc_getProperty(self, a2, 280, 1);
}

- (id)remoteContentURLSession
{
  return self->_remoteContentURLSession;
}

- (id)readLaterPersistence
{
  return objc_getProperty(self, a2, 360, 1);
}

- (id)localActionPersistence
{
  return objc_getProperty(self, a2, 224, 1);
}

- (MFPersistence_iOS)initWithPath:(id)a3 inMemoryIdentifier:(id)a4 library:(id)a5 propertyMapper:(id)a6
{
  id v10;
  id v11;
  MFPersistence_iOS *v12;
  MFPersistence_iOS *v13;
  MFProtectedDatabasePersistence_iOS *v14;
  MFProtectedDatabasePersistence_iOS *v15;
  void *v16;
  MFProtectedDatabasePersistence_iOS *v17;
  id v18;
  MFPersistenceDatabase_iOS *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  EDPersistenceDatabase *database;
  MFProtectedDatabasePersistence_iOS *v24;
  void *v25;
  MFPersistenceDatabase_iOS *v26;
  uint64_t v27;
  id *p_library;
  id v29;
  EDPersistenceDatabase *v30;
  void *v31;
  uint64_t v32;
  EDConversationPersistence *conversationPersistence;
  MFLocalActionPersistence_iOS *v34;
  EDLocalActionPersistence *localActionPersistence;
  MFServerMessagePersistenceFactory_iOS *v36;
  EDServerMessagePersistenceFactory *serverMessagePersistenceFactory;
  id v38;
  void *v39;
  uint64_t v40;
  EDRemoteContentCacheConfiguration *remoteContentCacheConfiguration;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  EMRemoteContentURLCache *remoteContentURLCache;
  id v47;
  uint64_t v48;
  EMRemoteContentURLSession *remoteContentURLSession;
  _BOOL8 v50;
  uint64_t v51;
  EDRemoteContentPersistence *remoteContentPersistence;
  uint64_t v53;
  EDRemoteContentManager *remoteContentManager;
  void *v55;
  uint64_t v56;
  EDSearchableIndexDiagnosticsController *diagnosticsController;
  id v58;
  EDPersistenceDatabase *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  EDSenderPersistence *senderPersistence;
  uint64_t v64;
  EDMailboxActionPersistence *mailboxActionPersistence;
  uint64_t v66;
  EDRichLinkPersistence *richLinkPersistence;
  id v68;
  EDPersistenceDatabase *v69;
  void *v70;
  uint64_t v71;
  EDBusinessPersistence *businessPersistence;
  MFCategoryPersistence_iOS *v73;
  id WeakRetained;
  EDPersistenceDatabase *v75;
  void *v76;
  uint64_t v77;
  EDCategoryPersistence *categoryPersistence;
  id v80;
  id v81;
  objc_super v82;

  v10 = a3;
  v80 = a4;
  v11 = a5;
  v81 = a6;
  v82.receiver = self;
  v82.super_class = (Class)MFPersistence_iOS;
  v12 = -[EDPersistence init](&v82, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D1EB78], "registerAdditionalPropertiesForPropertyMapper:", v81);
    if (v80)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v80, CFSTR("Envelope Index"));
      v14 = (MFProtectedDatabasePersistence_iOS *)objc_claimAutoreleasedReturnValue();
      v15 = [MFProtectedDatabasePersistence_iOS alloc];
      -[EDPersistence hookRegistry](v12, "hookRegistry");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[EDProtectedDatabasePersistence initWithBasePath:hookRegistry:](v15, "initWithBasePath:hookRegistry:", 0, v16);
      v18 = v10;

      v19 = [MFPersistenceDatabase_iOS alloc];
      +[EDPersistenceDatabaseSchema schema](MFPersistenceDatabaseSchema_iOS, "schema");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDPersistenceDatabaseSchema protectedSchema](MFPersistenceDatabaseSchema_iOS, "protectedSchema");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MFPersistenceDatabase_iOS initWithBasePath:databaseName:maxConcurrentReaders:schema:protectedSchema:propertyMapper:protectedDatabasePersistence:](v19, "initWithBasePath:databaseName:maxConcurrentReaders:schema:protectedSchema:propertyMapper:protectedDatabasePersistence:", 0, v14, 3, v20, v21, v81, v17);
      database = v12->_database;
      v12->_database = (EDPersistenceDatabase *)v22;

    }
    else
    {
      v24 = [MFProtectedDatabasePersistence_iOS alloc];
      -[EDPersistence hookRegistry](v12, "hookRegistry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[EDProtectedDatabasePersistence initWithBasePath:hookRegistry:](v24, "initWithBasePath:hookRegistry:", v10, v25);

      v26 = [MFPersistenceDatabase_iOS alloc];
      +[EDPersistenceDatabaseSchema schema](MFPersistenceDatabaseSchema_iOS, "schema");
      v17 = (MFProtectedDatabasePersistence_iOS *)objc_claimAutoreleasedReturnValue();
      +[EDPersistenceDatabaseSchema protectedSchema](MFPersistenceDatabaseSchema_iOS, "protectedSchema");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v10;
      v27 = -[MFPersistenceDatabase_iOS initWithBasePath:databaseName:maxConcurrentReaders:schema:protectedSchema:propertyMapper:protectedDatabasePersistence:](v26, "initWithBasePath:databaseName:maxConcurrentReaders:schema:protectedSchema:propertyMapper:protectedDatabasePersistence:", v10, CFSTR("Envelope Index"), 3, v17, v20, v81, v14);
      v21 = v12->_database;
      v12->_database = (EDPersistenceDatabase *)v27;
    }

    v10 = v18;
    -[EDPersistenceDatabase setSetupIsComplete:](v12->_database, "setSetupIsComplete:", 1);
    p_library = (id *)&v12->_library;
    objc_storeWeak((id *)&v12->_library, v11);
    v29 = objc_alloc(MEMORY[0x1E0D1EAC8]);
    v30 = v12->_database;
    -[EDPersistence hookRegistry](v13, "hookRegistry");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v29, "initWithDatabase:hookRegistry:", v30, v31);
    conversationPersistence = v13->_conversationPersistence;
    v13->_conversationPersistence = (EDConversationPersistence *)v32;

    v34 = -[MFLocalActionPersistence_iOS initWithLibrary:database:]([MFLocalActionPersistence_iOS alloc], "initWithLibrary:database:", v11, v13->_database);
    localActionPersistence = v13->_localActionPersistence;
    v13->_localActionPersistence = &v34->super;

    v36 = -[MFServerMessagePersistenceFactory_iOS initWithLibrary:database:]([MFServerMessagePersistenceFactory_iOS alloc], "initWithLibrary:database:", v11, v13->_database);
    serverMessagePersistenceFactory = v13->_serverMessagePersistenceFactory;
    v13->_serverMessagePersistenceFactory = &v36->super;

    v38 = objc_alloc(MEMORY[0x1E0D1EBB0]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v18, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "initWithBaseURL:diskCapacity:", v39, 104857600);
    remoteContentCacheConfiguration = v13->_remoteContentCacheConfiguration;
    v13->_remoteContentCacheConfiguration = (EDRemoteContentCacheConfiguration *)v40;

    v42 = objc_alloc(MEMORY[0x1E0D1E2D8]);
    v43 = -[EDRemoteContentCacheConfiguration diskCapacity](v13->_remoteContentCacheConfiguration, "diskCapacity");
    -[EDRemoteContentCacheConfiguration cacheURL](v13->_remoteContentCacheConfiguration, "cacheURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v42, "initWithMemoryCapacity:diskCapacity:directoryURL:", 0, v43, v44);
    remoteContentURLCache = v13->_remoteContentURLCache;
    v13->_remoteContentURLCache = (EMRemoteContentURLCache *)v45;

    v47 = objc_alloc(MEMORY[0x1E0D1E2E8]);
    v48 = objc_msgSend(v47, "initWithCache:sourceBundleIdentifier:", v13->_remoteContentURLCache, *MEMORY[0x1E0D4D878]);
    remoteContentURLSession = v13->_remoteContentURLSession;
    v13->_remoteContentURLSession = (EMRemoteContentURLSession *)v48;

    v50 = +[MFMailMessageLibrary canUsePersistence](MFMailMessageLibrary, "canUsePersistence");
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EBC0]), "initWithDatabase:useAdditionalTable:", v13->_database, v50);
    remoteContentPersistence = v13->_remoteContentPersistence;
    v13->_remoteContentPersistence = (EDRemoteContentPersistence *)v51;

    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EBB8]), "initWithRemoteContentPersistence:contentRuleListManager:urlSession:", v13->_remoteContentPersistence, 0, v13->_remoteContentURLSession);
    remoteContentManager = v13->_remoteContentManager;
    v13->_remoteContentManager = (EDRemoteContentManager *)v53;

    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = objc_msgSend(v55, "isInternal");

    if ((_DWORD)v43)
    {
      v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EC10]), "initWithPersistence:", v13);
      diagnosticsController = v13->_diagnosticsController;
      v13->_diagnosticsController = (EDSearchableIndexDiagnosticsController *)v56;

    }
    v58 = objc_alloc(MEMORY[0x1E0D1EC50]);
    v59 = v13->_database;
    -[EDPersistence blockedSenderManager](v13, "blockedSenderManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistence hookRegistry](v13, "hookRegistry");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v58, "initWithDatabase:blockedSenderManager:hookRegistry:contactStore:", v59, v60, v61, 0);
    senderPersistence = v13->_senderPersistence;
    v13->_senderPersistence = (EDSenderPersistence *)v62;

    v64 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EB08]), "initWithDatabase:", v13->_database);
    mailboxActionPersistence = v13->_mailboxActionPersistence;
    v13->_mailboxActionPersistence = (EDMailboxActionPersistence *)v64;

    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EBE0]), "initWithDatabase:", v13->_database);
    richLinkPersistence = v13->_richLinkPersistence;
    v13->_richLinkPersistence = (EDRichLinkPersistence *)v66;

    v68 = objc_alloc(MEMORY[0x1E0D1EAA8]);
    v69 = v13->_database;
    -[EDPersistence hookRegistry](v13, "hookRegistry");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v68, "initWithDatabase:hookRegistry:", v69, v70);
    businessPersistence = v13->_businessPersistence;
    v13->_businessPersistence = (EDBusinessPersistence *)v71;

    v73 = [MFCategoryPersistence_iOS alloc];
    WeakRetained = objc_loadWeakRetained(p_library);
    v75 = v13->_database;
    -[EDPersistence hookRegistry](v13, "hookRegistry");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[MFCategoryPersistence_iOS initWithLibrary:database:hookResponder:](v73, "initWithLibrary:database:hookResponder:", WeakRetained, v75, v76);
    categoryPersistence = v13->_categoryPersistence;
    v13->_categoryPersistence = (EDCategoryPersistence *)v77;

  }
  return v13;
}

- (void)_configureSearchableIndexManagerIfNecessary
{
  void *v3;
  int v4;
  MFSearchableIndexManager_iOS *v5;
  EDPersistenceDatabase *database;
  void *v7;
  void *v8;
  void *v9;
  EDSearchableIndexManager *v10;
  EDSearchableIndexManager *searchableIndexManager;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUseSpotlightIndex");

  if (v4)
  {
    v5 = [MFSearchableIndexManager_iOS alloc];
    database = self->_database;
    -[MFPersistence_iOS messagePersistence](self, "messagePersistence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPersistence_iOS richLinkPersistence](self, "richLinkPersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDPersistence hookRegistry](self, "hookRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MFSearchableIndexManager_iOS initWithDatabase:messagePersistence:richLinkPersistence:hookResponder:](v5, "initWithDatabase:messagePersistence:richLinkPersistence:hookResponder:", database, v7, v8, v9);
    searchableIndexManager = self->_searchableIndexManager;
    self->_searchableIndexManager = v10;

    -[EDPersistence hookRegistry](self, "hookRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerMessageChangeHookResponder:", self->_searchableIndexManager);

    -[EDPersistence hookRegistry](self, "hookRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerCategoryChangeHookResponder:", self->_searchableIndexManager);

    +[MFPersistence_iOS log](MFPersistence_iOS, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "User agent says canUseSpotlightIndex - Enabling searchable index.", v15, 2u);
    }

  }
}

- (id)richLinkPersistence
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)_configureAttachmentPersistenceManager
{
  id v3;

  -[EDPersistence hookRegistry](self, "hookRegistry");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerMessageChangeHookResponder:", self->_attachmentPersistenceManager);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__MFPersistence_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_25 != -1)
    dispatch_once(&log_onceToken_25, block);
  return (OS_os_log *)(id)log_log_25;
}

- (void)setUserProfileProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userProfileProvider, a3);
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (void)scheduleRecurringActivity
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFPersistence_iOS;
  -[EDPersistence scheduleRecurringActivity](&v4, sel_scheduleRecurringActivity);
  -[MFPersistence_iOS library](self, "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleRecurringActivity");

}

- (void)test_tearDown
{
  void *v4;
  void *v5;
  objc_super v6;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPersistence_iOS.m"), 248, CFSTR("%s can only be called from unit tests"), "-[MFPersistence_iOS test_tearDown]");

  }
  v6.receiver = self;
  v6.super_class = (Class)MFPersistence_iOS;
  -[EDPersistence test_tearDown](&v6, sel_test_tearDown);
  -[MFPersistence_iOS threadPersistence](self, "threadPersistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "test_tearDown");

}

- (id)persistenceStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[MFPersistence_iOS messagePersistence](self, "messagePersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)MFPersistence_iOS;
  -[EDPersistence persistenceStateWithStatistics:](&v13, sel_persistenceStateWithStatistics_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "protectedDataAvailable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D1DF70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "messagesMarkedAsJournaled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D1DF58]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "mailboxesNeedingReconcilication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D1DF20]);

  -[MFPersistence_iOS searchableIndexStatistics](self, "searchableIndexStatistics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v10);

  if (objc_msgSend(v4, "protectedDataAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "protectedMessageData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D1DF78]);

  }
  return v6;
}

- (id)searchableIndexStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MFPersistence_iOS searchableIndexManager](self, "searchableIndexManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_opt_new();
  -[MFPersistence_iOS serverMessagesIndexer](self, "serverMessagesIndexer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getIndexingStatisticsWithCompletion:", v9);

  objc_msgSend(v7, "future");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v10, "resultWithTimeout:error:", &v16, 60.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v11)
  {
    objc_msgSend(v6, "addEntriesFromDictionary:", v11);
  }
  else
  {
    +[MFPersistence_iOS log](MFPersistence_iOS, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "Error getting remote indexing statistics: %@", buf, 0xCu);
    }

  }
  v14 = (void *)objc_msgSend(v6, "copy");

  return v14;
}

- (id)dataDetectionPersistence
{
  return objc_getProperty(self, a2, 216, 1);
}

- (id)mailboxActionPersistence
{
  return self->_mailboxActionPersistence;
}

- (void)setMailboxPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPersistence, a3);
}

- (id)searchProvider
{
  return self->_searchProvider;
}

- (id)senderPersistence
{
  return objc_getProperty(self, a2, 296, 1);
}

- (id)attachmentPersistenceManager
{
  return objc_getProperty(self, a2, 328, 1);
}

- (id)remoteContentURLCache
{
  return self->_remoteContentURLCache;
}

- (void)setRemoteContentURLCache:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentURLCache, a3);
}

- (void)setRemoteContentURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentURLSession, a3);
}

- (id)bimiManager
{
  return self->_bimiManager;
}

- (id)businessPersistence
{
  return objc_getProperty(self, a2, 384, 1);
}

- (id)businessCloudStorage
{
  return self->_businessCloudStorage;
}

- (id)diagnosticsController
{
  return self->_diagnosticsController;
}

- (id)categoryPersistence
{
  return objc_getProperty(self, a2, 408, 1);
}

- (MCCCategoryRulesController)rulesController
{
  return self->_rulesController;
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
  objc_storeStrong((id *)&self->_rulesController, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_businessCloudStorage, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_bimiManager, 0);
  objc_storeStrong((id *)&self->_readLaterPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentURLSession, 0);
  objc_storeStrong((id *)&self->_remoteContentURLCache, 0);
  objc_storeStrong((id *)&self->_remoteContentCacheConfiguration, 0);
  objc_storeStrong((id *)&self->_attachmentPersistenceManager, 0);
  objc_storeStrong((id *)&self->_richLinkPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentManager, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_serverMessagePersistenceFactory, 0);
  objc_storeStrong((id *)&self->_searchableIndexManager, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_messageChangeManager, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_mailboxActionPersistence, 0);
  objc_storeStrong((id *)&self->_localActionPersistence, 0);
  objc_storeStrong((id *)&self->_dataDetectionPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_conversationPersistence, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_serverMessagesIndexer, 0);
}

- (void)setUpWithMailboxProvider:(id)a3 remoteSearchProvider:(id)a4 serverMessagesIndexer:(id)a5
{
  id v8;
  id v9;

  objc_storeStrong((id *)&self->_serverMessagesIndexer, a5);
  v8 = a4;
  v9 = a3;
  -[MFPersistence_iOS setUpWithMailboxProvider:remoteSearchProvider:](self, "setUpWithMailboxProvider:remoteSearchProvider:");

}

- (MFServerMessagesIndexer)serverMessagesIndexer
{
  return self->_serverMessagesIndexer;
}

@end
