@implementation FCKeyValueStore

- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7 migrator:(id)a8 savePolicy:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  FCKeyValueStore *v21;
  FCKeyValueStore *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  id v28;
  id v29;
  NSString *storeDirectory;
  NSString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSURL *storeURL;
  FCKeyValueStoreClassRegistry *v36;
  FCKeyValueStoreClassRegistry *classRegistry;
  uint64_t v38;
  NFLocking *lock;
  void *v40;
  void *v41;
  uint64_t v42;
  double Current;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  FCKeyValueStoreClassRegistry *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  NSString *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSMutableDictionary *unsafeObjectsByKey;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  void **p_migrator;
  void *v100;
  NSString **p_name;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  objc_super v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE buf[12];
  __int16 v118;
  double v119;
  __int16 v120;
  int v121;
  __int16 v122;
  void *v123;
  _BYTE v124[12];
  __int16 v125;
  char *v126;
  __int16 v127;
  int v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v16 = a9;
  v131 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v106 = a8;
  v105 = a9;
  v107.receiver = self;
  v107.super_class = (Class)FCKeyValueStore;
  v20 = v19;
  v21 = -[FCKeyValueStore init](&v107, sel_init);
  v22 = v21;
  if (v21)
  {
    p_name = &v21->_name;
    objc_storeStrong((id *)&v21->_name, a3);
    v22->_clientVersion = a5;
    v22->_optionsMask = a6;
    v23 = v18;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "fileExistsAtPath:", v23);

    if ((v25 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v27 = objc_msgSend(v26, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 1, 0, buf);
      v28 = *(id *)buf;

      if ((v27 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to create cache directory with error: %@"), v28);
        *(_DWORD *)v124 = 136315906;
        *(_QWORD *)&v124[4] = "-[FCKeyValueStore _initializeStoreDirectoryWithName:]";
        v125 = 2080;
        v126 = "FCKeyValueStore.m";
        v127 = 1024;
        v128 = 689;
        v129 = 2114;
        v130 = v88;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v124, 0x26u);

      }
    }
    v29 = v23;

    storeDirectory = v22->_storeDirectory;
    v22->_storeDirectory = (NSString *)v29;

    v31 = v22->_storeDirectory;
    if (v31)
    {
      v32 = (void *)MEMORY[0x1E0C99E98];
      -[NSString stringByAppendingPathComponent:](v31, "stringByAppendingPathComponent:", v22->_name);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "fileURLWithPath:isDirectory:", v33, 0);
      v34 = objc_claimAutoreleasedReturnValue();
      storeURL = v22->_storeURL;
      v22->_storeURL = (NSURL *)v34;

    }
    else
    {
      v33 = v22->_storeURL;
      v22->_storeURL = 0;
    }

    if (v20)
      v36 = v20;
    else
      v36 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    classRegistry = v22->_classRegistry;
    v22->_classRegistry = v36;

    p_migrator = (void **)&v22->_migrator;
    objc_storeStrong((id *)&v22->_migrator, a8);
    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v22->_lock;
    v22->_lock = (NFLocking *)v38;

    v40 = (void *)MEMORY[0x1E0C99E08];
    -[FCKeyValueStore storeDirectory](v22, "storeDirectory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingPathComponent:", v22->_name);
    v42 = objc_claimAutoreleasedReturnValue();

    Current = CFAbsoluteTimeGetCurrent();
    v104 = (void *)v42;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    v103 = v44;
    if (!v44)
      goto LABEL_62;
    v100 = v40;
    v22->_storeSize = objc_msgSend(v44, "length");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62708]), "initWithData:", v45);
    v102 = v47;
    if (v47 && (v48 = v47, objc_msgSend(v47, "version") == 7))
    {
      v93 = v20;
      v95 = v18;
      v97 = v17;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      objc_msgSend(v48, "keyValuePairs");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
      if (v50)
      {
        v51 = v50;
        v52 = MEMORY[0x1E0C81028];
        v53 = *(_QWORD *)v114;
        do
        {
          for (i = 0; i != v51; ++i)
          {
            if (*(_QWORD *)v114 != v53)
              objc_enumerationMutation(v49);
            v55 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
            objc_msgSend(v55, "key");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v56 && os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("WARNING: the key value store should never contain an entry without a key"));
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "-[FCKeyValueStore _loadFromDisk]";
              v118 = 2080;
              v119 = COERCE_DOUBLE("FCKeyValueStore.m");
              v120 = 1024;
              v121 = 470;
              v122 = 2114;
              v123 = v62;
              _os_log_error_impl(&dword_1A1B90000, v52, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            v57 = v22->_classRegistry;
            v58 = -[FCKeyValueStoreClassRegistry classForValueType:](v57, "classForValueType:", objc_msgSend(v55, "valueType"));

            if (!v58 && os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no class to decode KVS value type %lu"), (int)objc_msgSend(v55, "valueType"));
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "-[FCKeyValueStore _loadFromDisk]";
              v118 = 2080;
              v119 = COERCE_DOUBLE("FCKeyValueStore.m");
              v120 = 1024;
              v121 = 473;
              v122 = 2114;
              v123 = v63;
              _os_log_error_impl(&dword_1A1B90000, v52, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            -[objc_class readValueFromKeyValuePair:](v58, "readValueFromKeyValuePair:", v55);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59)
            {
              objc_msgSend(v55, "key");
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              if (v60)
              {
                objc_msgSend(v55, "key");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKey:", v59, v61);

              }
            }

          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
        }
        while (v51);
      }

      objc_msgSend(v102, "plistSidecar");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        v65 = (void *)MEMORY[0x1E0CB38B0];
        objc_msgSend(v102, "plistSidecar");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = 0;
        objc_msgSend(v65, "propertyListWithData:options:format:error:", v66, 0, 0, &v112);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "addEntriesFromDictionary:", v67);
      }
      v68 = objc_msgSend(v102, "version");
      v69 = objc_msgSend(v102, "clientVersion");
      v18 = v95;
      v17 = v97;
      v20 = v93;
    }
    else
    {
      *(_QWORD *)v124 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v45, 0, 0, v124);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKey:", CFSTR("data"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addEntriesFromDictionary:", v71);
      objc_msgSend(v70, "objectForKey:", CFSTR("version"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v72, "unsignedIntegerValue");

      objc_msgSend(v70, "objectForKey:", CFSTR("clientVersion"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v73, "unsignedIntegerValue");

    }
    v74 = CFAbsoluteTimeGetCurrent();
    v75 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
    {
      v76 = *p_name;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v76;
      v118 = 2048;
      v119 = v74 - Current;
      v77 = v75;
      _os_log_impl(&dword_1A1B90000, v77, OS_LOG_TYPE_INFO, "Loaded %@ cache in %f ms", buf, 0x16u);

    }
    if (v68 != 7)
    {
      -[FCKeyValueStore _clearStore]((uint64_t)v22);
      v45 = 0;
LABEL_42:
      v40 = v100;
      goto LABEL_61;
    }
    v40 = v100;
    if (v69 == v22->_clientVersion)
    {
      v45 = v46;
LABEL_61:

      v16 = a9;
LABEL_62:

      objc_msgSend(v40, "dictionaryWithDictionary:", v45);
      v90 = objc_claimAutoreleasedReturnValue();
      unsafeObjectsByKey = v22->_unsafeObjectsByKey;
      v22->_unsafeObjectsByKey = (NSMutableDictionary *)v90;

      objc_storeStrong((id *)&v22->_savePolicy, v16);
      goto LABEL_63;
    }
    if ((v22->_optionsMask & 2) != 0)
    {
      v78 = *p_migrator;
      if (!*p_migrator)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a migrator in order to migrate between KVS client versions"));
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[FCKeyValueStore _loadFromDisk]";
          v118 = 2080;
          v119 = COERCE_DOUBLE("FCKeyValueStore.m");
          v120 = 1024;
          v121 = 523;
          v122 = 2114;
          v123 = v89;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          if ((v22->_optionsMask & 2) == 0)
            goto LABEL_60;
          v78 = *p_migrator;
        }
        else
        {
          v78 = 0;
        }
      }
      if (objc_msgSend(v78, "keyValueStore:canMigrateFromVersion:", v22, v69))
      {
        v94 = v20;
        v96 = v18;
        v98 = v17;
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        objc_msgSend(v46, "allKeys");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)objc_msgSend(v79, "copy");

        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
        if (v81)
        {
          v82 = v81;
          v83 = *(_QWORD *)v109;
          do
          {
            for (j = 0; j != v82; ++j)
            {
              if (*(_QWORD *)v109 != v83)
                objc_enumerationMutation(v80);
              v85 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * j);
              objc_msgSend(v46, "objectForKey:", v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[FCKeyValueStoreMigrating keyValueStore:migrateObject:forKey:fromVersion:](v22->_migrator, "keyValueStore:migrateObject:forKey:fromVersion:", v22, v86, v85, v69);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
                objc_msgSend(v46, "setObject:forKey:", v87, v85);
              else
                objc_msgSend(v46, "removeObjectForKey:", v85);

            }
            v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v108, buf, 16);
          }
          while (v82);
        }

        v45 = v46;
        v18 = v96;
        v17 = v98;
        v20 = v94;
        goto LABEL_42;
      }
    }
LABEL_60:
    -[FCKeyValueStore _clearStore]((uint64_t)v22);
    v45 = 0;
    goto LABEL_61;
  }
LABEL_63:

  return v22;
}

- (NSString)storeDirectory
{
  return self->_storeDirectory;
}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__91;
  v15 = __Block_byref_object_dispose__91;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__FCKeyValueStore_objectForKey___block_invoke;
  v8[3] = &unk_1E46401F8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_readObjectsByKey:(uint64_t)a1
{
  void (**v3)(id, _QWORD);

  v3 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 80) & 8) != 0)
      objc_msgSend(*(id *)(a1 + 64), "lock");
    v3[2](v3, *(_QWORD *)(a1 + 56));
    if ((*(_BYTE *)(a1 + 80) & 8) != 0)
      objc_msgSend(*(id *)(a1 + 64), "unlock");
  }

}

void __32__FCKeyValueStore_objectForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __26__FCKeyValueStore_allKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allKeys");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __34__FCKeyValueStore_objectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "fc_subdictionaryForKeys:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __45__FCKeyValueStore_addAllEntriesToDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
}

void __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke_2;
  v4[3] = &unk_1E4648030;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);

}

uint64_t __53__FCKeyValueStore_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", *(_QWORD *)(a1 + 32));
}

void __31__FCKeyValueStore_asDictionary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)objectsForKeys:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__91;
  v15 = __Block_byref_object_dispose__91;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__FCKeyValueStore_objectsForKeys___block_invoke;
  v8[3] = &unk_1E46401F8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)setObjects:(id)a3 forKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCKeyValueStore addEntriesFromDictionary:](self, "addEntriesFromDictionary:", v9);

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "objects");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCKeyValueStore setObjects:forKeys:]";
    v14 = 2080;
    v15 = "FCKeyValueStore.m";
    v16 = 1024;
    v17 = 170;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v8)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keys");
      *(_DWORD *)buf = 136315906;
      v13 = "-[FCKeyValueStore setObjects:forKeys:]";
      v14 = 2080;
      v15 = "FCKeyValueStore.m";
      v16 = 1024;
      v17 = 171;
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
LABEL_9:

}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__FCKeyValueStore_addEntriesFromDictionary___block_invoke_2;
    v6[3] = &unk_1E463AA78;
    v7 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v6);

  }
}

- (void)updateObjectsForKeys:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v7 && v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__FCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke_2;
    v9[3] = &unk_1E46432D0;
    v10 = v6;
    v11 = v7;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v9);

  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__FCKeyValueStore_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v6[3] = &unk_1E463CA08;
  v7 = v4;
  v5 = v4;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v6);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __36__FCKeyValueStore_setObject_forKey___block_invoke_2;
      v10[3] = &unk_1E464B7D8;
      v11 = v7;
      v12 = v6;
      -[FCKeyValueStore _maybeWriteObjectsByKey:]((uint64_t)self, v10);

    }
    else
    {
      -[FCKeyValueStore removeObjectForKey:](self, "removeObjectForKey:", v7);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "key");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCKeyValueStore setObject:forKey:]";
    v15 = 2080;
    v16 = "FCKeyValueStore.m";
    v17 = 1024;
    v18 = 146;
    v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)_maybeWriteObjectsByKey:(uint64_t)a1
{
  uint64_t (**v3)(id, _QWORD);
  int v4;
  int v5;
  int v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "lock");
    v4 = *(unsigned __int8 *)(a1 + 9);
    v5 = v3[2](v3, *(_QWORD *)(a1 + 56));
    v6 = v5;
    v7 = *(_BYTE *)(a1 + 9) ? 1 : v5;
    *(_BYTE *)(a1 + 9) = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v8;

    objc_msgSend(*(id *)(a1 + 64), "unlock");
    if (!v4)
    {
      if (v6)
      {
        v10 = (void *)FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          v12 = v10;
          _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "Key-value store <%@> will schedule save", buf, 0xCu);

        }
        v13 = *(id *)(a1 + 104);
        objc_opt_class();
        objc_opt_self();
        FCPersistenceQueue();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __43__FCKeyValueStore__maybeWriteObjectsByKey___block_invoke;
        v15[3] = &unk_1E463AB18;
        v15[4] = a1;
        objc_msgSend(v13, "scheduleSaveOnQueue:handler:", v14, v15);

      }
    }
  }

}

BOOL __36__FCKeyValueStore_setObject_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 != v5)
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  return v4 != v5;
}

uint64_t __38__FCKeyValueStore__writeObjectsByKey___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __38__FCKeyValueStore_removeObjectForKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__FCKeyValueStore_addEntriesFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
}

void __50__FCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v11, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)enumerateKeysAndObjectsForKeys:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke;
  v10[3] = &unk_1E464B878;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v10);

}

uint64_t __45__FCKeyValueStore_saveWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  -[FCKeyValueStore _save](*(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_save
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  double Current;
  FCKeyValueStoreWriter *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  NSObject *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  char *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  id v76;
  uint8_t v77[128];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  char *v81;
  __int16 v82;
  _QWORD v83[5];

  v83[2] = *MEMORY[0x1E0C80C00];
  if (a1 && (*(_BYTE *)(a1 + 80) & 4) == 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "lock");
    if (*(_BYTE *)(a1 + 9))
      v2 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
    else
      v2 = 0;
    *(_BYTE *)(a1 + 9) = 0;
    objc_msgSend(*(id *)(a1 + 64), "unlock");
    if (v2)
    {
      objc_msgSend((id)a1, "storeDirectory");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = a1;
      objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
      v67 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v66 = v2;
      v5 = v2;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v72 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
            objc_msgSend(v5, "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11 && objc_msgSend(v11, "conformsToProtocol:", &unk_1EE6964A8))
            {
              v13 = v12;
              objc_msgSend(v68, "setObject:forKey:", v13, v10);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0
                          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                        {
                          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ is not supported by this key-value store"), objc_opt_class());
                          *(_DWORD *)buf = 136315906;
                          v79 = "-[FCKeyValueStore _save]";
                          v80 = 2080;
                          v81 = "FCKeyValueStore.m";
                          v82 = 1024;
                          LODWORD(v83[0]) = 624;
                          WORD2(v83[0]) = 2114;
                          *(_QWORD *)((char *)v83 + 6) = v14;
                          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

                        }
                      }
                    }
                  }
                }
              }
              objc_msgSend(v4, "setObject:forKey:", v12, v10);
              v13 = 0;
            }

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        }
        while (v7);
      }

      v15 = v5;
      objc_opt_self();
      if (qword_1ED0F8960 != -1)
        dispatch_once(&qword_1ED0F8960, &__block_literal_global_194);
      v16 = (void *)v67;
      if (_MergedGlobals_225 && objc_msgSend((id)a1, "shouldExportJSONSidecar"))
      {
        -[FCKeyValueStore fc_jsonEncodableDictionaryWithDictionary:](a1, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fc_jsonString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          FCURLForFeldsparUserAccountHomeDirectory();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", CFSTR("automation_cloudkit_data"), 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0;
          objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v76);
          v22 = v76;

          if (v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v57 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v22, "localizedDescription");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = (void *)objc_msgSend(v57, "initWithFormat:", CFSTR("Error creating directy at path %@ : %@"), v20, v58);
            *(_DWORD *)buf = 136315906;
            v79 = "-[FCKeyValueStore _maybeSaveJSONRepresentationWithDictionary:]";
            v80 = 2080;
            v81 = "FCKeyValueStore.m";
            v82 = 1024;
            LODWORD(v83[0]) = 581;
            WORD2(v83[0]) = 2114;
            *(_QWORD *)((char *)v83 + 6) = v59;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathExtension:", CFSTR("json"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "URLByAppendingPathComponent:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = 0;
          objc_msgSend(v18, "writeToURL:atomically:encoding:error:", v24, 1, 4, &v75);
          v25 = v75;
          if (v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v60 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v25, "localizedDescription");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = (void *)objc_msgSend(v60, "initWithFormat:", CFSTR("Error generating JSON : %@"), v64);
            *(_DWORD *)buf = 136315906;
            v79 = "-[FCKeyValueStore _maybeSaveJSONRepresentationWithDictionary:]";
            v80 = 2080;
            v81 = "FCKeyValueStore.m";
            v82 = 1024;
            LODWORD(v83[0]) = 589;
            WORD2(v83[0]) = 2114;
            *(_QWORD *)((char *)v83 + 6) = v61;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
        }

      }
      v26 = objc_alloc_init(MEMORY[0x1E0D62708]);
      objc_msgSend(v26, "setVersion:", 7);
      objc_msgSend(v26, "setClientVersion:", *(_QWORD *)(v65 + 72));
      v27 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(void **)(v65 + 32);
        v29 = v28;
        v30 = v27;
        v31 = objc_msgSend(v68, "count");
        *(_DWORD *)buf = 138412546;
        v79 = (const char *)v28;
        v80 = 2048;
        v81 = (char *)v31;
        _os_log_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEFAULT, "Key-value store <%@> will save %lu pairs", buf, 0x16u);

      }
      v70 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v70);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (char *)v70;
      objc_msgSend(v26, "setPlistSidecar:", v32);

      if (objc_msgSend(v4, "count") && v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v52 = objc_alloc(MEMORY[0x1E0CB3940]);
          v53 = *(id *)(v65 + 32);
          v54 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("failed to serialize %@ key-value store plist with error: %@"), v53, v33);
          *(_DWORD *)buf = 136315906;
          v79 = "-[FCKeyValueStore _save]";
          v80 = 2080;
          v81 = "FCKeyValueStore.m";
          v82 = 1024;
          LODWORD(v83[0]) = 649;
          WORD2(v83[0]) = 2114;
          *(_QWORD *)((char *)v83 + 6) = v54;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v34 = (void *)FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          v35 = *(const char **)(v65 + 32);
          *(_DWORD *)buf = 138543618;
          v79 = v35;
          v80 = 2114;
          v81 = v33;
          v36 = v34;
          _os_log_error_impl(&dword_1A1B90000, v36, OS_LOG_TYPE_ERROR, "failed to serialize %{public}@ key-value store plist with error: %{public}@", buf, 0x16u);

        }
      }
      else
      {
        Current = CFAbsoluteTimeGetCurrent();
        v38 = objc_alloc_init(FCKeyValueStoreWriter);
        if (-[FCKeyValueStoreWriter writeKVS:codables:toFile:size:](v38, "writeKVS:codables:toFile:size:", v26, v68, v67, v65 + 40))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v67, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_QWORD *)(v65 + 80) & 1) == 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *MEMORY[0x1E0C9AC90];
          v69 = 0;
          v42 = objc_msgSend(v39, "setResourceValue:forKey:error:", v40, v41, &v69);
          v63 = (char *)v69;

          if ((v42 & 1) == 0)
          {
            v43 = FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v79 = (const char *)v39;
              v80 = 2114;
              v81 = v63;
              _os_log_error_impl(&dword_1A1B90000, v43, OS_LOG_TYPE_ERROR, "Failed to set backup status for %{public}@ -- %{public}@", buf, 0x16u);
            }
          }
          v44 = CFAbsoluteTimeGetCurrent();
          v45 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
          {
            v46 = v39;
            v47 = *(void **)(v65 + 32);
            v48 = (void *)MEMORY[0x1E0CB34E8];
            v62 = v47;
            v49 = v45;
            objc_msgSend(v48, "stringFromByteCount:countStyle:", objc_msgSend((id)v65, "storeSize"), 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v79 = (const char *)v47;
            v39 = v46;
            v80 = 2048;
            v81 = (char *)((v44 - Current) * 1000.0);
            v16 = (void *)v67;
            v82 = 2114;
            v83[0] = v50;
            _os_log_impl(&dword_1A1B90000, v49, OS_LOG_TYPE_DEFAULT, "Key-value store <%{public}@> did save in %lums with size %{public}@", buf, 0x20u);

          }
        }
        else
        {
          v51 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
          {
            v55 = *(const char **)(v65 + 32);
            *(_DWORD *)buf = 138543362;
            v79 = v55;
            v56 = v51;
            _os_log_error_impl(&dword_1A1B90000, v56, OS_LOG_TYPE_ERROR, "Failed to save key-value store <%{public}@>", buf, 0xCu);

          }
        }

      }
      v2 = v66;
    }

  }
}

- (unint64_t)storeSize
{
  return self->_storeSize;
}

- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7 migrator:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  FCKeyValueStore *v17;

  v13 = a7;
  v14 = a4;
  v15 = a3;
  +[FCKeyValueStoreSavePolicy defaultPolicy](FCKeyValueStoreSavePolicy, "defaultPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:savePolicy:](self, "initWithName:directory:version:options:classRegistry:migrator:savePolicy:", v15, v14, a5, a6, v13, 0, v16);

  return v17;
}

- (void)setJSONEncodingHandlersWithObjectHandler:(id)a3 arrayObjectHandler:(id)a4 dictionaryKeyHandler:(id)a5 dictionaryValueHandler:(id)a6
{
  id v10;
  id v11;
  SEL v12;
  SEL v13;
  SEL v14;
  SEL v15;
  id newValue;

  if (self)
  {
    newValue = a6;
    v10 = a5;
    v11 = a4;
    objc_setProperty_nonatomic_copy(self, v12, a3, 112);
    objc_setProperty_nonatomic_copy(self, v13, v11, 120);

    objc_setProperty_nonatomic_copy(self, v14, v10, 128);
    objc_setProperty_nonatomic_copy(self, v15, newValue, 136);

  }
}

- (void)setShouldExportJSONSidecar:(BOOL)a3
{
  self->_shouldExportJSONSidecar = a3;
}

- (NSDictionary)asDictionary
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__91;
  v9 = __Block_byref_object_dispose__91;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__FCKeyValueStore_asDictionary__block_invoke;
  v4[3] = &unk_1E464B800;
  v4[4] = &v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

- (void)addAllEntriesToDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__FCKeyValueStore_addAllEntriesToDictionary___block_invoke;
  v6[3] = &unk_1E464B850;
  v7 = v4;
  v5 = v4;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v6);

}

- (void)saveWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_opt_class();
  objc_opt_self();
  FCPersistenceQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__FCKeyValueStore_saveWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E463B790;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)allKeys
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__91;
  v9 = __Block_byref_object_dispose__91;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__FCKeyValueStore_allKeys__block_invoke;
  v4[3] = &unk_1E464B800;
  v4[4] = &v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->_optionsMask = self->_optionsMask & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__FCKeyValueStore_removeObjectForKey___block_invoke_2;
    v6[3] = &unk_1E463AA78;
    v7 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v6);

  }
}

- (void)_writeObjectsByKey:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__FCKeyValueStore__writeObjectsByKey___block_invoke;
    v5[3] = &unk_1E464B8A0;
    v6 = v3;
    -[FCKeyValueStore _maybeWriteObjectsByKey:](a1, v5);

  }
}

- (FCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 classRegistry:(id)a7
{
  return -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:](self, "initWithName:directory:version:options:classRegistry:migrator:", a3, a4, a5, a6, a7, 0);
}

void __35__FCKeyValueStore_shouldDumpToJSON__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("running_ui_automation")) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "bundleIdentifier");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      _MergedGlobals_225 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news"));

    }
    else
    {
      _MergedGlobals_225 = 0;
    }

  }
  else
  {
    _MergedGlobals_225 = 0;
  }
}

- (FCKeyValueStore)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCKeyValueStore init]";
    v9 = 2080;
    v10 = "FCKeyValueStore.m";
    v11 = 1024;
    v12 = 77;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCKeyValueStore init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)containsObjectForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[FCKeyValueStore objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)replaceContentsWithDictionary:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__FCKeyValueStore_replaceContentsWithDictionary___block_invoke_2;
    v6[3] = &unk_1E463AA78;
    v7 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v6);

  }
}

void __49__FCKeyValueStore_replaceContentsWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));

}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__FCKeyValueStore_removeObjectsForKeys___block_invoke_2;
    v5[3] = &unk_1E463AA78;
    v6 = v4;
    -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, v5);

  }
}

uint64_t __40__FCKeyValueStore_removeObjectsForKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectsForKeys:", *(_QWORD *)(a1 + 32));
}

- (void)removeAllObjects
{
  -[FCKeyValueStore _writeObjectsByKey:]((uint64_t)self, &__block_literal_global_27_5);
}

uint64_t __35__FCKeyValueStore_removeAllObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)setBoolValue:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FCKeyValueStore setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (BOOL)BOOLValueForKey:(id)a3
{
  void *v3;
  char v4;

  -[FCKeyValueStore objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)allObjects
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__91;
  v9 = __Block_byref_object_dispose__91;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__FCKeyValueStore_allObjects__block_invoke;
  v4[3] = &unk_1E464B800;
  v4[4] = &v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __29__FCKeyValueStore_allObjects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)keysOfEntriesPassingTest:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__91;
  v15 = __Block_byref_object_dispose__91;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__FCKeyValueStore_keysOfEntriesPassingTest___block_invoke;
  v8[3] = &unk_1E464B828;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[FCKeyValueStore _readObjectsByKey:]((uint64_t)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __44__FCKeyValueStore_keysOfEntriesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "keysOfEntriesPassingTest:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __61__FCKeyValueStore_enumerateKeysAndObjectsForKeys_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSDate)modificationDate
{
  FCKeyValueStore *v2;
  NSDate *modificationDate;
  NSURL *storeURL;
  uint64_t v5;
  NSURL *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  NSDate *v10;
  NSDate *v11;
  NSDate *v12;
  id v14;

  v2 = self;
  if (self)
    self = (FCKeyValueStore *)self->_lock;
  -[FCKeyValueStore lock](self, "lock");
  modificationDate = v2->_modificationDate;
  if (!modificationDate)
  {
    if ((v2->_optionsMask & 4) != 0)
    {
      modificationDate = 0;
    }
    else
    {
      storeURL = v2->_storeURL;
      v14 = 0;
      v5 = *MEMORY[0x1E0C998D8];
      v6 = storeURL;
      v7 = -[NSURL getResourceValue:forKey:error:](v6, "getResourceValue:forKey:error:", &v14, v5, 0);
      v8 = v14;
      v9 = v14;

      if (v7)
        objc_storeStrong((id *)&v2->_modificationDate, v8);

      modificationDate = v2->_modificationDate;
    }
  }
  v10 = modificationDate;
  -[NFLocking unlock](v2->_lock, "unlock");
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)save
{
  NSObject *v3;
  _QWORD block[5];

  objc_opt_class();
  objc_opt_self();
  FCPersistenceQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__FCKeyValueStore_save__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __23__FCKeyValueStore_save__block_invoke(uint64_t a1)
{
  -[FCKeyValueStore _save](*(_QWORD *)(a1 + 32));
}

void __43__FCKeyValueStore__maybeWriteObjectsByKey___block_invoke(uint64_t a1)
{
  -[FCKeyValueStore _save](*(_QWORD *)(a1 + 32));
}

- (void)_clearStore
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

  *(_QWORD *)(a1 + 40) = 0;
}

- (id)jsonEncodableObject
{
  id *p_isa;
  void *v3;

  p_isa = (id *)&self->super.isa;
  if (self)
  {
    -[NFLocking lock](self->_lock, "lock");
    v3 = (void *)objc_msgSend(p_isa[7], "copy");
    objc_msgSend(p_isa[8], "unlock");
    -[FCKeyValueStore fc_jsonEncodableDictionaryWithDictionary:]((uint64_t)p_isa, v3);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();

  }
  return p_isa;
}

- (id)fc_jsonEncodableDictionaryWithDictionary:(uint64_t)a1
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v4 = *(void **)(a1 + 112);
  v3 = *(void **)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 136);
  v6 = *(id *)(a1 + 128);
  v7 = v3;
  v8 = v4;
  objc_msgSend(a2, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", v8, v7, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)shouldExportJSONSidecar
{
  return self->_shouldExportJSONSidecar;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dictionaryValueHandler, 0);
  objc_storeStrong(&self->_dictionaryKeyHandler, 0);
  objc_storeStrong(&self->_arrayObjectHandler, 0);
  objc_storeStrong(&self->_objectHandler, 0);
  objc_storeStrong((id *)&self->_savePolicy, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_classRegistry, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_unsafeObjectsByKey, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

@end
