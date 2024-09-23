@implementation MSPSharedTripRelay

- (MSPSharedTripRelay)init
{
  MSPSharedTripRelay *v2;
  void *v3;
  uint64_t v4;
  NSString *clientID;
  MSPSharedTripStorageController *v6;
  MSPSharedTripStorageController *storageController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSPSharedTripRelay;
  v2 = -[MSPSharedTripRelay init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    clientID = v2->_clientID;
    v2->_clientID = (NSString *)v4;

    v6 = objc_alloc_init(MSPSharedTripStorageController);
    storageController = v2->_storageController;
    v2->_storageController = v6;

    -[MSPSharedTripRelay _startService](v2, "_startService");
  }
  return v2;
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
    v6 = "-[MSPSharedTripRelay dealloc]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[RELAY] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripRelay;
  -[MSPSharedTripRelay dealloc](&v4, sel_dealloc);
}

- (void)_fetchDisplayName
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id *p_displayName;
  NSString *displayName;
  __CFString *v13;
  NSObject *v14;
  id v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v4, "aa_firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  objc_msgSend(v4, "aa_middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMiddleName:", v7);

  objc_msgSend(v4, "aa_lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFamilyName:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v9, "setStyle:", 2);
  objc_msgSend(v9, "stringFromPersonNameComponents:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  p_displayName = (id *)&self->_displayName;
  *p_displayName = (id)v10;

  if (*p_displayName)
    v13 = (__CFString *)*p_displayName;
  else
    v13 = &stru_1E6655688;
  objc_storeStrong(p_displayName, v13);
  MSPGetSharedTripLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *p_displayName;
    v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[RELAY] fetched displayName %@", (uint8_t *)&v16, 0xCu);
  }

}

- (MSPSharedTripSharingIdentity)sharingIdentity
{
  MSPSharedTripSharingIdentity *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  MSPSharedTripSharingIdentity *v8;

  v3 = [MSPSharedTripSharingIdentity alloc];
  v4 = -[MSPSharedTripRelay hasValidIDSAccount](self, "hasValidIDSAccount");
  -[MSPSharedTripRelay sharingName](self, "sharingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripRelay sharingHandle](self, "sharingHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripRelay accountAliases](self, "accountAliases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MSPSharedTripSharingIdentity initWithValidAccount:name:handle:aliases:](v3, "initWithValidAccount:name:handle:aliases:", v4, v5, v6, v7);

  return v8;
}

- (NSString)sharingName
{
  NSString *displayName;

  displayName = self->_displayName;
  if (!displayName)
  {
    -[MSPSharedTripRelay _fetchDisplayName](self, "_fetchDisplayName");
    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)sharingHandle
{
  return (NSString *)-[IDSService _msp_currentAccountIdentifier](self->_sharingService, "_msp_currentAccountIdentifier");
}

- (BOOL)hasValidIDSAccount
{
  return -[IDSService _msp_hasValidIDSAccount](self->_sharingService, "_msp_hasValidIDSAccount");
}

- (NSArray)accountAliases
{
  void *v2;
  void *v3;

  -[IDSService _msp_currentAccount](self->_sharingService, "_msp_currentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aliasStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_startService
{
  IDSService *v3;
  IDSService *sharingService;
  NSObject *v5;
  void *v6;
  void *v7;
  NSString *displayName;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.maps.eta"));
  sharingService = self->_sharingService;
  self->_sharingService = v3;

  -[IDSService addDelegate:queue:](self->_sharingService, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSService activeAliases](self->_sharingService, "activeAliases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSService _msp_currentAccount](self->_sharingService, "_msp_currentAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    displayName = self->_displayName;
    v9 = 138413058;
    v10 = CFSTR("com.apple.private.alloy.maps.eta");
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = displayName;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[RELAY] startService: %@, active alias: %@, account: %@, displayName: %@", (uint8_t *)&v9, 0x2Au);

  }
}

- (id)startSharingGroupSessionWithTripIdentifer:(id)a3
{
  id v4;
  MSPSharedTripGroupSession *sharingETAGroupSession;
  NSObject *v6;
  MSPSharedTripGroupSession *v7;
  IDSService *sharingService;
  void *v9;
  MSPSharedTripGroupSession *v10;
  MSPSharedTripGroupSession *v11;
  void *v12;
  MSPSharedTripGroupSession *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sharingETAGroupSession = self->_sharingETAGroupSession;
  if (!sharingETAGroupSession)
  {
    MSPGetSharedTripLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[RELAY] creating _sharingGroupSession for identifier %@", (uint8_t *)&v15, 0xCu);
    }

    v7 = [MSPSharedTripGroupSession alloc];
    sharingService = self->_sharingService;
    -[IDSService _msp_currentAccountIdentifier](sharingService, "_msp_currentAccountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MSPSharedTripGroupSession initWithService:groupID:initiator:initiatorIdentifier:](v7, "initWithService:groupID:initiator:initiatorIdentifier:", sharingService, v4, 1, v9);
    v11 = self->_sharingETAGroupSession;
    self->_sharingETAGroupSession = v10;

    -[MSPSharedTripRelay _fetchDisplayName](self, "_fetchDisplayName");
    -[MSPSharedTripRelay sharingName](self, "sharingName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSharedTripGroupSession setInitiatorDisplayName:](self->_sharingETAGroupSession, "setInitiatorDisplayName:", v12);

    sharingETAGroupSession = self->_sharingETAGroupSession;
  }
  v13 = sharingETAGroupSession;

  return v13;
}

- (id)removeSharingWith:(id)a3
{
  MSPSharedTripGroupSession *sharingETAGroupSession;

  if (!-[MSPSharedTripGroupSession sessionIsAliveAfterRemovingSharingIdentifiers:](self->_sharingETAGroupSession, "sessionIsAliveAfterRemovingSharingIdentifiers:", a3))
  {
    sharingETAGroupSession = self->_sharingETAGroupSession;
    self->_sharingETAGroupSession = 0;

  }
  return self->_sharingETAGroupSession;
}

- (void)stopSharing
{
  MSPSharedTripGroupSession *sharingETAGroupSession;

  sharingETAGroupSession = self->_sharingETAGroupSession;
  self->_sharingETAGroupSession = 0;

}

- (id)groupSessionForIdentifier:(id)a3
{
  id v4;
  MSPSharedTripGroupSession *v5;
  uint64_t v6;
  void *v7;
  MSPSharedTripGroupSession *v8;
  IDSService *sharingService;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedTripGroupIDSSessions, "objectForKeyedSubscript:", v4);
  v5 = (MSPSharedTripGroupSession *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MSPSharedTripStorageController groupSessionInfoForKey:](self->_storageController, "groupSessionInfoForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [MSPSharedTripGroupSession alloc];
      sharingService = self->_sharingService;
      objc_msgSend(v7, "fromID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[MSPSharedTripGroupSession initWithService:groupID:initiator:initiatorIdentifier:](v8, "initWithService:groupID:initiator:initiatorIdentifier:", sharingService, v4, 0, v10);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedTripGroupIDSSessions, "setObject:forKeyedSubscript:", v5, v4);
      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[RELAY] group session created %@", (uint8_t *)&v14, 0xCu);
      }

    }
    else
    {
      MSPGetSharedTripLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "[RELAY] unknown group session %@", (uint8_t *)&v14, 0xCu);
      }

      -[MSPSharedTripRelay _removeFinishedSession:](self, "_removeFinishedSession:", v4);
      v5 = 0;
    }
  }

  return v5;
}

- (void)_handleChunk:(id)a3 fromID:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *packetBuckets;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  MSPSharedTripRelay *v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("commandKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("commandKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSharedTripRelay _handleCommand:fromID:](self, "_handleCommand:fromID:", v15, v11);

    goto LABEL_39;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkMessageIDKey"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_36;
  v17 = (void *)v16;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkNumberKey"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_35;
  v19 = (void *)v18;
  v54 = self;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkIndexKey"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  v21 = (void *)v20;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkDataKey"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {

    goto LABEL_34;
  }
  v23 = (void *)v22;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkGroupIDKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (!self->_packetBuckets)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      packetBuckets = self->_packetBuckets;
      self->_packetBuckets = v25;

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkMessageIDKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    MSPGetSharedTripIDSTransportLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v63 = (uint64_t)v10;
      v64 = 2114;
      v65 = v27;
      _os_log_impl(&dword_1B39C0000, v28, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage %@ from %{public}@", buf, 0x16u);
    }

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("chunkNumberKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedIntegerValue");

    -[NSMutableDictionary objectForKeyedSubscript:](self->_packetBuckets, "objectForKeyedSubscript:", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      v31 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_packetBuckets, "setObject:forKeyedSubscript:", v31, v27);
    }
    objc_msgSend(v31, "addObject:", v10);
    MSPGetSharedTripIDSTransportLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 134218242;
      v63 = v33;
      v64 = 2112;
      v65 = v31;
      _os_log_impl(&dword_1B39C0000, v32, OS_LOG_TYPE_INFO, "[RELAY] handleChunk %lu %@", buf, 0x16u);
    }

    if (objc_msgSend(v31, "count") == v30)
    {
      v50 = v27;
      v51 = v12;
      v52 = v11;
      v53 = v10;
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v30;
      v36 = (void *)v34;
      v56 = v35;
      if (v35)
      {
        v37 = 0;
        v55 = v31;
        do
        {
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v38 = v31;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v58 != v41)
                  objc_enumerationMutation(v38);
                v43 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("chunkIndexKey"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "unsignedIntegerValue");

                if (v45 == v37)
                {
                  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("chunkDataKey"));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "appendData:", v46);

                }
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
            }
            while (v40);
          }

          ++v37;
          v31 = v55;
        }
        while (v37 != v56);
      }
      MSPGetSharedTripIDSTransportLog();
      v47 = objc_claimAutoreleasedReturnValue();
      v27 = v50;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v36, "length"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v63 = (uint64_t)v48;
        v64 = 2114;
        v65 = v50;
        _os_log_impl(&dword_1B39C0000, v47, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage full message ready %@ messageID %{public}@", buf, 0x16u);

      }
      v10 = v53;
      v12 = v51;
      v11 = v52;
      -[MSPSharedTripRelay _handleIncomingMessage:info:fromID:receivingHandle:receivingAccountIdentifier:](v54, "_handleIncomingMessage:info:fromID:receivingHandle:receivingAccountIdentifier:", v36, v53, v52, v51, v13);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v54->_packetBuckets, "setObject:forKeyedSubscript:", 0, v50);

    }
    goto LABEL_39;
  }
LABEL_36:
  MSPGetSharedTripIDSTransportLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v63 = (uint64_t)v10;
    _os_log_impl(&dword_1B39C0000, v49, OS_LOG_TYPE_ERROR, "[RELAY] cannot handle message %@", buf, 0xCu);
  }

LABEL_39:
}

- (void)_handleCommand:(id)a3 fromID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("j")))
  {
    -[MSPSharedTripGroupSession participantDidJoin:](self->_sharingETAGroupSession, "participantDidJoin:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("l")))
  {
    -[MSPSharedTripGroupSession participantDidLeave:](self->_sharingETAGroupSession, "participantDidLeave:", v7);
  }
  else
  {
    MSPGetSharedTripIDSTransportLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_ERROR, "[RELAY] cannot handle command %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_handleIncomingMessage:(id)a3 info:(id)a4 fromID:(id)a5 receivingHandle:(id)a6 receivingAccountIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *WeakRetained;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("chunkGroupIDKey"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v12 && v17)
  {
    -[MSPSharedTripStorageController groupSessionInfoForKey:](self->_storageController, "groupSessionInfoForKey:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      MSPGetSharedTripLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1B39C0000, v20, OS_LOG_TYPE_DEFAULT, "[RELAY] add new session %@", (uint8_t *)&v22, 0xCu);
      }

      -[MSPSharedTripStorageController addNewSession:originator:receivingHandle:receivingAccountIdentifier:](self->_storageController, "addNewSession:originator:receivingHandle:receivingAccountIdentifier:", v18, v14, v15, v16);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject relay:receiveData:info:fromID:](WeakRetained, "relay:receiveData:info:fromID:", self, v12, v13, v14);
  }
  else
  {
    MSPGetSharedTripIDSTransportLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1B39C0000, WeakRetained, OS_LOG_TYPE_ERROR, "[RELAY] identifier or data missing %@", (uint8_t *)&v22, 0xCu);
    }
  }

}

- (void)_removeFinishedSession:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedTripGroupIDSSessions, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "leaveLiveModeForced:", 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedTripGroupIDSSessions, "setObject:forKeyedSubscript:", 0, v7);
  }
  -[MSPSharedTripStorageController removeSession:](self->_storageController, "removeSession:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "relay:sharingClosed:", self, v7);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  MSPGetSharedTripIDSTransportLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v18 = 138412802;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage %@ from %@ to %@", (uint8_t *)&v18, 0x20u);
  }

  objc_msgSend(v14, "toID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripRelay _handleChunk:fromID:receivingHandle:receivingAccountIdentifier:](self, "_handleChunk:fromID:receivingHandle:receivingAccountIdentifier:", v12, v13, v16, v17);

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = a5;
  MSPGetSharedTripIDSTransportLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v19 = 138412546;
    v20 = v12;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_INFO, "[RELAY] incomingData from %@ to %@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithPlistData:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "toID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripRelay _handleChunk:fromID:receivingHandle:receivingAccountIdentifier:](self, "_handleChunk:fromID:receivingHandle:receivingAccountIdentifier:", v16, v12, v17, v18);

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a5;
  MSPGetSharedTripIDSTransportLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage URL %@ from %@ to %@", buf, 0x20u);
  }

  v19 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(v17, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v19, "dataWithContentsOfFile:options:error:", v20, 1, &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v25;

  if (v22)
  {
    MSPGetSharedTripIDSTransportLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_ERROR, "[RELAY] incomingMessage error %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v16, "toID");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSharedTripRelay _handleIncomingMessage:info:fromID:receivingHandle:receivingAccountIdentifier:](self, "_handleIncomingMessage:info:fromID:receivingHandle:receivingAccountIdentifier:", v21, v14, v15, v23, v24);

  }
}

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "[RELAY] receivedGroupSessionParticipantUpdate %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v10 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  v13 = a8;
  MSPGetSharedTripIDSTransportLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v11;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[RELAY] Did send message {identifier: %{public}@, success: %@, error: %@ context %@}", (uint8_t *)&v16, 0x2Au);

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = a7;
  MSPGetSharedTripIDSTransportLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_INFO, "[RELAY] Message hasBeenDelivered {identifier: %{public}@, context: %@ fromID %@}", (uint8_t *)&v13, 0x20u);
  }

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5;

  -[MSPSharedTripRelay availabilityDelegate](self, "availabilityDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relay:accountStatusChanged:", self, -[MSPSharedTripRelay hasValidIDSAccount](self, "hasValidIDSAccount"));

}

- (MSPSharedTripStorageController)storageController
{
  return self->_storageController;
}

- (void)setStorageController:(id)a3
{
  objc_storeStrong((id *)&self->_storageController, a3);
}

- (MSPSharedTripRelayDelegate)delegate
{
  return (MSPSharedTripRelayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MSPSharedTripAvailabiltyDelegate)availabilityDelegate
{
  return (MSPSharedTripAvailabiltyDelegate *)objc_loadWeakRetained((id *)&self->_availabilityDelegate);
}

- (void)setAvailabilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_availabilityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_availabilityDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_packetBuckets, 0);
  objc_storeStrong((id *)&self->_sharedTripGroupIDSSessions, 0);
  objc_storeStrong((id *)&self->_sharingETAGroupSession, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_sharingService, 0);
}

@end
