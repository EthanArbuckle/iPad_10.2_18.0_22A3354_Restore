@implementation SFAnalytics

void __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && (WeakRetained[40] & 1) == 0)
  {
    v15 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "begin");

    LODWORD(v4) = *(_DWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "eventDictForEventName:withAttributes:eventClass:timestampBucket:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), (double)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    switch(*(_QWORD *)(a1 + 64))
    {
      case 0:
        LOBYTE(v7) = *(_BYTE *)(a1 + 76);
        goto LABEL_15;
      case 1:
        v8 = *(_DWORD *)(a1 + 76);
        if ((v8 & 1) == 0)
        {
          objc_msgSend(v15, "database");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addEventDict:toTable:timestampBucket:", v5, CFSTR("hard_failures"), *(unsigned int *)(a1 + 72));

          v6 = v15;
          v8 = *(_DWORD *)(a1 + 76);
        }
        if ((v8 & 2) != 0)
          goto LABEL_20;
        objc_msgSend(v6, "database");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "incrementHardFailureCountForEventType:", *(_QWORD *)(a1 + 40));
        break;
      case 2:
        v11 = *(_DWORD *)(a1 + 76);
        if ((v11 & 1) == 0)
        {
          objc_msgSend(v15, "database");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addEventDict:toTable:timestampBucket:", v5, CFSTR("soft_failures"), *(unsigned int *)(a1 + 72));

          v6 = v15;
          v11 = *(_DWORD *)(a1 + 76);
        }
        if ((v11 & 2) != 0)
          goto LABEL_20;
        objc_msgSend(v6, "database");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "incrementSoftFailureCountForEventType:", *(_QWORD *)(a1 + 40));
        break;
      case 3:
        v7 = *(_DWORD *)(a1 + 76);
        if ((v7 & 1) == 0)
        {
          objc_msgSend(v15, "database");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addEventDict:toTable:timestampBucket:", v5, CFSTR("notes"), *(unsigned int *)(a1 + 72));

          v6 = v15;
          v7 = *(_DWORD *)(a1 + 76);
        }
LABEL_15:
        if ((v7 & 2) != 0)
          goto LABEL_20;
        objc_msgSend(v6, "database");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "incrementSuccessCountForEventType:", *(_QWORD *)(a1 + 40));
        break;
      case 4:
        if ((*(_BYTE *)(a1 + 76) & 1) != 0)
          goto LABEL_20;
        objc_msgSend(v15, "database");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addRockwellDict:userinfo:toTable:timestampBucket:", *(_QWORD *)(a1 + 40), v5, CFSTR("rockwell"), *(unsigned int *)(a1 + 72));
        break;
      default:
        goto LABEL_20;
    }

LABEL_20:
    objc_msgSend(v15, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "end");

    WeakRetained = v15;
  }

}

+ (id)logger
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  if ((id)objc_opt_class() == a1)
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "attempt to instatiate abstract class SFAnalytics", v8, 2u);
    }

    v4 = 0;
  }
  else
  {
    v3 = a1;
    objc_sync_enter(v3);
    objc_getAssociatedObject(v3, "SFAnalyticsInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = objc_alloc_init((Class)v3);
      objc_setAssociatedObject(v3, "SFAnalyticsInstance", v4, (void *)0x301);
    }
    objc_sync_exit(v3);

    v5 = (id)objc_msgSend(v4, "database");
  }
  return v4;
}

- (id)database
{
  SFAnalyticsSQLiteStore *database;
  void *v4;
  SFAnalyticsSQLiteStore *v5;
  SFAnalyticsSQLiteStore *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  if (!database)
  {
    objc_msgSend((id)objc_opt_class(), "databasePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFAnalyticsSQLiteStore storeWithPath:schema:](SFAnalyticsSQLiteStore, "storeWithPath:schema:", v4, CFSTR("CREATE TABLE IF NOT EXISTS hard_failures (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_hard_failures;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_hard_failures_v2 AFTER INSERT ON hard_failures\nBEGIN\nDELETE FROM hard_failures WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS soft_failures (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_soft_failures;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_soft_failures_v2 AFTER INSERT ON soft_failures\nBEGIN\nDELETE FROM soft_failures WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS notes (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_notes;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_notes_v2 AFTER INSERT ON notes\nBEGIN\nDELETE FROM notes WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS samples (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,\nname STRING,\nvalue REAL\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_samples;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_samples_v2 AFTER INSERT ON samples\nBEGIN\nDELETE FROM samples WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS success_count (\nevent_type STRING PRIMARY KEY,\nsuccess_count INTEGER,\nhard_failure_count INTEGER,\nsoft_failure_count INTEGER\n);\nCREATE TABLE IF NOT EXISTS rockwell (\nevent_type STRING PRIMARY KEY,\ntimestamp REAL,data BLOB\n);\nDROP TABLE IF EXISTS all_events;\n"));
    v5 = (SFAnalyticsSQLiteStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_database;
    self->_database = v5;

    database = self->_database;
    if (!database)
    {
      secLogObjForScope("SecCritical");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_18A900000, v7, OS_LOG_TYPE_DEFAULT, "Did not get a database! (Client %@)", (uint8_t *)&v11, 0xCu);

      }
      database = self->_database;
    }
  }
  return database;
}

- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4 eventClass:(int64_t)a5 timestampBucket:(double)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  if (a4)
  {
    v10 = a3;
    v11 = (void *)objc_msgSend(a4, "mutableCopy");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99E08];
    v13 = a3;
    objc_msgSend(v12, "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v11;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", a3, CFSTR("eventType"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970WithBucket:", a6);
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 * 1000.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("eventTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("eventClass"));

  +[SFAnalytics addOSVersionToEvent:](SFAnalytics, "addOSVersionToEvent:", v14);
  return v14;
}

+ (void)addOSVersionToEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD block[5];

  v4 = a3;
  block[1] = 3221225472;
  block[2] = __35__SFAnalytics_addOSVersionToEvent___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v5 = v4;
  block[0] = MEMORY[0x1E0C809B0];
  if (addOSVersionToEvent__onceToken != -1)
  {
    dispatch_once(&addOSVersionToEvent__onceToken, block);
    v4 = v5;
  }
  if (addOSVersionToEvent__build)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", addOSVersionToEvent__build, CFSTR("build"));
    v4 = v5;
  }
  if (addOSVersionToEvent__product)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", addOSVersionToEvent__product, CFSTR("product"));
    v4 = v5;
  }
  if (addOSVersionToEvent__modelID)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", addOSVersionToEvent__modelID, CFSTR("modelid"));
    v4 = v5;
  }
  if (addOSVersionToEvent__internal)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("internal"));
    v4 = v5;
  }

}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5
{
  -[SFAnalytics logEventNamed:class:attributes:timestampBucket:](self, "logEventNamed:class:attributes:timestampBucket:", a3, 1, a4, *(_QWORD *)&a5);
}

void __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "metricsHooks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableSet)metricsHooks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5 timestampBucket:(unsigned int)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23[2];
  unsigned int v24;
  int v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    *(_QWORD *)buf = 0;
    v33 = buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__2140;
    v36 = __Block_byref_object_dispose__2141;
    v37 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke;
    block[3] = &unk_1E1FDBC88;
    block[4] = self;
    block[5] = buf;
    dispatch_sync(queue, block);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = *((id *)v33 + 5);
    v14 = 0;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v14 |= (*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17++) + 16))();
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v15);
    }

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = self->_queue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke_2;
    v20[3] = &unk_1E1FCC158;
    objc_copyWeak(v23, &location);
    v20[4] = self;
    v21 = v10;
    v22 = v11;
    v23[1] = (id)a4;
    v24 = a6;
    v25 = v14;
    dispatch_sync(v18, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    secLogObjForScope("SecError");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A900000, v19, OS_LOG_TYPE_DEFAULT, "SFAnalytics: attempt to log an event with no name", buf, 2u);
    }

  }
}

+ (id)encodeSFACollection:(id)a3 error:(id *)a4
{
  id v5;
  SECSFARules *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  SECSFARule *v15;
  void *v16;
  id v17;
  void *v18;
  SECSFAAction *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  SECSFAActionTapToRadar *v26;
  void *v27;
  int v28;
  id v29;
  SECSFAActionAutomaticBugCapture *v30;
  id v31;
  SECSFAActionDropEvent *v32;
  void *v33;
  SECSFAActionDropEvent *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(SECSFARules);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rules"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v59 = v9;
        obj = v9;
        v61 = v7;
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
        if (v63)
        {
          v64 = *(_QWORD *)v67;
          v57 = v5;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v67 != v64)
                objc_enumerationMutation(obj);
              v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 3, CFSTR("rules type invalid"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = v42;
                if (a4)
                {
                  v12 = objc_retainAutorelease(v42);
                  *a4 = v12;
                }
                goto LABEL_82;
              }
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("eventType"));
              v12 = (id)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 2, CFSTR("eventType missing"));
                  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  *a4 = v43;

                }
                goto LABEL_82;
              }
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("match"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 4, CFSTR("match missing"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44;
                if (a4)
                  *a4 = objc_retainAutorelease(v44);

LABEL_82:
LABEL_83:

                v8 = 0;
                v5 = v57;
                v9 = v59;
                goto LABEL_86;
              }
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("repeatAfterSeconds"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v15 = objc_alloc_init(SECSFARule);
                -[SECSFARule setEventType:](v15, "setEventType:", v12);
                -[SECSFARule setRepeatAfterSeconds:](v15, "setRepeatAfterSeconds:", (int)objc_msgSend(v14, "intValue"));
                v65 = 0;
                objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v13, 200, 0, &v65);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = v65;
                -[SECSFARule setMatch:](v15, "setMatch:", v16);

                -[SECSFARule match](v15, "match");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  v19 = objc_alloc_init(SECSFAAction);
                  -[SECSFARule setAction:](v15, "setAction:", v19);

                  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("action"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("radarNumber"));
                    v21 = objc_claimAutoreleasedReturnValue();
                    v60 = (id)v21;
                    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      if (a4)
                      {
                        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 8, CFSTR("radarNumber invalid"));
                        v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                        *a4 = v58;
                        goto LABEL_55;
                      }
                      v28 = 1;
                    }
                    else
                    {
                      -[SECSFARule action](v15, "action");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = v21;
                      v24 = v22;
                      objc_msgSend(v22, "setRadarnumber:", v23);

                      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("actionType"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v58 = v25;
                      if (objc_msgSend(v25, "isEqual:", CFSTR("ttr")))
                      {
                        v26 = objc_alloc_init(SECSFAActionTapToRadar);
                        if (v26)
                        {
                          v53 = v26;
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("alert"));
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("componentID"));
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("componentName"));
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("componentVersion"));
                          v49 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("radarDescription"));
                          v48 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    objc_msgSend(v53, "setAlert:", v54);
                                    objc_msgSend(v53, "setComponentID:", v52);
                                    objc_msgSend(v53, "setComponentName:", v51);
                                    objc_msgSend(v53, "setComponentVersion:", v49);
                                    objc_msgSend(v53, "setRadarDescription:", v48);
                                    -[SECSFARule action](v15, "action");
                                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v47, "setTtr:", v53);

                                    v27 = v54;
                                    goto LABEL_42;
                                  }
                                }
                              }
                            }
                          }
                          if (a4)
                          {
                            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 9, CFSTR("attribute invalid type"));
                            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                            *a4 = v31;

                          }
LABEL_54:

                        }
LABEL_55:
                        v28 = 1;
                      }
                      else
                      {
                        if (objc_msgSend(v25, "isEqual:", CFSTR("abc")))
                        {
                          v30 = objc_alloc_init(SECSFAActionAutomaticBugCapture);
                          if (!v60)
                          {

                            goto LABEL_55;
                          }
                          v53 = v30;
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("domain"));
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("type"));
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("subtype"));
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0
                            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                            || v51 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                          {
                            if (a4)
                            {
                              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 10, CFSTR("abc invalid type"));
                              v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                              *a4 = v35;

                            }
                            goto LABEL_54;
                          }
                          objc_msgSend(v53, "setDomain:", v54);
                          objc_msgSend(v53, "setType:", v52);
                          objc_msgSend(v53, "setSubtype:", v51);
                          -[SECSFARule action](v15, "action");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v50, "setAbc:", v53);

                          v27 = v54;
LABEL_42:

                        }
                        else
                        {
                          if (!objc_msgSend(v25, "isEqual:", CFSTR("drop")))
                          {
                            if (a4)
                            {
                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("action unknown: %@"), v25);
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 11, v36);
                              v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                              *a4 = v37;

                            }
                            goto LABEL_55;
                          }
                          v32 = objc_alloc_init(SECSFAActionDropEvent);
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("event"));
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SECSFAActionDropEvent setExcludeEvent:](v32, "setExcludeEvent:", objc_msgSend(v55, "BOOLValue"));

                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("count"));
                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SECSFAActionDropEvent setExcludeCount:](v32, "setExcludeCount:", objc_msgSend(v56, "BOOLValue"));

                          -[SECSFARule action](v15, "action");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          v34 = v32;
                          v27 = v33;
                          v53 = v34;
                          objc_msgSend(v33, "setDrop:");
                        }

                        -[SECSFARules addRules:](v6, "addRules:", v15);
                        v28 = 0;
                      }

                    }
                    v29 = v60;
LABEL_58:

                  }
                  else
                  {
                    if (a4)
                    {
                      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 6, CFSTR("action invalid type"));
                      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                      *a4 = v29;
                      v28 = 1;
                      goto LABEL_58;
                    }
                    v28 = 1;
                  }

                }
                else
                {
                  if (a4)
                  {
                    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:underlying:", CFSTR("com.apple.SFAErrorDomain"), 12, CFSTR("plist encode failed"), v17);
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v28 = 1;
                }

                v7 = v61;
                goto LABEL_61;
              }
              if (!a4)
              {
                v28 = 1;
                goto LABEL_62;
              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 5, CFSTR("repeatAfterSeconds missing"));
              v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              *a4 = v17;
              v28 = 1;
LABEL_61:

LABEL_62:
              if (v28)
                goto LABEL_83;
              ++v10;
            }
            while (v63 != v10);
            v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
            v5 = v57;
            v63 = v38;
          }
          while (v38);
        }

        -[SECSFARules data](v6, "data");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
        {
          objc_msgSend(v39, "compressedDataUsingAlgorithm:error:", 0, a4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }
        v9 = v59;

        v7 = v61;
      }
      else
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:description:", CFSTR("com.apple.SFAErrorDomain"), 1, CFSTR("rules key missing"));
          v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a4 = v41;

        }
        v8 = 0;
      }
LABEL_86:

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addMetricsHook:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SFAnalytics_addMetricsHook___block_invoke;
  block[3] = &unk_1E1FCBFD0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)removeMetricsHook:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFAnalytics_removeMetricsHook___block_invoke;
  block[3] = &unk_1E1FCBFD0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)loadCollectionConfiguration
{
  SFAnalyticsCollection *v2;
  SFAnalyticsCollection *v3;
  SFAnalytics *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = objc_alloc_init(SFAnalyticsCollection);
  v3 = v2;
  if (v2)
  {
    -[SFAnalyticsCollection loadCollection:](v2, "loadCollection:", obj);
    -[SFAnalytics setCollection:](obj, "setCollection:", v3);
  }

  objc_sync_exit(obj);
}

- (void)updateCollectionConfigurationWithData:(id)a3
{
  SFAnalytics *v4;
  void *v5;
  SFAnalyticsCollection *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[SFAnalytics collection](v4, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(SFAnalyticsCollection);
    -[SFAnalytics setCollection:](v4, "setCollection:", v6);

  }
  -[SFAnalytics collection](v4, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeCollection:logger:", v8, v4);

  objc_sync_exit(v4);
}

- (void)removeStateAndUnlinkFile:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  -[NSMutableDictionary removeAllObjects](self->_samplers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_multisamplers, "removeAllObjects");
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SFAnalytics_removeStateAndUnlinkFile___block_invoke;
  block[3] = &unk_1E1FCBFF8;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_sync(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)removeState
{
  -[SFAnalytics removeStateAndUnlinkFile:](self, "removeStateAndUnlinkFile:", 1);
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__SFAnalytics_setDateProperty_forKey___block_invoke;
  v11[3] = &unk_1E1FCC020;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)datePropertyForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2140;
  v18 = __Block_byref_object_dispose__2141;
  v19 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__SFAnalytics_datePropertyForKey___block_invoke;
  v9[3] = &unk_1E1FCC070;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = &v14;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)incrementIntegerPropertyForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFAnalytics_incrementIntegerPropertyForKey___block_invoke;
  block[3] = &unk_1E1FCC048;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setNumberProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__SFAnalytics_setNumberProperty_forKey___block_invoke;
  v11[3] = &unk_1E1FCC020;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)numberPropertyForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2140;
  v18 = __Block_byref_object_dispose__2141;
  v19 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__SFAnalytics_numberPropertyForKey___block_invoke;
  v9[3] = &unk_1E1FCC070;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = &v14;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)setDataProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__SFAnalytics_setDataProperty_forKey___block_invoke;
  v11[3] = &unk_1E1FCC020;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)dataPropertyForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2140;
  v22 = __Block_byref_object_dispose__2141;
  v23 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __34__SFAnalytics_dataPropertyForKey___block_invoke;
  v13 = &unk_1E1FCC070;
  objc_copyWeak(&v16, &location);
  v15 = &v18;
  v6 = v4;
  v14 = v6;
  dispatch_sync(queue, &v10);
  if (v19[5])
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    v8 = (void *)objc_msgSend(v7, "initWithBase64EncodedString:options:", v19[5], 0, v10, v11, v12, v13);
  }
  else
  {
    v8 = 0;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)metricsAccountID
{
  NSObject *queue;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2140;
  v13 = __Block_byref_object_dispose__2141;
  v14 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SFAnalytics_metricsAccountID__block_invoke;
  block[3] = &unk_1E1FCC098;
  objc_copyWeak(&v7, &location);
  block[4] = &v9;
  dispatch_sync(queue, block);
  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)setMetricsAccountID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFAnalytics_setMetricsAccountID___block_invoke;
  block[3] = &unk_1E1FCC048;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (SFAnalytics)init
{
  SFAnalytics *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *samplers;
  uint64_t v8;
  NSMutableDictionary *multisamplers;
  uint64_t v10;
  NSMutableSet *metricsHooks;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFAnalytics;
  v2 = -[SFAnalytics init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SFAnalytics data access queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    samplers = v2->_samplers;
    v2->_samplers = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    multisamplers = v2->_multisamplers;
    v2->_multisamplers = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    metricsHooks = v2->_metricsHooks;
    v2->_metricsHooks = (NSMutableSet *)v10;

    v12 = -[SFAnalytics database](v2, "database");
  }
  return v2;
}

- (id)dailyMetrics
{
  void *v3;
  NSObject *queue;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2140;
  v28 = __Block_byref_object_dispose__2141;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2140;
  v22 = __Block_byref_object_dispose__2141;
  v23 = 0;
  queue = self->_queue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SFAnalytics_dailyMetrics__block_invoke;
  block[3] = &unk_1E1FCDEC8;
  block[4] = self;
  block[5] = &v24;
  block[6] = &v18;
  dispatch_sync(queue, block);
  v6 = (void *)v25[5];
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __27__SFAnalytics_dailyMetrics__block_invoke_2;
  v15[3] = &unk_1E1FCC0E0;
  v7 = v3;
  v16 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);
  v8 = (void *)v19[5];
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __27__SFAnalytics_dailyMetrics__block_invoke_3;
  v13[3] = &unk_1E1FCC108;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)coreAnalyticsKeyFilter:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SFAnalytics_coreAnalyticsKeyFilter___block_invoke;
  v8[3] = &unk_1E1FCC130;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (void)dailyCoreAnalyticsMetrics:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SFAnalytics dailyMetrics](self, "dailyMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics coreAnalyticsKeyFilter:](self, "coreAnalyticsKeyFilter:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SecCoreAnalytics sendEvent:event:](SecCoreAnalytics, "sendEvent:event:", v4, v5);

}

- (void)logSuccessForEventNamed:(id)a3 timestampBucket:(unsigned int)a4
{
  -[SFAnalytics logEventNamed:class:attributes:timestampBucket:](self, "logEventNamed:class:attributes:timestampBucket:", a3, 0, 0, *(_QWORD *)&a4);
}

- (void)logSuccessForEventNamed:(id)a3
{
  -[SFAnalytics logSuccessForEventNamed:timestampBucket:](self, "logSuccessForEventNamed:timestampBucket:", a3, 0);
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  -[SFAnalytics logHardFailureForEventNamed:withAttributes:timestampBucket:](self, "logHardFailureForEventNamed:withAttributes:timestampBucket:", a3, a4, 0);
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5
{
  -[SFAnalytics logEventNamed:class:attributes:timestampBucket:](self, "logEventNamed:class:attributes:timestampBucket:", a3, 2, a4, *(_QWORD *)&a5);
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
  -[SFAnalytics logSoftFailureForEventNamed:withAttributes:timestampBucket:](self, "logSoftFailureForEventNamed:withAttributes:timestampBucket:", a3, a4, 0);
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 timestampBucket:(unsigned int)a6
{
  -[SFAnalytics logResultForEvent:hardFailure:result:withAttributes:timestampBucket:](self, "logResultForEvent:hardFailure:result:withAttributes:timestampBucket:", a3, a4, a5, 0, 0);
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5
{
  -[SFAnalytics logResultForEvent:hardFailure:result:timestampBucket:](self, "logResultForEvent:hardFailure:result:timestampBucket:", a3, a4, a5, 0);
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6 timestampBucket:(unsigned int)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  id v28;

  v9 = a4;
  v28 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
      v14 = objc_msgSend(v12, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    objc_msgSend(v11, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v9;
      v27 = v13;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 6;
      do
      {
        v21 = v18;
        objc_msgSend(v18, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendFormat:", CFSTR("%@-%ld:"), v22, objc_msgSend(v21, "code"));

        objc_msgSend(v21, "userInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!--v20)
          break;
        objc_opt_class();
      }
      while ((objc_opt_isKindOfClass() & 1) != 0);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("errorChain"));

      v13 = v27;
      v9 = v26;
    }
    objc_msgSend(v11, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "code"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("errorCode"));

    if (v9)
      -[SFAnalytics logHardFailureForEventNamed:withAttributes:](self, "logHardFailureForEventNamed:withAttributes:", v28, v15);
    else
      -[SFAnalytics logSoftFailureForEventNamed:withAttributes:](self, "logSoftFailureForEventNamed:withAttributes:", v28, v15);

  }
  else
  {
    -[SFAnalytics logSuccessForEventNamed:](self, "logSuccessForEventNamed:", v28);
  }

}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6
{
  -[SFAnalytics logResultForEvent:hardFailure:result:withAttributes:timestampBucket:](self, "logResultForEvent:hardFailure:result:withAttributes:timestampBucket:", a3, a4, a5, a6, 0);
}

- (void)noteEventNamed:(id)a3 timestampBucket:(unsigned int)a4
{
  -[SFAnalytics logEventNamed:class:attributes:timestampBucket:](self, "logEventNamed:class:attributes:timestampBucket:", a3, 3, 0, *(_QWORD *)&a4);
}

- (void)noteEventNamed:(id)a3
{
  -[SFAnalytics noteEventNamed:timestampBucket:](self, "noteEventNamed:timestampBucket:", a3, 0);
}

- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5
{
  -[SFAnalytics logEventNamed:class:attributes:timestampBucket:](self, "logEventNamed:class:attributes:timestampBucket:", a3, a4, a5, 0);
}

- (id)addMetricSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v13;
  const char *v14;
  NSObject *v15;
  NSObject *v17;
  uint32_t v18;
  _QWORD block[4];
  id v21;
  SFAnalytics *v22;
  id v23;
  __int128 *p_buf;
  id v25[2];
  id location;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v14 = "SFAnalytics: cannot add sampler without name";
LABEL_15:
      v17 = v15;
      v18 = 2;
LABEL_16:
      _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v18);
    }
LABEL_17:

    v13 = 0;
    goto LABEL_18;
  }
  if (a4 < 1.0 && a4 != -1.0)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = a4;
    v14 = "SFAnalytics: cannot add sampler with interval %f";
    v17 = v15;
    v18 = 12;
    goto LABEL_16;
  }
  if (!v9)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v14 = "SFAnalytics: cannot add sampler without block";
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2140;
  v30 = __Block_byref_object_dispose__2141;
  v31 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SFAnalytics_addMetricSamplerForName_withTimeInterval_block___block_invoke;
  block[3] = &unk_1E1FCC180;
  objc_copyWeak(v25, &location);
  v21 = v8;
  p_buf = &buf;
  v25[1] = *(id *)&a4;
  v22 = self;
  v23 = v10;
  dispatch_sync(queue, block);
  v13 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

LABEL_18:
  return v13;
}

- (id)AddMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v13;
  const char *v14;
  NSObject *v15;
  NSObject *v17;
  uint32_t v18;
  _QWORD block[4];
  id v21;
  SFAnalytics *v22;
  id v23;
  __int128 *p_buf;
  id v25[2];
  id location;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v14 = "SFAnalytics: cannot add sampler without name";
LABEL_15:
      v17 = v15;
      v18 = 2;
LABEL_16:
      _os_log_impl(&dword_18A900000, v17, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v18);
    }
LABEL_17:

    v13 = 0;
    goto LABEL_18;
  }
  if (a4 < 1.0 && a4 != -1.0)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = a4;
    v14 = "SFAnalytics: cannot add sampler with interval %f";
    v17 = v15;
    v18 = 12;
    goto LABEL_16;
  }
  if (!v9)
  {
    secLogObjForScope("SecError");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      v14 = "SFAnalytics: cannot add sampler without block";
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2140;
  v30 = __Block_byref_object_dispose__2141;
  v31 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SFAnalytics_AddMultiSamplerForName_withTimeInterval_block___block_invoke;
  block[3] = &unk_1E1FCC180;
  objc_copyWeak(v25, &location);
  v21 = v8;
  p_buf = &buf;
  v25[1] = *(id *)&a4;
  v22 = self;
  v23 = v10;
  dispatch_sync(queue, block);
  v13 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

LABEL_18:
  return v13;
}

- (id)existingMetricSamplerForName:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2140;
  v18 = __Block_byref_object_dispose__2141;
  v19 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SFAnalytics_existingMetricSamplerForName___block_invoke;
  v9[3] = &unk_1E1FCC070;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = &v14;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)existingMultiSamplerForName:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2140;
  v18 = __Block_byref_object_dispose__2141;
  v19 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SFAnalytics_existingMultiSamplerForName___block_invoke;
  v9[3] = &unk_1E1FCC070;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = &v14;
  v6 = v4;
  dispatch_sync(queue, v9);
  v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)removeMetricSamplerForName:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location[2];

  v4 = a3;
  if (v4)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SFAnalytics_removeMetricSamplerForName___block_invoke;
    v7[3] = &unk_1E1FCC048;
    objc_copyWeak(&v9, location);
    v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to remove sampler without specifying samplerName", (uint8_t *)location, 2u);
    }

  }
}

- (void)removeMultiSamplerForName:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location[2];

  v4 = a3;
  if (v4)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SFAnalytics_removeMultiSamplerForName___block_invoke;
    v7[3] = &unk_1E1FCC048;
    objc_copyWeak(&v9, location);
    v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    secLogObjForScope("SecError");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "Attempt to remove multisampler without specifying samplerName", (uint8_t *)location, 2u);
    }

  }
}

- (id)logSystemMetricsForActivityNamed:(id)a3 withAction:(id)a4
{
  id v5;
  id v6;
  SFAnalyticsActivityTracker *v7;
  SFAnalyticsActivityTracker *v8;
  NSObject *v9;
  uint8_t v11[16];

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[SFAnalyticsActivityTracker initWithName:clientClass:]([SFAnalyticsActivityTracker alloc], "initWithName:clientClass:", v5, objc_opt_class());
    v8 = v7;
    if (v6)
      -[SFAnalyticsActivityTracker performAction:](v7, "performAction:", v6);
  }
  else
  {
    secLogObjForScope("SecError");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, "Cannot log system metrics without name", v11, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)startLogSystemMetricsForActivityNamed:(id)a3
{
  id v3;
  SFAnalyticsActivityTracker *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SFAnalyticsActivityTracker initWithName:clientClass:]([SFAnalyticsActivityTracker alloc], "initWithName:clientClass:", v3, objc_opt_class());
    -[SFAnalyticsActivityTracker start](v4, "start");
  }
  else
  {
    secLogObjForScope("SecError");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "Cannot log system metrics without name", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (void)logMetric:(id)a3 withName:(id)a4
{
  -[SFAnalytics logMetric:withName:oncePerReport:](self, "logMetric:withName:oncePerReport:", a3, a4, 0);
}

- (void)logMetric:(id)a3 withName:(id)a4 oncePerReport:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *queue;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id location[2];

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__SFAnalytics_logMetric_withName_oncePerReport___block_invoke;
    v12[3] = &unk_1E1FCC1A8;
    objc_copyWeak(&v15, location);
    v16 = a5;
    v13 = v9;
    v14 = v8;
    dispatch_async(queue, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    secLogObjForScope("SecError");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "SFAnalytics: Need a valid result and name to log result", (uint8_t *)location, 2u);
    }

  }
}

- (void)noteLaunchSequence:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "metricsReport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Launch-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalytics logEventNamed:class:attributes:timestampBucket:](self, "logEventNamed:class:attributes:timestampBucket:", v7, 4, v4, 0);

  }
}

- (void)drainLogQueue
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_123);
}

- (void)setMetricsHooks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (SFAnalyticsCollection)collection
{
  return (SFAnalyticsCollection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_metricsHooks, 0);
  objc_storeStrong((id *)&self->_multisamplers, 0);
  objc_storeStrong((id *)&self->_samplers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __48__SFAnalytics_logMetric_withName_oncePerReport___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && (WeakRetained[40] & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(WeakRetained, "database");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeAllSamplesForName:", *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(v6, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSample:forName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

void __41__SFAnalytics_removeMultiSamplerForName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  v2 = (void *)os_transaction_create();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseSampling");

    objc_msgSend(WeakRetained[4], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  }

}

void __42__SFAnalytics_removeMetricSamplerForName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  v2 = (void *)os_transaction_create();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseSampling");

    objc_msgSend(WeakRetained[3], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  }

}

void __43__SFAnalytics_existingMultiSamplerForName___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

void __44__SFAnalytics_existingMetricSamplerForName___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    WeakRetained = v6;
  }

}

void __61__SFAnalytics_AddMultiSamplerForName_withTimeInterval_block___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  SFAnalyticsMultiSampler *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "SFAnalytics: multisampler \"%@\" already exists", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v6 = -[SFAnalyticsMultiSampler initWithName:interval:block:clientClass:]([SFAnalyticsMultiSampler alloc], "initWithName:interval:block:clientClass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_opt_class(), *(double *)(a1 + 72));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(WeakRetained[4], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));
  }

}

void __62__SFAnalytics_addMetricSamplerForName_withTimeInterval_block___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  SFAnalyticsSampler *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "SFAnalytics: sampler \"%@\" already exists", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v6 = -[SFAnalyticsSampler initWithName:interval:block:clientClass:]([SFAnalyticsSampler alloc], "initWithName:interval:block:clientClass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_opt_class(), *(double *)(a1 + 72));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(WeakRetained[3], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));
  }

}

void __38__SFAnalytics_coreAnalyticsKeyFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

void __27__SFAnalytics_dailyMetrics__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1[4] + 32), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 24), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __27__SFAnalytics_dailyMetrics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "oncePerReport");
  v5 = v7;
  if (v4)
  {
    objc_msgSend(v7, "sampleNow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v6);

    v5 = v7;
  }

}

void __27__SFAnalytics_dailyMetrics__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "oncePerReport"))
  {
    objc_msgSend(v5, "sampleNow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

void __35__SFAnalytics_setMetricsAccountID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMetricsAccountID:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

void __31__SFAnalytics_metricsAccountID__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metricsAccountID");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    WeakRetained = v7;
  }

}

void __34__SFAnalytics_dataPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyForKey:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    WeakRetained = v7;
  }

}

void __38__SFAnalytics_setDataProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __36__SFAnalytics_numberPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    WeakRetained = v8;
  }

}

void __40__SFAnalytics_setNumberProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __46__SFAnalytics_incrementIntegerPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    objc_msgSend(v8, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v5 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v7, *(_QWORD *)(a1 + 32));

    WeakRetained = v8;
  }

}

void __34__SFAnalytics_datePropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "datePropertyForKey:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    WeakRetained = v7;
  }

}

void __38__SFAnalytics_setDateProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDateProperty:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __40__SFAnalytics_removeStateAndUnlinkFile___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "database");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "close");

    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "database");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "remove");

    }
    v4 = WeakRetained[1];
    WeakRetained[1] = 0;

    objc_msgSend(WeakRetained[6], "removeAllObjects");
  }

}

void __33__SFAnalytics_removeMetricsHook___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "metricsHooks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v3, "removeObject:", v2);

}

void __30__SFAnalytics_addMetricsHook___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "metricsHooks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

+ (NSString)databasePath
{
  return 0;
}

+ (id)defaultAnalyticsDatabasePath:(id)a3
{
  id v3;
  void *v4;
  CFURLRef v5;
  void *v6;

  v3 = a3;
  WithPathInKeychainDirectory((uint64_t)CFSTR("Analytics"), (uint64_t)&__block_literal_global_2196);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Analytics/%@.db"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v5 = SecCopyURLForFileInBaseDirectory(CFSTR("Library/Keychains"), (uint64_t)v4);
  -[__CFURL path](v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)removeLegacyDefaultAnalyticsDatabasePath:(id)a3 usingDispatchToken:(int64_t *)a4
{
  id v5;
  int64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke;
  block[3] = &unk_1E1FDBE18;
  v11 = v5;
  v6 = *a4;
  v7 = v5;
  v9 = v7;
  if (v6 == -1)
  {
    v8 = v7;
  }
  else
  {
    dispatch_once(a4, block);
    v8 = v11;
  }

}

+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3 uuid:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFURL *v8;
  void *v9;
  const __CFURL *v10;
  void *v11;
  CFURLRef v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("sfanalytics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SecCopyURLForFileInBaseDirectory(CFSTR("private/var/protected/"), (uint64_t)v7);
  WithPathInDirectory(v8, (uint64_t)&__block_literal_global_86);
  if (v6)
  {
    objc_msgSend(v7, "appendString:", CFSTR("/"));
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v9);

    v10 = SecCopyURLForFileInBaseDirectory(CFSTR("private/var/protected/"), (uint64_t)v7);
    WithPathInDirectory(v10, (uint64_t)&__block_literal_global_90);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.db"), v7, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = SecCopyURLForFileInBaseDirectory(CFSTR("private/var/protected/"), (uint64_t)v11);
  -[__CFURL path](v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "removeLegacyDefaultAnalyticsDatabasePath:usingDispatchToken:", v4, &defaultProtectedAnalyticsDatabasePath__onceToken);
  +[SFAnalytics defaultProtectedAnalyticsDatabasePath:uuid:](SFAnalytics, "defaultProtectedAnalyticsDatabasePath:uuid:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)fuzzyDaysSinceDate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  int64_t v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1483228800.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "compare:", v4);

    if (v5 == -1)
    {
      v9 = 1000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v3);
      v8 = v7;

      if (v8 >= 86400.0)
      {
        if (v8 >= 604800.0)
        {
          if (v8 >= 2592000.0)
          {
            if (v8 >= 31536000.0)
              v9 = 365;
            else
              v9 = 30;
          }
          else
          {
            v9 = 7;
          }
        }
        else
        {
          v9 = 1;
        }
      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (int64_t)fuzzyInteger:(int64_t)a3
{
  unint64_t v3;
  int64_t v4;
  unint64_t v6;

  if (a3 >= 0)
    v3 = a3;
  else
    v3 = -a3;
  if (!a3)
    return 0;
  v4 = (a3 >> 63) | 1;
  if (v3 <= 5)
    return 5 * v4;
  if (v3 % 5 >= 3)
    v6 = 5 * (v3 / 5) + 5;
  else
    v6 = 5 * (v3 / 5);
  return v6 * v4;
}

+ (id)fuzzyNumber:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "fuzzyInteger:", objc_msgSend(a3, "integerValue")));
}

+ (id)hwModelID
{
  if (hwModelID_onceToken != -1)
    dispatch_once(&hwModelID_onceToken, &__block_literal_global_101);
  return (id)hwModelID_hwModel;
}

void __35__SFAnalytics_addOSVersionToEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v9 = v2;
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)addOSVersionToEvent__build;
    addOSVersionToEvent__build = v3;

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB98]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)addOSVersionToEvent__product;
    addOSVersionToEvent__product = v5;

    addOSVersionToEvent__internal = os_variant_has_internal_diagnostics();
    objc_msgSend(*(id *)(a1 + 32), "hwModelID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)addOSVersionToEvent__modelID;
    addOSVersionToEvent__modelID = v7;

    v2 = v9;
  }

}

void __24__SFAnalytics_hwModelID__block_invoke()
{
  uint64_t v0;
  void *v1;
  utsname __b;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  memset(&__b, 170, sizeof(__b));
  uname(&__b);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", __b.machine, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hwModelID_hwModel;
  hwModelID_hwModel = v0;

}

uint64_t __58__SFAnalytics_defaultProtectedAnalyticsDatabasePath_uuid___block_invoke_89(int a1, char *path)
{
  int v3;
  int v4;
  NSObject *v5;
  int v7;
  char *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    v4 = v3;
    if (v3 != 17)
    {
      secLogObjForScope("SecError");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = path;
        v9 = 2080;
        v10 = strerror(v4);
        _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }

    }
  }
  return chmod(path, 0x1FFu);
}

uint64_t __58__SFAnalytics_defaultProtectedAnalyticsDatabasePath_uuid___block_invoke(int a1, char *path)
{
  int v3;
  int v4;
  NSObject *v5;
  int v7;
  char *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    v4 = v3;
    if (v3 != 17)
    {
      secLogObjForScope("SecError");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = path;
        v9 = 2080;
        v10 = strerror(v4);
        _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }

    }
  }
  return chmod(path, 0x1FFu);
}

void __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Analytics/%@.db"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WithPathInKeychainDirectory((uint64_t)v2, (uint64_t)&__block_literal_global_74);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Analytics/%@.db-shm"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WithPathInKeychainDirectory((uint64_t)v3, (uint64_t)&__block_literal_global_77);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Analytics/%@.db-wal"), *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  WithPathInKeychainDirectory((uint64_t)v4, (uint64_t)&__block_literal_global_80);
  WithPathInKeychainDirectory((uint64_t)CFSTR("Analytics"), (uint64_t)&__block_literal_global_81);

}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_5(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_4(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_3(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_2(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

uint64_t __44__SFAnalytics_defaultAnalyticsDatabasePath___block_invoke(int a1, char *path)
{
  int v3;
  int v4;
  NSObject *v5;
  int v7;
  char *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    v4 = v3;
    if (v3 != 17)
    {
      secLogObjForScope("SecError");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315394;
        v8 = path;
        v9 = 2080;
        v10 = strerror(v4);
        _os_log_impl(&dword_18A900000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }

    }
  }
  return chmod(path, 0x1FFu);
}

@end
