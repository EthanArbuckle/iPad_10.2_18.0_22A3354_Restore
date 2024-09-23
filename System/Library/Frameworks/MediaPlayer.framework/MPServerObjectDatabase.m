@implementation MPServerObjectDatabase

void __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];

  if ((objc_msgSend((id)objc_opt_class(), "prefersInMemoryDatabase") & 1) != 0)
  {
    v2 = &__block_literal_global_31834;
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke_3;
    v5[3] = &__block_descriptor_40_e21___MSVSQLDatabase_8__0l;
    v5[4] = *(_QWORD *)(a1 + 32);
    v2 = (void *)MEMORY[0x19403A810](v5);
  }
  v3 = -[MPServerObjectDatabase _initWithDatabaseCreationBlock:]([MPServerObjectDatabase alloc], "_initWithDatabaseCreationBlock:", v2);
  v4 = (void *)sharedServerObjectDatabase___sharedServerObjectDatabase;
  sharedServerObjectDatabase___sharedServerObjectDatabase = (uint64_t)v3;

}

- (id)_initWithDatabaseCreationBlock:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v15;
  id v16;
  SEL v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPServerObjectDatabase;
  v6 = -[MPServerObjectDatabase init](&v18, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MediaPlayer.MPServerObjectDatabase/accessQueue", v7);
    v9 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v10;

    *((_QWORD *)v6 + 4) = 0;
    v12 = *((_QWORD *)v6 + 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MPServerObjectDatabase__initWithDatabaseCreationBlock___block_invoke;
    block[3] = &unk_1E315C618;
    v15 = v6;
    v16 = v5;
    v17 = a2;
    dispatch_async(v12, block);

  }
  return v6;
}

+ (BOOL)prefersInMemoryDatabase
{
  return _MPServerObjectDatabasePrefersInMemoryDatabase;
}

void __57__MPServerObjectDatabase__initWithDatabaseCreationBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "_createDatabaseSchema") & 1) == 0)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_FAULT, "SOD: Unable to create database schema. Attempting fallback to in-memory database.", v12, 2u);
    }

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0D0]), "initWithMemory");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

    v9 = *(_QWORD **)(a1 + 32);
    if (!v9[2])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("MPServerObjectDatabase.m"), 577, CFSTR("SOD: Unable to create server objects database in-memory"));

      v9 = *(_QWORD **)(a1 + 32);
    }
    if ((objc_msgSend(v9, "_createDatabaseSchema") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("MPServerObjectDatabase.m"), 578, CFSTR("SOD: Unable to create database schema on disk or in-memory."));

    }
  }
}

- (BOOL)_createDatabaseSchema
{
  MSVSQLDatabase *database;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  v16 = 0;
  -[MSVSQLDatabase transactionWithName:error:](database, "transactionWithName:error:", CFSTR("schema"), &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  if (!v4)
  {
    v15 = 0;
    objc_msgSend(v3, "executeStatementString:error:", CFSTR("CREATE TABLE IF NOT EXISTS objects (identifier TEXT NOT NULL, person_id TEXT NOT NULL, source INTEGER NOT NULL DEFAULT 0, expiration_date INTEGER NOT NULL DEFAULT 0, type TEXT NOT NULL, payload TEXT, PRIMARY KEY (identifier, person_id)) WITHOUT ROWID"), &v15);
    v5 = v15;
    if (v5)
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v5;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create objects table [] error=%{public}@", buf, 0xCu);
      }
      v6 = 0;
      goto LABEL_18;
    }
    v14 = 0;
    objc_msgSend(v3, "executeStatementString:error:", CFSTR("CREATE TABLE IF NOT EXISTS assets (identifier TEXT NOT NULL, hashed_person_id TEXT NOT NULL, flavor TEXT NOT NULL, url TEXT NOT NULL, url_expiration_date INTEGER NOT NULL DEFAULT 0, mini_sinf BLOB, sinfs BLOB, PRIMARY KEY (identifier, hashed_person_id, flavor)) WITHOUT ROWID"), &v14);
    v7 = v14;
    v13 = 0;
    objc_msgSend(v3, "executeStatementString:error:", CFSTR("CREATE TABLE IF NOT EXISTS hls_assets (identifier TEXT NOT NULL, hashed_person_id TEXT NOT NULL, url_expiration_date INTEGER NOT NULL DEFAULT 0, playlist_url TEXT NOT NULL, key_certificate_url TEXT, key_server_url TEXT, key_server_adam_id INTEGER NOT NULL DEFAULT 0, key_server_protocol_type TEXT NOT NULL, is_itunes_store_stream INTEGER NOT NULL, PRIMARY KEY (identifier, hashed_person_id)) WITHOUT ROWID"), &v13);
    v8 = v13;
    if (v8)
    {
      v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v8;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create hls assets table [] error=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      v12 = 0;
      objc_msgSend(v3, "executeStatementString:error:", CFSTR("CREATE TABLE IF NOT EXISTS object_relationships (parent_identifier TEXT NOT NULL, child_identifier TEXT NOT_NULL, person_id TEXT NOT NULL, suborder INTEGER NOT NULL DEFAULT 0, child_key TEXT NOT NULL, parent_version_hash TEXT, PRIMARY KEY (parent_identifier, person_id, suborder, child_key)) WITHOUT ROWID"), &v12);
      v9 = v12;
      if (!v9)
      {
        v6 = objc_msgSend(v3, "commit");
        goto LABEL_17;
      }
      v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v9;
        _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create object relationships table [] error=%{public}@", buf, 0xCu);
      }

    }
    v6 = 0;
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_ERROR, "[SOD] _createDatabaseSchema | failed to create transaction [] error=%{public}@", buf, 0xCu);
  }
  v6 = 0;
LABEL_19:

  return v6;
}

id __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.MediaPlayer/ServerObjectDatabases/%@-ServerObjectDatabase.sqlpkg"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "removeItemAtURL:error:", v9, 0);
  objc_msgSend(*(id *)(a1 + 32), "_clearOldDatabasePaths");
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("Database"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v13;
    _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEBUG, "SOD: databasePath: %{public}@", buf, 0xCu);

  }
  v20 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0D0]), "initWithURL:error:", v11, &v20);
  v15 = v20;
  v16 = v15;
  if (!v14 || v15)
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v11, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_FAULT, "SOD: Unable to create server objects database at path=%{public}@ error=%{public}@", buf, 0x16u);

    }
  }

  return v14;
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);

  os_unfair_recursive_lock_unlock();
}

+ (MPServerObjectDatabase)sharedServerObjectDatabase
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServerObjectDatabase_onceToken != -1)
    dispatch_once(&sharedServerObjectDatabase_onceToken, block);
  return (MPServerObjectDatabase *)(id)sharedServerObjectDatabase___sharedServerObjectDatabase;
}

- (id)importObjectsFromRequest:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  id v14;
  NSObject *accessQueue;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  uint8_t v25[16];
  _QWORD v26[5];
  id v27;
  __int128 *v28;
  _QWORD block[5];
  id v30;
  uint64_t *v31;
  __int128 *p_buf;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v10 = os_signpost_id_make_with_pointer(v9, v8);

  v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v14, "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SODImportObjectsFromRequest", " enableTelemetry=YES type=%{public, signpost.telemetry:string1, name=type}s", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__31509;
  v43 = __Block_byref_object_dispose__31510;
  v44 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__31509;
  v38 = __Block_byref_object_dispose__31510;
  v39 = 0;
  accessQueue = self->_accessQueue;
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke;
  block[3] = &unk_1E315C560;
  v33 = a4;
  block[4] = self;
  v31 = &v34;
  v17 = v8;
  v30 = v17;
  p_buf = &buf;
  dispatch_sync(accessQueue, block);
  if (a5)
  {
    v18 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v18)
      *a5 = objc_retainAutorelease(v18);
  }
  v19 = self->_accessQueue;
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_2;
  v26[3] = &unk_1E31635A8;
  v26[4] = self;
  v28 = &buf;
  v20 = v17;
  v27 = v20;
  dispatch_async(v19, v26);
  v21 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v22, OS_SIGNPOST_INTERVAL_END, v10, "SODImportObjectsFromRequest", (const char *)&unk_193F291C9, v25, 2u);
  }

  v23 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  return v23;
}

- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  MPMutablePropertySet *v12;
  void *v13;
  MPMutablePropertySet *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char IsRestricted;
  char v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  MPMutablePropertySet *v26;
  unint64_t v27;

  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(MPMutablePropertySet);
  objc_msgSend(v10, "relationships");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __85__MPServerObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke;
  v25 = &unk_1E315C588;
  v27 = a5;
  v14 = v12;
  v26 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v22);

  -[MPServerObjectDatabase _modelObjectMatchingIdentifierSet:propertySet:error:](self, "_modelObjectMatchingIdentifierSet:propertySet:error:", v11, v14, a6, v22, v23, v24, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_10;
  if ((a5 & 1) == 0)
    goto LABEL_11;
  v16 = objc_msgSend(v15, "type");
  switch(v16)
  {
    case 9:
      objc_msgSend(v15, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IsRestricted = MPModelMovieIsRestricted(v17);
      break;
    case 6:
      objc_msgSend(v15, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IsRestricted = MPModelTVEpisodeIsRestricted(v17);
      break;
    case 1:
      objc_msgSend(v15, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IsRestricted = objc_msgSend(v17, "isExplicitSong");
      break;
    default:
LABEL_11:
      objc_msgSend(v15, "identifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  v19 = IsRestricted;

  if ((v19 & 1) == 0)
    goto LABEL_11;
LABEL_10:
  v20 = 0;
LABEL_12:

  return v20;
}

- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5
{
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  -[MPServerObjectDatabase identifiersMatchingIdentifierSet:propertySet:options:error:](self, "identifiersMatchingIdentifierSet:propertySet:options:error:", a3, a4, a5, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v8)
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "SOD: identifiersMatchingIdentifierSet: returning nil [non-nil error] error=%{public}@", buf, 0xCu);

    }
    objc_msgSend(v8, "domain");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("MPObjectDatabaseError");
    if (v11 == CFSTR("MPObjectDatabaseError"))
    {

    }
    else
    {
      v13 = -[__CFString isEqual:](v11, "isEqual:", CFSTR("MPObjectDatabaseError"));

      if (!v13)
        goto LABEL_11;
    }
    v15 = objc_msgSend(v8, "code");

    if (v15 != 1)
    {
LABEL_12:
      v14 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v8, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MissingPropertySetMappingEntityType"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MissingPropertySetMappingRelationshipKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 256, CFSTR("PropertySet does not contain mapping for identifierSet [] matchingEntityType='%@' relationshipKey=%@"), v11, v18);

LABEL_11:
    goto LABEL_12;
  }
  v14 = v7;
LABEL_13:

  return v14;
}

- (id)modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  -[MPServerObjectDatabase modelObjectMatchingIdentifierSet:propertySet:error:](self, "modelObjectMatchingIdentifierSet:propertySet:error:", a3, a4, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v7)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "SOD: modelObjectMatchingIdentifierSet: returning nil [non-nil error] error=%{public}@", buf, 0xCu);

    }
    objc_msgSend(v7, "domain");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("MPObjectDatabaseError");
    if (v10 == CFSTR("MPObjectDatabaseError"))
    {

    }
    else
    {
      v12 = -[__CFString isEqual:](v10, "isEqual:", CFSTR("MPObjectDatabaseError"));

      if (!v12)
        goto LABEL_11;
    }
    v14 = objc_msgSend(v7, "code");

    if (v14 != 1)
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v7, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MissingPropertySetMappingEntityType"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MissingPropertySetMappingRelationshipKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 276, CFSTR("PropertySet does not contain mapping for identifierSet [] matchingEntityType='%@' relationshipKey=%@"), v10, v17);

LABEL_11:
    goto LABEL_12;
  }
  v13 = v6;
LABEL_13:

  return v13;
}

- (id)relatedIdentifierSetsForParentIdentifierSet:(id)a3 childKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *accessQueue;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  MPServerObjectDatabase *v24;
  id v25;
  id v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "personalizedStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_INFO, "SOD: relatedIdentifierSetsForParentIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    v11 = (id)*MEMORY[0x1E0DDBEC8];
    v9 = v11;
  }
  objc_msgSend(v6, "prioritizedStoreStringIdentifiersForPersonID:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__31509;
    v32 = __Block_byref_object_dispose__31510;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    accessQueue = self->_accessQueue;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __79__MPServerObjectDatabase_relatedIdentifierSetsForParentIdentifierSet_childKey___block_invoke;
    v21 = &unk_1E315C5C8;
    v22 = v9;
    v23 = v12;
    v24 = self;
    v25 = v7;
    v15 = v13;
    v26 = v15;
    v27 = buf;
    dispatch_sync(accessQueue, &v18);
    if (*((_QWORD *)v29 + 5))
      v16 = (void *)MEMORY[0x1E0C9AA60];
    else
      v16 = (void *)objc_msgSend(v15, "copy", v18, v19, v20, v21, v22, v23, v24, v25);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)relatedIdentifierSetsForParentIdentifierSet:(id)a3 parentVersionHash:(id)a4 childKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *accessQueue;
  id v19;
  void *v20;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  MPServerObjectDatabase *v26;
  id v27;
  id v28;
  id v29;
  uint8_t *v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "personalizedStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "length"))
  {
    v14 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_INFO, "SOD: relatedIdentifierSetsForParentIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    v15 = (id)*MEMORY[0x1E0DDBEC8];
    v13 = v15;
  }
  objc_msgSend(v9, "prioritizedStoreStringIdentifiersForPersonID:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 390, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("versionHash != nil"));

    }
    *(_QWORD *)buf = 0;
    v32 = buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__31509;
    v35 = __Block_byref_object_dispose__31510;
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__MPServerObjectDatabase_relatedIdentifierSetsForParentIdentifierSet_parentVersionHash_childKey___block_invoke;
    block[3] = &unk_1E315C5F0;
    v24 = v13;
    v25 = v16;
    v26 = self;
    v27 = v11;
    v28 = v10;
    v19 = v17;
    v29 = v19;
    v30 = buf;
    dispatch_sync(accessQueue, block);
    if (*((_QWORD *)v32 + 5))
      v20 = (void *)MEMORY[0x1E0C9AA60];
    else
      v20 = (void *)objc_msgSend(v19, "copy");

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

- (id)assetsMatchingIdentifierSet:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SODAssetsMatchingIdentifierSet", " enableTelemetry=YES ", buf, 2u);
  }

  -[MPServerObjectDatabase _assetsMatchingIdentifierSet:query:](self, "_assetsMatchingIdentifierSet:query:", v4, CFSTR("SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND url_expiration_date > @now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v6, "SODAssetsMatchingIdentifierSet", (const char *)&unk_193F291C9, v13, 2u);
  }

  return v9;
}

- (id)assetsWithMiniSINFsMatchingIdentifierSet:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SODAssetsWithMiniSINFsMatchingIdentifierSet", " enableTelemetry=YES ", buf, 2u);
  }

  -[MPServerObjectDatabase _assetsMatchingIdentifierSet:query:](self, "_assetsMatchingIdentifierSet:query:", v4, CFSTR("SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND LENGTH(mini_sinf) > 1 AND url_expiration_date > @now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v6, "SODAssetsWithMiniSINFsMatchingIdentifierSet", (const char *)&unk_193F291C9, v13, 2u);
  }

  return v9;
}

- (id)hlsAssetMatchingIdentifierSet:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v6 = os_signpost_id_generate(v5);

  v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SODHLSAssetMatchingIdentifierSet", " enableTelemetry=YES ", buf, 2u);
  }

  -[MPServerObjectDatabase _hlsAssetMatchingIdentifierSet:query:](self, "_hlsAssetMatchingIdentifierSet:query:", v4, CFSTR("SELECT identifier, hashed_person_id, playlist_url, key_certificate_url, key_server_url, key_server_adam_id, key_server_protocol_type, is_itunes_store_stream FROM hls_assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND url_expiration_date > @now"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v11, OS_SIGNPOST_INTERVAL_END, v6, "SODHLSAssetMatchingIdentifierSet", (const char *)&unk_193F291C9, v13, 2u);
  }

  return v9;
}

- (void)enumerateAssetsMissingSINFsForHashedPersonID:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MPServerObjectDatabase_enumerateAssetsMissingSINFsForHashedPersonID_usingBlock___block_invoke;
  block[3] = &unk_1E3161780;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, block);

}

- (BOOL)importAssetsFromRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *accessQueue;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__31509;
  v26 = __Block_byref_object_dispose__31510;
  v27 = 0;
  v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v8 = os_signpost_id_make_with_pointer(v7, v6);

  v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SODImportAssetsFromRequest", " enableTelemetry=YES ", buf, 2u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MPServerObjectDatabase_importAssetsFromRequest_error___block_invoke;
  block[3] = &unk_1E31635A8;
  block[4] = self;
  v12 = v6;
  v19 = v12;
  v20 = &v22;
  dispatch_sync(accessQueue, block);
  if (a4)
  {
    v13 = (void *)v23[5];
    if (v13)
      *a4 = objc_retainAutorelease(v13);
  }
  v14 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193B9B000, v15, OS_SIGNPOST_INTERVAL_END, v8, "SODImportAssetsFromRequest", (const char *)&unk_193F291C9, buf, 2u);
  }

  v16 = v23[5] != 0;
  _Block_object_dispose(&v22, 8);

  return v16;
}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

  os_unfair_recursive_lock_unlock();
}

- (id)payloadForRelatedEntityWithIdentifierSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  objc_msgSend(v4, "personalizedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredStoreStringIdentifierForPersonID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "personalizedStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "length"))
    {
      v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_INFO, "SOD: payloadForRelatedEntityWithIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
      }

      v11 = (id)*MEMORY[0x1E0DDBEC8];
      v9 = v11;
    }
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__31509;
    v24 = __Block_byref_object_dispose__31510;
    v25 = 0;
    accessQueue = self->_accessQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__MPServerObjectDatabase_payloadForRelatedEntityWithIdentifierSet___block_invoke;
    v16[3] = &unk_1E31615D0;
    v16[4] = self;
    v17 = v7;
    v18 = v9;
    v19 = buf;
    v13 = v9;
    dispatch_sync(accessQueue, v16);
    v14 = *((id *)v21 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_assetsMatchingIdentifierSet:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *);
  void *v16;
  MPServerObjectDatabase *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__31509;
  v25 = __Block_byref_object_dispose__31510;
  v26 = (id)MEMORY[0x1E0C9AA60];
  accessQueue = self->_accessQueue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __61__MPServerObjectDatabase__assetsMatchingIdentifierSet_query___block_invoke;
  v16 = &unk_1E31615D0;
  v20 = &v21;
  v17 = self;
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  dispatch_sync(accessQueue, &v13);
  v11 = (void *)objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (id)_hlsAssetMatchingIdentifierSet:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__31509;
  v21 = __Block_byref_object_dispose__31510;
  v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MPServerObjectDatabase__hlsAssetMatchingIdentifierSet_query___block_invoke;
  v13[3] = &unk_1E31615D0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)payloadDataForIdentifierSet:(id)a3 outError:(id *)a4
{
  void *v4;
  void *v5;

  -[MPServerObjectDatabase _payloadForIdentifierSet:outError:](self, "_payloadForIdentifierSet:outError:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_payloadForIdentifierSet:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *accessQueue;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  uint8_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[4];
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__31509;
  v40 = __Block_byref_object_dispose__31510;
  v41 = 0;
  objc_msgSend(v6, "personalizedStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_INFO, "SOD: modelObjectMatchingIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    v10 = (id)*MEMORY[0x1E0DDBEC8];
    v8 = v10;
  }
  objc_msgSend(v6, "prioritizedStoreStringIdentifiersForPersonID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__31509;
    v34 = __Block_byref_object_dispose__31510;
    v35 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__31509;
    v27 = __Block_byref_object_dispose__31510;
    v28 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MPServerObjectDatabase__payloadForIdentifierSet_outError___block_invoke;
    block[3] = &unk_1E315C640;
    block[4] = self;
    v17 = v11;
    v18 = v8;
    v19 = v29;
    v20 = &v23;
    v21 = buf;
    v22 = &v36;
    dispatch_sync(accessQueue, block);
    if (!v24[5])
    {
      if (a4)
      {
        v13 = (void *)*((_QWORD *)v31 + 5);
        if (v13)
          *a4 = objc_retainAutorelease(v13);
      }
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(buf, 8);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 0, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = (id)v37[5];

  _Block_object_dispose(&v36, 8);
  return v14;
}

- (id)_modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  MPStoreItemMetadata *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  MPPropertySet *v24;
  void *v25;
  void *v26;
  MPPropertySet *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  MPStoreModelGenericObjectBuilder *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  MPStoreModelGenericObjectBuilder *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *context;
  MPMediaKitEntityTranslatorContext *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  void *v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t buf[4];
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v67 = 0;
  -[MPServerObjectDatabase _payloadForIdentifierSet:outError:](self, "_payloadForIdentifierSet:outError:", v9, &v67);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v67;
  v13 = v12;
  if (v11 && !v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("source"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PersonID"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PayloadData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v16, 0, &v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v66;
    if (v17)
    {
      v18 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v17;
        _os_log_impl(&dword_193B9B000, v18, OS_LOG_TYPE_FAULT, "SOD: modelObjectMatchingIdentifierSet jsonError: %{public}@", buf, 0xCu);
      }

      v19 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v17);
LABEL_48:

      goto LABEL_49;
    }
    if (v15 && !v65)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabase.m"), 837, CFSTR("Cannot have a source without a payload."));

    }
    v20 = (void *)MEMORY[0x19403A624]();
    if (v15 == 2)
    {
      v57 = v16;
      context = v20;
      +[MPServerObjectDatabaseStorePlatformImportRequest _entityTypeForObject:](MPServerObjectDatabaseStorePlatformImportRequest, "_entityTypeForObject:", v65);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "genericObjectRelationshipKey");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "relationships");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)v31;
      if (v33)
      {
        v19 = -[MPStoreItemMetadata initWithStorePlatformDictionary:]([MPStoreItemMetadata alloc], "initWithStorePlatformDictionary:", v65);
        if (!v19)
        {
          v29 = 0;
          v30 = v60;
          v16 = v57;

LABEL_44:
          v20 = context;
          goto LABEL_45;
        }
        v34 = -[MPStoreModelObjectBuilder initWithRequestedPropertySet:]([MPStoreModelGenericObjectBuilder alloc], "initWithRequestedPropertySet:", v10);
        -[MPStoreModelGenericObjectBuilder setPreventStoreItemMetadataCaching:](v34, "setPreventStoreItemMetadataCaching:", 1);
        v35 = objc_msgSend(v64, "longLongValue");
        v16 = v57;
        v56 = v34;
        if (v35)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v35);
          v36 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = 0;
        }
        v54 = (void *)v36;
        objc_msgSend(MEMORY[0x1E0DDC100], "specificAccountWithDSID:", v36);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (MPMediaKitEntityTranslatorContext *)v19;
        -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](v56, "modelObjectWithStoreItemMetadata:userIdentity:", v19, v48);
        v19 = (MPStoreItemMetadata *)objc_claimAutoreleasedReturnValue();

        if (!v35)
        {
          -[MPStoreItemMetadata identifiers](v19, "identifiers");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v49, "copyWithSource:block:", CFSTR("ServerObjectDatabase"), &__block_literal_global_110);
          v52 = -[MPStoreItemMetadata copyWithIdentifiers:](v19, "copyWithIdentifiers:", v50);

          v19 = (MPStoreItemMetadata *)v52;
        }

        v29 = 0;
        v30 = v60;
        v28 = v56;
LABEL_43:

        goto LABEL_44;
      }
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v68[0] = CFSTR("MissingPropertySetMappingEntityType");
      v30 = v60;
      objc_msgSend(v60, "serverEntityType");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("<null>");
      v62 = (MPMediaKitEntityTranslatorContext *)v44;
      if (v44)
        v46 = (const __CFString *)v44;
      else
        v46 = CFSTR("<null>");
      v68[1] = CFSTR("MissingPropertySetMappingRelationshipKey");
      v69[0] = v46;
      if (v31)
        v45 = (const __CFString *)v31;
      v69[1] = v45;
      v41 = (void *)MEMORY[0x1E0C99D80];
      v42 = v69;
      v43 = v68;
    }
    else
    {
      if (v15 != 1)
      {
        v29 = 0;
        v19 = 0;
LABEL_45:
        objc_autoreleasePoolPop(v20);
        if (a5)
          *a5 = objc_retainAutorelease(v29);

        goto LABEL_48;
      }
      v57 = v16;
      context = v20;
      +[MPServerObjectDatabaseMediaKitImportRequest _entityTypeForObject:](MPServerObjectDatabaseMediaKitImportRequest, "_entityTypeForObject:", v65);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "genericObjectRelationshipKey");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "relationships");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)v21;
      if (v23)
      {
        v62 = objc_alloc_init(MPMediaKitEntityTranslatorContext);
        -[MPMediaKitEntityTranslatorContext setPersonID:](v62, "setPersonID:", v64);
        -[MPMediaKitEntityTranslatorContext setRelationshipPayloadProvider:](v62, "setRelationshipPayloadProvider:", self);
        +[MPBaseEntityTranslator translatorForMPModelClass:](MPMediaKitEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = [MPPropertySet alloc];
        v70 = v21;
        objc_msgSend(v10, "relationships");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[MPPropertySet initWithProperties:relationships:](v24, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v26);

        objc_msgSend(v55, "objectForPropertySet:payload:context:", v27, v65, v62);
        v19 = (MPStoreItemMetadata *)objc_claimAutoreleasedReturnValue();

        v28 = v55;
        v29 = 0;
        v30 = v59;
LABEL_37:
        v16 = v57;
        goto LABEL_43;
      }
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v72[0] = CFSTR("MissingPropertySetMappingEntityType");
      v30 = v59;
      objc_msgSend(v59, "serverEntityType");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("<null>");
      v62 = (MPMediaKitEntityTranslatorContext *)v38;
      if (v38)
        v40 = (const __CFString *)v38;
      else
        v40 = CFSTR("<null>");
      v72[1] = CFSTR("MissingPropertySetMappingRelationshipKey");
      if (v21)
        v39 = (const __CFString *)v21;
      v73[0] = v40;
      v73[1] = v39;
      v41 = (void *)MEMORY[0x1E0C99D80];
      v42 = v73;
      v43 = v72;
    }
    objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 2);
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MPObjectDatabaseError"), 1, v47, CFSTR("Matching object is not supported"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v47;
    v19 = 0;
    goto LABEL_37;
  }
  v19 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v12);
LABEL_49:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __78__MPServerObjectDatabase__modelObjectMatchingIdentifierSet_propertySet_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersonalStoreIdentifiersWithPersonID:block:", *MEMORY[0x1E0DDBEC8], &__block_literal_global_112);
}

void __60__MPServerObjectDatabase__payloadForIdentifierSet_outError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _QWORD v31[3];
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "statementWithString:error:", CFSTR("SELECT source, payload FROM objects WHERE identifier = @identifier AND person_id = @personID"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v27;
    *(_QWORD *)&v4 = 138543362;
    v23 = v4;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(v2, "bindStringValue:toParameterNamed:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), CFSTR("@identifier"), v23);
        objc_msgSend(v2, "bindStringValue:toParameterNamed:", *(_QWORD *)(a1 + 48), CFSTR("@personID"));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resultsForStatement:", v2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v8, "nextObjectWithError:", &v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v25;
        v11 = v25;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v9, "int64ValueAtColumnIndex:", 0);
        objc_msgSend(v9, "jsonDataAtColumnIndex:", 1);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        if (v11)
        {
          v15 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v23;
            v33 = v11;
            _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_FAULT, "SOD: modelObjectMatchingIdentifierSet stepError: %{public}@", buf, 0xCu);
          }

          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v10);
        }
        v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v16)
        {
          v30[0] = CFSTR("PayloadData");
          v30[1] = CFSTR("PersonID");
          v17 = *(_QWORD *)(a1 + 48);
          v18 = *(_QWORD *)(a1 + 56);
          v31[0] = v16;
          v31[1] = v17;
          v30[2] = CFSTR("source");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(v18 + 8) + 24));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31[2] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;

          goto LABEL_15;
        }
        objc_msgSend(v2, "reset");

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

  objc_msgSend(v2, "invalidate");
}

void __63__MPServerObjectDatabase__hlsAssetMatchingIdentifierSet_query___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  MPServerObjectDatabaseHLSAsset *v17;
  void *v18;
  void *v19;
  __int16 v20;
  CC_LONG64 v21;
  CC_LONG64 v22;
  uint64_t v23;
  CC_LONG64 v24;
  CC_LONG64 v25;
  CC_LONG64 v26;
  CC_LONG64 v27;
  CC_LONG64 v28;
  CC_LONG64 v29;
  CC_LONG64 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CC_LONG64 v34;
  CC_LONG64 v35;
  CC_LONG64 v36;
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
  CC_LONG64 v48;
  CC_LONG64 v49;
  uint64_t v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  unsigned int v55;
  CC_LONG64 *v56;
  unint64_t v57;
  int v58;
  unint64_t v59;
  int v60;
  unint64_t v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  _QWORD *v67;
  ldiv_t v68;
  uint64_t v69;
  char *v70;
  const UInt8 *v71;
  unsigned __int8 *v72;
  char *v73;
  char *v74;
  uint64_t m;
  unsigned int v76;
  char *v77;
  id v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  _BYTE *v83;
  unint64_t v84;
  unsigned __int8 *v85;
  char *v86;
  char *v87;
  uint64_t j;
  unsigned int v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t quot;
  lldiv_t v94;
  uint64_t v95;
  CFStringRef v96;
  unsigned __int8 *v97;
  char *v98;
  char *v99;
  uint64_t k;
  unsigned int v101;
  char *v102;
  char *v103;
  uint64_t v104;
  _BYTE *v105;
  unint64_t v106;
  unsigned __int8 *v107;
  char *v108;
  char *v109;
  uint64_t i;
  unsigned int v111;
  char *v112;
  __CFString *v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t n;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  NSObject *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  _QWORD *v132;
  void *v133;
  void *v134;
  id v135;
  id obj;
  MPServerObjectDatabaseHLSAsset *v137;
  void *v138;
  uint8_t buf[8];
  CC_SHA512_CTX v140;
  _OWORD v141[5];
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  id v147[3];
  _QWORD v148[3];

  v1 = a1;
  v148[0] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[5];
  v3 = (void *)a1[6];
  v4 = *(id *)(a1[4] + 16);
  v5 = v2;
  v6 = v3;
  objc_msgSend(v5, "personalizedStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_INFO, "SOD: _MPServerObjectDatabaseHLSAssetsMatchingIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    v10 = (id)*MEMORY[0x1E0DDBEC8];
    v8 = v10;
  }
  objc_msgSend(v5, "prioritizedStoreStringIdentifiersForPersonID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    v17 = 0;
    goto LABEL_133;
  }
  v134 = v11;
  v135 = v6;
  v12 = v8;
  memset(&v140, 0, sizeof(v140));
  *(_QWORD *)buf = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)&v140);
  v13 = objc_retainAutorelease(v12);
  v14 = (_BYTE *)objc_msgSend(v13, "UTF8String");
  v15 = objc_msgSend(v13, "length");
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(_QWORD *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&v140, v14, v15);
      }
      else if (*(_QWORD *)buf == 4512)
      {
        CC_SHA512_Update(&v140, v14, v15);
      }
    }
    else if (*(_QWORD *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v140, v14, v15);
    }
    else if (*(_QWORD *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&v140, v14, v15);
    }
  }
  else if (*(uint64_t *)buf > 2999)
  {
    if (*(_QWORD *)buf == 3000)
    {
      _MSV_XXH_XXH32_update_10929(&v140, v14, v15);
    }
    else if (*(_QWORD *)buf == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v140, v14, v15);
    }
  }
  else if (*(_QWORD *)buf)
  {
    if (*(_QWORD *)buf == 2000)
    {
      v16 = (char *)&v140.hash[-1] + BYTE3(v140.count[1]);
      switch((((_BYTE)v15 + BYTE3(v140.count[1])) & 3) - BYTE3(v140.count[1]))
      {
        case 0:
          break;
        case 1:
          *v16 = *v14;
          break;
        case 2:
          v20 = *(_WORD *)v14;
          goto LABEL_30;
        case 3:
          v20 = *(_WORD *)v14;
          *((_BYTE *)&v140.count[1] + BYTE3(v140.count[1]) + 2) = v14[2];
LABEL_30:
          *(_WORD *)v16 = v20;
          break;
        default:
          memcpy(v16, v14, (((v15 + BYTE3(v140.count[1])) & 3) - BYTE3(v140.count[1])));
          break;
      }
      HIDWORD(v140.count[0]) += v15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

  }
  memset((char *)v141 + 8, 0, 64);
  *(_QWORD *)&v141[0] = *(_QWORD *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    v11 = v134;
    if (*(uint64_t *)buf <= 4000)
    {
      if (*(_QWORD *)buf == 3001)
      {
        *((_QWORD *)&v141[0] + 1) = _MSV_XXH_XXH64_digest(&v140);
      }
      else if (*(_QWORD *)buf == 4000)
      {
        CC_MD5_Final((unsigned __int8 *)v141 + 8, (CC_MD5_CTX *)&v140);
      }
    }
    else
    {
      switch(*(_QWORD *)buf)
      {
        case 0xFA1:
          CC_SHA1_Final((unsigned __int8 *)v141 + 8, (CC_SHA1_CTX *)&v140);
          break;
        case 0x10A0:
          CC_SHA256_Final((unsigned __int8 *)v141 + 8, (CC_SHA256_CTX *)&v140);
          break;
        case 0x11A0:
          CC_SHA512_Final((unsigned __int8 *)v141 + 8, &v140);
          break;
      }
    }
    goto LABEL_69;
  }
  v11 = v134;
  if (*(uint64_t *)buf > 1999)
  {
    if (*(_QWORD *)buf != 2000)
    {
      if (*(_QWORD *)buf != 3000)
        goto LABEL_69;
      if (HIDWORD(v140.count[0]))
        v51 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v140.count[1], (uint32x4_t)xmmword_193F0CA90), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v140.count[1], (uint32x4_t)xmmword_193F0CA80)));
      else
        v51 = LODWORD(v140.hash[0]) + 374761393;
      v55 = LODWORD(v140.count[0]) + v51;
      v56 = &v140.hash[1];
      v57 = v140.hash[3] & 0xF;
      if (v57 >= 4)
      {
        do
        {
          v58 = *(_DWORD *)v56;
          v56 = (CC_LONG64 *)((char *)v56 + 4);
          HIDWORD(v59) = v55 - 1028477379 * v58;
          LODWORD(v59) = HIDWORD(v59);
          v55 = 668265263 * (v59 >> 15);
          v57 -= 4;
        }
        while (v57 > 3);
      }
      for (; v57; --v57)
      {
        v60 = *(unsigned __int8 *)v56;
        v56 = (CC_LONG64 *)((char *)v56 + 1);
        HIDWORD(v61) = v55 + 374761393 * v60;
        LODWORD(v61) = HIDWORD(v61);
        v55 = -1640531535 * (v61 >> 21);
      }
      v62 = (-2048144777 * (v55 ^ (v55 >> 15))) ^ ((-2048144777 * (v55 ^ (v55 >> 15))) >> 13);
      v63 = (-1028477379 * v62) ^ ((-1028477379 * v62) >> 16);
      goto LABEL_68;
    }
    switch(BYTE3(v140.count[1]))
    {
      case 1u:
        v54 = LOBYTE(v140.count[1]);
        break;
      case 2u:
        v54 = LOWORD(v140.count[1]);
        break;
      case 3u:
        v54 = LOWORD(v140.count[1]) | (BYTE2(v140.count[1]) << 16);
        break;
      default:
        v64 = v140.count[0];
        goto LABEL_67;
    }
    v64 = (461845907 * ((380141568 * v54) | ((-862048943 * v54) >> 17))) ^ LODWORD(v140.count[0]);
LABEL_67:
    v65 = -2048144789 * (HIDWORD(v140.count[0]) ^ v64 ^ ((HIDWORD(v140.count[0]) ^ v64) >> 16));
    v63 = (-1028477387 * (v65 ^ (v65 >> 13))) ^ ((-1028477387 * (v65 ^ (v65 >> 13))) >> 16);
    LODWORD(v140.count[0]) = v63;
LABEL_68:
    DWORD2(v141[0]) = v63;
    goto LABEL_69;
  }
  if (*(_QWORD *)buf)
  {
    if (*(_QWORD *)buf == 1000)
    {
      v21 = (v140.count[0] + v140.count[1]) ^ __ROR8__(v140.count[1], 51);
      v22 = v140.hash[0] + (v140.hash[1] ^ v140.hash[2]);
      v23 = __ROR8__(v140.hash[1] ^ v140.hash[2], 48);
      v24 = (v22 ^ v23) + __ROR8__(v140.count[0] + v140.count[1], 32);
      v25 = v24 ^ __ROR8__(v22 ^ v23, 43);
      v26 = v22 + v21;
      v27 = v26 ^ __ROR8__(v21, 47);
      v28 = (v24 ^ v140.hash[2]) + v27;
      v29 = v28 ^ __ROR8__(v27, 51);
      v30 = (__ROR8__(v26, 32) ^ 0xFFLL) + v25;
      v31 = __ROR8__(v25, 48);
      v32 = __ROR8__(v28, 32) + (v30 ^ v31);
      v33 = v32 ^ __ROR8__(v30 ^ v31, 43);
      v34 = v29 + v30;
      v35 = v34 ^ __ROR8__(v29, 47);
      v36 = v35 + v32;
      v37 = v36 ^ __ROR8__(v35, 51);
      v38 = __ROR8__(v34, 32) + v33;
      v39 = __ROR8__(v33, 48);
      v40 = __ROR8__(v36, 32) + (v38 ^ v39);
      v41 = v40 ^ __ROR8__(v38 ^ v39, 43);
      v42 = v37 + v38;
      v43 = v42 ^ __ROR8__(v37, 47);
      v44 = v43 + v40;
      v45 = v44 ^ __ROR8__(v43, 51);
      v46 = __ROR8__(v42, 32) + v41;
      v47 = __ROR8__(v41, 48);
      v48 = __ROR8__(v44, 32) + (v46 ^ v47);
      v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
      v50 = v45 + v46;
      v140.count[0] = v48;
      v140.count[1] = v50 ^ __ROR8__(v45, 47);
      v140.hash[0] = __ROR8__(v50, 32);
      v140.hash[1] = v49;
      *((_QWORD *)&v141[0] + 1) = v140.count[1] ^ v48 ^ v140.hash[0] ^ v49;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

  }
LABEL_69:
  v142 = v141[0];
  v143 = v141[1];
  v144 = v141[2];
  v145 = v141[3];
  v146 = *(_QWORD *)&v141[4];
  v133 = v8;
  if (*(uint64_t *)&v141[0] > 3999)
  {
    if (*(uint64_t *)&v141[0] > 4255)
    {
      if (*(_QWORD *)&v141[0] == 4256)
      {
        v107 = (unsigned __int8 *)&v142 + 8;
        v108 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v109 = v108;
        for (i = 0; i != 64; i += 2)
        {
          v111 = *v107++;
          v112 = &v108[i];
          *v112 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v111 >> 4];
          v112[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v111 & 0xF];
        }
        v78 = objc_alloc(MEMORY[0x1E0CB3940]);
        v79 = v109;
        v80 = 64;
      }
      else
      {
        if (*(_QWORD *)&v141[0] != 4512)
          goto LABEL_134;
        v85 = (unsigned __int8 *)&v142 + 8;
        v86 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v87 = v86;
        for (j = 0; j != 128; j += 2)
        {
          v89 = *v85++;
          v90 = &v86[j];
          *v90 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v89 >> 4];
          v90[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v89 & 0xF];
        }
        v78 = objc_alloc(MEMORY[0x1E0CB3940]);
        v79 = v87;
        v80 = 128;
      }
    }
    else if (*(_QWORD *)&v141[0] == 4000)
    {
      v97 = (unsigned __int8 *)&v142 + 8;
      v98 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v99 = v98;
      for (k = 0; k != 32; k += 2)
      {
        v101 = *v97++;
        v102 = &v98[k];
        *v102 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v101 >> 4];
        v102[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v101 & 0xF];
      }
      v78 = objc_alloc(MEMORY[0x1E0CB3940]);
      v79 = v99;
      v80 = 32;
    }
    else
    {
      if (*(_QWORD *)&v141[0] != 4001)
        goto LABEL_134;
      v72 = (unsigned __int8 *)&v142 + 8;
      v73 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v74 = v73;
      for (m = 0; m != 40; m += 2)
      {
        v76 = *v72++;
        v77 = &v73[m];
        *v77 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v76 >> 4];
        v77[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v76 & 0xF];
      }
      v78 = objc_alloc(MEMORY[0x1E0CB3940]);
      v79 = v74;
      v80 = 40;
    }
LABEL_113:
    v96 = (CFStringRef)objc_msgSend(v78, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v79, v80, 4, 1);
    goto LABEL_114;
  }
  if (*(uint64_t *)&v141[0] > 2999)
  {
    if (*(_QWORD *)&v141[0] == 3000)
    {
      LODWORD(v147[0]) = bswap32(DWORD2(v142));
      v103 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v104 = 0;
      v105 = v103 + 1;
      do
      {
        v106 = *((unsigned __int8 *)v147 + v104);
        *(v105 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v106 >> 4];
        *v105 = MSVFastHexStringFromBytes_hexCharacters_47995[v106 & 0xF];
        v105 += 2;
        ++v104;
      }
      while (v104 != 4);
      v78 = objc_alloc(MEMORY[0x1E0CB3940]);
      v79 = v103;
      v80 = 8;
    }
    else
    {
      if (*(_QWORD *)&v141[0] != 3001)
        goto LABEL_134;
      v147[0] = (id)bswap64(*((unint64_t *)&v142 + 1));
      v81 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v82 = 0;
      v83 = v81 + 1;
      do
      {
        v84 = *((unsigned __int8 *)v147 + v82);
        *(v83 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v84 >> 4];
        *v83 = MSVFastHexStringFromBytes_hexCharacters_47995[v84 & 0xF];
        v83 += 2;
        ++v82;
      }
      while (v82 != 8);
      v78 = objc_alloc(MEMORY[0x1E0CB3940]);
      v79 = v81;
      v80 = 16;
    }
    goto LABEL_113;
  }
  if (*(_QWORD *)&v141[0] == 1000)
  {
    v91 = *((_QWORD *)&v142 + 1);
    v92 = (char *)v148 + 1;
    quot = *((_QWORD *)&v142 + 1);
    do
    {
      v94 = lldiv(quot, 10);
      quot = v94.quot;
      if (v94.rem >= 0)
        LOBYTE(v95) = v94.rem;
      else
        v95 = -v94.rem;
      *(v92 - 2) = v95 + 48;
      v71 = (const UInt8 *)(v92 - 2);
      --v92;
    }
    while (v94.quot);
    if (v91 < 0)
    {
      *(v92 - 2) = 45;
      v71 = (const UInt8 *)(v92 - 2);
    }
    v70 = (char *)((char *)v148 - (char *)v71);
    goto LABEL_103;
  }
  if (*(_QWORD *)&v141[0] != 2000)
  {
LABEL_134:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "handleFailureInFunction:file:lineNumber:description:", v130, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v113 = &stru_1E3163D10;
    goto LABEL_115;
  }
  v66 = DWORD2(v142);
  v67 = v148;
  do
  {
    v68 = ldiv(v66, 10);
    v66 = v68.quot;
    if (v68.rem >= 0)
      LOBYTE(v69) = v68.rem;
    else
      v69 = -v68.rem;
    *((_BYTE *)v67 - 1) = v69 + 48;
    v67 = (_QWORD *)((char *)v67 - 1);
  }
  while (v68.quot);
  v70 = (char *)((char *)v148 - (char *)v67);
  v71 = (const UInt8 *)v67;
LABEL_103:
  v96 = CFStringCreateWithBytes(0, v71, (CFIndex)v70, 0x8000100u, 0);
LABEL_114:
  v113 = (__CFString *)v96;
LABEL_115:

  -[__CFString substringToIndex:](v113, "substringToIndex:", 7);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v115 = v114;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  obj = v11;
  v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, buf, 16);
  if (v116)
  {
    v117 = v116;
    v131 = v5;
    v132 = v1;
    v118 = *(_QWORD *)v143;
    while (2)
    {
      for (n = 0; n != v117; ++n)
      {
        if (*(_QWORD *)v143 != v118)
          objc_enumerationMutation(obj);
        v120 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * n);
        objc_msgSend(v4, "statementWithString:error:", v6, 0, v131, v132);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "bindStringValue:toParameterNamed:", v120, CFSTR("@identifier"));
        objc_msgSend(v121, "bindStringValue:toParameterNamed:", v138, CFSTR("@hashedPersonID"));
        objc_msgSend(v121, "bindInt64Value:toParameterNamed:", (uint64_t)v115, CFSTR("@now"));
        objc_msgSend(v4, "resultsForStatement:", v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v147[0] = 0;
        objc_msgSend(v122, "nextObjectWithError:", v147);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = v147[0];
        if (v123)
        {
          v137 = -[MPServerObjectDatabaseHLSAsset initWithSQLRowResult:]([MPServerObjectDatabaseHLSAsset alloc], "initWithSQLRowResult:", v123);
        }
        else
        {
          objc_msgSend(v121, "invalidate");
          if (v124)
          {
            v125 = v4;
            v126 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
            if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT))
            {
              LODWORD(v141[0]) = 138543618;
              *(_QWORD *)((char *)v141 + 4) = v135;
              WORD6(v141[0]) = 2114;
              *(_QWORD *)((char *)v141 + 14) = v124;
              _os_log_impl(&dword_193B9B000, v126, OS_LOG_TYPE_FAULT, "SOD: _MPServerObjectDatabaseAssetsMatchingIdentifierSet query='%{public}@' stepError=%{public}@", (uint8_t *)v141, 0x16u);
            }

            v4 = v125;
            v6 = v135;
          }
        }

        if (v123)
        {
          v5 = v131;
          v1 = v132;
          v11 = v134;
          v17 = v137;
          goto LABEL_132;
        }
      }
      v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, buf, 16);
      if (v117)
        continue;
      break;
    }
    v17 = 0;
    v5 = v131;
    v1 = v132;
    v11 = v134;
  }
  else
  {
    v17 = 0;
  }
LABEL_132:

  v8 = v133;
LABEL_133:

  v127 = *(_QWORD *)(v1[7] + 8);
  v128 = *(void **)(v127 + 40);
  *(_QWORD *)(v127 + 40) = v17;

}

void __61__MPServerObjectDatabase__assetsMatchingIdentifierSet_query___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __int16 v21;
  CC_LONG64 v22;
  CC_LONG64 v23;
  uint64_t v24;
  CC_LONG64 v25;
  CC_LONG64 v26;
  CC_LONG64 v27;
  CC_LONG64 v28;
  CC_LONG64 v29;
  CC_LONG64 v30;
  CC_LONG64 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CC_LONG64 v35;
  CC_LONG64 v36;
  CC_LONG64 v37;
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
  uint64_t v48;
  CC_LONG64 v49;
  CC_LONG64 v50;
  uint64_t v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  unsigned int v56;
  CC_LONG64 *v57;
  unint64_t v58;
  int v59;
  unint64_t v60;
  int v61;
  unint64_t v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  _QWORD *v68;
  ldiv_t v69;
  uint64_t v70;
  char *v71;
  const UInt8 *v72;
  unsigned __int8 *v73;
  char *v74;
  char *v75;
  uint64_t m;
  unsigned int v77;
  char *v78;
  id v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  _BYTE *v84;
  unint64_t v85;
  unsigned __int8 *v86;
  char *v87;
  char *v88;
  uint64_t j;
  unsigned int v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t quot;
  lldiv_t v95;
  uint64_t v96;
  CFStringRef v97;
  unsigned __int8 *v98;
  char *v99;
  char *v100;
  uint64_t k;
  unsigned int v102;
  char *v103;
  char *v104;
  uint64_t v105;
  _BYTE *v106;
  unint64_t v107;
  unsigned __int8 *v108;
  char *v109;
  char *v110;
  uint64_t i;
  unsigned int v112;
  char *v113;
  __CFString *v114;
  double v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  BOOL n;
  void *v127;
  MPServerObjectDatabaseAsset *v128;
  NSObject *v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  _QWORD *v141;
  id obj;
  uint64_t v143;
  void *v144;
  id v145;
  id v146;
  uint8_t buf[8];
  CC_SHA512_CTX v148;
  _OWORD v149[5];
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  uint64_t v154;
  id v155[3];
  _QWORD v156[3];

  v1 = a1;
  v156[0] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[5];
  v3 = (void *)a1[6];
  v145 = *(id *)(a1[4] + 16);
  v4 = v2;
  v146 = v3;
  objc_msgSend(v4, "personalizedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_INFO, "SOD: _MPServerObjectDatabaseAssetsMatchingIdentifierSet [missing personID, defaulting to 'Unknown-PersonID']", buf, 2u);
    }

    v8 = (id)*MEMORY[0x1E0DDBEC8];
    v6 = v8;
  }
  objc_msgSend(v4, "prioritizedStoreStringIdentifiersForPersonID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = MEMORY[0x1E0C9AA60];
  if (!v10)
  {
    v17 = 0;
    v18 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_134;
  }
  v12 = v6;
  memset(&v148, 0, sizeof(v148));
  *(_QWORD *)buf = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)&v148);
  v13 = objc_retainAutorelease(v12);
  v14 = (_BYTE *)objc_msgSend(v13, "UTF8String");
  v15 = objc_msgSend(v13, "length");
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(_QWORD *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&v148, v14, v15);
      }
      else if (*(_QWORD *)buf == 4512)
      {
        CC_SHA512_Update(&v148, v14, v15);
      }
    }
    else if (*(_QWORD *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v148, v14, v15);
    }
    else if (*(_QWORD *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&v148, v14, v15);
    }
  }
  else if (*(uint64_t *)buf > 2999)
  {
    if (*(_QWORD *)buf == 3000)
    {
      _MSV_XXH_XXH32_update_10929(&v148, v14, v15);
    }
    else if (*(_QWORD *)buf == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v148, v14, v15);
    }
  }
  else if (*(_QWORD *)buf)
  {
    if (*(_QWORD *)buf == 2000)
    {
      v16 = (char *)&v148.hash[-1] + BYTE3(v148.count[1]);
      switch((((_BYTE)v15 + BYTE3(v148.count[1])) & 3) - BYTE3(v148.count[1]))
      {
        case 0:
          break;
        case 1:
          *v16 = *v14;
          break;
        case 2:
          v21 = *(_WORD *)v14;
          goto LABEL_30;
        case 3:
          v21 = *(_WORD *)v14;
          *((_BYTE *)&v148.count[1] + BYTE3(v148.count[1]) + 2) = v14[2];
LABEL_30:
          *(_WORD *)v16 = v21;
          break;
        default:
          memcpy(v16, v14, (((v15 + BYTE3(v148.count[1])) & 3) - BYTE3(v148.count[1])));
          break;
      }
      HIDWORD(v148.count[0]) += v15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

  }
  memset((char *)v149 + 8, 0, 64);
  *(_QWORD *)&v149[0] = *(_QWORD *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    if (*(uint64_t *)buf <= 4000)
    {
      if (*(_QWORD *)buf == 3001)
      {
        *((_QWORD *)&v149[0] + 1) = _MSV_XXH_XXH64_digest(&v148);
      }
      else if (*(_QWORD *)buf == 4000)
      {
        CC_MD5_Final((unsigned __int8 *)v149 + 8, (CC_MD5_CTX *)&v148);
      }
    }
    else
    {
      switch(*(_QWORD *)buf)
      {
        case 0xFA1:
          CC_SHA1_Final((unsigned __int8 *)v149 + 8, (CC_SHA1_CTX *)&v148);
          break;
        case 0x10A0:
          CC_SHA256_Final((unsigned __int8 *)v149 + 8, (CC_SHA256_CTX *)&v148);
          break;
        case 0x11A0:
          CC_SHA512_Final((unsigned __int8 *)v149 + 8, &v148);
          break;
      }
    }
    goto LABEL_69;
  }
  if (*(uint64_t *)buf > 1999)
  {
    if (*(_QWORD *)buf != 2000)
    {
      if (*(_QWORD *)buf != 3000)
        goto LABEL_69;
      if (HIDWORD(v148.count[0]))
        v52 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v148.count[1], (uint32x4_t)xmmword_193F0CA90), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v148.count[1], (uint32x4_t)xmmword_193F0CA80)));
      else
        v52 = LODWORD(v148.hash[0]) + 374761393;
      v56 = LODWORD(v148.count[0]) + v52;
      v57 = &v148.hash[1];
      v58 = v148.hash[3] & 0xF;
      if (v58 >= 4)
      {
        do
        {
          v59 = *(_DWORD *)v57;
          v57 = (CC_LONG64 *)((char *)v57 + 4);
          HIDWORD(v60) = v56 - 1028477379 * v59;
          LODWORD(v60) = HIDWORD(v60);
          v56 = 668265263 * (v60 >> 15);
          v58 -= 4;
        }
        while (v58 > 3);
      }
      for (; v58; --v58)
      {
        v61 = *(unsigned __int8 *)v57;
        v57 = (CC_LONG64 *)((char *)v57 + 1);
        HIDWORD(v62) = v56 + 374761393 * v61;
        LODWORD(v62) = HIDWORD(v62);
        v56 = -1640531535 * (v62 >> 21);
      }
      v63 = (-2048144777 * (v56 ^ (v56 >> 15))) ^ ((-2048144777 * (v56 ^ (v56 >> 15))) >> 13);
      v64 = (-1028477379 * v63) ^ ((-1028477379 * v63) >> 16);
      goto LABEL_68;
    }
    switch(BYTE3(v148.count[1]))
    {
      case 1u:
        v55 = LOBYTE(v148.count[1]);
        break;
      case 2u:
        v55 = LOWORD(v148.count[1]);
        break;
      case 3u:
        v55 = LOWORD(v148.count[1]) | (BYTE2(v148.count[1]) << 16);
        break;
      default:
        v65 = v148.count[0];
        goto LABEL_67;
    }
    v65 = (461845907 * ((380141568 * v55) | ((-862048943 * v55) >> 17))) ^ LODWORD(v148.count[0]);
LABEL_67:
    v66 = -2048144789 * (HIDWORD(v148.count[0]) ^ v65 ^ ((HIDWORD(v148.count[0]) ^ v65) >> 16));
    v64 = (-1028477387 * (v66 ^ (v66 >> 13))) ^ ((-1028477387 * (v66 ^ (v66 >> 13))) >> 16);
    LODWORD(v148.count[0]) = v64;
LABEL_68:
    DWORD2(v149[0]) = v64;
    goto LABEL_69;
  }
  if (*(_QWORD *)buf)
  {
    if (*(_QWORD *)buf == 1000)
    {
      v22 = (v148.count[0] + v148.count[1]) ^ __ROR8__(v148.count[1], 51);
      v23 = v148.hash[0] + (v148.hash[1] ^ v148.hash[2]);
      v24 = __ROR8__(v148.hash[1] ^ v148.hash[2], 48);
      v25 = (v23 ^ v24) + __ROR8__(v148.count[0] + v148.count[1], 32);
      v26 = v25 ^ __ROR8__(v23 ^ v24, 43);
      v27 = v23 + v22;
      v28 = v27 ^ __ROR8__(v22, 47);
      v29 = (v25 ^ v148.hash[2]) + v28;
      v30 = v29 ^ __ROR8__(v28, 51);
      v31 = (__ROR8__(v27, 32) ^ 0xFFLL) + v26;
      v32 = __ROR8__(v26, 48);
      v33 = __ROR8__(v29, 32) + (v31 ^ v32);
      v34 = v33 ^ __ROR8__(v31 ^ v32, 43);
      v35 = v30 + v31;
      v36 = v35 ^ __ROR8__(v30, 47);
      v37 = v36 + v33;
      v38 = v37 ^ __ROR8__(v36, 51);
      v39 = __ROR8__(v35, 32) + v34;
      v40 = __ROR8__(v34, 48);
      v41 = __ROR8__(v37, 32) + (v39 ^ v40);
      v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
      v43 = v38 + v39;
      v44 = v43 ^ __ROR8__(v38, 47);
      v45 = v44 + v41;
      v46 = v45 ^ __ROR8__(v44, 51);
      v47 = __ROR8__(v43, 32) + v42;
      v48 = __ROR8__(v42, 48);
      v49 = __ROR8__(v45, 32) + (v47 ^ v48);
      v50 = v49 ^ __ROR8__(v47 ^ v48, 43);
      v51 = v46 + v47;
      v148.count[0] = v49;
      v148.count[1] = v51 ^ __ROR8__(v46, 47);
      v148.hash[0] = __ROR8__(v51, 32);
      v148.hash[1] = v50;
      *((_QWORD *)&v149[0] + 1) = v148.count[1] ^ v49 ^ v148.hash[0] ^ v50;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

  }
LABEL_69:
  v150 = v149[0];
  v151 = v149[1];
  v152 = v149[2];
  v153 = v149[3];
  v154 = *(_QWORD *)&v149[4];
  v141 = v1;
  if (*(uint64_t *)&v149[0] > 3999)
  {
    if (*(uint64_t *)&v149[0] > 4255)
    {
      if (*(_QWORD *)&v149[0] == 4256)
      {
        v108 = (unsigned __int8 *)&v150 + 8;
        v109 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v110 = v109;
        for (i = 0; i != 64; i += 2)
        {
          v112 = *v108++;
          v113 = &v109[i];
          *v113 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v112 >> 4];
          v113[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v112 & 0xF];
        }
        v79 = objc_alloc(MEMORY[0x1E0CB3940]);
        v80 = v110;
        v81 = 64;
      }
      else
      {
        if (*(_QWORD *)&v149[0] != 4512)
          goto LABEL_137;
        v86 = (unsigned __int8 *)&v150 + 8;
        v87 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v88 = v87;
        for (j = 0; j != 128; j += 2)
        {
          v90 = *v86++;
          v91 = &v87[j];
          *v91 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v90 >> 4];
          v91[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v90 & 0xF];
        }
        v79 = objc_alloc(MEMORY[0x1E0CB3940]);
        v80 = v88;
        v81 = 128;
      }
    }
    else if (*(_QWORD *)&v149[0] == 4000)
    {
      v98 = (unsigned __int8 *)&v150 + 8;
      v99 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v100 = v99;
      for (k = 0; k != 32; k += 2)
      {
        v102 = *v98++;
        v103 = &v99[k];
        *v103 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v102 >> 4];
        v103[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v102 & 0xF];
      }
      v79 = objc_alloc(MEMORY[0x1E0CB3940]);
      v80 = v100;
      v81 = 32;
    }
    else
    {
      if (*(_QWORD *)&v149[0] != 4001)
        goto LABEL_137;
      v73 = (unsigned __int8 *)&v150 + 8;
      v74 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v75 = v74;
      for (m = 0; m != 40; m += 2)
      {
        v77 = *v73++;
        v78 = &v74[m];
        *v78 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v77 >> 4];
        v78[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v77 & 0xF];
      }
      v79 = objc_alloc(MEMORY[0x1E0CB3940]);
      v80 = v75;
      v81 = 40;
    }
LABEL_113:
    v97 = (CFStringRef)objc_msgSend(v79, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v80, v81, 4, 1);
    goto LABEL_114;
  }
  if (*(uint64_t *)&v149[0] > 2999)
  {
    if (*(_QWORD *)&v149[0] == 3000)
    {
      LODWORD(v155[0]) = bswap32(DWORD2(v150));
      v104 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v105 = 0;
      v106 = v104 + 1;
      do
      {
        v107 = *((unsigned __int8 *)v155 + v105);
        *(v106 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v107 >> 4];
        *v106 = MSVFastHexStringFromBytes_hexCharacters_47995[v107 & 0xF];
        v106 += 2;
        ++v105;
      }
      while (v105 != 4);
      v79 = objc_alloc(MEMORY[0x1E0CB3940]);
      v80 = v104;
      v81 = 8;
    }
    else
    {
      if (*(_QWORD *)&v149[0] != 3001)
        goto LABEL_137;
      v155[0] = (id)bswap64(*((unint64_t *)&v150 + 1));
      v82 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v83 = 0;
      v84 = v82 + 1;
      do
      {
        v85 = *((unsigned __int8 *)v155 + v83);
        *(v84 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v85 >> 4];
        *v84 = MSVFastHexStringFromBytes_hexCharacters_47995[v85 & 0xF];
        v84 += 2;
        ++v83;
      }
      while (v83 != 8);
      v79 = objc_alloc(MEMORY[0x1E0CB3940]);
      v80 = v82;
      v81 = 16;
    }
    goto LABEL_113;
  }
  if (*(_QWORD *)&v149[0] == 1000)
  {
    v92 = *((_QWORD *)&v150 + 1);
    v93 = (char *)v156 + 1;
    quot = *((_QWORD *)&v150 + 1);
    do
    {
      v95 = lldiv(quot, 10);
      quot = v95.quot;
      if (v95.rem >= 0)
        LOBYTE(v96) = v95.rem;
      else
        v96 = -v95.rem;
      *(v93 - 2) = v96 + 48;
      v72 = (const UInt8 *)(v93 - 2);
      --v93;
    }
    while (v95.quot);
    if (v92 < 0)
    {
      *(v93 - 2) = 45;
      v72 = (const UInt8 *)(v93 - 2);
    }
    v71 = (char *)((char *)v156 - (char *)v72);
    goto LABEL_103;
  }
  if (*(_QWORD *)&v149[0] != 2000)
  {
LABEL_137:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "handleFailureInFunction:file:lineNumber:description:", v137, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v114 = &stru_1E3163D10;
    goto LABEL_115;
  }
  v67 = DWORD2(v150);
  v68 = v156;
  do
  {
    v69 = ldiv(v67, 10);
    v67 = v69.quot;
    if (v69.rem >= 0)
      LOBYTE(v70) = v69.rem;
    else
      v70 = -v69.rem;
    *((_BYTE *)v68 - 1) = v70 + 48;
    v68 = (_QWORD *)((char *)v68 - 1);
  }
  while (v69.quot);
  v71 = (char *)((char *)v156 - (char *)v68);
  v72 = (const UInt8 *)v68;
LABEL_103:
  v97 = CFStringCreateWithBytes(0, v72, (CFIndex)v71, 0x8000100u, 0);
LABEL_114:
  v114 = (__CFString *)v97;
LABEL_115:
  v139 = v6;
  v140 = v4;

  -[__CFString substringToIndex:](v114, "substringToIndex:", 7);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v116 = v115;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v138 = v9;
  obj = v9;
  v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, buf, 16);
  if (v117)
  {
    v118 = v117;
    v17 = 0;
    v143 = *(_QWORD *)v151;
LABEL_117:
    v119 = 0;
    while (1)
    {
      if (*(_QWORD *)v151 != v143)
        objc_enumerationMutation(obj);
      v120 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * v119);
      objc_msgSend(v145, "statementWithString:error:", v146, 0, v138);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "bindStringValue:toParameterNamed:", v120, CFSTR("@identifier"));
      objc_msgSend(v121, "bindStringValue:toParameterNamed:", v144, CFSTR("@hashedPersonID"));
      objc_msgSend(v121, "bindInt64Value:toParameterNamed:", (uint64_t)v116, CFSTR("@now"));
      objc_msgSend(v145, "resultsForStatement:", v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v155[0] = 0;
      objc_msgSend(v122, "nextObjectWithError:", v155);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v155[0];
      v125 = v124;
      for (n = v124 == 0; v123 && !v125; n = v125 == 0)
      {
        v127 = v123;
        v128 = -[MPServerObjectDatabaseAsset initWithSQLRowResult:]([MPServerObjectDatabaseAsset alloc], "initWithSQLRowResult:", v123);
        objc_msgSend(v18, "addObject:", v128);

        v155[0] = 0;
        objc_msgSend(v122, "nextObjectWithError:", v155);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = v155[0];

      }
      objc_msgSend(v121, "invalidate");
      if (!n)
      {
        v129 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
        {
          LODWORD(v149[0]) = 138543618;
          *(_QWORD *)((char *)v149 + 4) = v146;
          WORD6(v149[0]) = 2114;
          *(_QWORD *)((char *)v149 + 14) = v125;
          _os_log_impl(&dword_193B9B000, v129, OS_LOG_TYPE_FAULT, "SOD: _MPServerObjectDatabaseAssetsMatchingIdentifierSet query='%{public}@' stepError=%{public}@", (uint8_t *)v149, 0x16u);
        }

        v17 = objc_retainAutorelease(v125);
      }
      v130 = objc_msgSend(v18, "count");

      if (v130)
        break;
      if (++v119 == v118)
      {
        v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v150, buf, 16);
        if (v118)
          goto LABEL_117;
        break;
      }
    }
  }
  else
  {
    v17 = 0;
  }

  v4 = v140;
  v1 = v141;
  v9 = v138;
  v6 = v139;
  v11 = MEMORY[0x1E0C9AA60];
LABEL_134:

  v131 = v17;
  v132 = *(_QWORD *)(v1[7] + 8);
  v133 = *(void **)(v132 + 40);
  *(_QWORD *)(v132 + 40) = v18;

  if (v131)
  {
    v134 = *(_QWORD *)(v1[7] + 8);
    v135 = *(void **)(v134 + 40);
    *(_QWORD *)(v134 + 40) = v11;

  }
}

void __67__MPServerObjectDatabase_payloadForRelatedEntityWithIdentifierSet___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 16), "statementWithString:error:", CFSTR("SELECT payload FROM objects WHERE identifier = @identifier AND person_id = @personID AND source = @source LIMIT 1"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bindStringValue:toParameterNamed:", a1[5], CFSTR("@identifier"));
  objc_msgSend(v2, "bindStringValue:toParameterNamed:", a1[6], CFSTR("@personID"));
  objc_msgSend(v2, "bindInt64Value:toParameterNamed:", 1, CFSTR("@source"));
  objc_msgSend(*(id *)(a1[4] + 16), "resultsForStatement:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "nextObjectWithError:", &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v12 = 0;
  objc_msgSend(v4, "jsonValueAtColumnIndex:error:", 0, &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  objc_msgSend(v2, "invalidate");
  if (v5)
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_impl(&dword_193B9B000, v10, OS_LOG_TYPE_FAULT, "SOD: payloadForRelatedEntityWithIdentifierSet stepError: %{public}@", buf, 0xCu);
    }

  }
  if (v7)
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_FAULT, "SOD: payloadForRelatedEntityWithIdentifierSet jsonError: %{public}@", buf, 0xCu);
    }

  }
}

void __56__MPServerObjectDatabase_importAssetsFromRequest_error___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  id obj;

  v2 = -[_MPServerObjectDatabaseImporter initWithDatabase:]([_MPServerObjectDatabaseImporter alloc], *(void **)(a1[4] + 16));
  v3 = (void *)a1[5];
  obj = 0;
  objc_msgSend(v3, "performWithDatabaseOperations:error:", v2, &obj);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);

}

void __82__MPServerObjectDatabase_enumerateAssetsMissingSINFsForHashedPersonID_usingBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  MPServerObjectDatabaseAsset *v7;
  NSObject *v8;
  id v9;
  char v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 16), "statementWithString:error:", CFSTR("SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE mini_sinf IS NULL AND sinfs is NULL AND hashed_person_id = @hashedPersonID AND cast(identifier AS INT) != 0"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bindStringValue:toParameterNamed:", a1[5], CFSTR("@hashedPersonID"));
  objc_msgSend(*(id *)(a1[4] + 16), "resultsForStatement:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v10 = 0;
  while (1)
  {
    v5 = v4;
    v9 = 0;
    objc_msgSend(v3, "nextObjectWithError:", &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;

    if (!v4 || v6)
      break;
    v7 = -[MPServerObjectDatabaseAsset initWithSQLRowResult:]([MPServerObjectDatabaseAsset alloc], "initWithSQLRowResult:", v4);
    (*(void (**)(void))(a1[6] + 16))();

    if (v10)
    {
      objc_msgSend(v2, "invalidate");
      goto LABEL_10;
    }
  }
  objc_msgSend(v2, "invalidate");
  if (v6)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_FAULT, "SOD: enumerateAssetsMissingSINFsUsingBlock stepError: %{public}@", buf, 0xCu);
    }

  }
LABEL_10:

}

void __97__MPServerObjectDatabase_relatedIdentifierSetsForParentIdentifierSet_parentVersionHash_childKey___block_invoke(uint64_t a1)
{
  MPMediaKitEntityTranslatorContext *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *context;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x19403A624]();
  v2 = objc_alloc_init(MPMediaKitEntityTranslatorContext);
  -[MPMediaKitEntityTranslatorContext setPersonID:](v2, "setPersonID:", *(_QWORD *)(a1 + 32));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 40);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v28;
LABEL_3:
    v3 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v22)
        objc_enumerationMutation(obj);
      v24 = v3;
      v4 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "statementWithString:error:", CFSTR("SELECT child_identifier, token FROM object_relationships LEFT OUTER JOIN playback_authorization_token ON child_identifier = identifier WHERE parent_identifier = @parentIdentifier AND object_relationships.person_id = @personID AND child_key = @childKey AND parent_version_hash = @parentVersionHash ORDER BY suborder"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bindStringValue:toParameterNamed:", v4, CFSTR("@parentIdentifier"));
      objc_msgSend(v5, "bindStringValue:toParameterNamed:", *(_QWORD *)(a1 + 32), CFSTR("@personID"));
      objc_msgSend(v5, "bindStringValue:toParameterNamed:", *(_QWORD *)(a1 + 56), CFSTR("@childKey"));
      objc_msgSend(v5, "bindStringValue:toParameterNamed:", *(_QWORD *)(a1 + 64), CFSTR("@parentVersionHash"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "resultsForStatement:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v6, "nextObjectWithError:", &v26);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v26;
      v9 = v8 == 0;
      v10 = !v8 && v7 != 0;
      v25 = v10;
      if (v10)
      {
        v11 = v7;
        do
        {
          objc_msgSend(v11, "stringValueAtColumnIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("id"));
          _MPServerObjectDatabaseMediaKitParentChildTypesForChildKey(*(void **)(a1 + 56));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "second");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          +[MPMediaKitEntityTranslator translatorForType:](MPMediaKitEntityTranslator, "translatorForType:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifiersForPayload:context:", v13, v2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(*(id *)(a1 + 72), "addObject:", v17);

          v26 = 0;
          objc_msgSend(v6, "nextObjectWithError:", &v26);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v26;

          v9 = v18 == 0;
          if (!v7)
            break;
          v11 = v7;
        }
        while (!v18);
      }
      else
      {
        v18 = v8;
      }
      objc_msgSend(v5, "invalidate");
      if (!v9)
      {
        v19 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v18;
          _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_FAULT, "SOD: relatedIdentifierSetsForParentIdentifierSet stepError: %{public}@", buf, 0xCu);
        }

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v18);
      }

      if (v25)
        break;
      v3 = v24 + 1;
      if (v24 + 1 == v23)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v23)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
}

void __79__MPServerObjectDatabase_relatedIdentifierSetsForParentIdentifierSet_childKey___block_invoke(uint64_t a1)
{
  MPMediaKitEntityTranslatorContext *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *context;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  const __CFString *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x19403A624]();
  v2 = objc_alloc_init(MPMediaKitEntityTranslatorContext);
  -[MPMediaKitEntityTranslatorContext setPersonID:](v2, "setPersonID:", *(_QWORD *)(a1 + 32));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 40);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v28;
LABEL_3:
    v3 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v22)
        objc_enumerationMutation(obj);
      v24 = v3;
      v4 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "statementWithString:error:", CFSTR("SELECT child_identifier FROM object_relationships WHERE parent_identifier = @parentIdentifier AND person_id = @personID AND child_key = @childKey ORDER BY suborder"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bindStringValue:toParameterNamed:", v4, CFSTR("@parentIdentifier"));
      objc_msgSend(v5, "bindStringValue:toParameterNamed:", *(_QWORD *)(a1 + 32), CFSTR("@personID"));
      objc_msgSend(v5, "bindStringValue:toParameterNamed:", *(_QWORD *)(a1 + 56), CFSTR("@childKey"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "resultsForStatement:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v6, "nextObjectWithError:", &v26);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v26;
      v9 = v8 == 0;
      v10 = !v8 && v7 != 0;
      v25 = v10;
      if (v10)
      {
        v11 = v7;
        do
        {
          objc_msgSend(v11, "stringValueAtColumnIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = CFSTR("id");
          v34 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _MPServerObjectDatabaseMediaKitParentChildTypesForChildKey(*(void **)(a1 + 56));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "second");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          +[MPMediaKitEntityTranslator translatorForType:](MPMediaKitEntityTranslator, "translatorForType:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifiersForPayload:context:", v13, v2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v17);

          v26 = 0;
          objc_msgSend(v6, "nextObjectWithError:", &v26);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v26;

          v9 = v18 == 0;
          if (!v7)
            break;
          v11 = v7;
        }
        while (!v18);
      }
      else
      {
        v18 = v8;
      }
      objc_msgSend(v5, "invalidate");
      if (!v9)
      {
        v19 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v18;
          _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_FAULT, "SOD: relatedIdentifierSetsForParentIdentifierSet stepError: %{public}@", buf, 0xCu);
        }

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v18);
      }

      if (v25)
        break;
      v3 = v24 + 1;
      if (v24 + 1 == v23)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v23)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
}

void __85__MPServerObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString **v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
    goto LABEL_2;
  if (objc_msgSend(v5, "isEqual:", CFSTR("MPModelRelationshipGenericSong")))
  {
    v9 = *(void **)(a1 + 32);
    v16 = CFSTR("MPModelPropertySongExplicit");
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v16;
LABEL_9:
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1, v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addRelationship:properties:", v5, v13);

    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqual:", CFSTR("MPModelRelationshipGenericMovie")))
  {
    v9 = *(void **)(a1 + 32);
    v15 = CFSTR("MPModelPropertyMovieExplicitRating");
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v15;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqual:", CFSTR("MPModelRelationshipGenericTVEpisode")))
  {
    v9 = *(void **)(a1 + 32);
    v14 = CFSTR("MPModelPropertyTVEpisodeExplicitRating");
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v14;
    goto LABEL_9;
  }
LABEL_2:
  v7 = *(void **)(a1 + 32);
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRelationship:properties:", v5, v8);

LABEL_10:
}

void __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = -[_MPServerObjectDatabaseImporter initWithDatabase:]([_MPServerObjectDatabaseImporter alloc], *(void **)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(void **)(a1 + 40);
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v11 = 0;
    objc_msgSend(v3, "performWithDatabaseOperations:augmentingPayload:", v2, &v11);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v11;
  }
  else
  {
    objc_msgSend(v3, "performWithDatabaseOperations:augmentingPayload:", v2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "error");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  __int128 v10;

  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_3;
  block[3] = &unk_1E31615D0;
  v3 = *(_QWORD *)(a1 + 32);
  v8 = v2;
  v9 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__MPServerObjectDatabase_importObjectsFromRequest_options_error___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  v2 = *(id *)(a1 + 32);
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "database:didFailImportRequest:withErrror:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "database:didFinishImportRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (void)_clearOldDatabasePaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLsForDirectory:inDomains:", 13, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.MediaPlayer/ServerObjectDatabases/%@-ServerObjectDatabase.sqlpkg"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeItemAtURL:error:", v8, 0);
  objc_msgSend(v13, "URLsForDirectory:inDomains:", 9, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("ServerObjectDatabase.sqlpkg"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeItemAtURL:error:", v11, 0);
  objc_msgSend(v11, "URLByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeItemAtURL:error:", v12, 0);
}

+ (void)setPrefersInMemoryDatabase:(BOOL)a3
{
  _MPServerObjectDatabasePrefersInMemoryDatabase = a3;
}

id __52__MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0D0]), "initWithMemory");
}

@end
