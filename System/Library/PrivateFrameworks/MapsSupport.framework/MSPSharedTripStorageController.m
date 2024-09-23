@implementation MSPSharedTripStorageController

- (MSPSharedTripStorageController)init
{
  MSPSharedTripStorageController *v2;
  NSObject *v3;
  uint64_t v4;
  NSMutableDictionary *sharedTripGroupSessionInfo;
  uint64_t v6;
  NSMutableDictionary *receiverRules;
  uint64_t v8;
  NSMutableDictionary *senderRules;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v14;
  id buf[2];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripStorageController;
  v2 = -[MSPSharedTripStorageController init](&v16, sel_init);
  if (v2)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[STORAGE] initializing new MSPSharedTripStorageController", (uint8_t *)buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    sharedTripGroupSessionInfo = v2->_sharedTripGroupSessionInfo;
    v2->_sharedTripGroupSessionInfo = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    receiverRules = v2->_receiverRules;
    v2->_receiverRules = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    senderRules = v2->_senderRules;
    v2->_senderRules = (NSMutableDictionary *)v8;

    -[MSPSharedTripStorageController _loadSenderSession](v2, "_loadSenderSession");
    MSPGetSharedTripStorageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "[STORAGE] Scheduling deferred load of stored sessions", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    v11 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__MSPSharedTripStorageController_init__block_invoke;
    block[3] = &unk_1E66520A0;
    objc_copyWeak(&v14, buf);
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __38__MSPSharedTripStorageController_init__block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[8];
    MSPGetSharedTripStorageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] Ignoring deferred load of stored sessions, already completed", buf, 2u);
      }

    }
    else
    {
      if (v5)
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] Triggering deferred load of stored sessions", v6, 2u);
      }

      objc_msgSend(v2, "_loadStoredSessions");
    }
  }

}

- (void)initialiseStoredSessionsIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_initalisedStoredSessions)
  {
    MSPGetSharedTripStorageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[STORAGE] Triggering immediate load of stored sessions", v4, 2u);
    }

    -[MSPSharedTripStorageController _loadStoredSessions](self, "_loadStoredSessions");
  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v6 = "-[MSPSharedTripStorageController dealloc]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[STORAGE] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripStorageController;
  -[MSPSharedTripStorageController dealloc](&v4, sel_dealloc);
}

- (void)setSenderSessionStorage:(id)a3
{
  MSPGroupSessionStorage *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  MSPGroupSessionStorage *senderSessionStorage;
  int v15;
  __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (MSPGroupSessionStorage *)a3;
  if (-[MSPGroupSessionStorage hasGroupIdentifier](v4, "hasGroupIdentifier")
    && -[MSPGroupSessionStorage hasGroupIdentifier](self->_senderSessionStorage, "hasGroupIdentifier"))
  {
    -[MSPGroupSessionStorage groupIdentifier](v4, "groupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPGroupSessionStorage groupIdentifier](self->_senderSessionStorage, "groupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v4 && (v7 & 1) != 0)
      goto LABEL_12;
  }
  else
  {
    v7 = 0;
  }
  MSPGetSharedTripStorageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v7)
      v9 = CFSTR("YES");
    v10 = v9;
    -[MSPGroupSessionStorage groupIdentifier](v4, "groupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPGroupSessionStorage groupIdentifier](self->_senderSessionStorage, "groupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEFAULT, "[STORAGE] setSenderSessionStorage clearing storage (sameGroup: %@, incoming: %@, existing: %@)", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripStorageController setSenderRules:](self, "setSenderRules:", v13);

LABEL_12:
  senderSessionStorage = self->_senderSessionStorage;
  self->_senderSessionStorage = v4;

  -[MSPSharedTripStorageController _saveSenderSession](self, "_saveSenderSession");
}

- (id)groupSessionInfoForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sharedTripGroupSessionInfo, "objectForKeyedSubscript:", a3);
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *sharedTripGroupSessionInfo;
  void *v7;
  int v8;
  NSMutableDictionary *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  MSPGetSharedTripStorageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
    v8 = 138412290;
    v9 = sharedTripGroupSessionInfo;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_INFO, "[STORAGE] setDelegate %@", (uint8_t *)&v8, 0xCu);
  }

  if (-[NSMutableDictionary count](self->_sharedTripGroupSessionInfo, "count"))
  {
    v7 = (void *)-[NSMutableDictionary copy](self->_sharedTripGroupSessionInfo, "copy");
    objc_msgSend(v4, "storageController:updatedSharedTripGroupStorage:", self, v7);

  }
}

- (void)addNewSession:(id)a3 originator:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *sharedTripGroupSessionInfo;
  id WeakRetained;
  void *v15;
  int v16;
  NSMutableDictionary *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  +[MSPGroupSessionStorage groupStorageWithIdentifier:originator:receivingHandle:receivingAccountIdentifier:](MSPGroupSessionStorage, "groupStorageWithIdentifier:originator:receivingHandle:receivingAccountIdentifier:", v10, a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedTripGroupSessionInfo, "setObject:forKeyedSubscript:", v11, v10);

  -[MSPSharedTripStorageController _saveStoredSessions](self, "_saveStoredSessions");
  MSPGetSharedTripStorageLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
    v16 = 138412290;
    v17 = sharedTripGroupSessionInfo;
    _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_DEFAULT, "[STORAGE] addNewSession %@", (uint8_t *)&v16, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = (void *)-[NSMutableDictionary copy](self->_sharedTripGroupSessionInfo, "copy");
  objc_msgSend(WeakRetained, "storageController:updatedSharedTripGroupStorage:", self, v15);

}

- (void)removeSession:(id)a3
{
  NSMutableDictionary *sharedTripGroupSessionInfo;
  id v5;
  void *v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  id WeakRetained;
  void *v10;
  int v11;
  NSMutableDictionary *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
  v5 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](sharedTripGroupSessionInfo, "setObject:forKeyedSubscript:", 0, v5);
  -[MSPSharedTripStorageController receiverRules](self, "receiverRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v5);

  -[MSPSharedTripStorageController _saveStoredSessions](self, "_saveStoredSessions");
  MSPGetSharedTripStorageLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_sharedTripGroupSessionInfo;
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEFAULT, "[STORAGE] removeSession %@", (uint8_t *)&v11, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = (void *)-[NSMutableDictionary copy](self->_sharedTripGroupSessionInfo, "copy");
  objc_msgSend(WeakRetained, "storageController:updatedSharedTripGroupStorage:", self, v10);

}

- (void)updateGroupSessionStorageWithState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripStorageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "[STORAGE] updateGroupSessionStorageWithState %@", (uint8_t *)&v8, 0xCu);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedTripGroupSessionInfo, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithState:", v4);

  -[MSPSharedTripStorageController _saveStoredSessions](self, "_saveStoredSessions");
}

- (id)receivingRulesForIdentifier:(id)a3
{
  id v4;
  void *v5;
  MSPSharedTripNotificationRules *v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSPSharedTripStorageController receiverRules](self, "receiverRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (MSPSharedTripNotificationRules *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    MSPGetSharedTripLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEFAULT, "MSPSharedTripStorageController allocated receiving MSPSharedTripNotificationRules for groupIdentifier %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = objc_alloc_init(MSPSharedTripNotificationRules);
    -[MSPSharedTripStorageController receiverRules](self, "receiverRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (id)sendingRulesForIdentifier:(id)a3
{
  void *v4;
  MSPGroupSessionStorage *senderSessionStorage;
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  MSPSharedTripNotificationRules *v9;
  NSObject *v10;
  NSObject *v11;
  NSMutableDictionary *senderRules;
  uint8_t buf[4];
  NSMutableDictionary *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  senderSessionStorage = self->_senderSessionStorage;
  v6 = a3;
  -[MSPGroupSessionStorage groupIdentifier](senderSessionStorage, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@+%@"), v7, v6);
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_senderRules, "objectForKeyedSubscript:", v8);
  v9 = (MSPSharedTripNotificationRules *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    MSPGetSharedTripLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "MSPSharedTripStorageController allocated sending MSPSharedTripNotificationRules for key %@", buf, 0xCu);
    }

    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      senderRules = self->_senderRules;
      *(_DWORD *)buf = 138412290;
      v15 = senderRules;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_INFO, "rules %@", buf, 0xCu);
    }

    v9 = -[MSPSharedTripNotificationRules initWithMaximumNumberOfNotifications:]([MSPSharedTripNotificationRules alloc], "initWithMaximumNumberOfNotifications:", GEOConfigGetUInteger());
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_senderRules, "setObject:forKeyedSubscript:", v9, v8);
  }

  return v9;
}

+ (id)_receivedSessionsPath
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapsDirectory");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("receivedsessions.data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_receivedNotificationRulesPath
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapsDirectory");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("rules.data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_loadStoredSessions
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *sharedTripGroupSessionInfo;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id WeakRetained;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  os_signpost_id_t spid;
  void *v49;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_receivedSessionsPath");
  v3 = objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripStorageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadStoredSessions %@", buf, 0xCu);
  }

  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_loadStoredSessions", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }
  spid = v6;

  v49 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0x1E0CB3000uLL;
  if (v10)
  {
    v12 = (void *)MEMORY[0x1E0CB3710];
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v46 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v46, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v12, "unarchivedObjectOfClasses:fromData:error:", v16, v10, &v51);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v51;

    if (v18)
    {
      MSPGetSharedTripLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v18;
        _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_ERROR, "[STORAGE] _loadStoredSessions unarchiving error %@", buf, 0xCu);
      }

      v20 = v8;
      v21 = v20;
      v11 = 0x1E0CB3000;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B39C0000, v21, OS_SIGNPOST_EVENT, spid, "_loadStoredSessionsUnarchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
      }
    }
    else
    {
      v22 = (NSMutableDictionary *)objc_msgSend(v17, "mutableCopy");
      sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
      self->_sharedTripGroupSessionInfo = v22;

      MSPGetSharedTripStorageLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v24 = self->_sharedTripGroupSessionInfo;
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v24;
        _os_log_impl(&dword_1B39C0000, v21, OS_LOG_TYPE_INFO, "[STORAGE] cached group %@", buf, 0xCu);
      }
      v11 = 0x1E0CB3000uLL;
    }

  }
  -[MSPSharedTripStorageController _identifiersOfStaleSessions:](self, "_identifiersOfStaleSessions:", self->_sharedTripGroupSessionInfo);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectsForKeys:](self->_sharedTripGroupSessionInfo, "removeObjectsForKeys:", v26);
  objc_msgSend((id)objc_opt_class(), "_receivedNotificationRulesPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripStorageLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = (uint64_t)v27;
    _os_log_impl(&dword_1B39C0000, v28, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadStoredSessions rulesPath %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v47 = v10;
    v30 = *(void **)(v11 + 1808);
    +[MSPSharedTripNotificationRules unarchivingObjectsSet](MSPSharedTripNotificationRules, "unarchivingObjectsSet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    objc_msgSend(v30, "unarchivedObjectOfClasses:fromData:error:", v31, v29, &v50);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v50;

    if (v33)
    {
      MSPGetSharedTripLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v33;
        _os_log_impl(&dword_1B39C0000, v34, OS_LOG_TYPE_ERROR, "[STORAGE] rules unarchiving error %@", buf, 0xCu);
      }

      v35 = v8;
      v36 = v35;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B39C0000, v36, OS_SIGNPOST_EVENT, spid, "_loadStoredSessionsRulesUnarchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
      }
    }
    else
    {
      v37 = (void *)objc_msgSend(v32, "mutableCopy");
      -[MSPSharedTripStorageController setReceiverRules:](self, "setReceiverRules:", v37);

      MSPGetSharedTripStorageLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        -[MSPSharedTripStorageController receiverRules](self, "receiverRules");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = (uint64_t)v38;
        _os_log_impl(&dword_1B39C0000, v36, OS_LOG_TYPE_INFO, "[STORAGE] cached rules %@", buf, 0xCu);

      }
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_receiverRules, "removeObjectsForKeys:", v26);
    v10 = v47;
  }
  else
  {
    -[NSMutableDictionary removeObjectsForKeys:](self->_receiverRules, "removeObjectsForKeys:", v26);
    if (!v10)
      goto LABEL_32;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v40 = (void *)-[NSMutableDictionary copy](self->_sharedTripGroupSessionInfo, "copy");
  objc_msgSend(WeakRetained, "storageController:updatedSharedTripGroupStorage:", self, v40);

LABEL_32:
  v41 = v8;
  v42 = v41;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v42, OS_SIGNPOST_INTERVAL_END, spid, "_loadStoredSessions", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  if (objc_msgSend(v26, "count"))
  {
    MSPGetSharedTripStorageLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 134217984;
      v53 = v44;
      _os_log_impl(&dword_1B39C0000, v43, OS_LOG_TYPE_INFO, "[STORAGE] %lu sessions are stale, re-saving remaining sessions", buf, 0xCu);
    }

    -[MSPSharedTripStorageController _saveStoredSessions](self, "_saveStoredSessions");
    -[MSPSharedTripStorageController _saveReceivingRules](self, "_saveReceivingRules");
  }
  if (!self->_initalisedStoredSessions)
  {
    MSPGetSharedTripStorageLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v45, OS_LOG_TYPE_DEFAULT, "[STORAGE] initialised stored sessions", buf, 2u);
    }

    self->_initalisedStoredSessions = 1;
  }

}

- (id)_identifiersOfStaleSessions:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v3, "keysOfEntriesPassingTest:", &__block_literal_global_4);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __62__MSPSharedTripStorageController__identifiersOfStaleSessions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  NSObject *v24;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  int v33;
  id v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "hasArrived"))
      v8 = objc_msgSend(v7, "arrived");
    else
      v8 = 0;
    if (objc_msgSend(v7, "hasClosed"))
      v11 = objc_msgSend(v7, "closed");
    else
      v11 = 0;
    v12 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "etaInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "etaTimestamp");
    objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceNow");
    v16 = v15;

    v17 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v5, "lastUpdateTimestamp");
    objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceNow](v9, "timeIntervalSinceNow");
    v19 = v18;
    GEOConfigGetDouble();
    v21 = -v20;
    v22 = v8 | v11;
    if (v16 < 0.0)
      v22 = 1;
    if (v19 >= v21 || v22 == 0)
    {
      v10 = 0;
    }
    else
    {
      MSPGetSharedTripLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        if (v8)
          v26 = CFSTR("YES");
        else
          v26 = CFSTR("NO");
        v27 = v26;
        if (v11)
          v28 = CFSTR("YES");
        else
          v28 = CFSTR("NO");
        v29 = v28;
        if (v16 >= 0.0)
          v30 = CFSTR("NO");
        else
          v30 = CFSTR("YES");
        v31 = v30;
        v33 = 138413058;
        v34 = v4;
        v35 = 2112;
        v36 = v27;
        v37 = 2112;
        v38 = v29;
        v39 = 2112;
        v40 = v31;
        _os_log_impl(&dword_1B39C0000, v24, OS_LOG_TYPE_INFO, "restored session %@ is stale: arrived %@ closed %@ etaInPast %@", (uint8_t *)&v33, 0x2Au);

      }
      v10 = 1;
    }
  }
  else
  {
    MSPGetSharedTripLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v33 = 138412290;
      v34 = v4;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_INFO, "restored session %@ is stale: no trip state", (uint8_t *)&v33, 0xCu);
    }
  }

  return v10;
}

- (void)_saveStoredSessions
{
  void *v3;
  NSObject *v4;
  NSMutableDictionary *sharedTripGroupSessionInfo;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  NSMutableDictionary *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_receivedSessionsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripStorageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
    *(_DWORD *)buf = 138412546;
    v27 = sharedTripGroupSessionInfo;
    v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveStoredSessions groupsData %@ at path %@", buf, 0x16u);
  }

  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveStoredSessions", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  v11 = self->_sharedTripGroupSessionInfo;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSMutableDictionary *)v25;
  if (v13 || !v3)
  {
    MSPGetSharedTripStorageLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_ERROR, "[STORAGE] groupArchivingError %@", buf, 0xCu);
    }

    v20 = v9;
    v21 = v20;
    if (v10 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v23 = v21;
      goto LABEL_26;
    }
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v21, OS_SIGNPOST_EVENT, v7, "_saveStoredSessionsArchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }

    v22 = v21;
    goto LABEL_23;
  }
  v24 = 0;
  objc_msgSend(v12, "writeToFile:options:error:", v3, 1, &v24);
  v14 = (NSMutableDictionary *)v24;
  MSPExcludePathFromBackup(v3);
  if (v14)
  {
    MSPGetSharedTripStorageLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_ERROR, "[STORAGE] groupWriteError %@", buf, 0xCu);
    }

    v16 = v9;
    v17 = v16;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v17, OS_SIGNPOST_EVENT, v7, "_saveStoredSessionsWriteError", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }

  }
  v18 = v9;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_23:
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_INTERVAL_END, v7, "_saveStoredSessions", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }
  }
LABEL_26:

}

- (void)_saveReceivingRules
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_receivedNotificationRulesPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripStorageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MSPSharedTripStorageController receiverRules](self, "receiverRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v5;
    v29 = 2112;
    v30 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveRules %@ at path %@", buf, 0x16u);

  }
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveReceivingRules", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  v11 = (void *)MEMORY[0x1E0CB36F8];
  -[MSPSharedTripStorageController receiverRules](self, "receiverRules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v26;

  if (v14 || !v3)
  {
    MSPGetSharedTripStorageLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v14;
      _os_log_impl(&dword_1B39C0000, v20, OS_LOG_TYPE_ERROR, "[STORAGE] rulesArchivingError %@", buf, 0xCu);
    }

    v21 = v9;
    v22 = v21;
    if (v10 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v24 = v22;
      goto LABEL_26;
    }
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v22, OS_SIGNPOST_EVENT, v7, "_saveReceivingRulesArchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }

    v23 = v22;
    goto LABEL_23;
  }
  v25 = 0;
  objc_msgSend(v13, "writeToFile:options:error:", v3, 1, &v25);
  v15 = v25;
  MSPExcludePathFromBackup(v3);
  if (v15)
  {
    MSPGetSharedTripStorageLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_ERROR, "[STORAGE] rulesWriteError %@", buf, 0xCu);
    }

    v17 = v9;
    v18 = v17;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v18, OS_SIGNPOST_EVENT, v7, "_saveReceivingRulesWriteError", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }

  }
  v19 = v9;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_23:
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_INTERVAL_END, v7, "_saveReceivingRules", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }
  }
LABEL_26:

}

+ (id)_senderSessionStoragePath
{
  void *v2;
  void *v3;
  void *v4;

  +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("sender.data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_sentNotificationRulesPath
{
  void *v2;
  void *v3;
  void *v4;

  +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("senderRules.data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_loadSenderSession
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  MSPGroupSessionStorage **p_senderSessionStorage;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t spid;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_loadSenderSession", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }
  spid = v4;

  objc_msgSend((id)objc_opt_class(), "_sentNotificationRulesPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripStorageLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v8;
    _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadSenderSession rulesPath %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3710];
    +[MSPSharedTripNotificationRules unarchivingObjectsSet](MSPSharedTripNotificationRules, "unarchivingObjectsSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v12, v10, &v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v34;

    if (v14)
    {
      MSPGetSharedTripLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v14;
        _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_ERROR, "[STORAGE] sender rules unarchiving error %@", buf, 0xCu);
      }

      v16 = v6;
      v17 = v16;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B39C0000, v17, OS_SIGNPOST_EVENT, spid, "_loadSenderSessionRulesUnarchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
      }
    }
    else
    {
      v18 = (void *)objc_msgSend(v13, "mutableCopy");
      -[MSPSharedTripStorageController setSenderRules:](self, "setSenderRules:", v18);

      MSPGetSharedTripStorageLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        -[MSPSharedTripStorageController senderRules](self, "senderRules");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v19;
        _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "[STORAGE] cached sender rules %@", buf, 0xCu);

      }
    }

  }
  objc_msgSend((id)objc_opt_class(), "_senderSessionStoragePath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripStorageLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v20;
    _os_log_impl(&dword_1B39C0000, v21, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadSenderSession %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v22, &v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;
    if (v24)
    {
      MSPGetSharedTripLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v24;
        _os_log_impl(&dword_1B39C0000, v25, OS_LOG_TYPE_ERROR, "[STORAGE] _loadSenderSession unarchiver error %@", buf, 0xCu);
      }

      v26 = v6;
      v27 = v26;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B39C0000, v27, OS_SIGNPOST_EVENT, spid, "_loadSenderSessionUnarchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
      }
    }
    else
    {
      p_senderSessionStorage = &self->_senderSessionStorage;
      objc_storeStrong((id *)&self->_senderSessionStorage, v23);
      MSPGetSharedTripStorageLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        -[MSPGroupSessionStorage groupIdentifier](*p_senderSessionStorage, "groupIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v29;
        _os_log_impl(&dword_1B39C0000, v27, OS_LOG_TYPE_INFO, "[STORAGE] cached session for group id %@", buf, 0xCu);

      }
    }

  }
  v30 = v6;
  v31 = v30;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v31, OS_SIGNPOST_INTERVAL_END, spid, "_loadSenderSession", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

}

- (void)_saveSenderSession
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  MSPGroupSessionStorage *senderSessionStorage;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  NSObject *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_senderSessionStoragePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_37;
  MSPGetSharedTripStorageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MSPGroupSessionStorage groupIdentifier](self->_senderSessionStorage, "groupIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v5;
    v33 = 2112;
    v34 = v3;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveSenderSession session for group id: %@ path: %@", buf, 0x16u);

  }
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveSenderSession", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  senderSessionStorage = self->_senderSessionStorage;
  if (senderSessionStorage)
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", senderSessionStorage, 1, &v30);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v30;
    if (v13)
    {
      MSPGetSharedTripStorageLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v13;
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_ERROR, "[STORAGE] archiveError %@", buf, 0xCu);
      }

      v15 = v9;
      v16 = v15;
      if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B39C0000, v16, OS_SIGNPOST_EVENT, v7, "_saveSenderSessionArchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
      }

    }
    if (v12)
    {
      v29 = 0;
      -[NSObject writeToFile:options:error:](v12, "writeToFile:options:error:", v3, 1, &v29);
      v17 = v29;
      MSPExcludePathFromBackup(v3);
      if (v17)
      {
        MSPGetSharedTripStorageLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v17;
          _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_ERROR, "[STORAGE] writeError %@", buf, 0xCu);
        }

        v19 = v9;
        v20 = v19;
        if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B39C0000, v20, OS_SIGNPOST_EVENT, v7, "_saveSenderSessionWriteError", (const char *)&unk_1B3A3EAC5, buf, 2u);
        }

      }
LABEL_31:

      goto LABEL_32;
    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "fileExistsAtPath:", v3);

  if (!v22)
    goto LABEL_33;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v23, "removeItemAtPath:error:", v3, &v28);
  v12 = v28;

  if (v12)
  {
    MSPGetSharedTripStorageLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl(&dword_1B39C0000, v24, OS_LOG_TYPE_ERROR, "[STORAGE] deleteError %@", buf, 0xCu);
    }

    v25 = v9;
    v17 = v25;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v17, OS_SIGNPOST_EVENT, v7, "_saveSenderSessionDeleteError", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }
    goto LABEL_31;
  }
LABEL_32:

LABEL_33:
  v26 = v9;
  v27 = v26;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v27, OS_SIGNPOST_INTERVAL_END, v7, "_saveSenderSession", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

LABEL_37:
}

- (void)_saveSendingRules
{
  void *v3;
  NSObject *v4;
  NSMutableDictionary *senderRules;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSMutableDictionary *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  NSMutableDictionary *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_sentNotificationRulesPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    MSPGetSharedTripStorageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      senderRules = self->_senderRules;
      *(_DWORD *)buf = 138412546;
      v27 = senderRules;
      v28 = 2112;
      v29 = v3;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveSendingRules rules %@ at path %@", buf, 0x16u);
    }

    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);
    v8 = v6;
    v9 = v8;
    v10 = v7 - 1;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveSendingRules", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }

    v11 = self->_senderRules;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSMutableDictionary *)v25;
    if (v13)
    {
      MSPGetSharedTripStorageLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_ERROR, "[STORAGE] _saveSendingRules archiving error %@", buf, 0xCu);
      }

      v15 = v9;
      v16 = v15;
      if (v10 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v23 = v16;
LABEL_25:

        goto LABEL_26;
      }
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B39C0000, v16, OS_SIGNPOST_EVENT, v7, "_saveSendingRulesArchiveError", (const char *)&unk_1B3A3EAC5, buf, 2u);
      }

      v17 = v16;
    }
    else
    {
      v24 = 0;
      objc_msgSend(v12, "writeToFile:options:error:", v3, 1, &v24);
      v18 = (NSMutableDictionary *)v24;
      MSPExcludePathFromBackup(v3);
      if (v18)
      {
        MSPGetSharedTripStorageLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v18;
          _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_ERROR, "[STORAGE] _saveSendingRules write error %@", buf, 0xCu);
        }

        v20 = v9;
        v21 = v20;
        if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B39C0000, v21, OS_SIGNPOST_EVENT, v7, "_saveSendingRulesWriteError", (const char *)&unk_1B3A3EAC5, buf, 2u);
        }

      }
      v22 = v9;
      if (v10 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_25;
    }
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B39C0000, v9, OS_SIGNPOST_INTERVAL_END, v7, "_saveSendingRules", (const char *)&unk_1B3A3EAC5, buf, 2u);
    }
    goto LABEL_25;
  }
LABEL_26:

}

+ (void)removeFilesFromBackupsIfNeeded
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__MSPSharedTripStorageController_removeFilesFromBackupsIfNeeded__block_invoke;
  v10[3] = &unk_1E6652108;
  v11 = v3;
  v4 = v3;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E2B4E8](v10);
  objc_msgSend(a1, "_senderSessionStoragePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  objc_msgSend(a1, "_sentNotificationRulesPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  objc_msgSend(a1, "_receivedSessionsPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v8);

  objc_msgSend(a1, "_receivedNotificationRulesPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v9);

}

void __64__MSPSharedTripStorageController_removeFilesFromBackupsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3
    && objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v3)
    && (MSPIsExcludedFromBackup((uint64_t)v3) & 1) == 0)
  {
    MSPGetSharedTripStorageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] Found file not excluded from backup, excluding now: %@", (uint8_t *)&v8, 0xCu);

    }
    if ((MSPExcludePathFromBackup(v3) & 1) == 0)
    {
      MSPGetSharedTripStorageLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "[STORAGE] Failed to exclude file from backup: %@", (uint8_t *)&v8, 0xCu);

      }
    }
  }

}

- (MSPSharedTripStorageDelegate)delegate
{
  return (MSPSharedTripStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MSPGroupSessionStorage)senderSessionStorage
{
  return self->_senderSessionStorage;
}

- (NSMutableDictionary)sharedTripGroupSessionInfo
{
  return self->_sharedTripGroupSessionInfo;
}

- (void)setSharedTripGroupSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTripGroupSessionInfo, a3);
}

- (NSMutableDictionary)receiverRules
{
  return self->_receiverRules;
}

- (void)setReceiverRules:(id)a3
{
  objc_storeStrong((id *)&self->_receiverRules, a3);
}

- (NSMutableDictionary)senderRules
{
  return self->_senderRules;
}

- (void)setSenderRules:(id)a3
{
  objc_storeStrong((id *)&self->_senderRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderRules, 0);
  objc_storeStrong((id *)&self->_receiverRules, 0);
  objc_storeStrong((id *)&self->_sharedTripGroupSessionInfo, 0);
  objc_storeStrong((id *)&self->_senderSessionStorage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
