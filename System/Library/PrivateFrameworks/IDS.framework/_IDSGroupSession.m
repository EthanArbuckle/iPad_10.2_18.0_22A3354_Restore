@implementation _IDSGroupSession

- (_IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  _IDSGroupSession *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *stableGroupID;
  void *v22;
  uint64_t v23;
  NSString *groupID;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  NSString *instanceID;
  void *v29;
  uint64_t v30;
  NSString *accountID;
  uint64_t v32;
  NSString *fromID;
  void *v34;
  uint64_t v35;
  NSSet *destinations;
  uint64_t v37;
  id delegateContext;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSString *clientUUID;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSNumber *qrReason;
  uint64_t v57;
  NSNumber *previousError;
  IDSGroupEncryptionKeyMaterialCache *v59;
  IDSGroupEncryptionKeyMaterialCache *keyMaterialCache;
  uint64_t v61;
  NSMutableArray *dataCryptorRequests;
  uint64_t v63;
  NSMutableDictionary *createParticipantIDAliasCallbacks;
  uint64_t v65;
  NSMutableDictionary *getParticipantIDForAliasCallbacks;
  uint64_t v67;
  NSMutableArray *getParticipantIDForAliasDelegateQueueCallbacks;
  NSObject *v69;
  NSString *uniqueID;
  NSString *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSMutableDictionary *sessionConfig;
  void *v76;
  void *v77;
  uint64_t v78;
  NSDictionary *destinationsLightweightStatus;
  NSObject *v80;
  const __CFString *v81;
  NSString *v82;
  NSDictionary *v83;
  objc_super v85;
  uint8_t buf[4];
  _IDSGroupSession *v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  NSDictionary *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907EA7E8();

  }
  v85.receiver = self;
  v85.super_class = (Class)_IDSGroupSession;
  v17 = -[_IDSGroupSession init](&v85, sel_init);
  if (v17)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C50]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D347E8]);
    v20 = objc_claimAutoreleasedReturnValue();
    stableGroupID = v17->_stableGroupID;
    v17->_stableGroupID = (NSString *)v20;

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D347D8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uppercaseString");
    v23 = objc_claimAutoreleasedReturnValue();
    groupID = v17->_groupID;
    v17->_groupID = (NSString *)v23;

    v25 = objc_msgSend(v19, "length");
    v26 = (NSString *)v19;
    if (!v25)
      v26 = v17->_groupID;
    objc_storeStrong((id *)&v17->_uniqueID, v26);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v27 = objc_claimAutoreleasedReturnValue();
    instanceID = v17->_instanceID;
    v17->_instanceID = (NSString *)v27;

    objc_msgSend(v10, "_internal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uniqueID");
    v30 = objc_claimAutoreleasedReturnValue();
    accountID = v17->_accountID;
    v17->_accountID = (NSString *)v30;

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D347D0]);
    v32 = objc_claimAutoreleasedReturnValue();
    fromID = v17->_fromID;
    v17->_fromID = (NSString *)v32;

    objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "destinationURIs");
    v35 = objc_claimAutoreleasedReturnValue();
    destinations = v17->_destinations;
    v17->_destinations = (NSSet *)v35;

    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v13);
    v37 = objc_claimAutoreleasedReturnValue();
    delegateContext = v17->_delegateContext;
    v17->_delegateContext = (id)v37;

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C48]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_transportType = objc_msgSend(v39, "integerValue");

    v40 = *MEMORY[0x1E0D347C0];
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D347C0]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v12, "objectForKey:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_isInitiator = objc_msgSend(v42, "BOOLValue");

    }
    else
    {
      v17->_isInitiator = 1;
    }

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BD0]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_connectionCountHint = objc_msgSend(v43, "unsignedIntegerValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BF0]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_disallowCellularInterface = objc_msgSend(v44, "BOOLValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BF8]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_disallowWifiInterface = objc_msgSend(v45, "BOOLValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C38]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_preferredAddressFamily = objc_msgSend(v46, "unsignedIntegerValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C30]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_preferCellularForCallSetup = objc_msgSend(v47, "BOOLValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BC8]);
    v48 = objc_claimAutoreleasedReturnValue();
    clientUUID = v17->_clientUUID;
    v17->_clientUUID = (NSString *)v48;

    v17->_localParticipantID = 0;
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34830]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v50, "BOOLValue") & 1) != 0)
      v51 = 1;
    else
      v51 = IMGetDomainBoolForKey();
    v17->_startAsUPlusOneSession = v51;

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D347C8]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_isLightweightParticipant = objc_msgSend(v52, "BOOLValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D347B0]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_callScreeningMode = objc_msgSend(v53, "BOOLValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BB8]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_alwaysSkipSelf = objc_msgSend(v54, "BOOLValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D350F8]);
    v55 = objc_claimAutoreleasedReturnValue();
    qrReason = v17->_qrReason;
    v17->_qrReason = (NSNumber *)v55;

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D350F0]);
    v57 = objc_claimAutoreleasedReturnValue();
    previousError = v17->_previousError;
    v17->_previousError = (NSNumber *)v57;

    v59 = objc_alloc_init(IDSGroupEncryptionKeyMaterialCache);
    keyMaterialCache = v17->_keyMaterialCache;
    v17->_keyMaterialCache = v59;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = objc_claimAutoreleasedReturnValue();
    dataCryptorRequests = v17->_dataCryptorRequests;
    v17->_dataCryptorRequests = (NSMutableArray *)v61;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v63 = objc_claimAutoreleasedReturnValue();
    createParticipantIDAliasCallbacks = v17->_createParticipantIDAliasCallbacks;
    v17->_createParticipantIDAliasCallbacks = (NSMutableDictionary *)v63;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v65 = objc_claimAutoreleasedReturnValue();
    getParticipantIDForAliasCallbacks = v17->_getParticipantIDForAliasCallbacks;
    v17->_getParticipantIDForAliasCallbacks = (NSMutableDictionary *)v65;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v67 = objc_claimAutoreleasedReturnValue();
    getParticipantIDForAliasDelegateQueueCallbacks = v17->_getParticipantIDForAliasDelegateQueueCallbacks;
    v17->_getParticipantIDForAliasDelegateQueueCallbacks = (NSMutableArray *)v67;

    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = v17->_uniqueID;
      v71 = v17->_instanceID;
      *(_DWORD *)buf = 134218498;
      v87 = v17;
      v88 = 2112;
      v89 = (const __CFString *)uniqueID;
      v90 = 2112;
      v91 = (NSDictionary *)v71;
      _os_log_impl(&dword_1906E0000, v69, OS_LOG_TYPE_DEFAULT, "Initializing _IDSGroupSession { self: %p, uniqueID: %@, instanceID: %@ }", buf, 0x20u);
    }

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "listener");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "addHandler:", v17);

    v74 = objc_msgSend(v12, "mutableCopy");
    sessionConfig = v17->_sessionConfig;
    v17->_sessionConfig = (NSMutableDictionary *)v74;

    if (v17->_destinations)
    {
      objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v11);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v11);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "destinationLightweightStatus");
        v78 = objc_claimAutoreleasedReturnValue();
        destinationsLightweightStatus = v17->_destinationsLightweightStatus;
        v17->_destinationsLightweightStatus = (NSDictionary *)v78;

      }
      -[NSMutableDictionary removeObjectForKey:](v17->_sessionConfig, "removeObjectForKey:", *MEMORY[0x1E0D347E0]);

    }
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      if (v17->_isLightweightParticipant)
        v81 = CFSTR("YES");
      else
        v81 = CFSTR("NO");
      v83 = v17->_destinationsLightweightStatus;
      v82 = v17->_fromID;
      *(_DWORD *)buf = 138412802;
      v87 = (_IDSGroupSession *)v82;
      v88 = 2112;
      v89 = v81;
      v90 = 2112;
      v91 = v83;
      _os_log_impl(&dword_1906E0000, v80, OS_LOG_TYPE_DEFAULT, "_fromID: %@, _isLightweightParticipant: %@, _destinationsLightweightStatus: %@", buf, 0x20u);
    }

    -[_IDSGroupSession _broadcastNewSessionToDaemon](v17, "_broadcastNewSessionToDaemon");
  }

  return v17;
}

- (void)invalidate
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSString *uniqueID;
  NSString *instanceID;
  void *v9;
  int v10;
  _IDSGroupSession *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EA874();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    instanceID = self->_instanceID;
    v10 = 134218498;
    v11 = self;
    v12 = 2112;
    v13 = uniqueID;
    v14 = 2112;
    v15 = instanceID;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating _IDSGroupSession { self: %p, uniqueID: %@, instanceID: %@ }", (uint8_t *)&v10, 0x20u);
  }

  self->_isInvalidated = 1;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cleanupSessionWithInstanceID:", self->_instanceID);

}

- (void)dealloc
{
  NSObject *v3;
  NSString *uniqueID;
  NSString *instanceID;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  _IDSGroupSession *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    instanceID = self->_instanceID;
    *(_DWORD *)buf = 134218498;
    v12 = self;
    v13 = 2112;
    v14 = uniqueID;
    v15 = 2112;
    v16 = instanceID;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating _IDSGroupSession { self: %p, uniqueID: %@, instanceID: %@ }", buf, 0x20u);
  }

  if (!self->_isInvalidated)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907EA900((uint64_t)self, v6);

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cleanupSessionWithInstanceID:", self->_instanceID);

  }
  -[_IDSGroupSession _cleanupSocketPairConnections](self, "_cleanupSocketPairConnections");
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "listener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeHandler:", self);

  v10.receiver = self;
  v10.super_class = (Class)_IDSGroupSession;
  -[_IDSGroupSession dealloc](&v10, sel_dealloc);
}

- (void)daemonDisconnected
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSString *uniqueID;
  id v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EA98C();

  }
  if (-[NSString length](self->_uniqueID, "length"))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412290;
      v12 = uniqueID;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Disconnected from daemon, notifying client of groupSession %@", buf, 0xCu);
    }

    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", CFSTR("IDSSessionEndedReasonComponentCrashed"), *MEMORY[0x1E0CB2D50], 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 13, v9);
    -[_IDSGroupSession groupSessionEnded:withReason:error:](self, "groupSessionEnded:withReason:error:", self->_uniqueID, 16, v10);

  }
}

- (void)_broadcastNewSessionToDaemon
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSString *accountID;
  NSString *uniqueID;
  NSString *instanceID;
  NSString *stableGroupID;
  NSString *groupID;
  NSString *fromID;
  void *v16;
  NSDictionary *destinationsLightweightStatus;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *clientUUID;
  void *v28;
  NSNumber *qrReason;
  NSNumber *previousError;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *sessionConfig;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EAA9C();

  }
  if (!-[NSString length](self->_uniqueID, "length"))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907EAA70();

  }
  if (!-[NSString length](self->_instanceID, "length"))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EAA44();

  }
  if (!-[NSString length](self->_accountID, "length"))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907EAA18();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInitiator);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C10], v9);

  CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C18], MEMORY[0x1E0C9AAB0]);
  accountID = self->_accountID;
  if (accountID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BB0], accountID);
  uniqueID = self->_uniqueID;
  if (uniqueID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C50], uniqueID);
  instanceID = self->_instanceID;
  if (instanceID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C08], instanceID);
  stableGroupID = self->_stableGroupID;
  if (stableGroupID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D347E8], stableGroupID);
  groupID = self->_groupID;
  if (groupID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D347D8], groupID);
  fromID = self->_fromID;
  if (fromID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D347D0], fromID);
  -[NSSet allObjects](self->_destinations, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BE0], v16);

  destinationsLightweightStatus = self->_destinationsLightweightStatus;
  if (destinationsLightweightStatus)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BD8], destinationsLightweightStatus);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_transportType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C48], v18);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "listenerID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BC0], v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_connectionCountHint);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BD0], v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsToWaitForPreConnectionData);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C58], v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disallowCellularInterface);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BF0], v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disallowWifiInterface);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BF8], v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_preferredAddressFamily);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C38], v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preferCellularForCallSetup);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C30], v26);

  clientUUID = self->_clientUUID;
  if (clientUUID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BC8], clientUUID);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_alwaysSkipSelf);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BB8], v28);

  qrReason = self->_qrReason;
  if (qrReason)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D350F8], qrReason);
  previousError = self->_previousError;
  if (previousError)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D350F0], previousError);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_startAsUPlusOneSession);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34830], v31);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLightweightParticipant);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D347C8], v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_callScreeningMode);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D347B0], v33);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setupNewSessionWithConfiguration:", self->_sessionConfig);

  sessionConfig = self->_sessionConfig;
  self->_sessionConfig = 0;

}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *queue;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "assertQueueIsCurrent");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907EAB28();

    }
    -[CUTWeakReference object](self->_delegate, "object");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    queue = self->_queue;
    if (queue && v8)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_190736E14;
      v11[3] = &unk_1E2C60E00;
      v13 = v4;
      v12 = v9;
      dispatch_async(queue, v11);

    }
  }

}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  CUTWeakReference *v6;
  OS_dispatch_queue *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  CUTWeakReference *v12;
  CUTWeakReference *delegate;
  OS_dispatch_queue *queue;
  int v15;
  CUTWeakReference *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (CUTWeakReference *)a3;
  v7 = (OS_dispatch_queue *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EABB4();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134217984;
    v16 = v6;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Setting up session delegate %p", (uint8_t *)&v15, 0xCu);
  }

  if (self->_delegate != v6)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v6);
    v12 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
    delegate = self->_delegate;
    self->_delegate = v12;

  }
  queue = self->_queue;
  self->_queue = v7;

}

- (NSString)uniqueID
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EAC40();

  }
  return self->_uniqueID;
}

- (void)_cleanupSocketPairConnections
{
  IDSBaseSocketPairConnection *unreliableSocketPairConnection;

  -[IDSBaseSocketPairConnection endSession](self->_unreliableSocketPairConnection, "endSession");
  unreliableSocketPairConnection = self->_unreliableSocketPairConnection;
  self->_unreliableSocketPairConnection = 0;

}

- (void)updateMembers:(id)a3 withContext:(id)a4 triggeredLocally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  NSObject *v22;
  NSDictionary *destinationsLightweightStatus;
  NSDictionary *v24;
  NSDictionary *v25;
  void *v26;
  uint8_t buf[4];
  NSDictionary *v28;
  __int16 v29;
  NSDictionary *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EACCC();

  }
  v13 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v9, "__imSetFromArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "destinationWithDestinations:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "destinationURIs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v9, "__imSetFromArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "destinationWithDestinations:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "destinationLightweightStatus");
  v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    destinationsLightweightStatus = self->_destinationsLightweightStatus;
    *(_DWORD *)buf = 138412546;
    v28 = v21;
    v29 = 2112;
    v30 = destinationsLightweightStatus;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "updateMembers: lightweightStatusDict: %@, _destinationLightweightStatus: %@", buf, 0x16u);
  }

  v24 = self->_destinationsLightweightStatus;
  self->_destinationsLightweightStatus = v21;
  v25 = v21;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateMembers:forGroup:sessionID:withContext:messagingCapabilities:triggeredLocally:lightweightStatusDict:", v17, self->_groupID, self->_uniqueID, v8, 0, v5, v25);

}

- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  NSObject *v25;
  NSDictionary *destinationsLightweightStatus;
  NSDictionary *v27;
  NSDictionary *v28;
  void *v29;
  uint8_t buf[4];
  NSDictionary *v31;
  __int16 v32;
  NSDictionary *v33;
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "assertQueueIsCurrent");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1907EAD58();

  }
  v16 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v12, "__imSetFromArray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "destinationWithDestinations:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "destinationURIs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v12, "__imSetFromArray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "destinationWithDestinations:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "destinationLightweightStatus");
  v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    destinationsLightweightStatus = self->_destinationsLightweightStatus;
    *(_DWORD *)buf = 138412546;
    v31 = v24;
    v32 = 2112;
    v33 = destinationsLightweightStatus;
    _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "updateMembers (messagingCapabilities): lightweightStatusDict: %@, _destinationLightweightStatus: %@", buf, 0x16u);
  }

  v27 = self->_destinationsLightweightStatus;
  self->_destinationsLightweightStatus = v24;
  v28 = v24;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "updateMembers:forGroup:sessionID:withContext:messagingCapabilities:triggeredLocally:lightweightStatusDict:", v20, self->_groupID, self->_uniqueID, v11, v10, v6, v28);

}

- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907EADE4();

  }
  v10 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v6, "__imSetFromArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationWithDestinations:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "destinationURIs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "manageDesignatedMembers:forGroup:sessionID:withType:", v14, self->_groupID, self->_uniqueID, v4);

}

- (void)removeParticipantIDs:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EAE70();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeParticipantIDs:forGroup:sessionID:", v4, self->_groupID, self->_uniqueID);

}

- (void)updateParticipantData:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EAEFC();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateParticipantData:forGroup:sessionID:withContext:", v7, self->_groupID, self->_uniqueID, v6);

}

- (void)updateParticipantInfo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EAF88();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateParticipantInfo:forGroup:sessionID:", v4, self->_groupID, self->_uniqueID);

}

- (void)setParticipantInfo:(id)a3
{
  NSDictionary *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSDictionary *participantInfo;

  v4 = (NSDictionary *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EB014();

  }
  participantInfo = self->_participantInfo;
  self->_participantInfo = v4;

}

- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 withContext:(id)a5 triggeredLocally:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSDictionary *destinationsLightweightStatus;
  NSDictionary *v16;
  NSDictionary *v17;
  NSDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSObject *v23;
  NSDictionary *v24;
  NSObject *v25;
  NSObject *v26;
  NSDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  NSDictionary *v35;
  uint8_t buf[4];
  _BYTE v37[18];
  uint64_t v38;

  v6 = a6;
  v8 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907EB0CC();

  }
  if (v6)
  {
    destinationsLightweightStatus = self->_destinationsLightweightStatus;
    self->_isLightweightParticipant = (_DWORD)v8 == 0;
    v16 = (NSDictionary *)-[NSDictionary mutableCopy](destinationsLightweightStatus, "mutableCopy");
    v17 = v16;
    if (self->_fromID)
    {
      v18 = self->_destinationsLightweightStatus;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = sub_190737BB8;
      v34[3] = &unk_1E2C62498;
      v34[4] = self;
      v35 = v16;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v34);

    }
    else
    {
      +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1907EB0A0();

    }
    objc_storeStrong((id *)&self->_destinationsLightweightStatus, v17);
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_destinationsLightweightStatus;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v37 = v8;
      *(_WORD *)&v37[4] = 2112;
      *(_QWORD *)&v37[6] = v27;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "updateParticipantType to %u, _destinationsLightweightStatus: %@", buf, 0x12u);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D34D18];
    objc_msgSend(v10, "__imSetFromArray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "destinationWithDestinations:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "destinationLightweightStatus");
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_destinationsLightweightStatus;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v37 = v22;
      *(_WORD *)&v37[8] = 2112;
      *(_QWORD *)&v37[10] = v24;
      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "updateParticipantType: triggered remotely: lightweightStatusDict: %@, _destinationLightweightStatus: %@", buf, 0x16u);
    }

    v17 = self->_destinationsLightweightStatus;
    self->_destinationsLightweightStatus = v22;
  }

  v28 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v10, "__imSetFromArray");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "destinationWithDestinations:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "destinationURIs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "updateParticipantType:forGroup:sessionID:members:triggeredLocally:withContext:lightweightStatusDict:", v8, self->_groupID, self->_uniqueID, v32, v6, v11, self->_destinationsLightweightStatus);

}

- (void)joinWithOptions:(id)a3
{
  NSDictionary *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSDictionary *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSString *uniqueID;
  dispatch_time_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSDictionary *participantInfo;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  _QWORD block[4];
  id v50[5];
  id v51;
  id v52;
  uint64_t v53;
  const __CFString *v54;
  _BYTE buf[24];
  uint64_t v56;
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  v4 = (NSDictionary *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EB1E8();

  }
  if (self->_state != 2)
  {
    -[_IDSGroupSession uniqueID](self, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "joinWithOptions called %@", buf, 0xCu);
    }

    v13 = (void *)objc_msgSend(v11, "copy");
    -[NSDictionary description](v4, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = (id)MEMORY[0x1E0C809B0];
    v50[2] = (id)3221225472;
    v50[3] = sub_19073842C;
    v50[4] = &unk_1E2C607A8;
    v15 = v13;
    v51 = v15;
    v16 = v14;
    v52 = v16;
    cut_dispatch_log_queue();
    v17 = (void *)-[NSDictionary mutableCopy](v4, "mutableCopy");
    v18 = *MEMORY[0x1E0D34800];
    -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0D34800]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v4;
    if (!v19)
    {
      participantInfo = self->_participantInfo;
      if (!participantInfo
        || (-[NSDictionary objectForKey:](participantInfo, "objectForKey:", v18),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v43,
            !v43))
      {
        +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "Cannot join a session without the participant data information.", buf, 2u);
        }

        v45 = (void *)MEMORY[0x1E0CB35C8];
        v53 = *MEMORY[0x1E0CB2938];
        v54 = CFSTR("Cannot join a session without the participant data information.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("joinGroupSessionError"), -1000, v46);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[_IDSGroupSession sessionDidJoinGroup:participantInfo:error:](self, "sessionDidJoinGroup:participantInfo:error:", self->_uniqueID, 0, v37);
        goto LABEL_34;
      }
      v20 = self->_participantInfo;
    }
    -[NSDictionary objectForKey:](v20, "objectForKey:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, v18);

    v22 = *MEMORY[0x1E0D34818];
    -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0D34818]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[NSDictionary objectForKey:](v4, "objectForKey:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v22);

    }
    v25 = *MEMORY[0x1E0D34830];
    -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0D34830]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "BOOLValue") & 1) != 0)
      v27 = 1;
    else
      v27 = IMGetDomainBoolForKey();
    self->_startAsUPlusOneSession = v27;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_startAsUPlusOneSession);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, v25);

    v29 = *MEMORY[0x1E0D347B0];
    -[NSDictionary objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0D347B0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    self->_callScreeningMode = objc_msgSend(v30, "BOOLValue");

    if (IMGetDomainBoolForKeyWithDefaultValue())
    {
      +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uniqueID = self->_uniqueID;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = uniqueID;
        _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "Force callScreening mode on for session: %@, due to default.", buf, 0xCu);
      }

      self->_callScreeningMode = 1;
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v33 = dispatch_time(0, 20000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1907384E4;
      block[3] = &unk_1E2C60B88;
      objc_copyWeak(v50, (id *)buf);
      dispatch_after(v33, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(v50);
      objc_destroyWeak((id *)buf);
    }
    if (self->_callScreeningMode)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, v29);

    }
    v35 = *MEMORY[0x1E0D347B8];
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D347B8]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      objc_msgSend(v36, "UUIDString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v38, v35);

    }
    v39 = *MEMORY[0x1E0D34840];
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D34840]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      objc_msgSend(v17, "setObject:forKey:", v40, v39);
    objc_msgSend(v17, "removeObjectForKey:", *MEMORY[0x1E0D347E0]);
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = sub_1907385A8;
    v47[3] = &unk_1E2C61B88;
    v47[4] = self;
    v48 = v17;
    objc_msgSend(v41, "forwardMethodWithReplyIsSync:block:", 0, v47);

LABEL_34:
    goto LABEL_35;
  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Cannot join a session that is already ended, ignoring...", buf, 2u);
  }

  v9 = (void *)MEMORY[0x1E0CB35C8];
  v56 = *MEMORY[0x1E0CB2938];
  v57[0] = CFSTR("Cannot join a session that is already ended.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("joinGroupSessionError"), -1000, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSGroupSession sessionDidJoinGroup:participantInfo:error:](self, "sessionDidJoinGroup:participantInfo:error:", self->_uniqueID, 0, v11);
LABEL_35:

}

- (void)leaveGroupSessionWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EB274();

  }
  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[_IDSGroupSession uniqueID](self, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "leaveGroupSessionWithOptions called %@", (uint8_t *)&v11, 0xCu);

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leaveGroupSession:participantInfo:options:", self->_uniqueID, self->_participantInfo, v4);

}

- (void)reconnectUPlusOneSession
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EB300();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reconnectSessionWithUniqueID:", self->_uniqueID);

}

- (void)setPreferences:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *preferences;
  void *v10;

  v4 = (NSMutableDictionary *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EB38C();

  }
  if (self->_preferences != v4)
  {
    v8 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v4, "mutableCopy");
    preferences = self->_preferences;
    self->_preferences = v8;

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferences:forSessionWithUniqueID:", v4, self->_uniqueID);

  }
}

- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  NSSet *v6;
  NSSet *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSSet *requiredCapabilities;
  NSSet *v12;
  NSSet *requiredLackOfCapabilities;
  NSSet *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = (NSSet *)a3;
  v7 = (NSSet *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EB418();

  }
  requiredCapabilities = self->_requiredCapabilities;
  self->_requiredCapabilities = v6;
  v12 = v6;

  requiredLackOfCapabilities = self->_requiredLackOfCapabilities;
  self->_requiredLackOfCapabilities = v7;
  v14 = v7;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](v12, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](v14, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRequiredCapabilities:requiredLackOfCapabilities:forSessionWithUniqueID:", v16, v17, self->_uniqueID);

}

- (unsigned)sessionEndedReason
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EB4A4();

  }
  return self->_sessionEndedReason;
}

- (void)requestActiveParticipants
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EB530();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestActiveParticipantsForGroupSession:", self->_uniqueID);

}

- (void)requestURIsForParticipantIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *queue;
  NSObject *v14;
  NSObject *v15;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *URIsToParticipantIDRequests;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD block[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EB5BC();

  }
  v11 = MEMORY[0x1E0C809B0];
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "requestURIsForParticipantIDs: request has no participants.", buf, 2u);
    }

    queue = self->_queue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = sub_190738DBC;
    block[3] = &unk_1E2C604E8;
    v31 = v7;
    dispatch_async(queue, block);

  }
  if (self->_isInvalidated)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "GroupSession is invalidated.", buf, 2u);
    }

    v15 = self->_queue;
    v25 = v11;
    v26 = 3221225472;
    v27 = sub_190738E98;
    v28 = &unk_1E2C604E8;
    v29 = v7;
    dispatch_async(v15, &v25);

  }
  if (!self->_URIsToParticipantIDRequests)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    URIsToParticipantIDRequests = self->_URIsToParticipantIDRequests;
    self->_URIsToParticipantIDRequests = Mutable;

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v25, v26, v27, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_URIsToParticipantIDRequests;
  v20 = (void *)MEMORY[0x19400FE1C](v7);
  -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v20, v18);

  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(v6, "count");
    v23 = -[NSMutableDictionary count](self->_URIsToParticipantIDRequests, "count");
    *(_DWORD *)buf = 138412802;
    v33 = v18;
    v34 = 2048;
    v35 = v22;
    v36 = 2048;
    v37 = v23;
    _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "requestURIsForParticipantIDs {id:%@, participant count:%lu, total requests :%lu}", buf, 0x20u);
  }

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "requestURIsForParticipantIDs:withRequestID:forGroupSession:", v6, v18, self->_uniqueID);

}

- (void)registerPluginWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EB670();

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D34820]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    sub_1907EB648();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19073908C;
  v11[3] = &unk_1E2C61B88;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "forwardMethodWithReplyIsSync:block:", 0, v11);

}

- (void)unregisterPluginWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EB724();

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D34820]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    sub_1907EB6FC();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907391B4;
  v11[3] = &unk_1E2C61B88;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "forwardMethodWithReplyIsSync:block:", 0, v11);

}

- (void)requestEncryptionKeyForParticipants:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EB7B0();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestEncryptionKeyForGroup:participants:", self->_uniqueID, v4);

}

- (void)_checkAndSendDataCryptor
{
  void *v3;
  int v4;
  NSObject *v5;
  IDSGroupEncryptionKeyMaterialCache *keyMaterialCache;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IDSGroupEncryptionKeyMaterialCache *v17;
  id v18;
  IDSGroupSessionDataCryptor *v19;
  NSObject *queue;
  NSMutableArray *v21;
  NSObject *p_super;
  const char *v23;
  NSMutableArray *obj;
  _QWORD block[4];
  IDSGroupSessionDataCryptor *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EB83C();

  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  keyMaterialCache = self->_keyMaterialCache;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1907396AC;
  v34[3] = &unk_1E2C624C0;
  v34[4] = &v35;
  -[IDSGroupEncryptionKeyMaterialCache enumerateCachedKeyMaterialUsingBlock:](keyMaterialCache, "enumerateCachedKeyMaterialUsingBlock:", v34);
  if (!*((_BYTE *)v36 + 24))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v23 = "No local key material found. Skip completion handler udpate.";
LABEL_23:
    _os_log_impl(&dword_1906E0000, p_super, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    goto LABEL_24;
  }
  if (!-[NSMutableArray count](self->_dataCryptorRequests, "count"))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    p_super = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v23 = "No completion handlers detected inside _dataCryptorRequests.";
    goto LABEL_23;
  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSMutableArray count](self->_dataCryptorRequests, "count");
    *(_DWORD *)buf = 134217984;
    v41 = v8;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Updating %lu completion handlers in _dataCryptorRequests", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_dataCryptorRequests;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "first");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "second");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataUsingEncoding:", 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D50]), "initWithEncryptionContext:encryptionKeySize:", v15, 32);
        v17 = self->_keyMaterialCache;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = sub_1907396EC;
        v28[3] = &unk_1E2C624E8;
        v18 = v16;
        v29 = v18;
        -[IDSGroupEncryptionKeyMaterialCache enumerateCachedKeyMaterialUsingBlock:](v17, "enumerateCachedKeyMaterialUsingBlock:", v28);
        v19 = -[IDSGroupSessionDataCryptor initWithTopic:keyManager:]([IDSGroupSessionDataCryptor alloc], "initWithTopic:keyManager:", v13, v18);
        queue = self->_queue;
        if (queue)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1907396F8;
          block[3] = &unk_1E2C60E00;
          v27 = v14;
          v26 = v19;
          dispatch_async(queue, block);

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  p_super = &self->_dataCryptorRequests->super.super;
  self->_dataCryptorRequests = v21;
LABEL_24:

  _Block_object_dispose(&v35, 8);
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *queue;
  NSObject *v14;
  NSObject *v15;
  NSMutableArray *dataCryptorRequests;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD block[4];
  id v29;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EB8CC();

  }
  v11 = MEMORY[0x1E0C809B0];
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "requestDataCryptorForTopic: topic is empty!", buf, 2u);
    }

    queue = self->_queue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = sub_190739960;
    block[3] = &unk_1E2C604E8;
    v29 = v7;
    dispatch_async(queue, block);

  }
  if (self->_isInvalidated)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "GroupSession is invalidated.", buf, 2u);
    }

    v15 = self->_queue;
    v23 = v11;
    v24 = 3221225472;
    v25 = sub_190739970;
    v26 = &unk_1E2C604E8;
    v27 = v7;
    dispatch_async(v15, &v23);

  }
  dataCryptorRequests = self->_dataCryptorRequests;
  if (!dataCryptorRequests)
  {
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = self->_dataCryptorRequests;
    self->_dataCryptorRequests = v17;

    dataCryptorRequests = self->_dataCryptorRequests;
  }
  v19 = (void *)MEMORY[0x1E0D36A98];
  v20 = (void *)objc_msgSend(v6, "copy", v23, v24, v25, v26);
  v21 = (void *)MEMORY[0x19400FE1C](v7);
  objc_msgSend(v19, "pairWithFirst:second:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](dataCryptorRequests, "addObject:", v22);

  -[_IDSGroupSession _checkAndSendDataCryptor](self, "_checkAndSendDataCryptor");
}

- (id)sessionIDAliasWithSalt:(id)a3
{
  return (id)IDSIDAliasHashUUIDString();
}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (void *)MEMORY[0x1E0D36A98];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "numberWithUnsignedLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairWithFirst:second:", v12, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x19400FE1C](v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_createParticipantIDAliasCallbacks, "setObject:forKeyedSubscript:", v13, v15);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createAliasForParticipantID:salt:sessionID:", a3, v11, self->_uniqueID);

}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (void *)MEMORY[0x1E0D36A98];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "numberWithUnsignedLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pairWithFirst:second:", v12, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x19400FE1C](v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_getParticipantIDForAliasCallbacks, "setObject:forKeyedSubscript:", v13, v15);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getParticipantIDForAlias:salt:sessionID:", a3, v11, self->_uniqueID);

}

- (void)createSessionIDAliasWithSalt:(id)a3 delegateQueueCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSString *uniqueID;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EB958();

  }
  IDSIDAliasHashUUIDString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412802;
    v21 = v11;
    v22 = 2112;
    v23 = uniqueID;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "createSessionIDAliasWithSalt(async) created %@ from %@ and %@", buf, 0x20u);
  }

  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_190739D04;
  v17[3] = &unk_1E2C60E00;
  v18 = v11;
  v19 = v7;
  v15 = v11;
  v16 = v7;
  dispatch_async(queue, v17);

}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 delegateQueueCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *queue;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EB9E4();

  }
  v13 = IDSIDAliasHashUInt64();
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v21 = v13;
    v22 = 2048;
    v23 = a3;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID(async) created %llu from %llu and %@", buf, 0x20u);
  }

  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_190739EB8;
  v17[3] = &unk_1E2C62510;
  v18 = v9;
  v19 = v13;
  v16 = v9;
  dispatch_async(queue, v17);

}

- (void)createAliasForLocalParticipantIDWithSalt:(id)a3 delegateQueueCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t localParticipantID;
  NSObject *queue;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EBA70();

  }
  v11 = IDSIDAliasHashUInt64();
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    localParticipantID = self->_localParticipantID;
    *(_DWORD *)buf = 134218498;
    v20 = v11;
    v21 = 2048;
    v22 = localParticipantID;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "createAliasForLocalParticipantIDWithSalt(async) created %llu from %llu and %@", buf, 0x20u);
  }

  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19073A06C;
  v16[3] = &unk_1E2C62510;
  v17 = v7;
  v18 = v11;
  v15 = v7;
  dispatch_async(queue, v16);

}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 delegateQueueCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSMutableArray *getParticipantIDForAliasDelegateQueueCallbacks;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  NSMutableArray *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EBAFC();

  }
  v13 = (void *)MEMORY[0x1E0D36A98];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pairWithFirst:second:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D36A98];
  v17 = (void *)MEMORY[0x19400FE1C](v9);

  objc_msgSend(v16, "pairWithFirst:second:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_getParticipantIDForAliasDelegateQueueCallbacks, "addObject:", v18);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    getParticipantIDForAliasDelegateQueueCallbacks = self->_getParticipantIDForAliasDelegateQueueCallbacks;
    v22 = 138412546;
    v23 = v15;
    v24 = 2112;
    v25 = getParticipantIDForAliasDelegateQueueCallbacks;
    _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "getParticipantIDForAlias(async) added %@ to %@", (uint8_t *)&v22, 0x16u);
  }

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getParticipantIDForAlias:salt:sessionID:", a3, v8, self->_uniqueID);

}

- (void)setCallScreeningMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSString *uniqueID;
  void *v8;
  void *v9;
  void *v10;
  NSString *fromID;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    uniqueID = self->_uniqueID;
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = uniqueID;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "setCallScreeningMode:%@ for session:%@", buf, 0x16u);
  }

  if (self->_callScreeningMode != v3)
  {
    self->_callScreeningMode = v3;
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQuickRelayUserTypeForSession:withUserType:", self->_uniqueID, v3);

    if (!v3)
    {
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "enableP2PlinksForSession:", self->_uniqueID);

      fromID = self->_fromID;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &fromID, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSGroupSession manageDesignatedMembers:withType:](self, "manageDesignatedMembers:withType:", v10, 13);

    }
  }
}

- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSString *uniqueID;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    uniqueID = self->_uniqueID;
    if (v3)
      v6 = CFSTR("YES");
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = uniqueID;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "setForceTCPFallbackOnWiFiUsingReinitiate:%@ for session:%@", (uint8_t *)&v9, 0x16u);
  }

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setForceTCPFallbackOnWiFiUsingReinitiate:forSessionWithUniqueID:", v3, self->_uniqueID);

}

- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSString *uniqueID;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    uniqueID = self->_uniqueID;
    if (v3)
      v6 = CFSTR("YES");
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = uniqueID;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "setForceTCPFallbackOnCellUsingReinitiate:%@ for session:%@", (uint8_t *)&v9, 0x16u);
  }

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setForceTCPFallbackOnCellUsingReinitiate:forSessionWithUniqueID:", v3, self->_uniqueID);

}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  NSString *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  NSString *uniqueID;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  NSString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EBB88();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Session %@ received report", buf, 0xCu);
  }

  v12 = (void *)-[NSString copy](v6, "copy");
  objc_msgSend(v7, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = sub_19073A83C;
  v24 = &unk_1E2C607A8;
  v15 = v12;
  v25 = v15;
  v16 = v13;
  v26 = v16;
  cut_dispatch_log_queue();
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = sub_19073A8F4;
    v19[3] = &unk_1E2C62538;
    v19[4] = self;
    v20 = v7;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v19);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v28 = uniqueID;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveReport, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)groupSessionDidTerminate:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  NSString *uniqueID;
  _QWORD v12[5];
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EBC14();

  }
  v8 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v4);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Group session %@ was terminated", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19073AB0C;
    v12[3] = &unk_1E2C62560;
    v12[4] = self;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v12);
  }
  else
  {
    if (v10)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v14 = uniqueID;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring group session termination, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  NSString *v8;
  NSString *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  NSString *uniqueID;
  _QWORD v17[5];
  NSString *v18;
  unsigned int v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = (NSString *)a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EBCA0();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Group session ended %@ with error: %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    -[_IDSGroupSession _cleanupSocketPairConnections](self, "_cleanupSocketPairConnections");
    self->_state = 2;
    if (a4 <= 1)
      v14 = 1;
    else
      v14 = a4;
    self->_sessionEndedReason = v14;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_19073AD8C;
    v17[3] = &unk_1E2C62588;
    v17[4] = self;
    v19 = a4;
    v18 = v9;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v21 = uniqueID;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring group session ended, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)sessionDidJoinGroup:(id)a3 participantInfo:(id)a4 error:(id)a5
{
  _IDSGroupSession *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  NSString *uniqueID;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  _IDSGroupSession *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  _IDSGroupSession *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = (_IDSGroupSession *)a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907EBD2C();

  }
  self->_state = 1;
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Did join group session %@", buf, 0xCu);
  }

  v15 = (void *)-[_IDSGroupSession copy](v8, "copy");
  objc_msgSend(v9, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = sub_19073B09C;
  v28 = &unk_1E2C607A8;
  v18 = v15;
  v29 = v18;
  v19 = v16;
  v30 = v19;
  cut_dispatch_log_queue();
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = sub_19073B154;
    v22[3] = &unk_1E2C625B0;
    v22[4] = self;
    v23 = v9;
    v24 = v10;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v22);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v32 = self;
      v33 = 2112;
      v34 = uniqueID;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidJoinGroup {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }

  }
}

- (void)sessionDidJoinGroup:(id)a3 participantUpdateDictionary:(id)a4 error:(id)a5
{
  _IDSGroupSession *v8;
  NSString *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t localParticipantID;
  void *v19;
  id v20;
  NSString *uniqueID;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  _IDSGroupSession *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  _IDSGroupSession *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = (_IDSGroupSession *)a3;
  v9 = (NSString *)a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907EBDB8();

  }
  self->_state = 1;
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Did join group session %@, participantUpdate %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    -[NSString objectForKey:](v9, "objectForKey:", CFSTR("IDSGroupSessionParticipantUpdateParticipantIdentifierKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      self->_localParticipantID = -[NSObject unsignedLongLongValue](v15, "unsignedLongLongValue");
      +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        localParticipantID = self->_localParticipantID;
        *(_DWORD *)buf = 134217984;
        v26 = (_IDSGroupSession *)localParticipantID;
        _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Received localParticipantID: %llu", buf, 0xCu);
      }

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D70]), "initWithDictionaryRepresentation:", v9);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_19073B480;
    v22[3] = &unk_1E2C625B0;
    v22[4] = self;
    v23 = v19;
    v24 = v10;
    v20 = v19;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v22);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v26 = self;
      v27 = 2112;
      v28 = uniqueID;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidJoinGroup {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }

}

- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4
{
  _IDSGroupSession *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *uniqueID;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  _IDSGroupSession *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  _IDSGroupSession *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (_IDSGroupSession *)a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EBE44();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Did leave group session %@", buf, 0xCu);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19073B80C;
    v14[3] = &unk_1E2C62538;
    v14[4] = self;
    v15 = v7;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v17 = self;
      v18 = 2112;
      v19 = uniqueID;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidLeaveGroup {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }

  }
}

- (void)session:(id)a3 participantDidJoinGroupWithInfo:(id)a4
{
  _IDSGroupSession *v6;
  NSString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *uniqueID;
  _QWORD v14[5];
  NSString *v15;
  uint8_t buf[4];
  _IDSGroupSession *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  _IDSGroupSession *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (_IDSGroupSession *)a3;
  v7 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EBED0();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "ParticipantDidJoin group session %@, participantInfo %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19073BA74;
    v14[3] = &unk_1E2C62538;
    v14[4] = self;
    v15 = v7;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v17 = self;
      v18 = 2112;
      v19 = uniqueID;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring participantDidJoinGroupWithInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }

  }
}

- (void)session:(id)a3 participantDidLeaveGroupWithInfo:(id)a4
{
  _IDSGroupSession *v6;
  NSString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *uniqueID;
  _QWORD v14[5];
  NSString *v15;
  uint8_t buf[4];
  _IDSGroupSession *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  _IDSGroupSession *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (_IDSGroupSession *)a3;
  v7 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EBF5C();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "ParticipantDidLeave group session %@, participantInfo %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19073BCDC;
    v14[3] = &unk_1E2C62538;
    v14[4] = self;
    v15 = v7;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v17 = self;
      v18 = 2112;
      v19 = uniqueID;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring participantDidLeaveGroupWithInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }

  }
}

- (void)session:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5
{
  NSString *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  id v27;
  NSString *uniqueID;
  id v29;
  _QWORD v30[5];
  id v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  _IDSGroupSession *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  NSString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EBFE8();

  }
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = v9;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D60]), "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v16);
    }

    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134218242;
      v45 = (_IDSGroupSession *)v21;
      v46 = 2112;
      v47 = v8;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "didReceiveActiveParticipants: count %lu for group session: %@", buf, 0x16u);
    }

    objc_msgSend(v13, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)-[NSString copy](v8, "copy");
    v24 = MEMORY[0x1E0C809B0];
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = sub_19073C0AC;
    v36 = &unk_1E2C607A8;
    v37 = v22;
    v38 = v23;
    v25 = v23;
    v26 = v22;
    cut_dispatch_log_queue();
    v30[0] = v24;
    v30[1] = 3221225472;
    v30[2] = sub_19073C164;
    v30[3] = &unk_1E2C625D8;
    v30[4] = self;
    v31 = v13;
    v32 = a5;
    v27 = v13;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v30);

    v9 = v29;
  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v45 = self;
      v46 = 2112;
      v47 = uniqueID;
      v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveActiveParticipants {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }

}

- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5
{
  NSString *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  id v27;
  NSString *uniqueID;
  id v29;
  _QWORD v30[5];
  id v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  _IDSGroupSession *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  NSString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EC074();

  }
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = v9;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D60]), "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v16);
    }

    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134218242;
      v45 = (_IDSGroupSession *)v21;
      v46 = 2112;
      v47 = v8;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "didReceiveActiveLightweightParticipants: count %lu for group session: %@", buf, 0x16u);
    }

    objc_msgSend(v13, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)-[NSString copy](v8, "copy");
    v24 = MEMORY[0x1E0C809B0];
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = sub_19073C538;
    v36 = &unk_1E2C607A8;
    v37 = v22;
    v38 = v23;
    v25 = v23;
    v26 = v22;
    cut_dispatch_log_queue();
    v30[0] = v24;
    v30[1] = 3221225472;
    v30[2] = sub_19073C5F0;
    v30[3] = &unk_1E2C625D8;
    v30[4] = self;
    v31 = v13;
    v32 = a5;
    v27 = v13;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v30);

    v9 = v29;
  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v45 = self;
      v46 = 2112;
      v47 = uniqueID;
      v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveActiveLightweightParticipants {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }

}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  _IDSGroupSession *v6;
  NSString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *uniqueID;
  _QWORD v14[5];
  NSString *v15;
  uint8_t buf[4];
  _IDSGroupSession *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  _IDSGroupSession *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (_IDSGroupSession *)a3;
  v7 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EC100();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "didRegisterPluginAllocationInfo for session: %@, sessionInfo: %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19073C85C;
    v14[3] = &unk_1E2C62538;
    v14[4] = self;
    v15 = v7;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v17 = self;
      v18 = 2112;
      v19 = uniqueID;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring didRegisterPluginAllocationInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }

  }
}

- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  _IDSGroupSession *v6;
  NSString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *uniqueID;
  _QWORD v14[5];
  NSString *v15;
  uint8_t buf[4];
  _IDSGroupSession *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  _IDSGroupSession *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (_IDSGroupSession *)a3;
  v7 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EC18C();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "didUnregisterPluginAllocationInfo for session: %@, sessionInfo: %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19073CAC4;
    v14[3] = &unk_1E2C62538;
    v14[4] = self;
    v15 = v7;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v17 = self;
      v18 = 2112;
      v19 = uniqueID;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring didUnregisterPluginAllocationInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }

  }
}

- (void)session:(id)a3 didReceiveBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  _BOOL4 v7;
  int v8;
  NSString *v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  _BOOL4 v19;
  const __CFString *v20;
  NSString *uniqueID;
  _QWORD v22[5];
  id v23;
  unsigned int v24;
  __int16 v25;
  BOOL v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  _BYTE v30[10];
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v7 = a7;
  v8 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = (NSString *)a3;
  v13 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907EC218();

  }
  v17 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v12);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v17 & 1) != 0)
  {
    if (v19)
    {
      v20 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v28 = v12;
      if (v7)
        v20 = CFSTR("YES");
      v29 = 1024;
      *(_DWORD *)v30 = a5;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v8;
      v31 = 2112;
      v32 = v20;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, type: %u, isTruncated: %@, didReceiveBlockedParticipantIDs: %@", buf, 0x2Cu);
    }

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_19073CD64;
    v22[3] = &unk_1E2C62600;
    v22[4] = self;
    v23 = v13;
    v24 = a5;
    v25 = v8;
    v26 = v7;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v22);

  }
  else
  {
    if (v19)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v28 = uniqueID;
      v29 = 2112;
      *(_QWORD *)v30 = v12;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveBlockedParticipantIDs, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 didReceiveQueryBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 isTruncated:(BOOL)a6
{
  _BOOL4 v6;
  NSString *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  const __CFString *v18;
  NSString *uniqueID;
  _QWORD v20[5];
  id v21;
  unsigned int v22;
  BOOL v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = (NSString *)a3;
  v11 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907EC2A4();

  }
  v15 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v10);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) != 0)
  {
    if (v17)
    {
      v18 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v26 = 1024;
      v25 = v10;
      if (v6)
        v18 = CFSTR("YES");
      *(_DWORD *)v27 = a5;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v18;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, isTruncated: %@, didReceiveQueryBlockedParticipantIDs: %@", buf, 0x26u);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_19073D044;
    v20[3] = &unk_1E2C62628;
    v20[4] = self;
    v21 = v11;
    v22 = a5;
    v23 = v6;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v20);

  }
  else
  {
    if (v17)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v25 = uniqueID;
      v26 = 2112;
      *(_QWORD *)v27 = v10;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveQueryBlockedParticipantIDs, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 didRemoveParticipantIDs:(id)a4 withCode:(unsigned int)a5 isTruncated:(BOOL)a6
{
  _BOOL4 v6;
  NSString *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  const __CFString *v18;
  NSString *uniqueID;
  _QWORD v20[5];
  id v21;
  unsigned int v22;
  BOOL v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = (NSString *)a3;
  v11 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907EC330();

  }
  v15 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v10);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) != 0)
  {
    if (v17)
    {
      v18 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v26 = 1024;
      v25 = v10;
      if (v6)
        v18 = CFSTR("YES");
      *(_DWORD *)v27 = a5;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v18;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, isTruncated: %@, didRemoveParticipantIDs: %@", buf, 0x26u);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_19073D2DC;
    v20[3] = &unk_1E2C62628;
    v20[4] = self;
    v21 = v11;
    v22 = a5;
    v23 = v6;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v20);

  }
  else
  {
    if (v17)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v25 = uniqueID;
      v26 = 2112;
      *(_QWORD *)v27 = v10;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didRemoveParticipantIDs, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 rejectedKeyRecoveryRequestFromURI:(id)a4 reason:(unsigned int)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  unsigned int v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EC3BC();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 1024;
    v23 = a5;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Group session %@ rejectedKeyRecoveryRequestFromURI: %@, reason: %u", buf, 0x1Cu);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19073D4E0;
  v15[3] = &unk_1E2C62588;
  v15[4] = self;
  v16 = v9;
  v17 = a5;
  v14 = v9;
  -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v15);

}

- (void)session:(id)a3 didReceiveKeyMaterial:(id)a4
{
  _IDSGroupSession *v6;
  NSString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  IDSGroupEncryptionKeyMaterialCache *keyMaterialCache;
  NSObject *v12;
  _BOOL4 v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  IDSGroupEncryptionKeyMaterialCache *v19;
  void *v20;
  NSString *uniqueID;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSString *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  _IDSGroupSession *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  _IDSGroupSession *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = (_IDSGroupSession *)a3;
  v7 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EC448();

  }
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) == 0)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v33 = self;
      v34 = 2112;
      v35 = uniqueID;
      v36 = 2112;
      v37 = v6;
      v22 = "Ignoring group session didReceiveKeyMaterial {self:%p, _uniqueID:%@, identifier:%@}";
      v23 = v12;
      v24 = 32;
LABEL_21:
      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
LABEL_22:

    goto LABEL_23;
  }
  keyMaterialCache = self->_keyMaterialCache;
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!keyMaterialCache)
  {
    if (v13)
    {
      v25 = self->_uniqueID;
      *(_DWORD *)buf = 138412290;
      v33 = (_IDSGroupSession *)v25;
      v22 = "Can't store key material for session %@";
      v23 = v12;
      v24 = 12;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (v13)
  {
    *(_DWORD *)buf = 138412546;
    v33 = v6;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Group session %@ didReceiveKeyMaterial SKM: %@", buf, 0x16u);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v7;
  v15 = -[NSString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = self->_keyMaterialCache;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D58]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        -[IDSGroupEncryptionKeyMaterialCache recvKeyMaterial:](v19, "recvKeyMaterial:", v20);

      }
      v16 = -[NSString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_19073D850;
  v26[3] = &unk_1E2C62560;
  v26[4] = self;
  -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v26);
  -[_IDSGroupSession _checkAndSendDataCryptor](self, "_checkAndSendDataCryptor");
LABEL_23:

}

- (void)session:(id)a3 shouldInvalidateKeyMaterialByKeyIndexes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSString *uniqueID;
  IDSGroupEncryptionKeyMaterialCache *keyMaterialCache;
  NSObject *v14;
  NSString *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSString *v19;
  int v20;
  NSString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EC4D4();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    v20 = 138412546;
    v21 = uniqueID;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "shouldInvalidateKeyMaterialByKeyIndexes for session %@, expiredKeyIndexes: %@", (uint8_t *)&v20, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) == 0)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_uniqueID;
      v20 = 138412546;
      v21 = v15;
      v22 = 2112;
      v23 = v6;
      v16 = "Ignoring group session shouldInvalidateKeyMaterialByKeyIndexes, session doesn't match %@ vs. %@";
      v17 = v14;
      v18 = 22;
LABEL_14:
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, v18);
    }
LABEL_15:

    goto LABEL_16;
  }
  keyMaterialCache = self->_keyMaterialCache;
  if (!keyMaterialCache)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_uniqueID;
      v20 = 138412290;
      v21 = v19;
      v16 = "Can't store key material for session %@";
      v17 = v14;
      v18 = 12;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  -[IDSGroupEncryptionKeyMaterialCache invalidateKeyMaterialByKeyIndexes:](keyMaterialCache, "invalidateKeyMaterialByKeyIndexes:", v7);
LABEL_16:

}

- (void)sessionDidReceiveParticipantUpgrade:(id)a3 participantType:(unsigned __int16)a4 error:(id)a5
{
  int v6;
  NSString *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  const __CFString *v17;
  NSString *uniqueID;
  _QWORD v19[5];
  id v20;
  __int16 v21;
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  _WORD v25[17];

  v6 = a4;
  *(_QWORD *)&v25[13] = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EC560();

  }
  v13 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412802;
      v23 = v8;
      v24 = 1024;
      *(_DWORD *)v25 = v6;
      v25[2] = 2112;
      *(_QWORD *)&v25[3] = v9;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "sessionDidReceiveParticipantUpgrade %@, type: %u, error: %@", buf, 0x1Cu);
    }

    if (v9)
    {
      self->_isLightweightParticipant = v6 != 0;
      +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = CFSTR("YES");
        if (!self->_isLightweightParticipant)
          v17 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v23 = v8;
        v24 = 2112;
        *(_QWORD *)v25 = v17;
        _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "sessionDidReceiveParticipantUpgrade %@, change _isLightweightParticipant to %@", buf, 0x16u);
      }

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_19073DD54;
    v19[3] = &unk_1E2C62650;
    v19[4] = self;
    v21 = v6;
    v20 = v9;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v19);

  }
  else
  {
    if (v15)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v23 = uniqueID;
      v24 = 2112;
      *(_QWORD *)v25 = v8;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidReceiveParticipantUpgrade, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  NSString *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  NSString *uniqueID;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EC5EC();

  }
  v13 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412802;
      v21 = v8;
      v22 = 2048;
      v23 = a4;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "didReceiveJoinedParticipantID identifier: %@, participantID: %llu, clientContext: %@", buf, 0x20u);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_19073DFB8;
    v17[3] = &unk_1E2C62678;
    v17[4] = self;
    v19 = a4;
    v18 = v9;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);

  }
  else
  {
    if (v15)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v21 = uniqueID;
      v22 = 2112;
      v23 = (unint64_t)v8;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveJoinedParticipantID, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  NSString *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  NSString *uniqueID;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EC678();

  }
  v13 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412802;
      v21 = v8;
      v22 = 2048;
      v23 = a4;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "didReceiveLeftParticipantID identifier: %@, participantID: %llu, clientContext: %@", buf, 0x20u);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_19073E218;
    v17[3] = &unk_1E2C62678;
    v17[4] = self;
    v19 = a4;
    v18 = v9;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);

  }
  else
  {
    if (v15)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v21 = uniqueID;
      v22 = 2112;
      v23 = (unint64_t)v8;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveLeftParticipantID, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 didReceiveParticipantIDs:(id)a4 withCode:(unsigned int)a5 managementType:(unsigned __int16)a6
{
  int v6;
  NSString *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  _BOOL4 v17;
  NSString *uniqueID;
  _QWORD v19[5];
  id v20;
  unsigned int v21;
  __int16 v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  _BYTE v26[10];
  __int16 v27;
  id v28;
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = (NSString *)a3;
  v11 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907EC704();

  }
  v15 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v10);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) != 0)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138413058;
      v24 = v10;
      v25 = 1024;
      *(_DWORD *)v26 = a5;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = v6;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, type: %u, didReceiveParticipantIDs: %@", buf, 0x22u);
    }

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_19073E490;
    v19[3] = &unk_1E2C626A0;
    v19[4] = self;
    v20 = v11;
    v21 = a5;
    v22 = v6;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v19);

  }
  else
  {
    if (v17)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v24 = uniqueID;
      v25 = 2112;
      *(_QWORD *)v26 = v10;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveParticipantIDs:withCode:managementType:, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 didReceiveURIsForParticipantIDs:(id)a4 withRequestID:(id)a5
{
  NSString *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  char v14;
  uint64_t v15;
  _BOOL4 v16;
  NSString *uniqueID;
  int v18;
  NSString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907EC790();

  }
  v14 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) != 0)
  {
    if (v16)
    {
      v18 = 138412546;
      v19 = v8;
      v20 = 2048;
      v21 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1906E0000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Group session %@ didReceiveURIsForParticipantIDs: count:%lu", (uint8_t *)&v18, 0x16u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_URIsToParticipantIDRequests, "objectForKeyedSubscript:", v10);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_URIsToParticipantIDRequests, "removeObjectForKey:", v10);
      (*(void (**)(uint64_t, id, _QWORD))(v15 + 16))(v15, v9, 0);
    }
  }
  else if (v16)
  {
    uniqueID = self->_uniqueID;
    v18 = 138412546;
    v19 = uniqueID;
    v20 = 2112;
    v21 = (uint64_t)v8;
    _os_log_impl(&dword_1906E0000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveURIsForParticipantIDs:, session doesn't match %@ vs. %@", (uint8_t *)&v18, 0x16u);
  }

}

- (void)participantUpdatedForSession:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  NSString *uniqueID;
  _QWORD v12[5];
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EC81C();

  }
  v8 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v4);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "participantUpdatedForSession %@", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19073E898;
    v12[3] = &unk_1E2C62560;
    v12[4] = self;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v12);
  }
  else
  {
    if (v10)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v14 = uniqueID;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring group session participantUpdated, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 hasOutdatedSKI:(id)a4
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EC8A8();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "hasOutdatedSKI %@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)session:(id)a3 didCreateParticipantIDAlias:(unint64_t)a4 forParticipantID:(unint64_t)a5 salt:(id)a6
{
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EC934();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218498;
    v20 = a4;
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = a5;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "didCreateParticipantIDAlias %llu salt %@ participantID %llu", (uint8_t *)&v19, 0x20u);
  }

  v14 = (void *)MEMORY[0x1E0D36A98];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pairWithFirst:second:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_createParticipantIDAliasCallbacks, "objectForKeyedSubscript:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
  {
    (*(void (**)(uint64_t, unint64_t))(v17 + 16))(v17, a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_createParticipantIDAliasCallbacks, "setObject:forKeyedSubscript:", 0, v16);
  }

}

- (void)session:(id)a3 didReceiveParticipantID:(unint64_t)a4 forParticipantIDAlias:(unint64_t)a5 salt:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *getParticipantIDForAliasDelegateQueueCallbacks;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _IDSGroupSession *v25;
  _BYTE *v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE buf[24];
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907EC9C0();

  }
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    v34 = a5;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "didReceiveParticipantID %llu salt %@ participantIDAlias %llu", buf, 0x20u);
  }

  v16 = (void *)MEMORY[0x1E0D36A98];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pairWithFirst:second:", v17, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v34) = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  getParticipantIDForAliasDelegateQueueCallbacks = self->_getParticipantIDForAliasDelegateQueueCallbacks;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_19073EE60;
  v23[3] = &unk_1E2C626C8;
  v20 = v18;
  v24 = v20;
  v25 = self;
  v27 = &v29;
  v28 = a4;
  v26 = buf;
  -[NSMutableArray enumerateObjectsUsingBlock:](getParticipantIDForAliasDelegateQueueCallbacks, "enumerateObjectsUsingBlock:", v23);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[NSMutableArray removeObjectAtIndex:](self->_getParticipantIDForAliasDelegateQueueCallbacks, "removeObjectAtIndex:", v30[3]);
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_getParticipantIDForAliasCallbacks, "objectForKeyedSubscript:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      (*(void (**)(uint64_t, unint64_t))(v21 + 16))(v21, a4);

  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

}

- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  NSString *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  NSObject *v16;
  NSString *uniqueID;
  _QWORD v18[5];
  id v19;
  NSString *v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907ECA50();

  }
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v14 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D60]), "initWithDictionaryRepresentation:", v10);
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v8;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "session %@ participant: %@, didReceiveDataBlob: %@", buf, 0x20u);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_19073F19C;
    v18[3] = &unk_1E2C625B0;
    v18[4] = self;
    v19 = v9;
    v20 = v14;
    v16 = v14;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v18);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v22 = uniqueID;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveDataBlob, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }

}

- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  int v7;
  NSString *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSString *v16;
  NSObject *v17;
  NSObject *v18;
  NSString *uniqueID;
  _QWORD v20[5];
  id v21;
  NSString *v22;
  __int16 v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = (NSString *)a3;
  v11 = a4;
  v12 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "assertQueueIsCurrent");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1907ECADC();

  }
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v10) & 1) != 0)
  {
    v16 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D60]), "initWithDictionaryRepresentation:", v12);
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v25 = v10;
      v26 = 2112;
      v27 = v16;
      v28 = 1024;
      v29 = v7;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "session %@ participant: %@, type: %u, didReceiveData: %@", buf, 0x26u);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_19073F45C;
    v20[3] = &unk_1E2C626F0;
    v20[4] = self;
    v23 = v7;
    v21 = v11;
    v22 = v16;
    v18 = v16;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v20);

  }
  else
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v25 = uniqueID;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveData:dataType:forParticipant, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }

}

- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  NSString *v6;
  void *v7;
  int v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  NSString *uniqueID;
  _QWORD v14[5];
  unsigned int v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907ECB68();

  }
  v10 = -[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6);
  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 1024;
      LODWORD(v19) = a4;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "session %@ didReceiveServerErrorCode: %u", buf, 0x12u);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19073F694;
    v14[3] = &unk_1E2C62718;
    v14[4] = self;
    v15 = a4;
    -[_IDSGroupSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);
  }
  else
  {
    if (v12)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v17 = uniqueID;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveServerErrorCode, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSString *uniqueID;
  int v15;
  NSObject *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKey:", CFSTR("object-type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToIgnoringCase:", CFSTR("session-device-socket"));

  if (v9)
  {
    +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "xpc object: [%@] context: [%@]", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v7, "objectForKey:", CFSTR("sessionID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v11) & 1) != 0)
    {
      if (v6)
        xpc_fd_dup(v6);
      -[_IDSGroupSession _cleanupSocketPairConnections](self, "_cleanupSocketPairConnections");
      objc_msgSend(v7, "objectForKey:", CFSTR("error"));
      v12 = objc_claimAutoreleasedReturnValue();
      +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Received XPC Response Error: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    else
    {
      +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uniqueID = self->_uniqueID;
        v15 = 138412546;
        v16 = uniqueID;
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring socket, session doesn't match %@ vs. %@", (uint8_t *)&v15, 0x16u);
      }
    }

  }
}

- (id)keyValueDelivery
{
  return (id)MEMORY[0x1E0DE7D20](_IDSGroupSession, sel_keyValueDeliveryForSessionID_);
}

+ (id)keyValueDeliveryForSessionID:(id)a3
{
  id v3;
  IDSGroupSessionKeyValueDelivery *v4;

  v3 = a3;
  v4 = -[IDSGroupSessionKeyValueDelivery initWithSessionID:]([IDSGroupSessionKeyValueDelivery alloc], "initWithSessionID:", v3);

  return v4;
}

- (void)emptyXPCReply
{
  NSObject *v2;
  uint8_t v3[16];

  +[IDSLogging _IDSGroupSession](IDSLogging, "_IDSGroupSession");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1906E0000, v2, OS_LOG_TYPE_DEFAULT, "received empty XPC reply", v3, 2u);
  }

}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (void)setKeyMaterialCache:(id)a3
{
  objc_storeStrong((id *)&self->_keyMaterialCache, a3);
}

- (id)getDestinations
{
  return self->_destinations;
}

- (id)getDestinationsLightweightStatusDict
{
  return self->_destinationsLightweightStatus;
}

- (id)getURIsToParticipantIDRequests
{
  return self->_URIsToParticipantIDRequests;
}

- (unsigned)state
{
  return self->_state;
}

- (id)boostContext
{
  return self->_boostContext;
}

- (void)setBoostContext:(id)a3
{
  objc_storeStrong(&self->_boostContext, a3);
}

- (unint64_t)localParticipantID
{
  return self->_localParticipantID;
}

- (NSSet)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSSet)requiredLackOfCapabilities
{
  return self->_requiredLackOfCapabilities;
}

- (BOOL)isLightweightParticipant
{
  return self->_isLightweightParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredLackOfCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_getParticipantIDForAliasDelegateQueueCallbacks, 0);
  objc_storeStrong((id *)&self->_getParticipantIDForAliasCallbacks, 0);
  objc_storeStrong((id *)&self->_createParticipantIDAliasCallbacks, 0);
  objc_storeStrong((id *)&self->_URIsToParticipantIDRequests, 0);
  objc_storeStrong((id *)&self->_dataCryptorRequests, 0);
  objc_storeStrong((id *)&self->_keyMaterialCache, 0);
  objc_storeStrong((id *)&self->_previousError, 0);
  objc_storeStrong((id *)&self->_qrReason, 0);
  objc_storeStrong((id *)&self->_joinLeaveError, 0);
  objc_storeStrong((id *)&self->_existingParticipants, 0);
  objc_storeStrong((id *)&self->_participantInfo, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_stableGroupID, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_unreliableSocketPairConnection, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_destinationsLightweightStatus, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong(&self->_boostContext, 0);
  objc_storeStrong(&self->_delegateContext, 0);
}

@end
