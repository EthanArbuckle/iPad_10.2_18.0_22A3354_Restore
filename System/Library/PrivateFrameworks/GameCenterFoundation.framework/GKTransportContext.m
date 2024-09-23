@implementation GKTransportContext

- (GKTransportContext)initWithSupportedTransports:(id)a3
{
  id v4;
  GKTransportContext *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (+[GKEntitledContextProvider hasBooleanPublicGameCenterEntitlement](GKEntitledContextProvider, "hasBooleanPublicGameCenterEntitlement"))
  {
    v5 = -[GKTransportContext initWithValidTransports:localPlayerID:](self, "initWithValidTransports:localPlayerID:", v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__GKTransportContext_initWithSupportedTransports___block_invoke;
    v9[3] = &unk_1E75B6378;
    v10 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v5 = -[GKTransportContext initWithValidTransports:localPlayerID:](self, "initWithValidTransports:localPlayerID:", v7, 0);

  }
  return v5;
}

void __50__GKTransportContext_initWithSupportedTransports___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (objc_msgSend(v3, "version") == 2)
  {
    if (!os_log_GKGeneral)
      v4 = GKOSLoggers();
    v5 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_INFO, "Removing FastSync from supported transports since this game doesn't have Game Center entitlements.", v6, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

- (GKTransportContext)initWithValidTransports:(id)a3 localPlayerID:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  GKTransportContext *v10;
  void *v11;
  uint64_t v12;
  NSSet *supportedTransports;
  GKMultiplayerDaemonProxyHelper *v14;
  GKMultiplayerDaemonProxy *daemonProxy;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKTransportContext;
  v10 = -[GKTransportContext init](&v17, sel_init);
  if (v10)
  {
    v11 = v9;
    if (!v9)
    {
      +[GKLocalPlayer local](GKLocalPlayer, "local");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "internal");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "playerID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_localPlayerID, v11);
    if (!v9)
    {

    }
    v12 = objc_msgSend(v8, "copy");
    supportedTransports = v10->_supportedTransports;
    v10->_supportedTransports = (NSSet *)v12;

    v14 = objc_alloc_init(GKMultiplayerDaemonProxyHelper);
    daemonProxy = v10->_daemonProxy;
    v10->_daemonProxy = (GKMultiplayerDaemonProxy *)v14;

  }
  return v10;
}

- (GKTransportContext)initWithLocalPlayerID:(id)a3 localPseudonym:(id)a4 sessionID:(id)a5
{
  id v9;
  id v10;
  id v11;
  GKSupportedTransport *v12;
  void *v13;
  GKTransportContext *v14;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = -[GKSupportedTransport initWithVersionNumber:]([GKSupportedTransport alloc], "initWithVersionNumber:", &unk_1E75FB190);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[GKTransportContext initWithValidTransports:localPlayerID:](self, "initWithValidTransports:localPlayerID:", v13, v11);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_selectedTransport, v12);
    objc_storeStrong((id *)&v14->_sessionID, a5);
    objc_storeStrong((id *)&v14->_pseudonym, a4);
  }

  return v14;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_11 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_11, &__block_literal_global_45);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_11;
}

void __45__GKTransportContext_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[14];
  _QWORD v17[15];

  v17[14] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("cdxTicket");
  v17[0] = objc_opt_class();
  v16[1] = CFSTR("matchID");
  v17[1] = objc_opt_class();
  v16[2] = CFSTR("connectionData");
  v17[2] = objc_opt_class();
  v16[3] = CFSTR("sessionID");
  v17[3] = objc_opt_class();
  v16[4] = CFSTR("peerDictionaries");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v0;
  v16[5] = CFSTR("pseudonym");
  v17[5] = objc_opt_class();
  v16[6] = CFSTR("localPlayerID");
  v17[6] = objc_opt_class();
  v16[7] = CFSTR("selectedTransport");
  v17[7] = objc_opt_class();
  v16[8] = CFSTR("sessionToken");
  v17[8] = objc_opt_class();
  v16[9] = CFSTR("gameParticipants");
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v3;
  v16[10] = CFSTR("lobbyParticipants");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v6;
  v16[11] = CFSTR("playerTokenMap");
  +[GKServiceInterface plistClasses](GKServiceInterface, "plistClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[11] = v7;
  v16[12] = CFSTR("supportedTransports");
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[12] = v10;
  v16[13] = CFSTR("playersAndPushTokens");
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[13] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 14);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_11;
  secureCodedPropertyKeys_sSecureCodedKeys_11 = v14;

}

+ (id)syncQueue
{
  if (syncQueue_onceToken_1 != -1)
    dispatch_once(&syncQueue_onceToken_1, &__block_literal_global_45_0);
  return (id)syncQueue_sSyncQueue_1;
}

void __31__GKTransportContext_syncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.GameKit.transportContext.updateQueue", v2);
  v1 = (void *)syncQueue_sSyncQueue_1;
  syncQueue_sSyncQueue_1 = (uint64_t)v0;

}

- (void)performUpdateSync:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  const char *label;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  dispatch_block_t block;

  block = a3;
  objc_msgSend((id)objc_opt_class(), "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    label = dispatch_queue_get_label(v3);
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%s invoked on the same queue(\"%s\"), would deadlock at %@"), "-[GKTransportContext performUpdateSync:]", label, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/Transport/GKTransportContext.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]"), v8, "-[GKTransportContext performUpdateSync:]", objc_msgSend(v10, "UTF8String"), 115);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  dispatch_sync(v3, block);

}

- (BOOL)allowEarlyConnection
{
  void *v2;
  BOOL v3;

  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "version") == 2;

  return v3;
}

- (BOOL)inviteeShouldAwaitInviteUpdate
{
  void *v2;
  BOOL v3;

  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "version") == 2;

  return v3;
}

- (BOOL)shouldFilterGuestWhenSendingToAll
{
  void *v2;
  BOOL v3;

  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "version") != 2;

  return v3;
}

- (BOOL)shouldDelayConnectionForMatchResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  GKTransportContext *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "version");

  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTransportContext pseudonym](self, "pseudonym");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v38 = self;
      -[GKTransportContext pseudonym](self, "pseudonym");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v39 = v4;
      objc_msgSend(v4, "matches");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v41 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v15, "objectForKey:", CFSTR("client-data"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", CFSTR("ps"));
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              if (!os_log_GKGeneral)
                v26 = GKOSLoggers();
              v27 = os_log_GKMatch;
              v4 = v39;
              if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
                -[GKTransportContext shouldDelayConnectionForMatchResponse:].cold.3((uint64_t)v15, v27);

              goto LABEL_26;
            }
            v18 = (void *)v17;
            objc_msgSend(v7, "addObject:", v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_msgSend(v7, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_59);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!os_log_GKGeneral)
        v21 = GKOSLoggers();
      v22 = (void *)os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
        -[GKTransportContext shouldDelayConnectionForMatchResponse:].cold.2((uint64_t)v20, v22, v38);
      -[GKTransportContext pseudonym](v38, "pseudonym");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24) ^ 1;

      v4 = v39;
    }
    else
    {
      if (!os_log_GKGeneral)
        v28 = GKOSLoggers();
      v29 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        -[GKTransportContext shouldDelayConnectionForMatchResponse:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
LABEL_26:
      LOBYTE(v25) = 0;
    }

  }
  else
  {
    LOBYTE(v25) = 0;
  }

  return v25;
}

uint64_t __60__GKTransportContext_shouldDelayConnectionForMatchResponse___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

- (BOOL)validTransportSelected
{
  void *v3;
  void *v4;
  BOOL v5;

  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKTransportContext selectedTransport](self, "selectedTransport");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "version") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)supportedTransportVersions
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[GKTransportContext selectedTransport](self, "selectedTransport"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "version"),
        v5,
        v4,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[GKTransportContext selectedTransport](self, "selectedTransport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTransportContext supportedTransports](self, "supportedTransports");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__GKTransportContext_supportedTransportVersions__block_invoke;
    v15[3] = &unk_1E75B6378;
    v14 = v12;
    v16 = v14;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    return v14;
  }
}

void __48__GKTransportContext_supportedTransportVersions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "version"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSNumber)defaultInviteVersionFromMinimumSupportedTransportVersion
{
  void *v2;
  void *v3;

  -[GKTransportContext supportedTransportVersions](self, "supportedTransportVersions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("@min.self"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (BOOL)supportsTransportRequiredInTheInvite:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "transportVersionToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6)
  {
    -[GKTransportContext supportedTransports](self, "supportedTransports");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__GKTransportContext_supportsTransportRequiredInTheInvite___block_invoke;
    v12[3] = &unk_1E75B6420;
    v13 = v4;
    objc_msgSend(v8, "_gkFilterWithBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "count") != 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __59__GKTransportContext_supportsTransportRequiredInTheInvite___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "version");
  objc_msgSend(*(id *)(a1 + 32), "transportVersionToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == objc_msgSend(v5, "integerValue"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)selectTransportWith:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  GKSupportedTransport *selectedTransport;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  GKSupportedTransport *v21;
  __int16 v22;
  GKTransportContext *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKTransportContext selectTransportWith:].cold.2(v8, self);
  }
  else if (objc_msgSend(v5, "version"))
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fastSyncTransportEnabled");

    if (v10)
      objc_storeStrong((id *)&self->_selectedTransport, a3);
    else
      -[GKTransportContext selectDefaultTransport](self, "selectDefaultTransport");
    if (!os_log_GKGeneral)
      v13 = GKOSLoggers();
    v14 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      selectedTransport = self->_selectedTransport;
      *(_DWORD *)buf = 138412546;
      v21 = selectedTransport;
      v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_1BCDE3000, v14, OS_LOG_TYPE_INFO, "Transport has been selected as: %@ for context: %@", buf, 0x16u);
    }
    -[GKTransportContext daemonProxy](self, "daemonProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[GKSupportedTransport name](self->_selectedTransport, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Transport Selected: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "emitMultiplayerMessage:", v19);

  }
  else
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      -[GKTransportContext selectTransportWith:].cold.1(v12);
  }

}

- (void)selectDefaultTransport
{
  void *v3;
  GKSupportedTransport *v4;
  GKSupportedTransport *selectedTransport;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTransportContext defaultTransportWithForceEnabledTransports:andForceDisabledTransports:](self, "defaultTransportWithForceEnabledTransports:andForceDisabledTransports:", v6, v3);
  v4 = (GKSupportedTransport *)objc_claimAutoreleasedReturnValue();
  selectedTransport = self->_selectedTransport;
  self->_selectedTransport = v4;

}

- (void)updateForLegacyNearbyInvite
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke;
  v2[3] = &unk_1E75B1590;
  v2[4] = self;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v2);
}

void __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GKSupportedTransport *v13;
  uint64_t v14;
  void *v15;

  if (objc_msgSend(*(id *)(a1 + 32), "validTransportSelected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedTransport");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "version");

    if (v3 == 2)
    {
      if (!os_log_GKGeneral)
        v4 = GKOSLoggers();
      v5 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_ERROR))
        __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    v13 = -[GKSupportedTransport initWithVersionNumber:]([GKSupportedTransport alloc], "initWithVersionNumber:", &unk_1E75FB1A8);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 32);
    *(_QWORD *)(v14 + 32) = v13;

  }
}

- (void)updateForInviteInitiationWithOnlineConnectionData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKTransportContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), v5);
  if (!v4)
  {

  }
  v6 = *(void **)(a1 + 32);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 64), v6);
}

- (void)updateWithInviteInitiateResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKTransportContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  GKSupportedTransport *v4;
  void *v5;
  GKSupportedTransport *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  GKTransportParticipant *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  GKTransportParticipant *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke_cold_1();
  v3 = *(void **)(a1 + 40);
  v4 = [GKSupportedTransport alloc];
  objc_msgSend(*(id *)(a1 + 32), "transportVersionToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKSupportedTransport initWithVersionNumber:](v4, "initWithVersionNumber:", v5);
  objc_msgSend(v3, "selectTransportWith:", v6);

  objc_msgSend(*(id *)(a1 + 32), "selfPseudonym");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v7;

  objc_msgSend(*(id *)(a1 + 32), "playerTokenMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "playerTokenMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    objc_msgSend(*(id *)(a1 + 32), "playerTokenMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v17);

    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 104);
    *(_QWORD *)(v18 + 104) = v16;

  }
  v20 = [GKTransportParticipant alloc];
  +[GKLocalPlayer local](GKLocalPlayer, "local");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "internal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "playerID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pseudonym");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[GKTransportParticipant initWithPlayerID:pseudonym:](v20, "initWithPlayerID:pseudonym:", v23, v24);

  v26 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addLobbyParticipants:", v27);

  v28 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addGameParticipants:", v29);

}

- (void)updateForInviteAcceptWithConnectionData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKTransportContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke(uint64_t a1)
{
  id v2;

  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke_cold_1();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 64), *(id *)(a1 + 32));
}

- (void)updateAfterAcceptingRemoveInvite:(id)a3 acceptedResponse:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  GKTransportContext *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke;
  v10[3] = &unk_1E75B1A78;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v10);

}

void __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  GKSupportedTransport *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  GKSupportedTransport *v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint8_t buf[4];
  uint64_t v67;
  _QWORD v68[6];
  _QWORD v69[8];

  v69[6] = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 40), "selfPseudonym");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(v7 + 96);
  *(_QWORD *)(v7 + 96) = v6;

  objc_msgSend(*(id *)(a1 + 40), "matchID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "matchID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(v11 + 88);
    *(_QWORD *)(v11 + 88) = v10;

  }
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionToken");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(v15 + 80);
  *(_QWORD *)(v15 + 80) = v14;

  v68[0] = CFSTR("peer-id");
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "peerID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v62;
  v68[1] = CFSTR("peer-blob");
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "peerBlob");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v60;
  v68[2] = CFSTR("peer-push-token");
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "peerPushToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v18;
  v68[3] = CFSTR("peer-nat-type");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "peerNATType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v21;
  v68[4] = CFSTR("peer-nat-ip");
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "peerNATIP");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v23;
  v68[5] = CFSTR("session-token");
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sessionToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v69[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v26, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "internal");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "transportVersionToUse");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v28, "integerValue"))
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found undefined transport version from invite: %@"), *(_QWORD *)(a1 + 32));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/Transport/GKTransportContext.m");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastPathComponent");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ (transportVersionToUse.integerValue != GKSupportedTransportVersionUndefined)\n[%s (%s:%d)]"), v30, "-[GKTransportContext updateAfterAcceptingRemoveInvite:acceptedResponse:]_block_invoke", objc_msgSend(v32, "UTF8String"), 318);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v33);
  }
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "peerPseudonym");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "internal");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sessionID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v28, "integerValue") == 2)
  {
    v38 = *(void **)(a1 + 48);
    v39 = -[GKSupportedTransport initWithVersionNumber:]([GKSupportedTransport alloc], "initWithVersionNumber:", v28);
    objc_msgSend(v38, "selectTransportWith:", v39);

    v40 = v64;
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v37, CFSTR("sid"));
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v35, CFSTR("ps"));
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lobbyParticipants");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    if (v43)
    {
      v44 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "lobbyParticipants");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addLobbyParticipants:", v46);

    }
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "gameParticipants");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");

    if (v49)
    {
      v50 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "gameParticipants");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addGameParticipants:", v52);

LABEL_20:
    }
  }
  else
  {
    v40 = v64;
    if (objc_msgSend(v28, "integerValue"))
    {
      v53 = *(void **)(a1 + 48);
      v54 = -[GKSupportedTransport initWithVersionNumber:]([GKSupportedTransport alloc], "initWithVersionNumber:", &unk_1E75FB1A8);
      objc_msgSend(v53, "selectTransportWith:", v54);

      if (!os_log_GKGeneral)
        v55 = GKOSLoggers();
      v56 = os_log_GKMatch;
      if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v57 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v67 = v57;
        _os_log_impl(&dword_1BCDE3000, v56, OS_LOG_TYPE_INFO, "Cannot find transportVersionToUse from response, so it must be coming from older devices than Dawn. Response: %@", buf, 0xCu);
      }
      v65 = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = *(_QWORD *)(a1 + 48);
      v51 = *(void **)(v59 + 72);
      *(_QWORD *)(v59 + 72) = v58;
      goto LABEL_20;
    }
  }

}

- (void)updateAfterInviteeAcceptedUserInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKTransportContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  GKTransportParticipant *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  GKTTRMultiplayerParticipant *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  void *v37;
  _QWORD v38[6];
  _QWORD v39[7];

  v39[6] = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("peer-id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("peer-push-token"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("pps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v3;
  v38[0] = CFSTR("peer-id");
  v38[1] = CFSTR("peer-blob");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v6;
  v39[2] = v4;
  v38[2] = CFSTR("peer-push-token");
  v38[3] = CFSTR("peer-nat-type");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v7;
  v38[4] = CFSTR("peer-nat-ip");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v8;
  v38[5] = CFSTR("session-token");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v5)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("ps"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("session-token"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 80);
  *(_QWORD *)(v13 + 80) = v12;

  v37 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(v16 + 72);
  *(_QWORD *)(v16 + 72) = v15;

  objc_msgSend(*(id *)(a1 + 40), "playerTokenMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, v3);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 104), v22);
  if (v3 && v5)
  {
    v24 = -[GKTransportParticipant initWithPlayerID:pseudonym:]([GKTransportParticipant alloc], "initWithPlayerID:pseudonym:", v3, v5);
    v25 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addLobbyParticipants:", v26);

    v27 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addGameParticipants:", v28);

  }
  else
  {
    if (!os_log_GKGeneral)
      v29 = GKOSLoggers();
    v30 = os_log_GKFastSync;
    if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
    {
      v33 = 138412546;
      v34 = v3;
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_1BCDE3000, v30, OS_LOG_TYPE_INFO, "UpdateAfterInviteeAcceptedUserInfo cannot init participant. playerID(%@) or pseudonym(%@) is nil.", (uint8_t *)&v33, 0x16u);
    }
  }
  if (v3 && v4)
  {
    v31 = *(void **)(a1 + 40);
    v32 = -[GKTTRMultiplayerParticipant initWithPlayerID:pushToken:]([GKTTRMultiplayerParticipant alloc], "initWithPlayerID:pushToken:", v3, v4);
    objc_msgSend(v31, "addTTRMultiplayerParticipant:", v32);

  }
}

- (void)updateForMatchRequestWithConnectionData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKTransportContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  void *v5;

  if (!os_log_GKGeneral)
    v3 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke_cold_1();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 64), *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), v5);
  if (!v4)
  {

  }
}

- (void)updateForMatchResponse:(id)a3 serverHosted:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  GKTransportContext *v10;
  BOOL v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke;
  v8[3] = &unk_1E75B6090;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v8);

}

void __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  GKSupportedTransport *v14;
  void *v15;
  GKSupportedTransport *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  GKTTRMultiplayerParticipant *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  uint64_t v56;
  id obj;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke_cold_1(a1, v3);
  objc_msgSend(*(id *)(a1 + 32), "cdxTicket");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

  objc_msgSend(*(id *)(a1 + 32), "sessionToken");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = v7;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "selfPseudonym");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    v13 = *(void **)(a1 + 40);
    v14 = [GKSupportedTransport alloc];
    objc_msgSend(*(id *)(a1 + 32), "transportVersionToUse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GKSupportedTransport initWithVersionNumber:](v14, "initWithVersionNumber:", v15);
    objc_msgSend(v13, "selectTransportWith:", v16);

    objc_msgSend(*(id *)(a1 + 32), "matchID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 88);
    *(_QWORD *)(v18 + 88) = v17;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "matches");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    if (!v20)
      goto LABEL_42;
    v22 = v20;
    v60 = *(_QWORD *)v63;
    *(_QWORD *)&v21 = 138413058;
    v55 = v21;
    v58 = a1;
    while (1)
    {
      v23 = 0;
      v56 = v22;
      do
      {
        if (*(_QWORD *)v63 != v60)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v23);
        objc_msgSend(v24, "objectForKey:", CFSTR("client-data"), v55);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", CFSTR("player-id"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("push-token"));
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        if (v27)
        {
          objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("peer-id"));
          if (v29)
          {
            objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("peer-push-token"));
            v30 = *(void **)(a1 + 40);
            v31 = -[GKTTRMultiplayerParticipant initWithPlayerID:pushToken:]([GKTTRMultiplayerParticipant alloc], "initWithPlayerID:pushToken:", v27, v29);
            objc_msgSend(v30, "addTTRMultiplayerParticipant:", v31);

          }
        }
        else if (v28)
        {
          objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("peer-push-token"));
        }
        v61 = v29;
        objc_msgSend(v25, "objectForKey:", CFSTR("conn-blob"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend(v26, "setObject:forKey:", v32, CFSTR("peer-blob"));
        objc_msgSend(v25, "objectForKey:", CFSTR("nat-type"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("peer-nat-type"));
        objc_msgSend(v25, "objectForKey:", CFSTR("nat-ip"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          objc_msgSend(v26, "setObject:forKey:", v34, CFSTR("peer-nat-ip"));
        objc_msgSend(*(id *)(a1 + 32), "sessionToken");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(*(id *)(a1 + 32), "sessionToken");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v36, CFSTR("session-token"));

        }
        if (!objc_msgSend(v26, "count"))
          objc_msgSend(v26, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("missing-client-data"));
        objc_msgSend(v24, "objectForKey:", CFSTR("num-players"));
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v37;
        if (v37)
          v39 = (void *)v37;
        else
          v39 = &unk_1E75FB1C0;
        objc_msgSend(v26, "setObject:forKey:", v39, CFSTR("num-players"));
        objc_msgSend(*(id *)(a1 + 32), "transportVersionToUse");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "integerValue");

        if (v41 != 2)
          goto LABEL_34;
        objc_msgSend(v26, "setObject:forKey:", &unk_1E75FB190, CFSTR("stv"));
        objc_msgSend(v25, "objectForKey:", CFSTR("sid"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", CFSTR("ps"));
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v43;
        if (v27 && v42 && v43)
        {
          objc_msgSend(v26, "setObject:forKey:", v42, CFSTR("sid"));
          objc_msgSend(v26, "setObject:forKey:", v44, CFSTR("ps"));
          v45 = *(void **)(v58 + 40);
          +[GKTransportParticipant participantsFrom:withKey:](GKTransportParticipant, "participantsFrom:withKey:", v25, CFSTR("gp"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v45;
          a1 = v58;
          objc_msgSend(v47, "addGameParticipants:", v46);

          v22 = v56;
LABEL_34:
          objc_msgSend(v59, "addObject:", v26);
          goto LABEL_40;
        }
        if (!os_log_GKGeneral)
          v48 = GKOSLoggers();
        v49 = (void *)os_log_GKFastSync;
        if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
        {
          v50 = *(void **)(v58 + 40);
          v51 = v49;
          objc_msgSend(v50, "gameParticipants");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v55;
          v67 = v27;
          v68 = 2112;
          v69 = v42;
          v70 = 2112;
          v71 = v44;
          v72 = 2112;
          v73 = v52;
          _os_log_impl(&dword_1BCDE3000, v51, OS_LOG_TYPE_INFO, "Ignoring incomplete participant update for playerID: %@, sessionID: %@, pseudonym: %@, current gameParticipants: %@", buf, 0x2Au);

          a1 = v58;
        }

        v22 = v56;
LABEL_40:

        ++v23;
      }
      while (v22 != v23);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      if (!v22)
      {
LABEL_42:

        v53 = *(_QWORD *)(a1 + 40);
        v54 = *(void **)(v53 + 72);
        *(_QWORD *)(v53 + 72) = v59;

        return;
      }
    }
  }
}

- (void)updateWithInviteUpdateInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKTransportContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__GKTransportContext_updateWithInviteUpdateInfo___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __49__GKTransportContext_updateWithInviteUpdateInfo___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v20 = 138412290;
    v21 = v4;
    _os_log_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_INFO, "updateWithInviteUpdateInfo: %@", (uint8_t *)&v20, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "lobbyParticipants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "lobbyParticipants");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addLobbyParticipants:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "gameParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "gameParticipants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addGameParticipants:", v15);

    }
    objc_msgSend(*(id *)(a1 + 32), "matchID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "matchID");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(v18 + 88);
      *(_QWORD *)(v18 + 88) = v17;

    }
  }
}

- (void)updateWithForceEnabledTransports:(id)a3 andForceDisabledTransports:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  GKTransportContext *v11;

  v6 = a3;
  v7 = a4;
  if (!self->_selectedTransport)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke;
    v8[3] = &unk_1E75B1A78;
    v9 = v6;
    v10 = v7;
    v11 = self;
    -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v8);

  }
}

void __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GKSupportedTransport *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  GKSupportedTransport *v17;
  GKSupportedTransport *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke_cold_3();
  if (objc_msgSend(*(id *)(a1 + 32), "count") || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
      __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke_cold_2();
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "mutableCopy");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          v10 = -[GKSupportedTransport initWithVersionNumber:]([GKSupportedTransport alloc], "initWithVersionNumber:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v9));
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = *(id *)(a1 + 40);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
          v17 = [GKSupportedTransport alloc];
          v18 = -[GKSupportedTransport initWithVersionNumber:](v17, "initWithVersionNumber:", v16, (_QWORD)v23);
          objc_msgSend(v4, "removeObject:", v18);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v13);
    }

    v19 = *(_QWORD *)(a1 + 48);
    v20 = *(void **)(v19 + 48);
    *(_QWORD *)(v19 + 48) = v4;

  }
  if (!os_log_GKGeneral)
    v21 = GKOSLoggers();
  v22 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke_cold_1(a1, v22);
}

- (BOOL)shouldSendInviteUpdate
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__GKTransportContext_shouldSendInviteUpdate__block_invoke;
  v4[3] = &unk_1E75B6448;
  v4[4] = self;
  v4[5] = &v5;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __44__GKTransportContext_shouldSendInviteUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selectedTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "version");

  if (v3 == 2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "lobbyParticipants", 0);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "playerID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "localPlayerID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 != v10)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (id)formAnInviteUpdate
{
  GKUpdateInviteInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(GKUpdateInviteInfo);
  -[GKTransportContext gameParticipants](self, "gameParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo setGameParticipants:](v3, "setGameParticipants:", v4);

  -[GKTransportContext lobbyParticipants](self, "lobbyParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo setLobbyParticipants:](v3, "setLobbyParticipants:", v5);

  -[GKTransportContext playerTokenMap](self, "playerTokenMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo setPlayerTokenMap:](v3, "setPlayerTokenMap:", v6);

  -[GKTransportContext sessionID](self, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo setSessionID:](v3, "setSessionID:", v7);

  -[GKTransportContext sessionToken](self, "sessionToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo setSessionToken:](v3, "setSessionToken:", v8);

  -[GKTransportContext matchID](self, "matchID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GKTransportContext matchID](self, "matchID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKUpdateInviteInfo setMatchID:](v3, "setMatchID:", v10);

  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[GKTransportContext selectedTransport](self, "selectedTransport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUpdateInviteInfo setTransportVersionToUse:](v3, "setTransportVersionToUse:", v13);

  return v3;
}

- (void)addGameParticipants:(id)a3
{
  id v4;
  NSSet *gameParticipants;
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;
  NSSet *v9;
  id v10;

  v4 = a3;
  gameParticipants = self->_gameParticipants;
  v10 = v4;
  if (!gameParticipants)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gameParticipants;
    self->_gameParticipants = v6;

    v4 = v10;
    gameParticipants = self->_gameParticipants;
  }
  -[NSSet setByAddingObjectsFromSet:](gameParticipants, "setByAddingObjectsFromSet:", v4);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v9 = self->_gameParticipants;
  self->_gameParticipants = v8;

}

- (void)addLobbyParticipants:(id)a3
{
  id v4;
  NSSet *lobbyParticipants;
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;
  NSSet *v9;
  id v10;

  v4 = a3;
  lobbyParticipants = self->_lobbyParticipants;
  v10 = v4;
  if (!lobbyParticipants)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_lobbyParticipants;
    self->_lobbyParticipants = v6;

    v4 = v10;
    lobbyParticipants = self->_lobbyParticipants;
  }
  -[NSSet setByAddingObjectsFromSet:](lobbyParticipants, "setByAddingObjectsFromSet:", v4);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v9 = self->_lobbyParticipants;
  self->_lobbyParticipants = v8;

}

- (void)addTTRMultiplayerParticipant:(id)a3
{
  id v4;
  NSSet *playersAndPushTokens;
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;
  NSSet *v9;
  id v10;

  v4 = a3;
  playersAndPushTokens = self->_playersAndPushTokens;
  v10 = v4;
  if (!playersAndPushTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_playersAndPushTokens;
    self->_playersAndPushTokens = v6;

    v4 = v10;
    playersAndPushTokens = self->_playersAndPushTokens;
  }
  -[NSSet setByAddingObject:](playersAndPushTokens, "setByAddingObject:", v4);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v9 = self->_playersAndPushTokens;
  self->_playersAndPushTokens = v8;

}

- (id)updatedParticipantsAfterRemoving:(id)a3 fromOldParticipants:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "minusSet:", v5);
    v8 = (id)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)removeGameParticipantsIfExists:(id)a3
{
  NSSet *v4;
  NSSet *gameParticipants;

  -[GKTransportContext updatedParticipantsAfterRemoving:fromOldParticipants:](self, "updatedParticipantsAfterRemoving:fromOldParticipants:", a3, self->_gameParticipants);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  gameParticipants = self->_gameParticipants;
  self->_gameParticipants = v4;

}

- (void)removeLobbyParticipantsIfExists:(id)a3
{
  NSSet *v4;
  NSSet *lobbyParticipants;

  -[GKTransportContext updatedParticipantsAfterRemoving:fromOldParticipants:](self, "updatedParticipantsAfterRemoving:fromOldParticipants:", a3, self->_lobbyParticipants);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  lobbyParticipants = self->_lobbyParticipants;
  self->_lobbyParticipants = v4;

}

- (void)enrichServerRequest:(id)a3 withMatchRequest:(id)a4 selfPseudonym:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  GKTransportContext *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__GKTransportContext_enrichServerRequest_withMatchRequest_selfPseudonym___block_invoke;
  v14[3] = &unk_1E75B1AA0;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v14);

}

void __73__GKTransportContext_enrichServerRequest_withMatchRequest_selfPseudonym___block_invoke(uint64_t a1)
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "supportedTransportVersions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("supported-transport-versions"));

  v4 = (void *)MEMORY[0x1E0C99E08];
  v16[0] = CFSTR("client-data-version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("match-version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v16[2] = CFSTR("conn-blob");
  objc_msgSend(*(id *)(a1 + 40), "connectionData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("nat-ip");
  objc_msgSend(*(id *)(a1 + 40), "connectionData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKViceroyNATConfiguration externalAddressForSelfConnectionData:](GKViceroyNATConfiguration, "externalAddressForSelfConnectionData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  v16[4] = CFSTR("gp");
  objc_msgSend(*(id *)(a1 + 40), "gameParticipantsServerRepresentationsWithSelfPseudonym:", *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("sid"));

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v13, CFSTR("client-data"));

}

- (id)gameParticipantsServerRepresentationsWithSelfPseudonym:(id)a3
{
  id v4;
  GKTransportParticipant *v5;
  void *v6;
  GKTransportParticipant *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  v5 = [GKTransportParticipant alloc];
  -[GKTransportContext localPlayerID](self, "localPlayerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKTransportParticipant initWithPlayerID:pseudonym:](v5, "initWithPlayerID:pseudonym:", v6, v4);

  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[GKTransportParticipant serverRepresentation](v7, "serverRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E20];
  -[GKTransportContext localPlayerID](self, "localPlayerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKTransportContext gameParticipants](self, "gameParticipants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__GKTransportContext_gameParticipantsServerRepresentationsWithSelfPseudonym___block_invoke;
  v20[3] = &unk_1E75B6470;
  v21 = v13;
  v15 = v10;
  v22 = v15;
  v16 = v13;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);

  v17 = v22;
  v18 = v15;

  return v18;
}

void __77__GKTransportContext_gameParticipantsServerRepresentationsWithSelfPseudonym___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  objc_msgSend(v3, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v10, "serverRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "playerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)enrichConnectionDictionary:(id)a3 inviteResponse:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__GKTransportContext_enrichConnectionDictionary_inviteResponse___block_invoke;
  v10[3] = &unk_1E75B1A78;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v10);

}

void __64__GKTransportContext_enrichConnectionDictionary_inviteResponse___block_invoke(uint64_t a1)
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;

  objc_msgSend(*(id *)(a1 + 32), "connectionData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("blob-type"));

    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "connectionData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("self-blob"));

    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "connectionData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKViceroyNATConfiguration externalAddressForSelfConnectionData:](GKViceroyNATConfiguration, "externalAddressForSelfConnectionData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("self-nat-ip"));

  }
  else
  {
    v23 = 0;
    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v23, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("self-nat-ip"));

    v15 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("self-blob"));

    v18 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("blob-type"));

  }
  v20 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("sid"));

  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setSessionID:", v22);

}

- (void)enrichServerRequestWithConnectionData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__GKTransportContext_enrichServerRequestWithConnectionData___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __60__GKTransportContext_enrichServerRequestWithConnectionData___block_invoke(uint64_t a1)
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
  void *v13;
  void *v14;
  id v15;
  int v16;

  objc_msgSend(*(id *)(a1 + 32), "connectionData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("blob-type"));

    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "connectionData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("self-blob"));

    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "connectionData");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    +[GKViceroyNATConfiguration externalAddressForSelfConnectionData:](GKViceroyNATConfiguration, "externalAddressForSelfConnectionData:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("self-nat-ip"));

  }
  else
  {
    v16 = 0;
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("blob-type"));

    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("self-blob"));

    v13 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v16, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("self-nat-ip"));

  }
}

- (void)enrichServerRequest:(id)a3 andInviteResponse:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  GKTransportContext *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[GKTransportContext enrichServerRequestWithConnectionData:](self, "enrichServerRequestWithConnectionData:", v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke;
  v10[3] = &unk_1E75B1A78;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v10);

}

void __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  GKTransportParticipant *v8;
  void *v9;
  void *v10;
  GKTransportParticipant *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  objc_msgSend(a1[4], "objectForKeyedSubscript:", CFSTR("client-data"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[5], "sessionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v3, CFSTR("sid"));

  }
  v4 = a1[4];
  objc_msgSend(a1[5], "supportedTransportVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("supported-transport-versions"));

  objc_msgSend(a1[5], "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setSessionID:", v6);

  objc_msgSend(a1[5], "supportedTransportVersions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "containsObject:", &unk_1E75FB190);

  if ((_DWORD)v5)
  {
    v8 = [GKTransportParticipant alloc];
    objc_msgSend(a1[5], "localPlayerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "selfPseudonym");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[GKTransportParticipant initWithPlayerID:pseudonym:](v8, "initWithPlayerID:pseudonym:", v9, v10);

    v12 = (void *)MEMORY[0x1E0C99DE8];
    -[GKTransportParticipant serverRepresentation](v11, "serverRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "gameParticipants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_2;
    v29[3] = &unk_1E75B6498;
    v17 = v14;
    v30 = v17;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v29);

    v18 = (void *)MEMORY[0x1E0C99DE8];
    -[GKTransportParticipant serverRepresentation](v11, "serverRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "lobbyParticipants");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_3;
    v27[3] = &unk_1E75B6498;
    v22 = v20;
    v28 = v22;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v27);

    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("matchID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("matchID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("matchID"));

    }
    objc_msgSend(a1[6], "selfPseudonym");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("ps"));

    objc_msgSend(v26, "setObject:forKey:", v17, CFSTR("gp"));
    objc_msgSend(v26, "setObject:forKey:", v22, CFSTR("lp"));
    if (objc_msgSend(v17, "count"))
      objc_msgSend(a1[6], "setGameParticipantsInfo:", v17);
    if (objc_msgSend(v22, "count"))
      objc_msgSend(a1[6], "setLobbyParticipantsInfo:", v22);

  }
}

void __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serverRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __60__GKTransportContext_enrichServerRequest_andInviteResponse___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serverRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)supportsTransportVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKTransportContext supportedTransports](self, "supportedTransports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__GKTransportContext_supportsTransportVersion___block_invoke;
  v13[3] = &unk_1E75B64C0;
  v7 = v4;
  v14 = v7;
  v8 = objc_msgSend(v6, "_gkContainsObjectPassingTest:", v13);

  if (!os_log_GKGeneral)
    v9 = GKOSLoggers();
  v10 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("not ");
    if (v8)
      v11 = &stru_1E75BB5A8;
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "Transport version(%@) %@supported.", buf, 0x16u);
  }

  return v8;
}

BOOL __47__GKTransportContext_supportsTransportVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "version");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "integerValue");
}

- (NSArray)representedPlayerIDs
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__14;
  v9 = __Block_byref_object_dispose__14;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__GKTransportContext_representedPlayerIDs__block_invoke;
  v4[3] = &unk_1E75B32E0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __42__GKTransportContext_representedPlayerIDs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "lobbyParticipants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__GKTransportContext_representedPlayerIDs__block_invoke_2;
  v7[3] = &unk_1E75B64E8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "_gkFilterWithBlock:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __42__GKTransportContext_representedPlayerIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localPlayerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "playerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)updateWithInfoFromTransport:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  GKTransportContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__GKTransportContext_updateWithInfoFromTransport___block_invoke;
  v6[3] = &unk_1E75B1A28;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[GKTransportContext performUpdateSync:](self, "performUpdateSync:", v6);

}

void __50__GKTransportContext_updateWithInfoFromTransport___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("sid"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), obj);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("matchID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 88), v2);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("addedGameParticipants"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addGameParticipants:", v3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("addedLobbyParticipants"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addLobbyParticipants:", v4);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("removedGameParticipants"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 40), "removeGameParticipantsIfExists:", v5);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("removedLobbyParticipants"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 40), "removeLobbyParticipantsIfExists:", v6);

}

- (id)defaultTransportWithForceEnabledTransports:(id)a3 andForceDisabledTransports:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GKSupportedTransport *v10;
  GKSupportedTransport *v11;
  void *v12;

  -[GKTransportContext updateWithForceEnabledTransports:andForceDisabledTransports:](self, "updateWithForceEnabledTransports:andForceDisabledTransports:", a3, a4);
  -[GKTransportContext supportedTransports](self, "supportedTransports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_124);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = [GKSupportedTransport alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GKSupportedTransport initWithVersionNumber:](v11, "initWithVersionNumber:", v12);

  }
  return v10;
}

uint64_t __92__GKTransportContext_defaultTransportWithForceEnabledTransports_andForceDisabledTransports___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "version");
  if (v6 >= objc_msgSend(v5, "version"))
  {
    v8 = objc_msgSend(v4, "version");
    v7 = v8 > objc_msgSend(v5, "version");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (NSString)localPlayerID
{
  return self->_localPlayerID;
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (GKSupportedTransport)selectedTransport
{
  return self->_selectedTransport;
}

- (void)setValidTransportSelected:(BOOL)a3
{
  self->_validTransportSelected = a3;
}

- (GKMultiplayerDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (NSSet)supportedTransports
{
  return self->_supportedTransports;
}

- (NSData)cdxTicket
{
  return self->_cdxTicket;
}

- (NSData)connectionData
{
  return self->_connectionData;
}

- (NSArray)peerDictionaries
{
  return self->_peerDictionaries;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (NSString)matchID
{
  return self->_matchID;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSDictionary)playerTokenMap
{
  return self->_playerTokenMap;
}

- (NSSet)playersAndPushTokens
{
  return self->_playersAndPushTokens;
}

- (NSSet)gameParticipants
{
  return self->_gameParticipants;
}

- (NSSet)lobbyParticipants
{
  return self->_lobbyParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lobbyParticipants, 0);
  objc_storeStrong((id *)&self->_gameParticipants, 0);
  objc_storeStrong((id *)&self->_playersAndPushTokens, 0);
  objc_storeStrong((id *)&self->_playerTokenMap, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_peerDictionaries, 0);
  objc_storeStrong((id *)&self->_connectionData, 0);
  objc_storeStrong((id *)&self->_cdxTicket, 0);
  objc_storeStrong((id *)&self->_supportedTransports, 0);
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_storeStrong((id *)&self->_selectedTransport, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong((id *)&self->_localPlayerID, 0);
}

- (void)shouldDelayConnectionForMatchResponse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, a1, a3, "Nil pseudonym for local player.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)shouldDelayConnectionForMatchResponse:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "pseudonym");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v5, v7, "Sorted pseudonyms for stagger: %@, self pseudonym: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_2();
}

- (void)shouldDelayConnectionForMatchResponse:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCDE3000, a2, OS_LOG_TYPE_ERROR, "Invalid matched player: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)selectTransportWith:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "Skip transport selection for undefined version.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)selectTransportWith:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "selectedTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v3, v5, "Skip transport selection since we have already selected: %@.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_0();
}

void __49__GKTransportContext_updateForLegacyNearbyInvite__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, a1, a3, "Something went wrong. Transport context should not expect update of legacy nearby invite after v2 has been selected.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __72__GKTransportContext_updateForInviteInitiationWithOnlineConnectionData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "updateForInviteInitiationWithOnlineConnectionData: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__GKTransportContext_updateWithInviteInitiateResponse___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "updateWithInviteInitiateResponse: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__GKTransportContext_updateForInviteAcceptWithConnectionData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "updateForInviteAcceptWithConnectionData: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__GKTransportContext_updateAfterAcceptingRemoveInvite_acceptedResponse___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v0, v1, "updateAfterAcceptingRemoveInvite: %@, acceptedResponse: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __57__GKTransportContext_updateAfterInviteeAcceptedUserInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "updateAfterInviteeAcceptedUserInfo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__GKTransportContext_updateForMatchRequestWithConnectionData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "updateForMatchRequestWithConnectionData: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__GKTransportContext_updateForMatchResponse_serverHosted___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = a2;
  objc_msgSend(v3, "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v2;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v5, v7, "updateForMatchResponse: %@, serverHosted: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_1_2();
}

void __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 48);
  v3 = a2;
  objc_msgSend(v2, "supportedTransports");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v3, v5, "Supported transport versions: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2_0();
}

void __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v0, (uint64_t)v0, "Overriding transport versions with forceEnabledTransports: %@, forceDisabledTransports: %@", v1);
  OUTLINED_FUNCTION_2();
}

void __82__GKTransportContext_updateWithForceEnabledTransports_andForceDisabledTransports___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v0, v1, "UpdateWithTransportOverrides. ForceEnabled: %@, ForceDisabled: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
