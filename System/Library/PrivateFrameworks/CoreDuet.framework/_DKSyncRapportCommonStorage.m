@implementation _DKSyncRapportCommonStorage

+ (_DKSyncRapportCommonStorage)sharedInstance
{
  if (sharedInstance_initialized_6 != -1)
    dispatch_once(&sharedInstance_initialized_6, &__block_literal_global_78);
  return (_DKSyncRapportCommonStorage *)(id)sharedInstance_sharedInstance_3;
}

- (_DKSyncRapportCommonStorage)init
{
  _DKSyncRapportCommonStorage *v2;
  uint64_t v3;
  NSDictionary *failIfAsleepOption;
  uint64_t v5;
  _DKEventTypeResultStatsCounter *failIfAsleepStats;
  uint64_t v7;
  NSMutableDictionary *companionLinkClients;
  uint64_t v9;
  NSMutableSet *peerSourceDeviceIDsWithCompletedHandshakes;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_DKSyncRapportCommonStorage;
  v2 = -[_DKSyncRapportCommonStorage init](&v12, sel_init);
  if (v2)
  {
    v13 = *MEMORY[0x1E0D839A8];
    v14[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v3 = objc_claimAutoreleasedReturnValue();
    failIfAsleepOption = v2->_failIfAsleepOption;
    v2->_failIfAsleepOption = (NSDictionary *)v3;

    +[_DKEventTypeResultStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeResultStatsCounter, CFSTR("knowledge_sync"), CFSTR("rapport_message_sent_with_fail_if_asleep"), CFSTR("option"), &unk_1E272C040);
    v5 = objc_claimAutoreleasedReturnValue();
    failIfAsleepStats = v2->_failIfAsleepStats;
    v2->_failIfAsleepStats = (_DKEventTypeResultStatsCounter *)v5;

    v7 = objc_opt_new();
    companionLinkClients = v2->_companionLinkClients;
    v2->_companionLinkClients = (NSMutableDictionary *)v7;

    v2->_retryTimeout = 8.0;
    v9 = objc_opt_new();
    peerSourceDeviceIDsWithCompletedHandshakes = v2->_peerSourceDeviceIDsWithCompletedHandshakes;
    v2->_peerSourceDeviceIDsWithCompletedHandshakes = (NSMutableSet *)v9;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
  -[_DKSyncRapportCommonStorage removeAllClientsWithRetiring:]((uint64_t)self, 1);
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncRapportCommonStorage;
  -[_DKSyncRapportCommonStorage dealloc](&v3, sel_dealloc);
}

- (void)removeAllClientsWithRetiring:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v4, "peerWithIDSDeviceIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:](a1, v12, v11, a2);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)start
{
  NSObject *v3;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->_client && !self->_running)
    -[_DKSyncRapportCommonStorage startRapport]((uint64_t)self);
}

- (void)startRapport
{
  void *v3;
  uint8_t v4[24];

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Starting Rapport", v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (void)cancelOutstandingOperations
{
  NSObject *v2;

  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

}

- (id)name
{
  return CFSTR("Rapport");
}

- (int64_t)transportType
{
  return 1;
}

- (uint64_t)_additionalFlagsForInternal
{
  _QWORD block[5];

  if (result)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke;
    block[3] = &unk_1E26E2F20;
    block[4] = result;
    if (_additionalFlagsForInternal_onceToken != -1)
      dispatch_once(&_additionalFlagsForInternal_onceToken, block);
    return _additionalFlagsForInternal_flag;
  }
  return result;
}

- (void)handleInvalidation
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "%{public}@: Handling invalidation handler call", v5);

  OUTLINED_FUNCTION_1();
}

- (void)handleDeviceFound:(void *)a1
{
  __CFString *v2;
  void *v3;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  int v24;
  const __CFString *v25;
  __CFString *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    -[__CFString idsDeviceIdentifier](v5, "idsDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v5, "idsDeviceIdentifier");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString identifier](v5, "identifier");
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v20;
        v51 = 2114;
        v52 = v21;
        v53 = 2114;
        v54 = v2;
        _os_log_debug_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Found device %{public}@ with companion link identifier %{public}@", buf, 0x20u);

      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v5, "idsDeviceIdentifier");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v22;
        v51 = 2114;
        v52 = v23;
        v53 = 2112;
        v54 = v5;
        _os_log_debug_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Device %{public}@ is %@", buf, 0x20u);

      }
      +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString idsDeviceIdentifier](v5, "idsDeviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "peerWithIDSDeviceIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString name](v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setName:", v13);

      -[__CFString model](v5, "model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setModel:", v14);

      objc_msgSend(v12, "setCompanion:", ((unint64_t)-[__CFString statusFlags](v5, "statusFlags") >> 6) & 1);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v5, "idsDeviceIdentifier");
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v12, "me");
        v25 = &stru_1E26E9728;
        if (v24)
          v25 = CFSTR("pseudo ");
        v41 = v25;
        objc_msgSend(v12, "identifier");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "model");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v34 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v12, "model");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR(" (%@)"), v3);
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v2 = &stru_1E26E9728;
        }
        *(_DWORD *)buf = 138544386;
        v50 = v46;
        v51 = 2114;
        v52 = v43;
        v53 = 2114;
        v54 = (__CFString *)v41;
        v55 = 2114;
        v56 = v26;
        v57 = 2114;
        v58 = v2;
        _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Device %{public}@ is %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v27)
        {

        }
      }

      if ((-[__CFString statusFlags](v5, "statusFlags") & 0x100) != 0)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "me"))
            v31 = CFSTR("pseudo ");
          else
            v31 = &stru_1E26E9728;
          objc_msgSend(v12, "identifier");
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "model");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v38 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v12, "model");
            v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR(" (%@)"), v2);
            v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = &stru_1E26E9728;
          }
          *(_DWORD *)buf = 138544130;
          v50 = v48;
          v51 = 2114;
          v52 = v31;
          v53 = 2114;
          v54 = v45;
          v55 = 2114;
          v56 = v33;
          _os_log_debug_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: Activating %{public}@peer %{public}@%{public}@ recognizes sync protocol", buf, 0x2Au);
          if (v32)
          {

          }
        }

        objc_msgSend(a1, "handshakeWithDuetSyncPeer:orError:", v12, 0);
      }
      else
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v12, "me");
          v29 = &stru_1E26E9728;
          if (v28)
            v29 = CFSTR("pseudo ");
          v40 = v29;
          objc_msgSend(v12, "identifier");
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "model");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v35 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v12, "model");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR(" (%@)"), v39);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = &stru_1E26E9728;
          }
          -[__CFString model](v5, "model");
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString name](v5, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v50 = v47;
          v51 = 2114;
          v52 = v40;
          v53 = 2114;
          v54 = v44;
          v55 = 2114;
          v56 = v42;
          v57 = 2114;
          v58 = v36;
          v59 = 2112;
          v60 = v37;
          _os_log_debug_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Unsupported %{public}@peer %{public}@%{public}@ does not currently recognize sync protocol: %{public}@ (%@)", buf, 0x3Eu);

          if (v30)
          {

          }
        }

        objc_msgSend(v10, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v12);
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceFound:].cold.2();
      }

      objc_msgSend(v10, "debugLogPeers");
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceFound:].cold.1();
      }

    }
  }

}

- (void)handleDeviceChanged:(int)a3 changes:
{
  __CFString *v3;
  void *v4;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  const __CFString *v32;
  int v33;
  const __CFString *v34;
  __CFString *v35;
  void *v36;
  int v37;
  const __CFString *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  const __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  __CFString *v59;
  __int16 v60;
  __CFString *v61;
  __int16 v62;
  __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    -[__CFString idsDeviceIdentifier](v7, "idsDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v7, "idsDeviceIdentifier");
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString identifier](v7, "identifier");
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v55 = v28;
        v56 = 2114;
        v57 = v29;
        v58 = 2112;
        v59 = v3;
        v60 = 1024;
        LODWORD(v61) = a3;
        _os_log_debug_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Changed device %{public}@ with companion link identifier %@ and changes %x", buf, 0x26u);

      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v7, "idsDeviceIdentifier");
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v30;
        v56 = 2114;
        v57 = v31;
        v58 = 2112;
        v59 = v7;
        _os_log_debug_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Changed device %{public}@ is %@", buf, 0x20u);

      }
      +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString idsDeviceIdentifier](v7, "idsDeviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "peerWithIDSDeviceIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v7, "idsDeviceIdentifier");
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "me"))
          v32 = CFSTR("pseudo ");
        else
          v32 = &stru_1E26E9728;
        objc_msgSend(v14, "identifier");
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "model");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v36 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v14, "model");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"), v4);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v3 = &stru_1E26E9728;
        }
        *(_DWORD *)buf = 138544386;
        v55 = v48;
        v56 = 2114;
        v57 = v45;
        v58 = 2114;
        v59 = (__CFString *)v32;
        v60 = 2114;
        v61 = v43;
        v62 = 2114;
        v63 = v3;
        _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Changed device %{public}@ is %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v51)
        {

        }
      }

      v16 = objc_msgSend(v12, "activeTransportsForPeer:", v14);
      if ((-[__CFString statusFlags](v7, "statusFlags") & 0x100) != 0)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v14, "me");
          v34 = &stru_1E26E9728;
          if (v33)
            v34 = CFSTR("pseudo ");
          v44 = v34;
          objc_msgSend(v14, "identifier");
          v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "model");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
          {
            v41 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v14, "model");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR(" (%@)"), v4);
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35 = &stru_1E26E9728;
          }
          *(_DWORD *)buf = 138544130;
          v55 = v49;
          v56 = 2114;
          v57 = v44;
          v58 = 2114;
          v59 = v46;
          v60 = 2114;
          v61 = v35;
          _os_log_debug_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Activating %{public}@peer %{public}@%{public}@ now recognizes sync protocol", buf, 0x2Au);
          if (v52)
          {

          }
        }

        if ((objc_msgSend(a1, "transportType") & v16) == 0)
          objc_msgSend(a1, "handshakeWithDuetSyncPeer:orError:", v14, 0);
      }
      else if ((objc_msgSend(a1, "transportType") & v16) != 0)
      {
        objc_msgSend(v12, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v14);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v14, "me");
          v38 = &stru_1E26E9728;
          if (v37)
            v38 = CFSTR("pseudo ");
          v47 = v38;
          objc_msgSend(v14, "identifier");
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "model");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            v42 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v14, "model");
            v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringWithFormat:", CFSTR(" (%@)"), v3);
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v40 = &stru_1E26E9728;
          }
          *(_DWORD *)buf = 138544130;
          v55 = v53;
          v56 = 2114;
          v57 = v47;
          v58 = 2114;
          v59 = v50;
          v60 = 2114;
          v61 = v40;
          _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Unsupported %{public}@peer %{public}@%{public}@ no longer recognizes sync protocol", buf, 0x2Au);
          if (v39)
          {

          }
        }

      }
      -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)a1, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == 0;

      if (v21)
      {
        -[_DKSyncRapportCommonStorage clientForPeer:](a1, v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:]((uint64_t)a1, v22, v14, 0);
        objc_msgSend(v12, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v14);

      }
      if ((a3 & 2) != 0)
      {
        v23 = -[__CFString statusFlags](v7, "statusFlags") & 0x40;
        if (objc_msgSend(v14, "isCompanion") != (v23 >> 6))
        {
          if (v23)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              objc_claimAutoreleasedReturnValue();
              -[__CFString idsDeviceIdentifier](v7, "idsDeviceIdentifier");
              objc_claimAutoreleasedReturnValue();
              -[_DKSyncRapportCommonStorage handleDeviceChanged:changes:].cold.3();
            }
          }
          else
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend((id)objc_opt_class(), "description");
              objc_claimAutoreleasedReturnValue();
              -[__CFString idsDeviceIdentifier](v7, "idsDeviceIdentifier");
              objc_claimAutoreleasedReturnValue();
              -[_DKSyncRapportCommonStorage handleDeviceChanged:changes:].cold.4();
            }
          }

          v25 = objc_msgSend(v12, "activeTransportsForPeer:", v14);
          v26 = objc_msgSend(a1, "transportType") & v25;
          if (v26)
            objc_msgSend(v12, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v14);
          objc_msgSend(v14, "setCompanion:", v23 != 0);
          if (v26)
            objc_msgSend(v12, "addActiveTransports:toPeer:", objc_msgSend(a1, "transportType"), v14);
        }
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceFound:].cold.2();
      }

      objc_msgSend(v12, "debugLogPeers");
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceChanged:changes:].cold.1();
      }

    }
  }

}

- (void)handleDeviceLost:(_QWORD *)a1
{
  void *v2;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    -[__CFString idsDeviceIdentifier](v4, "idsDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v4, "idsDeviceIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString identifier](v4, "identifier");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v18;
        v34 = 2114;
        v35 = v19;
        v36 = 2112;
        v37 = v20;
        _os_log_debug_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Lost device %{public}@ with companion link identifier %@", buf, 0x20u);

      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v4, "idsDeviceIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v21;
        v34 = 2114;
        v35 = v22;
        v36 = 2112;
        v37 = v4;
        _os_log_debug_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Lost device %{public}@ is %@", buf, 0x20u);

      }
      +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString idsDeviceIdentifier](v4, "idsDeviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "peerWithIDSDeviceIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[_DKSyncRapportCommonStorage clientForPeer:](a1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:]((uint64_t)a1, v12, v11, 0);
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString idsDeviceIdentifier](v4, "idsDeviceIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v11, "me");
        v24 = &stru_1E26E9728;
        if (v23)
          v24 = CFSTR("pseudo ");
        v28 = v24;
        objc_msgSend(v11, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "model");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v27 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "model");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR(" (%@)"), v2);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = &stru_1E26E9728;
        }
        *(_DWORD *)buf = 138544386;
        v33 = v31;
        v34 = 2114;
        v35 = v30;
        v36 = 2114;
        v37 = v28;
        v38 = 2114;
        v39 = v29;
        v40 = 2114;
        v41 = v26;
        _os_log_debug_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Lost device %{public}@ is %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v25)
        {

        }
      }

      -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)a1, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

      if (v15)
      {
        objc_msgSend(v9, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v11);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          objc_claimAutoreleasedReturnValue();
          -[_DKSyncRapportCommonStorage handleDeviceFound:].cold.2();
        }

        objc_msgSend(v9, "debugLogPeers");
      }

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceLost:].cold.1();
      }

    }
  }

}

- (void)registerRequestIDsWithClient:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (a1)
  {
    v3 = MEMORY[0x1E0C809B0];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke;
    v6[3] = &unk_1E26E6FB0;
    v6[4] = a1;
    v4 = a2;
    objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.beacon"), 0, v6);
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke_2;
    v5[3] = &unk_1E26E6FB0;
    v5[4] = a1;
    objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("com.apple.coreduet.fetch-source-device-id"), 0, v5);

  }
}

- (void)handleActivateWithError:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleActivateWithError:].cold.2();
    }

    if (v3)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v17 = v13;
        v18 = 2114;
        v19 = v14;
        v20 = 2048;
        v21 = objc_msgSend(v3, "code");
        v22 = 2112;
        v23 = v3;
        _os_log_error_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to start Rapport: %{public}@:%lld (%@)", buf, 0x2Au);

      }
      *(_BYTE *)(a1 + 8) = 0;
      objc_msgSend(*(id *)(a1 + 40), "invalidate");
      v7 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      objc_msgSend((id)a1, "setIsAvailable:", 0);
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:userInfo:sender:", CFSTR("_DKRapportTransportAvailablityChangedNotification"), 0, a1);

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleActivateWithError:].cold.1();
      }

      v10 = *(void **)(a1 + 40);
      v11 = *MEMORY[0x1E0D839F0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke;
      v15[3] = &unk_1E26E3118;
      v15[4] = a1;
      objc_msgSend(v10, "registerProfileID:completion:", v11, v15);
      *(_BYTE *)(a1 + 8) = 1;
      objc_msgSend((id)a1, "setIsAvailable:", 1);
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postNotificationName:userInfo:sender:", CFSTR("_DKRapportTransportAvailablityChangedNotification"), 0, a1);
      *(_QWORD *)(a1 + 72) = 0x4020000000000000;

    }
  }

}

- (void)handleBeaconWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  id v7;
  void (**v8)(id, void *, _QWORD, void *);
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[3];
  _QWORD v35[3];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v33 = a3;
  v8 = a4;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:].cold.5();
    }

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:].cold.4();
    }

    v12 = (void *)objc_opt_new();
    objc_msgSend(a1, "myDeviceID");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("peer"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "peerWithIDSDeviceIdentifier:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v16, "me");
          v24 = &stru_1E26E9728;
          if (v23)
            v24 = CFSTR("pseudo ");
          v29 = v24;
          objc_msgSend(v16, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "model");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "model");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR(" (%@)"), v26);
            v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v25 = &stru_1E26E9728;
          }
          v28 = (__CFString *)v25;
          *(_DWORD *)buf = 138544130;
          v37 = v31;
          v38 = 2114;
          v39 = v29;
          v40 = 2114;
          v41 = v30;
          v42 = 2114;
          v43 = v25;
          _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Received beacon request from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
          if (v32)
          {

          }
        }

        if (v16)
        {
          objc_msgSend(a1, "handshakeWithDuetSyncPeer:orError:", v16, 0);
          v18 = 0;
        }
        else
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            objc_claimAutoreleasedReturnValue();
            -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:].cold.3();
          }

          +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        +[_DKSyncErrors invalidRequest](_DKSyncErrors, "invalidRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:].cold.2();
      }

      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v13 = &stru_1E26E9728;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34[0] = CFSTR("server");
    v34[1] = CFSTR("results");
    v35[0] = v13;
    v35[1] = v12;
    v34[2] = CFSTR("version");
    v35[2] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:].cold.1();
    }

    v8[2](v8, v21, 0, v18);
  }

}

- (void)handleFetchSourceDeviceIDWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  id v7;
  void (**v8)(id, void *, _QWORD, void *);
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  NSObject *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];
  const __CFString *v27;
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v24 = a3;
  v8 = a4;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:].cold.4();
    }

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:].cold.3();
    }

    objc_msgSend(a1, "myDeviceID");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (__CFString *)v13;
    if (v13)
    {
      v15 = 0;
      v27 = CFSTR("deviceID");
      v28[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:].cold.2();
      }

      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v19 = objc_claimAutoreleasedReturnValue();
      v17 = &stru_1E26E9728;
      v16 = 0;
      v15 = (void *)v19;
    }
    v25[0] = CFSTR("server");
    v25[1] = CFSTR("result");
    if (v16)
      v20 = v16;
    else
      v20 = &stru_1E26E9728;
    v26[0] = v17;
    v26[1] = v20;
    v25[2] = CFSTR("version");
    v26[2] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:].cold.1();
    }

    v8[2](v8, v21, 0, v15);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v10, v23, 0);

    }
  }

}

- (void)handshakeWithDuetSyncPeer:(id)a3 orError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSMutableSet *peerSourceDeviceIDsWithCompletedHandshakes;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "sourceDeviceID");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v6, "version");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        peerSourceDeviceIDsWithCompletedHandshakes = self->_peerSourceDeviceIDsWithCompletedHandshakes;
        objc_msgSend(v6, "sourceDeviceID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(peerSourceDeviceIDsWithCompletedHandshakes) = -[NSMutableSet containsObject:](peerSourceDeviceIDsWithCompletedHandshakes, "containsObject:", v29);

        if ((_DWORD)peerSourceDeviceIDsWithCompletedHandshakes)
        {
          objc_msgSend(v8, "addActiveTransports:toPeer:", -[_DKSyncRapportCommonStorage transportType](self, "transportType"), v6);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setLastSeenDate:onPeer:", v30, v6);

          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("handshake:%@"), v33);
    v18 = objc_claimAutoreleasedReturnValue();

    +[_DKThrottledActivity standardInstance](_DKThrottledActivity, "standardInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke;
    v47[3] = &unk_1E26E4A58;
    v47[4] = self;
    v48 = v6;
    v49 = v31;
    v50 = v8;
    v45[0] = v35;
    v45[1] = 3221225472;
    v45[2] = __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_127;
    v45[3] = &unk_1E26E7000;
    v45[4] = self;
    v46 = v48;
    v36 = v31;
    objc_msgSend(v34, "performNoMoreOftenInMinutesThan:name:activityBlock:throttleBlock:", v18, v47, v45, 1.0);

LABEL_21:
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "code") != -6714
    || (objc_msgSend(v7, "domain"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D83988]),
        v9,
        !v10))
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = &stru_1E26E9728;
      if (objc_msgSend(v6, "me"))
        v21 = CFSTR("pseudo ");
      else
        v21 = &stru_1E26E9728;
      objc_msgSend(v6, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "model");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v39 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "model");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR(" (%@)"), v43);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "domain");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v52 = v19;
      v53 = 2114;
      v54 = v21;
      v55 = 2114;
      v56 = v22;
      v57 = 2114;
      v58 = v20;
      v59 = 2114;
      v60 = v40;
      v61 = 2048;
      v62 = objc_msgSend(v7, "code");
      v63 = 2112;
      v64 = v7;
      _os_log_error_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed while handshaking with %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

      if (v23)
      {

      }
    }
    goto LABEL_21;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "me");
    v13 = &stru_1E26E9728;
    v14 = CFSTR("pseudo ");
    if (!v12)
      v14 = &stru_1E26E9728;
    v42 = v14;
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "model");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR(" (%@)"), v41);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "model");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v52 = v44;
    v53 = 2114;
    v54 = v42;
    v55 = 2114;
    v56 = v15;
    v57 = 2114;
    v58 = v13;
    v59 = 2114;
    v60 = v37;
    v61 = 2112;
    v62 = (uint64_t)v38;
    _os_log_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_INFO, "%{public}@: Unsupported %{public}@peer %{public}@%{public}@ failed to recognize sync protocol beacon: %{public}@ (%@)", buf, 0x3Eu);

    if (v16)
    {

    }
  }

  objc_msgSend(v8, "removeActiveTransports:fromPeer:", -[_DKSyncRapportCommonStorage transportType](self, "transportType"), v6);
LABEL_22:

}

- (id)deviceForPeer:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 40), "activeDevices");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v3, "idsDeviceIdentifier", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "idsDeviceIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqualToString:", v10);

          if (v11)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_QWORD)clientForPeer:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "idsDeviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)a1[6];
      objc_msgSend(v4, "idsDeviceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_DKSyncRapportCommonStorage clientForPeer:].cold.1(a1, v4, v8);

      a1 = 0;
    }

  }
  return a1;
}

- (void)removeClient:(void *)a3 forPeer:(int)a4 retiring:
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (a4)
    {
      if (v10)
        -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:].cold.1(a1, v8, v9);
    }
    else if (v10)
    {
      -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:].cold.2(a1, v8, v9);
    }

    objc_msgSend(v8, "idsDeviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", 0, v11);
    objc_msgSend(v7, "invalidate");

  }
}

- (void)handleActivateCompanionLinkClient:(void *)a3 forPeer:(void *)a4 error:
{
  void *v4;
  void *v5;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  __CFString *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v12);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "me");
      v16 = &stru_1E26E9728;
      if (v15)
        v16 = CFSTR("pseudo ");
      v28 = v16;
      objc_msgSend(v10, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "model");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR(" (%@)"), v5);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = &stru_1E26E9728;
      }
      *(_DWORD *)buf = 138544130;
      v33 = v30;
      v34 = 2114;
      v35 = v28;
      v36 = 2114;
      v37 = v4;
      v38 = 2114;
      v39 = v18;
      _os_log_debug_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Handling client activate of %{public}@peer %{public}@%{public}@", buf, 0x2Au);
      if (v17)
      {

      }
    }

    if (v11)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v10, "me");
        v20 = &stru_1E26E9728;
        if (v19)
          v20 = CFSTR("pseudo ");
        v27 = v20;
        objc_msgSend(v10, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "model");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v24 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "model");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR(" (%@)"), v4);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = &stru_1E26E9728;
        }
        objc_msgSend(v11, "domain");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v11, "code");
        *(_DWORD *)buf = 138544898;
        v33 = v31;
        v34 = 2114;
        v35 = v27;
        v36 = 2114;
        v37 = v29;
        v38 = 2114;
        v39 = v22;
        v40 = 2114;
        v41 = v25;
        v42 = 2048;
        v43 = v26;
        v44 = 2112;
        v45 = v11;
        _os_log_error_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed client activate of %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v21)
        {

        }
      }

      -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:](a1, v9, v10, 0);
    }
  }

}

- (id)transformResponseError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D83988];
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D83988]))
  {

LABEL_5:
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v6))
    {
      v10 = objc_msgSend(v4, "code");

      v8 = v4;
      if (v10 != -6722)
        goto LABEL_12;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DKSyncRapportCommonStorage transformResponseError:].cold.1((uint64_t)self, v11);

    }
    else
    {

    }
    v8 = v4;
    goto LABEL_12;
  }
  v7 = objc_msgSend(v4, "code");

  if (v7 != -71156)
    goto LABEL_5;
  +[_DKSyncErrors temporaryFailure](_DKSyncErrors, "temporaryFailure");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (id)transformCaughtObject:(id)a3 existingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString **v20;
  uint64_t *v21;
  char v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "code");
      v30 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v5, "reason");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("Exception Caught");
      if (v16)
        v18 = (const __CFString *)v16;
      v31[0] = v18;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = (const __CFString **)v31;
      v21 = &v30;
    }
    else
    {
      v22 = objc_opt_respondsToSelector();
      v11 = (void *)MEMORY[0x1E0CB35C8];
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "code");
      if ((v22 & 1) == 0)
      {
        v26 = *MEMORY[0x1E0CB2D50];
        v27 = CFSTR("Object Caught");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", v13, v15, v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v28 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v5, "description");
      v23 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v23;
      v24 = CFSTR("Object Caught");
      if (v23)
        v24 = (const __CFString *)v23;
      v29 = v24;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v29;
      v21 = &v28;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v13, v15, v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    goto LABEL_6;
  }
  v8 = v6;
LABEL_5:
  v9 = v8;
LABEL_6:

  return v9;
}

- (id)myDeviceID
{
  NSString *v3;
  NSObject *v4;
  RPCompanionLinkClient *client;
  void *v6;

  v3 = self->_deviceID;
  if (!v3)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[_DKSyncRapportCommonStorage myDeviceID].cold.1(self, v4);

    -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
    client = self->_client;
    self->_client = 0;

    -[_DKSyncRapportCommonStorage setIsAvailable:](self, "setIsAvailable:", 0);
    +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:userInfo:sender:", CFSTR("_DKRapportTransportAvailablityChangedNotification"), 0, self);

  }
  return v3;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (id)client
{
  return self->_client;
}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  const __CFString *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  int v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[5];

  v6 = a4;
  v45[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[_DKSyncRapportCommonStorage myDeviceID](self, "myDeviceID");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[_DKSyncRapportCommonStorage isAvailable](self, "isAvailable")
    && (objc_msgSend(v8, "idsDeviceIdentifier"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &stru_1E26E9728;
    if (v11)
      v15 = v11;
    else
      v15 = &stru_1E26E9728;
    v44[0] = CFSTR("client");
    v44[1] = CFSTR("version");
    v45[0] = v15;
    v45[1] = CFSTR("3.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v8, "me");
      v21 = CFSTR("pseudo ");
      if (!v20)
        v21 = &stru_1E26E9728;
      v25 = v21;
      objc_msgSend(v8, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "model");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "model");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR(" (%@)"), v24);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v35 = v27;
      v36 = 2114;
      v37 = v25;
      v38 = 2114;
      v39 = v26;
      v40 = 2114;
      v41 = v14;
      v42 = 2112;
      v43 = v16;
      _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Sending source device id request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v22)
      {

      }
    }

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke;
    v30[3] = &unk_1E26E7028;
    v30[4] = self;
    v31 = v8;
    v32 = v13;
    v33 = v9;
    v18 = v9;
    v19 = v13;
    -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, "sendRequestID:request:peer:highPriority:options:responseHandler:", CFSTR("com.apple.coreduet.fetch-source-device-id"), v16, v31, v6, 0, v30);

  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke_2;
    v28[3] = &unk_1E26E2FE8;
    v29 = v9;
    v16 = v9;
    -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:](self, "handleAvailabilityFailureWithPeer:completion:", v8, v28);
    v19 = v29;
  }

}

- (void)handleFetchSourceDeviceIDWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  __CFString *v13;
  id v14;
  id v15;
  _QWORD *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  double v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void (*v29)(_QWORD *, void *, void *, id);
  const __CFString *v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  int v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  __CFString *v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v48 = a3;
  v14 = a4;
  v49 = a5;
  v15 = a6;
  v16 = a7;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v17);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithResponse:options:error:peer:plStartDate:completion:].cold.1();
    }

    if (v14)
    {
      if (objc_msgSend(v14, "code") == -6714
        && (objc_msgSend(v14, "domain"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D83988]),
            v19,
            v20))
      {
        +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v49);
        v22 = 0;
        v23 = 0;
      }
      else
      {
        objc_msgSend(a1, "transformResponseError:", v14);
        v22 = 0;
        v23 = 0;
        v21 = v14;
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "me"))
          v30 = CFSTR("pseudo ");
        else
          v30 = &stru_1E26E9728;
        objc_msgSend(v49, "identifier");
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "model");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v34 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v49, "model");
          a5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR(" (%@)"), a5);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v33 = &stru_1E26E9728;
        }
        *(_DWORD *)buf = 138544386;
        v51 = v46;
        v52 = 2114;
        v53 = v30;
        v54 = 2114;
        v55 = v31;
        v56 = 2114;
        v57 = v33;
        v58 = 2112;
        v59 = v13;
        _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch source device id response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v32)
        {

        }
      }

      -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("result"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("version"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "length"))
      {
        objc_msgSend(v22, "doubleValue");
        if (v25 <= 0.0)
        {

          v22 = 0;
        }
      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("deviceID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 && (v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v26)) != 0)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v49, "me");
          v36 = &stru_1E26E9728;
          if (v35)
            v36 = CFSTR("pseudo ");
          v42 = v36;
          objc_msgSend(v49, "identifier");
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "model");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
          {
            v41 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v49, "model");
            v38 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR(" (%@)"), v38);
            v37 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)v38;
          }
          else
          {
            v37 = &stru_1E26E9728;
          }
          *(_DWORD *)buf = 138544386;
          v51 = v45;
          v52 = 2114;
          v53 = v44;
          v54 = 2114;
          v55 = v42;
          v56 = 2114;
          v57 = v43;
          v58 = 2114;
          v59 = v37;
          v39 = (__CFString *)v37;
          _os_log_debug_impl(&dword_18DDBE000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched source device id %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x34u);
          if (v47)
          {

          }
        }

        v14 = 0;
      }
      else
      {
        +[_DKSyncErrors invalidResponse](_DKSyncErrors, "invalidResponse");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v23 = 0;
      }

    }
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, objc_msgSend(a1, "transportType"), v15, v28, 0);

    }
    if (v16)
    {
      v29 = (void (*)(_QWORD *, void *, void *, id))v16[2];
      if (v14)
        v29(v16, 0, 0, v14);
      else
        v29(v16, v23, v22, 0);
    }

  }
}

- (BOOL)isTransportActiveForPeer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activeTransportsForPeer:", v4);

  LOBYTE(self) = (-[_DKSyncRapportCommonStorage transportType](self, "transportType") & v6) != 0;
  return (char)self;
}

- (void)sendRequestID:(id)a3 request:(id)a4 peer:(id)a5 highPriority:(BOOL)a6 options:(id)a7 responseHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  _DKSyncRapportCommonStorage *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  -[_DKSyncRapportCommonStorage clientForPeer:](self, v16);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (id)v20;
    -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)self, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDestinationDevice:", v22);

    objc_msgSend(v21, "destinationDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[_DKSyncRapportCommonStorage sendRequestID:request:peer:client:options:responseHandler:]((uint64_t)self, v14, v15, v16, v21, v17, v18);
      goto LABEL_21;
    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:].cold.3((int)self, (int)v16, (int)v28, v29, v30, v31, v32, v33, v39, v40, (uint8_t)v41, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49,
        v50,
        v51,
        v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        v58);

    -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:]((uint64_t)self, v21, v16, 0);
    if (v18)
    {
      +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
      v34 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v38 = (void *)v34;
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v18 + 2))(v18, 0, 0, v34);

    }
  }
  else
  {
    v24 = objc_alloc_init(MEMORY[0x1E0D83900]);
    if (v24)
    {
      v21 = v24;
      +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDispatchQueue:", v25);

      objc_msgSend(v21, "setControlFlags:", objc_msgSend(v21, "controlFlags") | -[_DKSyncRapportCommonStorage _additionalFlagsForInternal]((uint64_t)self) | 0x400000);
      -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)self, v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDestinationDevice:", v26);

      objc_msgSend(v21, "destinationDevice");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v39 = MEMORY[0x1E0C809B0];
        v40 = 3221225472;
        v41 = __95___DKSyncRapportCommonStorage_sendRequestID_request_peer_highPriority_options_responseHandler___block_invoke;
        v42 = &unk_1E26E7050;
        v43 = self;
        v21 = v21;
        v44 = v21;
        v45 = v16;
        v46 = v17;
        LOBYTE(v50) = a6;
        v47 = v14;
        v48 = v15;
        v49 = v18;
        objc_msgSend(v21, "activateWithCompletion:", &v39);

        goto LABEL_21;
      }
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:].cold.2(self, v16, v37);

      objc_msgSend(v21, "invalidate");
      if (v18)
      {
        +[_DKSyncErrors temporaryFailure](_DKSyncErrors, "temporaryFailure");
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:].cold.1(self, v16, v35);

      if (v18)
      {
        +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v18 + 2))(v18, 0, 0, v36);

      }
      v21 = 0;
    }
  }
LABEL_21:

}

- (void)sendRequestID:(void *)a3 request:(void *)a4 peer:(void *)a5 client:(void *)a6 options:(void *)a7 responseHandler:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  __CFString *v27;
  NSObject *v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  int v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  __CFString *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v48 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v18);

    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D839A8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = CFSTR("enabled");
    if (!v19)
      v20 = CFSTR("disabled");
    v21 = v20;
    v22 = (id)*MEMORY[0x1E0D83960];
    if (v16)
      v23 = (void *)objc_msgSend(v16, "mutableCopy");
    else
      v23 = (void *)objc_opt_new();
    v24 = v23;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E272B218, *MEMORY[0x1E0D839E0]);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v39 = v13;
      objc_msgSend((id)objc_opt_class(), "description");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v14, "me");
      v30 = CFSTR("pseudo ");
      if (!v29)
        v30 = &stru_1E26E9728;
      v40 = v30;
      objc_msgSend(v14, "identifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "model");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "model");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR(" (%@)"), v37);
        v31 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = &stru_1E26E9728;
      }
      v13 = v39;
      v38 = (void *)v31;
      *(_DWORD *)buf = 138544642;
      v54 = v46;
      v55 = 2114;
      v56 = v48;
      v57 = 2114;
      v58 = v40;
      v59 = 2114;
      v60 = v44;
      v61 = 2114;
      v62 = v31;
      v63 = 2112;
      v64 = v13;
      _os_log_debug_impl(&dword_18DDBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Starting to send request %{public}@ to %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
      if (v42)
      {

      }
    }

    v26 = MEMORY[0x1E0C809B0];
    ++*(_QWORD *)(a1 + 56);
    v49[0] = v26;
    v49[1] = 3221225472;
    v49[2] = __89___DKSyncRapportCommonStorage_sendRequestID_request_peer_client_options_responseHandler___block_invoke;
    v49[3] = &unk_1E26E7078;
    v49[4] = a1;
    v27 = v21;
    v50 = v27;
    v52 = v17;
    v51 = v15;
    objc_msgSend(v51, "sendRequestID:request:destinationID:options:responseHandler:", v48, v13, v22, v24, v49);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v14, "me");
      v33 = &stru_1E26E9728;
      v34 = CFSTR("pseudo ");
      if (!v32)
        v34 = &stru_1E26E9728;
      v41 = v34;
      objc_msgSend(v14, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "model");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "model");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"), v38);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544386;
      v54 = v43;
      v55 = 2114;
      v56 = v48;
      v57 = 2114;
      v58 = v41;
      v59 = 2114;
      v60 = v47;
      v61 = 2114;
      v62 = v33;
      _os_log_debug_impl(&dword_18DDBE000, v28, OS_LOG_TYPE_DEBUG, "%{public}@: Done sending request %{public}@ to %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v45)
      {

      }
    }

  }
}

- (void)handleAvailabilityFailureWithPeer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[_DKSyncErrors internalFailure](_DKSyncErrors, "internalFailure");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_DKSyncRapportCommonStorage isAvailable](self, "isAvailable"))
  {
    +[_DKSyncErrors temporaryFailure](_DKSyncErrors, "temporaryFailure");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(v6, "idsDeviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[_DKSyncErrors temporaryFailure](_DKSyncErrors, "temporaryFailure");
    v11 = objc_claimAutoreleasedReturnValue();

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:].cold.4(self, v6, v12);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:].cold.1();

    v8 = (void *)v11;
  }
  -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)self, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    +[_DKSyncErrors temporaryFailure](_DKSyncErrors, "temporaryFailure");
    v15 = objc_claimAutoreleasedReturnValue();

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:].cold.2(self, v6, v16);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:].cold.1();

    v8 = (void *)v15;
  }
  if (v7)
    v7[2](v7, v8);

}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerSourceDeviceIDsWithCompletedHandshakes, 0);
  objc_storeStrong((id *)&self->_companionLinkClientsCleanupTimer, 0);
  objc_storeStrong((id *)&self->_companionLinkClients, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_failIfAsleepStats, 0);
  objc_storeStrong((id *)&self->_failIfAsleepOption, 0);
}

- (void)handleDeviceFound:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Ignoring device found with no idsDeviceIdentifier: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleDeviceFound:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: peers now...", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleDeviceChanged:changes:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Ignoring device changed with no idsDeviceIdentifier: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleDeviceChanged:changes:.cold.3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_52(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Device %{public}@ is now paired companion", v5, v6);

  OUTLINED_FUNCTION_33();
}

- (void)handleDeviceChanged:changes:.cold.4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_52(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Device %{public}@ is no longer paired companion", v5, v6);

  OUTLINED_FUNCTION_33();
}

- (void)handleDeviceLost:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Ignoring device lost with no idsDeviceIdentifier: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleActivateWithError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Started Rapport", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleActivateWithError:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling activate", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with beacon response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to beacon, missing source device id or delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18DDBE000, "%{public}@: Failed to instantiate peer with ids device identifier %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received beacon request: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling beacon request", v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Calling response handler with fetch source device id response: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v3, (uint64_t)v3, "%{public}@: Failed to start, missing source device id or delegate", v4);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_0_12(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_9(&dword_18DDBE000, "%{public}@: Received fetch source device id request: %@", v4, v5);

  OUTLINED_FUNCTION_33();
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch source device id request", v5);

  OUTLINED_FUNCTION_33();
}

- (void)transformResponseError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "%{public}@: Rapport request timed out", v5);

  OUTLINED_FUNCTION_1();
}

- (void)myDeviceID
{
  void *v2;
  void *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint8_t v9[22];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_29_1();
  v10 = v7;
  v11 = v8;
  _os_log_fault_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_FAULT, "%{public}@: Illegal state, transport %{public}@ running with no device ID, turning off transport %{public}@", v9, 0x20u);

}

- (void)handleFetchSourceDeviceIDWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_7(&dword_18DDBE000, v3, v4, "%{public}@: Handling fetch source device id response", v5);

  OUTLINED_FUNCTION_33();
}

- (void)sendRequestID:(int)a3 request:(int)a4 peer:(int)a5 highPriority:(int)a6 options:(int)a7 responseHandler:(int)a8 .cold.3(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;

  OUTLINED_FUNCTION_41();
  a27 = v32;
  a28 = v33;
  OUTLINED_FUNCTION_23_2();
  objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "description");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  v34 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_15_3(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_22_3(), "model");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v31, "model");
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_21_3();
    objc_msgSend(v36, "stringWithFormat:", CFSTR(" (%@)"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  OUTLINED_FUNCTION_1_10();
  _os_log_fault_impl(&dword_18DDBE000, v29, OS_LOG_TYPE_FAULT, "%{public}@: Device disappeared for %{public}@peer %{public}@%{public}@", &buf, 0x2Au);
  if (v35)
  {

  }
  OUTLINED_FUNCTION_19();
}

- (void)handleAvailabilityFailureWithPeer:completion:.cold.1()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v0, v3, "%{public}@: Peer: %@", v4);

  OUTLINED_FUNCTION_7();
}

@end
