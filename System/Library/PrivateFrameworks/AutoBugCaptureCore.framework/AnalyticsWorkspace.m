@implementation AnalyticsWorkspace

+ (void)initialize
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)registry;
  registry = (uint64_t)v2;

}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  objc_super v5;

  connection = self->__connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->__connection;
    self->__connection = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)AnalyticsWorkspace;
  -[AnalyticsWorkspace dealloc](&v5, sel_dealloc);
}

- (id)_initWithName:(id)a3 inMemory:(BOOL)a4 useReadOnly:(BOOL)a5 customModelName:(id)a6 loadModelFromBundle:(id)a7
{
  _BOOL4 v10;
  id v13;
  __CFString *v14;
  id v15;
  AnalyticsWorkspace *v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  id v24;
  id v25;
  __CFString *v26;
  NSBundle *v27;
  NSBundle *objectModelResidentBundle;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const __CFString *v33;
  uint64_t v34;

  v10 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (__CFString *)a6;
  v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AnalyticsWorkspace;
  v16 = -[AnalyticsWorkspace init](&v31, sel_init);
  if (v16)
  {
    v30 = v13;
    v17 = -[__CFString length](v14, "length");
    v18 = (id *)MEMORY[0x1E0C97860];
    if (!v10)
      v18 = (id *)MEMORY[0x1E0C979E8];
    v19 = objc_retainAutorelease(*v18);
    v20 = (id *)MEMORY[0x1E0CB2AC0];
    if (!v17)
      v20 = (id *)MEMORY[0x1E0CB2AE0];
    v21 = objc_retainAutorelease(*v20);
    objectanalyticsHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("DAEMON");
      if (!v17)
        v23 = CFSTR("LEGACY");
      *(_DWORD *)buf = 138412290;
      v33 = v23;
      _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEFAULT, "AnalyticsWorkspace is running in %@ MODE", buf, 0xCu);
    }

    v24 = v19;
    v25 = v21;
    objc_storeStrong((id *)&v16->storeKind, v19);
    objc_storeStrong((id *)&v16->storeProt, v21);
    objc_storeStrong((id *)&v16->backingStore, a3);
    v16->readOnly = a5;
    v16->pathKnownToFail = 0;
    if (v17)
      v26 = v14;
    else
      v26 = CFSTR("SymptomAnalyticsLegacy");
    objc_storeStrong((id *)&v16->_objectModelName, v26);
    if (v15)
    {
      v27 = (NSBundle *)v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }
    objectModelResidentBundle = v16->_objectModelResidentBundle;
    v16->_objectModelResidentBundle = v27;

    v16->__persistent = 1;
    v13 = v30;
  }

  return v16;
}

- (id)initInMemoryWorkspaceWithName:(id)a3 customModelName:(id)a4 objectModelBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[AnalyticsWorkspace _initWithName:inMemory:useReadOnly:customModelName:loadModelFromBundle:]([AnalyticsWorkspace alloc], "_initWithName:inMemory:useReadOnly:customModelName:loadModelFromBundle:", v10, 1, 0, v9, v8);

  return v11;
}

+ (AnalyticsWorkspace)workspaceWithName:(id)a3 atPath:(id)a4 useReadOnly:(BOOL)a5
{
  return +[AnalyticsWorkspace workspaceWithName:atPath:objectModelName:objectModelBundle:useReadOnly:](AnalyticsWorkspace, "workspaceWithName:atPath:objectModelName:objectModelBundle:useReadOnly:", a3, a4, 0, 0, a5);
}

+ (AnalyticsWorkspace)workspaceWithName:(id)a3 atPath:(id)a4 objectModelName:(id)a5 objectModelBundle:(id)a6 useReadOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v20;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20 = 0;
  v15 = assembleFullName(v11, v12, &v20);
  v16 = v20;
  v17 = 0;
  if (v15)
  {
    v18 = (id)registry;
    objc_sync_enter(v18);
    objc_msgSend((id)registry, "objectForKey:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = -[AnalyticsWorkspace _initWithName:inMemory:useReadOnly:customModelName:loadModelFromBundle:]([AnalyticsWorkspace alloc], "_initWithName:inMemory:useReadOnly:customModelName:loadModelFromBundle:", v16, 0, v7, v13, v14);
      objc_msgSend((id)registry, "setObject:forKey:", v17, v16);
    }
    objc_sync_exit(v18);

  }
  return (AnalyticsWorkspace *)v17;
}

+ (id)defaultWorkspace
{
  return +[AnalyticsWorkspace workspaceWithName:atPath:useReadOnly:](AnalyticsWorkspace, "workspaceWithName:atPath:useReadOnly:", 0, 0, 0);
}

- (id)initWorkspaceWithName:(id)a3 atPath:(id)a4 useReadOnly:(BOOL)a5
{
  return -[AnalyticsWorkspace initWorkspaceWithName:atPath:objectModelName:objectModelBundle:useReadOnly:](self, "initWorkspaceWithName:atPath:objectModelName:objectModelBundle:useReadOnly:", a3, a4, 0, 0, a5);
}

- (id)initWorkspaceWithName:(id)a3 atPath:(id)a4 objectModelName:(id)a5 objectModelBundle:(id)a6 useReadOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  int v14;
  id v15;
  AnalyticsWorkspace *v16;
  id v18;

  v7 = a7;
  v12 = a5;
  v13 = a6;
  v18 = 0;
  v14 = assembleFullName(a3, a4, &v18);
  v15 = v18;
  if (v14)
  {
    self = (AnalyticsWorkspace *)-[AnalyticsWorkspace _initWithName:inMemory:useReadOnly:customModelName:loadModelFromBundle:](self, "_initWithName:inMemory:useReadOnly:customModelName:loadModelFromBundle:", v15, 0, v7, v12, v13);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)setCustomPersistenceProperties:(id)a3
{
  void *v4;
  char v5;
  BOOL v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v11;
  uint8_t buf[2];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PersistentWorkspace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objectanalyticsHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      v8 = "Invalid value for persistent key";
      v9 = (uint8_t *)&v11;
LABEL_11:
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    }
LABEL_12:

LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v5 = objc_msgSend(v4, "BOOLValue");
  if ((v5 & 1) == 0 && (self->__persistentStoreCoordinator || self->__mainObjectContext))
  {
    objectanalyticsHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "Requesting non-persistent but the workspace already has a PersistentStoreCoordinator and/or a MainObjectContext";
      v9 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->__persistent = v5;
  v6 = 1;
LABEL_14:

  return v6;
}

- (NSManagedObjectModel)objectModel
{
  NSManagedObjectModel *objectModel;
  NSManagedObjectModel **p_objectModel;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSManagedObjectModel *v18;
  NSObject *v19;
  void *v20;
  NSManagedObjectModel *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!self->__persistent)
    return (NSManagedObjectModel *)0;
  p_objectModel = &self->__objectModel;
  objectModel = self->__objectModel;
  if (objectModel)
    return objectModel;
  objectanalyticsHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[AnalyticsWorkspace objectModelName](self, "objectModelName");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    -[AnalyticsWorkspace objectModelResidentBundle](self, "objectModelResidentBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundlePath");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = 136315394;
    v23 = v8;
    v24 = 2080;
    v25 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Loading object model %s.momd from bundle at %s", (uint8_t *)&v22, 0x16u);

  }
  -[AnalyticsWorkspace objectModelResidentBundle](self, "objectModelResidentBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsWorkspace objectModelName](self, "objectModelName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathForResource:ofType:", v12, CFSTR("momd"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v14);
    objc_storeStrong((id *)p_objectModel, v15);
    objectanalyticsHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = (uint64_t)v14;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, "Loaded object model from URL %@", (uint8_t *)&v22, 0xCu);
    }

  }
  else
  {
    objectanalyticsHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[AnalyticsWorkspace objectModelName](self, "objectModelName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = (uint64_t)v17;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "Did not find path for object model %@", (uint8_t *)&v22, 0xCu);

    }
    v15 = 0;
  }

  v18 = *p_objectModel;
  if (!*p_objectModel)
  {
    objectanalyticsHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[AnalyticsWorkspace objectModelName](self, "objectModelName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = (uint64_t)v20;
      _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, "Couldn't match expected object model %@", (uint8_t *)&v22, 0xCu);

    }
    v18 = *p_objectModel;
  }
  v21 = v18;

  return v21;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  id v3;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *backingStore;
  const char *v9;
  void *v10;
  NSString *storeProt;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 readOnly;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  NSError *v25;
  NSObject *v26;
  NSError *v27;
  NSError *v28;
  _BOOL4 forceIntegrityCheck;
  NSPersistentStoreCoordinator *v30;
  _BOOL4 forceDestroyPersistentStore;
  _BOOL4 forceDeleteFile;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSString *storeKind;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSError *v42;
  NSString *v43;
  void *v44;
  NSError *persistentStoreError;
  NSObject *v46;
  NSString *v47;
  void *v48;
  NSObject *v49;
  char v50;
  const char *v51;
  NSObject *v52;
  NSError *v53;
  NSObject *v54;
  NSError *v55;
  NSObject *v56;
  uint64_t v57;
  char v58;
  char v59;
  void *v60;
  _BOOL4 v61;
  NSObject *v62;
  NSString *v63;
  NSError *v64;
  void *v65;
  int v66;
  NSObject *v67;
  id *location;
  void *v69;
  void *v70;
  NSError *v71;
  NSError *v72;
  NSError *v73;
  NSError *v74;
  NSError *v75;
  id v76;
  uint8_t buf[4];
  NSError *v78;
  __int16 v79;
  const char *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = (id)registry;
  objc_sync_enter(v3);
  if (!self->__persistent)
    goto LABEL_53;
  persistentStoreCoordinator = self->__persistentStoreCoordinator;
  if (!persistentStoreCoordinator)
  {
    location = (id *)&self->__persistentStoreCoordinator;
    if (!self->__connection
      && self->storeKind != (NSString *)*MEMORY[0x1E0C97860]
      && !-[AnalyticsWorkspace _primePath:](self, "_primePath:", self->backingStore))
    {
      v6 = 0;
LABEL_50:

      persistentStoreCoordinator = (NSPersistentStoreCoordinator *)*location;
      goto LABEL_51;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->__connection)
    {
      v5 = 0;
      v69 = 0;
    }
    else
    {
      objectanalyticsHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        backingStore = self->backingStore;
        v9 = "-only";
        if (!self->readOnly)
          v9 = "/write";
        *(_DWORD *)buf = 138412546;
        v78 = (NSError *)backingStore;
        v79 = 2080;
        v80 = v9;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "opening backingstore %@, read%s", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->backingStore);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addEntriesFromDictionary:", &unk_1EA3CF550);
      v10 = (void *)MEMORY[0x1E0C99D80];
      storeProt = self->storeProt;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->readOnly)
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      else
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      readOnly = self->readOnly;
      if (self->readOnly)
      {
        v16 = (void *)*MEMORY[0x1E0C97998];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v70, *MEMORY[0x1E0C979E0], storeProt, *MEMORY[0x1E0C97940], v12, *MEMORY[0x1E0C978D0], v13, *MEMORY[0x1E0C97868], v14, v16, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!readOnly)

    }
    -[AnalyticsWorkspace objectModel](self, "objectModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      self->_integrityCheckFailed = 0;
      v18 = objc_alloc(MEMORY[0x1E0C97C00]);
      -[AnalyticsWorkspace objectModel](self, "objectModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v18, "initWithManagedObjectModel:", v19);

      if (v6)
      {
        if (self->_forceIntegrityCheck)
        {
          objectanalyticsHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            goto LABEL_37;
          *(_WORD *)buf = 0;
          v21 = "DATA INTEGRITY: forceIntegrityCheck is true";
          v22 = v20;
          v23 = OS_LOG_TYPE_ERROR;
        }
        else
        {
          objectanalyticsHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            goto LABEL_37;
          *(_WORD *)buf = 0;
          v21 = "forceIntegrityCheck is false";
          v22 = v20;
          v23 = OS_LOG_TYPE_DEBUG;
        }
        _os_log_impl(&dword_1DBAE1000, v22, v23, v21, buf, 2u);
LABEL_37:

        if (self->_forceIntegrityCheck)
        {
          v28 = 0;
          forceIntegrityCheck = 1;
          goto LABEL_46;
        }
        if (self->_forceDestroyPersistentStore)
        {
          v28 = 0;
        }
        else
        {
          if (self->_forceDeleteFile)
          {
            v28 = 0;
          }
          else
          {
            storeKind = self->storeKind;
            v76 = 0;
            objc_msgSend(v6, "addPersistentStoreWithType:configuration:URL:options:error:", storeKind, 0, v69, v5, &v76);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (NSError *)v76;

            if (!v38)
            {
              objectanalyticsHandle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v28;
                _os_log_impl(&dword_1DBAE1000, v46, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: addPersistentStoreWithType failed because %@. Will check integrity.", buf, 0xCu);
              }

              forceIntegrityCheck = 1;
              self->_forceIntegrityCheck = 1;
              goto LABEL_46;
            }
            objc_storeStrong(location, v6);
            forceIntegrityCheck = self->_forceIntegrityCheck;
            if (self->_forceIntegrityCheck)
            {
LABEL_46:
              if (!self->__connection && !self->readOnly && self->storeKind != (NSString *)*MEMORY[0x1E0C97860])
              {
                forceDestroyPersistentStore = self->_forceDestroyPersistentStore;
                forceDeleteFile = self->_forceDeleteFile;
                *(_WORD *)&self->_forceIntegrityCheck = 0;
                self->_forceDeleteFile = 0;
                if (forceDeleteFile)
                {
                  objectanalyticsHandle();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1DBAE1000, v34, OS_LOG_TYPE_ERROR, "DATA LOSS: Have been instructed to delete persistent store.", buf, 2u);
                  }

                  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = v28;
                  v36 = objc_msgSend(v35, "removeItemAtURL:error:", v69, &v73);
                  v27 = v73;

                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    -[AnalyticsWorkspaceHealthDelegate deleteDatabaseCompleted:error:](self->_healthDelegate, "deleteDatabaseCompleted:error:", v36, v27);
                  goto LABEL_49;
                }
                if (forceDestroyPersistentStore)
                {
                  objectanalyticsHandle();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1DBAE1000, v39, OS_LOG_TYPE_ERROR, "DATA LOSS: Have been instructed to destroy persistent store.", buf, 2u);
                  }

                  v27 = v28;
LABEL_68:
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    -[AnalyticsWorkspaceHealthDelegate destroyPersistentStoreStarted](self->_healthDelegate, "destroyPersistentStoreStarted");
                  v40 = *MEMORY[0x1E0C979E8];
                  v72 = v27;
                  v41 = objc_msgSend(v6, "_destroyPersistentStoreAtURL:withType:options:error:", v69, v40, 0, &v72);
                  v42 = v72;

                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    -[AnalyticsWorkspaceHealthDelegate destroyPersistentStoreCompleted:error:](self->_healthDelegate, "destroyPersistentStoreCompleted:error:", v41, v42);
                  if ((_DWORD)v41)
                  {
                    v43 = self->storeKind;
                    v71 = v42;
                    objc_msgSend(v6, "addPersistentStoreWithType:configuration:URL:options:error:", v43, 0, v69, v5, &v71);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = v71;

                    if (v44)
                    {
                      objc_storeStrong(location, v6);
                      persistentStoreError = self->_persistentStoreError;
                      self->_persistentStoreError = 0;
                    }
                    else
                    {
                      objectanalyticsHandle();
                      v54 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v78 = v27;
                        _os_log_impl(&dword_1DBAE1000, v54, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Persisting fatal failure to recover incompatibility by creating new sqlite files : %@", buf, 0xCu);
                      }

                      if (v27)
                      {
                        v55 = v27;
                        v27 = v55;
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SymptomsErrorDomain"), 3203, 0);
                        v55 = (NSError *)objc_claimAutoreleasedReturnValue();
                        v27 = 0;
                      }
                      persistentStoreError = self->_persistentStoreError;
                      self->_persistentStoreError = v55;
                    }
                  }
                  else
                  {
                    objectanalyticsHandle();
                    v52 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v78 = v42;
                      _os_log_impl(&dword_1DBAE1000, v52, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Fatal failure to remove incompatible sqlite files: %@", buf, 0xCu);
                    }

                    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SymptomsErrorDomain"), 3204, 0);
                    v53 = (NSError *)objc_claimAutoreleasedReturnValue();
                    persistentStoreError = self->_persistentStoreError;
                    self->_persistentStoreError = v53;
                    v27 = v42;
                  }

                  goto LABEL_49;
                }
                if (forceIntegrityCheck)
                {
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    -[AnalyticsWorkspaceHealthDelegate integrityCheckStarted](self->_healthDelegate, "integrityCheckStarted");
                  objc_msgSend(v70, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("integrity_check"));
                  v47 = self->storeKind;
                  v75 = v28;
                  objc_msgSend(v6, "addPersistentStoreWithType:configuration:URL:options:error:", v47, 0, v69, v5, &v75);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v75;

                  if (v48)
                  {
                    objc_storeStrong(location, v6);
                    objectanalyticsHandle();
                    v49 = objc_claimAutoreleasedReturnValue();
                    v50 = 1;
                    if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                      goto LABEL_117;
                    *(_WORD *)buf = 0;
                    v51 = "DATA INTEGRITY: Integrity check passed";
                    goto LABEL_84;
                  }
                  objectanalyticsHandle();
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1DBAE1000, v56, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Integrity check failed", buf, 2u);
                  }

                  self->_integrityCheckFailed = 1;
                  v57 = -[NSError code](v27, "code");
                  v58 = isDBFileCorrupted(v27, 0);
                  if ((unint64_t)(v57 - 134000) < 0x15)
                    v59 = 1;
                  else
                    v59 = v58;
                  if ((v59 & 1) == 0 && (unint64_t)(v57 - 134100) > 0x46)
                  {
                    -[NSError domain](v27, "domain");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v60, "isEqualToString:", *MEMORY[0x1E0C979C8]))
                    {
                      v61 = -[NSError code](v27, "code") == 13;

                      if (v61)
                      {
                        objectanalyticsHandle();
                        v49 = objc_claimAutoreleasedReturnValue();
                        v50 = 1;
                        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          v51 = "DATA INTEGRITY WARNING: The disk is full";
LABEL_84:
                          _os_log_impl(&dword_1DBAE1000, v49, OS_LOG_TYPE_INFO, v51, buf, 2u);
                        }
LABEL_117:

                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          -[AnalyticsWorkspaceHealthDelegate integrityCheckCompleted:error:](self->_healthDelegate, "integrityCheckCompleted:error:", !self->_integrityCheckFailed, v27);
                        if ((v50 & 1) != 0)
                          goto LABEL_49;
                        goto LABEL_68;
                      }
                    }
                    else
                    {

                    }
                    objectanalyticsHandle();
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v78 = v27;
                      _os_log_impl(&dword_1DBAE1000, v62, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Error while creating persistent store: %@", buf, 0xCu);
                    }

                    v63 = self->storeKind;
                    v74 = v27;
                    objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:", v63, v69, v5, &v74);
                    v49 = objc_claimAutoreleasedReturnValue();
                    v64 = v74;

                    if (v49)
                    {
                      -[AnalyticsWorkspace objectModel](self, "objectModel");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      v66 = objc_msgSend(v65, "isConfiguration:compatibleWithStoreMetadata:", 0, v49);

                      objectanalyticsHandle();
                      v67 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v78 = (NSError *)v49;
                        v79 = 1024;
                        LODWORD(v80) = v66;
                        _os_log_impl(&dword_1DBAE1000, v67, OS_LOG_TYPE_INFO, "DATA INTEGRITY WARNING: metadata %@, compat %d", buf, 0x12u);
                      }

                    }
                    v50 = 1;
                    v27 = v64;
                    goto LABEL_117;
                  }
                  objectanalyticsHandle();
                  v49 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v78 = v27;
                    _os_log_impl(&dword_1DBAE1000, v49, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: DB content truncated due to model incompatibility or corruption. PSC creation failed with: %@", buf, 0xCu);
                  }
                  v50 = 0;
                  goto LABEL_117;
                }
              }
              goto LABEL_48;
            }
          }
          if (!self->_forceDestroyPersistentStore && !self->_forceDeleteFile)
          {
LABEL_48:
            v27 = v28;
            goto LABEL_49;
          }
        }
        forceIntegrityCheck = 0;
        goto LABEL_46;
      }
      objectanalyticsHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Fatal error while allocating persistent store", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SymptomsErrorDomain"), 3202, 0);
      v25 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objectanalyticsHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Unable to load the object model", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SymptomsErrorDomain"), 3201, 0);
      v25 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    v6 = 0;
    v27 = self->_persistentStoreError;
    self->_persistentStoreError = v25;
LABEL_49:

    if (v17)
      goto LABEL_50;

LABEL_53:
    v30 = 0;
    goto LABEL_54;
  }
LABEL_51:
  v30 = persistentStoreCoordinator;
LABEL_54:
  objc_sync_exit(v3);

  return v30;
}

- (NSManagedObjectContext)mainObjectContext
{
  NSManagedObjectContext *mainObjectContext;
  NSManagedObjectContext *v4;
  void *v5;
  NSManagedObjectContext *v6;
  id v7;
  NSManagedObjectContext *v8;
  NSManagedObjectContext *v9;

  if (self->__persistent)
  {
    mainObjectContext = self->__mainObjectContext;
    if (mainObjectContext)
    {
      v4 = mainObjectContext;
    }
    else
    {
      -[AnalyticsWorkspace persistentStoreCoordinator](self, "persistentStoreCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = self->__mainObjectContext;
      if (v5 && !v6)
      {
        v7 = objc_alloc(MEMORY[0x1E0C97B88]);
        v8 = (NSManagedObjectContext *)objc_msgSend(v7, "initWithConcurrencyType:", *MEMORY[0x1E0C97C38]);
        v9 = self->__mainObjectContext;
        self->__mainObjectContext = v8;

        -[NSManagedObjectContext setMergePolicy:](self->__mainObjectContext, "setMergePolicy:", *MEMORY[0x1E0C978C8]);
        -[NSManagedObjectContext setPersistentStoreCoordinator:](self->__mainObjectContext, "setPersistentStoreCoordinator:", v5);
        -[NSManagedObjectContext setUndoManager:](self->__mainObjectContext, "setUndoManager:", 0);
        v6 = self->__mainObjectContext;
      }
      v4 = v6;

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)createNewContext
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  if (self->__persistent)
  {
    -[AnalyticsWorkspace persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = objc_alloc(MEMORY[0x1E0C97B88]);
      v4 = (void *)objc_msgSend(v3, "initWithConcurrencyType:", *MEMORY[0x1E0C97C38]);
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "setMergePolicy:", *MEMORY[0x1E0C978C8]);
        objc_msgSend(v5, "setPersistentStoreCoordinator:", v2);
        objc_msgSend(v5, "setUndoManager:", 0);
      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  AnalyticsWorkspace *v5;
  uint64_t v6;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  uint64_t v8;
  NSManagedObjectModel *objectModel;
  uint64_t v10;
  NSXPCConnection *connection;

  -[AnalyticsWorkspace createNewContext](self, "createNewContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || !self->__persistent)
  {
    v5 = objc_alloc_init(AnalyticsWorkspace);
    objc_storeStrong((id *)&v5->backingStore, self->backingStore);
    objc_storeStrong((id *)&v5->storeKind, self->storeKind);
    objc_storeStrong((id *)&v5->_objectModelName, self->_objectModelName);
    objc_storeStrong((id *)&v5->_objectModelResidentBundle, self->_objectModelResidentBundle);
    objc_storeStrong((id *)&v5->storeProt, self->storeProt);
    -[AnalyticsWorkspace persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v6 = objc_claimAutoreleasedReturnValue();
    persistentStoreCoordinator = v5->__persistentStoreCoordinator;
    v5->__persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v6;

    objc_storeStrong((id *)&v5->__mainObjectContext, v4);
    -[AnalyticsWorkspace objectModel](self, "objectModel");
    v8 = objc_claimAutoreleasedReturnValue();
    objectModel = v5->__objectModel;
    v5->__objectModel = (NSManagedObjectModel *)v8;

    -[AnalyticsWorkspace connection](self, "connection");
    v10 = objc_claimAutoreleasedReturnValue();
    connection = v5->__connection;
    v5->__connection = (NSXPCConnection *)v10;

    v5->__persistent = -[AnalyticsWorkspace persistent](self, "persistent");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resetCompletionBlock
{
  return _Block_copy(self->__resetCompletionBlock);
}

- (void)setResetCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id resetCompletionBlock;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = _Block_copy(self->__resetCompletionBlock);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__AnalyticsWorkspace_setResetCompletionBlock___block_invoke;
    v9[3] = &unk_1EA3B4898;
    v10 = v5;
    v11 = v4;
    v6 = v5;
    v7 = _Block_copy(v9);
    resetCompletionBlock = self->__resetCompletionBlock;
    self->__resetCompletionBlock = v7;

  }
}

uint64_t __46__AnalyticsWorkspace_setResetCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)reset
{
  void *v3;
  void (**v4)(void);
  void (**v5)(void);

  if (self->__persistent)
  {
    -[AnalyticsWorkspace mainObjectContext](self, "mainObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reset");

  }
  -[AnalyticsWorkspace resetCompletionBlock](self, "resetCompletionBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (BOOL)save
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->__persistent)
    return 0;
  -[AnalyticsWorkspace persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[AnalyticsWorkspace mainObjectContext](self, "mainObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasChanges");

  if (v5)
  {
    -[AnalyticsWorkspace mainObjectContext](self, "mainObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v7 = objc_msgSend(v6, "save:", &v16);
    v8 = v16;

    if ((v7 & 1) == 0)
    {
      objectanalyticsHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localizedDescription");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "UTF8String");
        objc_msgSend(v8, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v18 = v11;
        v19 = 2080;
        v20 = v14;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Error while saving: %s\n%s", buf, 0x16u);

      }
    }

  }
  return 1;
}

- (BOOL)canCloneObjectsOfType:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->__persistent)
    return 0;
  objc_msgSend(a3, "relationshipsByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isToMany") & 1) != 0)
        {
          v9 = 0;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_12:

  return v9;
}

- (void)enumerateResidentObjectsOfType:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[AnalyticsWorkspace mainObjectContext](self, "mainObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registeredObjects");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__AnalyticsWorkspace_enumerateResidentObjectsOfType_usingBlock___block_invoke;
  v12[3] = &unk_1EA3B48C0;
  v13 = v6;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __64__AnalyticsWorkspace_enumerateResidentObjectsOfType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(v5, "isUpdated"))
    {
      objc_msgSend(v5, "entity");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

      if (v4)
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

- (id)cloneObject:(id)a3 intoWorkspace:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v12;

  v12 = 0;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 5);
  -[AnalyticsWorkspace _cloneInternal:intoWorkspace:ancestry:iteration:mustFail:](self, "_cloneInternal:intoWorkspace:ancestry:iteration:mustFail:", v8, v7, v9, 0, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cloneInternal:(id)a3 intoWorkspace:(id)a4 ancestry:(id)a5 iteration:(unint64_t)a6 mustFail:(BOOL *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  id v55;
  void *v56;
  unint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "mainObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v56)
  {
    objectanalyticsHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = v14;
      v25 = v13;
      v26 = v12;
      if (v10)
      {
        objc_msgSend(v10, "objectID");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URIRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "description");
        a6 = (unint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v27 = (const char *)objc_msgSend((id)a6, "UTF8String");
      }
      else
      {
        v27 = "(no nmo)";
      }
      *(_DWORD *)buf = 136315138;
      v66 = (uint64_t)v27;
      _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_ERROR, "Nil entity name for nmo: %s", buf, 0xCu);
      if (v10)
      {

      }
      v22 = 0;
      v12 = v26;
      v13 = v25;
      v14 = v24;
    }
    else
    {
      v22 = 0;
    }
    goto LABEL_33;
  }
  if (a6 >= 6)
  {
    objectanalyticsHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectID");
      v16 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URIRepresentation");
      v18 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v20 = v13;
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v66 = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_ERROR, "Too long a chain sequence leading to: %s", buf, 0xCu);

      v13 = v20;
      v12 = v18;

      v14 = v16;
    }
    v22 = 0;
    v23 = v15;
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend(v10, "objectID");
  v52 = v14;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v28);
  v22 = objc_claimAutoreleasedReturnValue();

  v14 = v52;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", v56, v13);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v59 = a6;
      v51 = v13;
      v55 = v11;
      objc_msgSend(v10, "objectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v12;
      objc_msgSend(v12, "setObject:forKey:", v22, v29);

      objc_msgSend(v10, "entity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "attributesByName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allKeys");
      v32 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v32;
      objc_msgSend(v10, "dictionaryWithValuesForKeys:", v32);
      v53 = v22;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValuesForKeysWithDictionary:](v22, "setValuesForKeysWithDictionary:");
      objc_msgSend(v10, "entity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "relationshipsByName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v34, "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v61;
        while (2)
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v61 != v38)
              objc_enumerationMutation(v35);
            v40 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v34, "valueForKey:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v41, "isToMany") & 1) == 0 && (objc_msgSend(v41, "isTransient") & 1) == 0)
            {
              v42 = v35;
              v43 = v10;
              objc_msgSend(v10, "valueForKey:", v40);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              ++v59;
              -[AnalyticsWorkspace _cloneInternal:intoWorkspace:ancestry:iteration:mustFail:](self, "_cloneInternal:intoWorkspace:ancestry:iteration:mustFail:", v44, v55, v54);
              v45 = objc_claimAutoreleasedReturnValue();
              if (!v45)
              {
                *a7 = 1;

                v22 = 0;
                v10 = v43;
                v23 = v53;
                goto LABEL_32;
              }
              v46 = (void *)v45;
              -[NSObject setValue:forKey:](v53, "setValue:forKey:", v45, v40);

              v10 = v43;
              v35 = v42;
            }

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
          if (v37)
            continue;
          break;
        }
      }

      v23 = v53;
      if (*a7)
        v47 = 0;
      else
        v47 = v53;
      v22 = v47;
LABEL_32:

      v12 = v54;
      v11 = v55;
      v13 = v51;
      v14 = v52;
      goto LABEL_33;
    }
  }
LABEL_34:

  return v22;
}

- (BOOL)_primePath:(id)a3
{
  BOOL v3;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSError *v13;
  NSError *persistentStoreError;
  id v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->pathKnownToFail)
    return 0;
  objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v17))
    v7 = v17 == 0;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", self->storeProt, *MEMORY[0x1E0CB2AD8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, v8, &v16);
    v9 = v16;
    v3 = v9 == 0;
    if (v9)
    {
      objectanalyticsHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "localizedDescription");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = objc_msgSend(v11, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v19 = v12;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Error creating directory path: %s", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SymptomsErrorDomain"), 3101, 0);
      v13 = (NSError *)objc_claimAutoreleasedReturnValue();
      persistentStoreError = self->_persistentStoreError;
      self->_persistentStoreError = v13;

    }
  }
  else
  {
    v3 = 1;
  }
  self->pathKnownToFail = !v3;

  return v3;
}

- (BOOL)persistent
{
  return self->__persistent;
}

- (NSXPCConnection)connection
{
  return self->__connection;
}

- (AnalyticsWorkspaceHealthDelegate)healthDelegate
{
  return self->_healthDelegate;
}

- (void)setHealthDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_healthDelegate, a3);
}

- (BOOL)forceIntegrityCheck
{
  return self->_forceIntegrityCheck;
}

- (void)setForceIntegrityCheck:(BOOL)a3
{
  self->_forceIntegrityCheck = a3;
}

- (BOOL)forceDestroyPersistentStore
{
  return self->_forceDestroyPersistentStore;
}

- (void)setForceDestroyPersistentStore:(BOOL)a3
{
  self->_forceDestroyPersistentStore = a3;
}

- (BOOL)forceDeleteFile
{
  return self->_forceDeleteFile;
}

- (void)setForceDeleteFile:(BOOL)a3
{
  self->_forceDeleteFile = a3;
}

- (NSString)objectModelName
{
  return self->_objectModelName;
}

- (void)setObjectModelName:(id)a3
{
  objc_storeStrong((id *)&self->_objectModelName, a3);
}

- (NSBundle)objectModelResidentBundle
{
  return self->_objectModelResidentBundle;
}

- (void)setObjectModelResidentBundle:(id)a3
{
  objc_storeStrong((id *)&self->_objectModelResidentBundle, a3);
}

- (BOOL)integrityCheckFailed
{
  return self->_integrityCheckFailed;
}

- (NSError)persistentStoreError
{
  return self->_persistentStoreError;
}

- (void)setPersistentStoreError:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStoreError, 0);
  objc_storeStrong((id *)&self->_objectModelResidentBundle, 0);
  objc_storeStrong((id *)&self->_objectModelName, 0);
  objc_storeStrong((id *)&self->_healthDelegate, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong(&self->__resetCompletionBlock, 0);
  objc_storeStrong((id *)&self->__objectModel, 0);
  objc_storeStrong((id *)&self->__mainObjectContext, 0);
  objc_storeStrong((id *)&self->__persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->storeProt, 0);
  objc_storeStrong((id *)&self->storeKind, 0);
  objc_storeStrong((id *)&self->backingStore, 0);
}

@end
