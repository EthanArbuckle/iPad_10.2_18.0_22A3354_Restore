@implementation _DKSyncPeerStatusTracker

+ (_DKSyncPeerStatusTracker)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___DKSyncPeerStatusTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_initialized_7 != -1)
    dispatch_once(&sharedInstance_initialized_7, block);
  return (_DKSyncPeerStatusTracker *)(id)sharedInstance_sharedInstance_4;
}

+ (_DKSyncPeerStatusTracker)peerStatusTrackerWithContext:(id)a3
{
  void *v3;
  void *v4;

  +[_DKSyncContextObjectFactory objectFactoryForClass:context:](_DKSyncContextObjectFactory, "objectFactoryForClass:context:", a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_DKSyncPeerStatusTracker *)v4;
}

+ (id)syncPeerTransportsStrings
{
  objc_opt_self();
  if (syncPeerTransportsStrings_initialized != -1)
    dispatch_once(&syncPeerTransportsStrings_initialized, &__block_literal_global_83);
  return (id)syncPeerTransportsStrings_strings;
}

- (_DKSyncPeerStatusTracker)initWithContext:(id)a3
{
  id v4;
  _DKSyncPeerStatusTracker *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *peerInfos;
  uint64_t v9;
  NSMutableArray *observers;
  uint64_t v11;
  NSMutableDictionary *lastSuccessfulActivityDates;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DKSyncPeerStatusTracker;
  v5 = -[_DKSyncContextObject initWithContext:](&v14, sel_initWithContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_storage, v6);

    v7 = objc_opt_new();
    peerInfos = v5->_peerInfos;
    v5->_peerInfos = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    observers = v5->_observers;
    v5->_observers = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    lastSuccessfulActivityDates = v5->_lastSuccessfulActivityDates;
    v5->_lastSuccessfulActivityDates = (NSMutableDictionary *)v11;

    -[_DKSyncPeerStatusTracker _loadPeers](v5);
  }

  return v5;
}

- (void)_loadPeers
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  OUTLINED_FUNCTION_18_3(a1, a2);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138543362;
  *v3 = v5;
  _os_log_fault_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_FAULT, "%{public}@: Loading peers before storage is available", v4, 0xCu);

  OUTLINED_FUNCTION_17_2();
}

- (void)setSourceDeviceID:(id)a3 version:(id)a4 peer:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableDictionary *peerInfos;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  __CFString *v46;
  const __CFString *v47;
  void *v48;
  int v49;
  const __CFString *v50;
  __CFString *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  __CFString *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (!v8)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_DKSyncPeerStatusTracker setSourceDeviceID:version:peer:].cold.1((uint64_t)self, v18);
    goto LABEL_56;
  }
  -[NSObject sourceDeviceID](v10, "sourceDeviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "isEqualToString:", v12);

  -[NSObject version](v10, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v9)
  {
    v16 = objc_msgSend(v9, "isEqualToString:", v14);

    if ((v13 & v16 & 1) == 0)
    {
      v17 = v10;
      if ((v16 & 1) == 0)
        -[NSObject setVersion:](v17, "setVersion:", v9);
LABEL_13:
      v18 = v10;
      if ((v13 & 1) != 0)
        goto LABEL_39;
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)objc_opt_class(), "description");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = &stru_1E26E9728;
        if (-[NSObject me](v10, "me"))
          v52 = CFSTR("pseudo ");
        else
          v52 = &stru_1E26E9728;
        -[NSObject identifier](v10, "identifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject model](v10, "model");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          v55 = (void *)MEMORY[0x1E0CB3940];
          -[NSObject model](v10, "model");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR(" (%@)"), v65);
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138544642;
        v71 = v68;
        v72 = 2114;
        v73 = v52;
        v74 = 2114;
        v75 = v53;
        v76 = 2114;
        v77 = v51;
        v78 = 2114;
        v79 = v8;
        v80 = 2114;
        v81 = (uint64_t)v9;
        _os_log_debug_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}@: Setting %{public}@peer %{public}@%{public}@ source device id to %{public}@ version %{public}@", buf, 0x3Eu);
        if (v54)
        {

        }
      }

      -[_DKSyncPeerStatusTracker existingPeerWithSourceDeviceID:](self, "existingPeerWithSourceDeviceID:", v8);
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject setSourceDeviceID:](v10, "setSourceDeviceID:", v8);
      -[_DKSyncPeerStatusTracker storage](self, "storage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deviceUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v25, "isEqualToString:", v8))
      {
        -[NSObject setMe:](v10, "setMe:", 1);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[_DKSyncPeerStatusTracker setSourceDeviceID:version:peer:].cold.3(self, v10, v26);

      }
      v18 = v10;
      if (!v22 || (v18 = v10, v22 == v10))
      {
LABEL_38:

LABEL_39:
        -[_DKSyncPeerStatusTracker storage](self, "storage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        objc_msgSend(v41, "saveSyncPeer:error:", v18, &v69);
        v42 = v69;

        if (v18 == v10)
        {
          if (!v42)
          {
LABEL_55:
            -[_DKSyncPeerStatusTracker postCloudDeviceCountChangedNotification]((uint64_t)self);

LABEL_56:
            goto LABEL_57;
          }
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = -[NSObject me](v10, "me");
            v46 = &stru_1E26E9728;
            v50 = CFSTR("pseudo ");
            if (!v49)
              v50 = &stru_1E26E9728;
            v64 = v50;
            -[NSObject identifier](v10, "identifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject model](v10, "model");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (v48)
            {
              v60 = (void *)MEMORY[0x1E0CB3940];
              -[NSObject model](v10, "model");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "stringWithFormat:", CFSTR(" (%@)"), v62);
              v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v42, "domain");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v42, "code");
            *(_DWORD *)buf = 138544898;
            v71 = v67;
            v72 = 2114;
            v73 = v64;
            v74 = 2114;
            v75 = v66;
            v76 = 2114;
            v77 = v46;
            v78 = 2114;
            v79 = v57;
            v80 = 2048;
            v81 = v61;
            v82 = 2112;
            v83 = v42;
            v59 = "%{public}@: Failed to save %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)";
            goto LABEL_70;
          }
        }
        else
        {
          +[_CDLogging syncChannel](_CDLogging, "syncChannel");
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (!v42)
          {
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              -[_DKSyncPeerStatusTracker setSourceDeviceID:version:peer:].cold.2(self, v18, v44);
            goto LABEL_54;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend((id)objc_opt_class(), "description");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = -[NSObject me](v18, "me");
            v46 = &stru_1E26E9728;
            v47 = CFSTR("pseudo ");
            if (!v45)
              v47 = &stru_1E26E9728;
            v63 = v47;
            -[NSObject identifier](v18, "identifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject model](v18, "model");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (v48)
            {
              v56 = (void *)MEMORY[0x1E0CB3940];
              -[NSObject model](v18, "model");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "stringWithFormat:", CFSTR(" (%@)"), v62);
              v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v42, "domain");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v42, "code");
            *(_DWORD *)buf = 138544898;
            v71 = v67;
            v72 = 2114;
            v73 = v63;
            v74 = 2114;
            v75 = v66;
            v76 = 2114;
            v77 = v46;
            v78 = 2114;
            v79 = v57;
            v80 = 2048;
            v81 = v58;
            v82 = 2112;
            v83 = v42;
            v59 = "%{public}@: Failed to save de-duplicated %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)";
LABEL_70:
            _os_log_error_impl(&dword_18DDBE000, v44, OS_LOG_TYPE_ERROR, v59, buf, 0x48u);

            if (v48)
            {

            }
          }
        }
LABEL_54:

        goto LABEL_55;
      }
      -[NSObject idsDeviceIdentifier](v22, "idsDeviceIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        -[NSObject idsDeviceIdentifier](v10, "idsDeviceIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
          goto LABEL_25;
        -[NSObject idsDeviceIdentifier](v10, "idsDeviceIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setIdsDeviceIdentifier:](v22, "setIdsDeviceIdentifier:", v27);
      }

LABEL_25:
      -[NSObject sourceDeviceID](v22, "sourceDeviceID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        -[NSObject sourceDeviceID](v10, "sourceDeviceID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
          goto LABEL_29;
        -[NSObject sourceDeviceID](v10, "sourceDeviceID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setSourceDeviceID:](v22, "setSourceDeviceID:", v29);
      }

LABEL_29:
      -[NSObject version](v22, "version");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        -[NSObject version](v10, "version");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
          goto LABEL_33;
        -[NSObject version](v10, "version");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setVersion:](v22, "setVersion:", v31);
      }

LABEL_33:
      -[NSObject zoneName](v22, "zoneName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        -[NSObject zoneName](v10, "zoneName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
LABEL_37:
          -[_DKSyncPeerStatusTracker addActiveTransports:toPeer:](self, "addActiveTransports:toPeer:", -[_DKSyncPeerStatusTracker activeTransportsForPeer:](self, "activeTransportsForPeer:", v10), v22);
          -[NSObject idsDeviceIdentifier](v22, "idsDeviceIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setIdsDeviceIdentifier:](v10, "setIdsDeviceIdentifier:", v35);

          -[NSObject sourceDeviceID](v22, "sourceDeviceID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setSourceDeviceID:](v10, "setSourceDeviceID:", v36);

          -[NSObject version](v22, "version");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setVersion:](v10, "setVersion:", v37);

          -[NSObject zoneName](v22, "zoneName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setZoneName:](v10, "setZoneName:", v38);

          -[_DKSyncPeerStatusTracker addActiveTransports:toPeer:](self, "addActiveTransports:toPeer:", -[_DKSyncPeerStatusTracker activeTransportsForPeer:](self, "activeTransportsForPeer:", v22), v10);
          peerInfos = self->_peerInfos;
          -[NSObject uuid](v10, "uuid");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](peerInfos, "setObject:forKeyedSubscript:", 0, v40);

          v18 = v22;
          goto LABEL_38;
        }
        -[NSObject zoneName](v10, "zoneName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setZoneName:](v22, "setZoneName:", v33);
      }

      goto LABEL_37;
    }
  }
  else
  {

    if (v15)
      v19 = 0;
    else
      v19 = v13;
    if ((v19 & 1) == 0)
    {
      v20 = v10;
      goto LABEL_13;
    }
  }
LABEL_57:

}

- (void)postCloudDeviceCountChangedNotification
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 16), "count");
    +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:userInfo:sender:", CFSTR("_DKCloudDeviceCountChangedNotification"), v5, a1);

  }
}

- (void)registerNewPeer:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUuid:", v4);
    v5 = (void *)objc_opt_new();
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v5, v4);
    -[_DKSyncWindow setStartDate:]((uint64_t)v5, v3);
    objc_msgSend(a1[2], "setObject:forKeyedSubscript:", v5, v4);
    objc_msgSend(v3, "sourceDeviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1, "storage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "sourceDeviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v9, "isEqualToString:", v10);

      if ((_DWORD)v8)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[_DKSyncPeerStatusTracker registerNewPeer:].cold.1(a1, v3, v11);

        objc_msgSend(v3, "setMe:", 1);
      }
      objc_msgSend(a1, "storage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v12, "saveSyncPeer:error:", v3, &v13);

    }
    -[_DKSyncPeerStatusTracker postCloudDeviceCountChangedNotification]((uint64_t)a1);

  }
}

- (id)peerWithCompanionLinkDevice:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "idsDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKSyncPeerStatusTracker peerWithIDSDeviceIdentifier:](self, "peerWithIDSDeviceIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)peerWithIDSDeviceIdentifier:(id)a3
{
  id v4;
  _DKSyncPeerStatusTracker *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _DKSyncPeer *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5->_peerInfos;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = *(void **)(v9 + 16);
        else
          v11 = 0;
        v12 = v11;
        -[_DKSyncPeer idsDeviceIdentifier](v12, "idsDeviceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {

          if (v12)
            goto LABEL_16;
          goto LABEL_15;
        }

        ++v8;
      }
      while (v6 != v8);
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v6 = v15;
      if (v15)
        continue;
      break;
    }
  }

LABEL_15:
  v12 = -[_DKSyncPeer initWithIDSDeviceIdentifier:]([_DKSyncPeer alloc], "initWithIDSDeviceIdentifier:", v4);
  -[_DKSyncPeerStatusTracker registerNewPeer:]((id *)&v5->super.super.isa, v12);
LABEL_16:
  objc_sync_exit(v5);

  return v12;
}

- (id)peerWithZoneName:(id)a3 sourceDeviceID:(id)a4
{
  id v6;
  id v7;
  _DKSyncPeerStatusTracker *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[_DKSyncPeerStatusTracker existingPeerWithSourceDeviceID:](v8, "existingPeerWithSourceDeviceID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (v6)
    {
      objc_msgSend(v9, "zoneName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(v10, "setZoneName:", v6);
        if (v7)
        {
          -[_DKSyncPeerStatusTracker storage](v8, "storage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
          objc_msgSend(v12, "saveSyncPeer:error:", v10, &v14);

        }
      }
    }
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setZoneName:", v6);
    objc_msgSend(v10, "setSourceDeviceID:", v7);
    -[_DKSyncPeerStatusTracker registerNewPeer:]((id *)&v8->super.super.isa, v10);
  }
  objc_sync_exit(v8);

  return v10;
}

- (id)existingPeerWithSourceDeviceID:(id)a3
{
  _DKSyncPeerStatusTracker *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSMutableDictionary *obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[32];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4->_peerInfos;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](v4->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          v10 = *(void **)(v8 + 16);
        else
          v10 = 0;
        v11 = v10;
        objc_msgSend(v11, "sourceDeviceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "sourceDeviceID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v20, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {

            if (v11)
              goto LABEL_19;
            goto LABEL_16;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v5 = v15;
      if (v15)
        continue;
      break;
    }
  }

LABEL_16:
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKSyncPeerStatusTracker existingPeerWithSourceDeviceID:].cold.1(v17, (uint64_t)v20, (uint64_t)v25);
  }

  v11 = 0;
LABEL_19:
  objc_sync_exit(v4);

  return v11;
}

- (id)existingPeerWithIDSDeviceIdentifier:(id)a3
{
  _DKSyncPeerStatusTracker *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSMutableDictionary *obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[32];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4->_peerInfos;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](v4->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          v10 = *(void **)(v8 + 16);
        else
          v10 = 0;
        v11 = v10;
        objc_msgSend(v11, "idsDeviceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "idsDeviceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v20, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {

            if (v11)
              goto LABEL_19;
            goto LABEL_16;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v5 = v15;
      if (v15)
        continue;
      break;
    }
  }

LABEL_16:
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKSyncPeerStatusTracker existingPeerWithIDSDeviceIdentifier:].cold.1(v17, (uint64_t)v20, (uint64_t)v25);
  }

  v11 = 0;
LABEL_19:
  objc_sync_exit(v4);

  return v11;
}

- (id)pseudoPeerForSyncTransportCloudUp
{
  _DKSyncPeer **p_pseudoPeer;
  _DKSyncPeer *v4;
  _DKSyncPeerStatusTracker *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  _DKSyncPeer *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_pseudoPeer = &self->_pseudoPeer;
  v4 = self->_pseudoPeer;
  if (!v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v5->_peerInfos;
    v4 = (_DKSyncPeer *)-[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v7 = *(_QWORD *)v18;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v6);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8), (_QWORD)v17);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (_QWORD *)v9;
          if (v9)
            v11 = *(void **)(v9 + 16);
          else
            v11 = 0;
          v12 = v11;
          v13 = objc_msgSend(v12, "me");

          if (v13)
          {
            if (v10)
              v15 = (void *)v10[2];
            else
              v15 = 0;
            v4 = v15;

            goto LABEL_18;
          }

          v8 = (_DKSyncPeer *)((char *)v8 + 1);
        }
        while (v4 != v8);
        v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v4 = (_DKSyncPeer *)v14;
        if (v14)
          continue;
        break;
      }
    }
LABEL_18:

    objc_storeStrong((id *)p_pseudoPeer, v4);
    objc_sync_exit(v5);

  }
  return v4;
}

- (void)removePeer:(id)a3
{
  _DKSyncPeer *v4;
  void *v5;
  NSMutableDictionary *peerInfos;
  void *v7;
  _DKSyncPeer *v8;

  v4 = (_DKSyncPeer *)a3;
  v8 = v4;
  if (self->_pseudoPeer == v4)
  {
    self->_pseudoPeer = 0;

  }
  -[_DKSyncPeerStatusTracker storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSyncPeer:", v8);

  peerInfos = self->_peerInfos;
  -[_DKSyncPeer uuid](v8, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](peerInfos, "setObject:forKeyedSubscript:", 0, v7);

  -[_DKSyncPeerStatusTracker postCloudDeviceCountChangedNotification]((uint64_t)self);
}

- (id)allPeers
{
  void *v3;
  _DKSyncPeerStatusTracker *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4->_peerInfos;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](v4->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8), (_QWORD)v16);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = *(void **)(v9 + 16);
        else
          v11 = 0;
        v12 = v11;
        objc_msgSend(v3, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v6 = v13;
    }
    while (v13);
  }

  objc_sync_exit(v4);
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (id)peersWithAnyActiveTransports
{
  void *v3;
  _DKSyncPeerStatusTracker *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4->_peerInfos;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](v4->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8), (_QWORD)v14);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9 && *(_QWORD *)(v9 + 24))
        {
          v11 = *(id *)(v9 + 16);
          objc_msgSend(v3, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)peersWithActiveTransports:(int64_t)a3
{
  void *v5;
  _DKSyncPeerStatusTracker *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = self;
  objc_sync_enter(v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6->_peerInfos;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary objectForKeyedSubscript:](v6->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10), (_QWORD)v16);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11 && (*(_QWORD *)(v11 + 24) & a3) != 0)
        {
          v13 = *(id *)(v11 + 16);
          objc_msgSend(v5, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

- (unint64_t)foreignPeersCount
{
  _DKSyncPeerStatusTracker *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;
  BOOL v17;
  NSDate *firstForeignPeersCountDate;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDate *v24;
  uint64_t v25;
  NSDate *v26;
  double v27;
  unsigned int v28;
  uint64_t v29;
  NSMutableDictionary *obj;
  unint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[_DKSyncPeerStatusTracker pseudoPeerForSyncTransportCloudUp](self, "pseudoPeerForSyncTransportCloudUp");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v3 = self;
  objc_sync_enter(v3);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3->_peerInfos;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v4)
  {
    v32 = 0;
    v5 = *(_QWORD *)v35;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](v3->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v6));
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          v9 = *(void **)(v7 + 16);
        else
          v9 = 0;
        v10 = v9;
        v11 = v10;
        if (v10 != v33)
        {
          objc_msgSend(v10, "sourceDeviceID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (!v13)
          {
            objc_msgSend(v11, "lastSeenDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "timeIntervalSinceNow");
              v17 = v16 < -2678400.0;
            }
            else
            {
              firstForeignPeersCountDate = v3->_firstForeignPeersCountDate;
              if (!firstForeignPeersCountDate)
              {
                -[_DKSyncPeerStatusTracker storage](v3, "storage");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (objc_class *)objc_opt_class();
                NSStringFromClass(v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "keyValueStoreForDomain:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "dateForKey:", CFSTR("FirstForeignPeersCountDate"));
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = v3->_firstForeignPeersCountDate;
                v3->_firstForeignPeersCountDate = (NSDate *)v23;

                if (!v3->_firstForeignPeersCountDate)
                {
                  objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  v25 = objc_claimAutoreleasedReturnValue();
                  v26 = v3->_firstForeignPeersCountDate;
                  v3->_firstForeignPeersCountDate = (NSDate *)v25;

                  objc_msgSend(v22, "setDate:forKey:", v3->_firstForeignPeersCountDate, CFSTR("FirstForeignPeersCountDate"));
                }

                firstForeignPeersCountDate = v3->_firstForeignPeersCountDate;
              }
              -[NSDate timeIntervalSinceNow](firstForeignPeersCountDate, "timeIntervalSinceNow");
              v17 = v27 < -43200.0;
            }
            v28 = !v17;

            v32 += v28;
          }
        }

        ++v6;
      }
      while (v4 != v6);
      v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v4 = v29;
    }
    while (v29);
  }
  else
  {
    v32 = 0;
  }

  objc_sync_exit(v3);
  return v32;
}

- (BOOL)isSingleDevice
{
  _DKSyncPeerStatusTracker *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;
  char v7;

  v2 = self;
  objc_sync_enter(v2);
  if (-[NSMutableDictionary count](v2->_peerInfos, "count"))
  {
    if (-[NSMutableDictionary count](v2->_peerInfos, "count") == 1)
    {
      -[NSMutableDictionary allValues](v2->_peerInfos, "allValues");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "firstObject");
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      if (v4)
        v5 = (void *)v4[2];
      else
        v5 = 0;
      v6 = v5;
      v7 = objc_msgSend(v6, "me");

    }
    else
    {
      v7 = -[_DKSyncPeerStatusTracker foreignPeersCount](v2, "foreignPeersCount") == 0;
    }
  }
  else
  {
    v7 = 1;
  }
  objc_sync_exit(v2);

  return v7;
}

- (_QWORD)_peerInfoForPeer:(void *)a1
{
  id v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  id obj;
  id *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    obj = v4[2];
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v22;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(obj);
          objc_msgSend(v20[2], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7));
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (_QWORD *)v8;
          if (v8)
          {
            v10 = *(id *)(v8 + 16);
            if (v10 == v3)
              goto LABEL_18;
            v11 = v10;
            v12 = (void *)v9[2];
          }
          else
          {
            if (!v3)
            {
LABEL_18:

              goto LABEL_19;
            }
            v11 = 0;
            v12 = 0;
          }
          v13 = v12;
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
            goto LABEL_19;

          ++v7;
        }
        while (v5 != v7);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v5 = v17;
        v9 = 0;
      }
      while (v17);
    }
    else
    {
      v9 = 0;
    }
LABEL_19:

    objc_sync_exit(v20);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)activeTransportsForPeer:(id)a3
{
  id v4;
  _DKSyncPeerStatusTracker *v5;
  _QWORD *v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[_DKSyncPeerStatusTracker _peerInfoForPeer:](v5, v4);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v6[3];
  else
    v7 = 0;

  objc_sync_exit(v5);
  return v7;
}

- (void)_modifyActiveTransportInPeer:(void *)a3 withNewTransportsBlock:
{
  id v5;
  uint64_t (**v6)(id, _QWORD);
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    v8 = a1;
    objc_sync_enter(v8);
    -[_DKSyncPeerStatusTracker _peerInfoForPeer:](v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (_QWORD *)v9;
    if (v9)
    {
      v11 = *(_QWORD *)(v9 + 24);
      v12 = v6[2](v6, v11);
      if (v11 == v12)
      {
        v13 = 0;
      }
      else
      {
        +[_DKSyncPeerStatusTracker stringForTransports:](_DKSyncPeerStatusTracker, "stringForTransports:", v10[3]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10[3] = v12;
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DKSyncPeerInfo transportsString](v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v29 = v21;
          v30 = 2112;
          v31 = v14;
          v32 = 2112;
          v33 = v22;
          v34 = 2112;
          v35 = v5;
          _os_log_debug_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Changing transports from %@ to %@ for peer: %@", buf, 0x2Au);

        }
        -[_DKSyncPeerStatusTracker _observerBlocks](v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v13 = 0;
    }

    objc_sync_exit(v8);
    if (objc_msgSend(v13, "count"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[_DKSyncPeerStatusTracker _modifyActiveTransportInPeer:withNewTransportsBlock:].cold.1((uint64_t)v8, v13, v16);

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = v13;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v17);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v18);
      }

    }
  }

}

- (id)_observerBlocks
{
  void *v2;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)objc_opt_new();
  v3 = a1;
  objc_sync_enter(v3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3[4];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if (v8)
          v8 = (_QWORD *)v8[1];
        v9 = v8;
        v10 = (void *)MEMORY[0x193FEEAF4](v9);
        objc_msgSend(v2, "addObject:", v10, (_QWORD)v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
  return v2;
}

- (void)addActiveTransports:(int64_t)a3 toPeer:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55___DKSyncPeerStatusTracker_addActiveTransports_toPeer___block_invoke;
  v4[3] = &__block_descriptor_40_e8_q16__0q8l;
  v4[4] = a3;
  -[_DKSyncPeerStatusTracker _modifyActiveTransportInPeer:withNewTransportsBlock:](self, a4, v4);
}

- (void)removeActiveTransports:(int64_t)a3 fromPeer:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60___DKSyncPeerStatusTracker_removeActiveTransports_fromPeer___block_invoke;
  v4[3] = &__block_descriptor_40_e8_q16__0q8l;
  v4[4] = a3;
  -[_DKSyncPeerStatusTracker _modifyActiveTransportInPeer:withNewTransportsBlock:](self, a4, v4);
}

- (void)setLastSeenDate:(id)a3 onPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  void *v33;
  id v34;
  _BYTE buf[24];
  __CFString *v36;
  _BYTE v37[32];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "me") & 1) == 0)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate dk_localtimeString](v6);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastSeenDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "timeIntervalSinceReferenceDate");
        v20 = v19;
        objc_msgSend(v7, "lastSeenDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "timeIntervalSinceReferenceDate");
        objc_msgSend(v18, "numberWithInt:", (int)(v20 - v21));
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = CFSTR("N/A");
      }
      v22 = &stru_1E26E9728;
      if (objc_msgSend(v7, "me"))
        v23 = CFSTR("pseudo ");
      else
        v23 = &stru_1E26E9728;
      objc_msgSend(v7, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "model");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "model");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (uint64_t)v29;
        objc_msgSend(v26, "stringWithFormat:", CFSTR(" (%@)"));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2114;
      v36 = v31;
      *(_WORD *)v37 = 2114;
      *(_QWORD *)&v37[2] = v23;
      *(_WORD *)&v37[10] = 2114;
      *(_QWORD *)&v37[12] = v24;
      *(_WORD *)&v37[20] = 2114;
      *(_QWORD *)&v37[22] = v22;
      _os_log_debug_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Updating last seen date to %{public}@ (delta %{public}@) on %{public}@peer %{public}@%{public}@", buf, 0x3Eu);
      if (v25)
      {

      }
      if (v17)
      {

      }
    }

    objc_msgSend(v7, "setLastSeenDate:", v6);
    -[_DKSyncPeerStatusTracker storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v9, "saveSyncPeer:error:", v7, &v34);
    v10 = v34;

    if (v10)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DKSyncPeerStatusTracker setLastSeenDate:onPeer:].cold.1((uint64_t)self, (uint64_t)v7, (uint64_t)v11, v12, v13, v14, v15, v16, v27, v28, (uint8_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16],
          (uint64_t)v36,
          *(uint64_t *)v37,
          *(uint64_t *)&v37[8],
          *(uint64_t *)&v37[16],
          *(uint64_t *)&v37[24],
          v38,
          v39,
          v40,
          v41);

    }
  }

}

- (id)lastSuccessfulActivityDateOnTransport:(int64_t)a3 forPeer:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_lastSuccessfulActivityDates, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setLastSuccessfulActivityDate:(id)a3 onTransport:(int64_t)a4 forPeer:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(a5, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastSuccessfulActivityDates, "setObject:forKeyedSubscript:", v9, v12);
}

- (id)addStatusChangeObserverWithBlock:(id)a3
{
  id v4;
  _DKSyncPeerStatusTracker *v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_new();
  v8 = v6;
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v7, v4, 8);
  -[NSMutableArray addObject:](v5->_observers, "addObject:", v8);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v10 = objc_claimAutoreleasedReturnValue();
    -[_DKSyncPeerStatusTracker addStatusChangeObserverWithBlock:].cold.1(v10, (uint64_t)v4);
  }

  objc_sync_exit(v5);
  return v8;
}

- (void)removeStatusChangeObserver:(id)a3
{
  _DKSyncPeerStatusTracker *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (_DKKnowledgeStorage)storage
{
  _DKKnowledgeStorage **p_storage;
  id WeakRetained;
  void *v4;

  p_storage = &self->_storage;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storage);

  if (!WeakRetained)
  {
    +[_DKSync2Coordinator storage]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_storage, v4);

  }
  return (_DKKnowledgeStorage *)objc_loadWeakRetained((id *)p_storage);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: peerInfos=%@>"), v5, self, self->_peerInfos);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringForTransports:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[_DKSyncPeerStatusTracker syncPeerTransportsStrings]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)debugLogPeers
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  NSObject *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  NSObject *v33;
  void *v34;
  int v35;
  const __CFString *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  NSObject *v53;
  void *v54;
  int v55;
  const __CFString *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  __CFString *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  __CFString *v85;
  __CFString *v86;
  __CFString *v87;
  void *v88;
  id v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  id v100;
  id v101;
  id obj;
  id obja;
  _DKSyncPeerStatusTracker *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t buf[4];
  id v121;
  __int16 v122;
  void *v123;
  __int16 v124;
  __CFString *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  __CFString *v129;
  __int16 v130;
  void *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v104 = self;
  objc_sync_enter(v104);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableDictionary count](v104->_peerInfos, "count"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v121 = v68;
    v122 = 2112;
    v123 = v69;
    _os_log_debug_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Tracking %@ peers", buf, 0x16u);

  }
  -[_DKSyncPeerStatusTracker pseudoPeerForSyncTransportCloudUp](v104, "pseudoPeerForSyncTransportCloudUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v104->_peerInfos, "objectForKeyedSubscript:", v5);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      obja = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v78, "me"))
        v71 = CFSTR("pseudo ");
      else
        v71 = &stru_1E26E9728;
      objc_msgSend(v78, "identifier");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "model");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73)
      {
        v75 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v78, "model");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "stringWithFormat:", CFSTR(" (%@)"), v2);
        v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v74 = &stru_1E26E9728;
      }
      objc_msgSend(v77, "debugDescription");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v121 = obja;
      v122 = 2112;
      v123 = v70;
      v124 = 2114;
      v125 = (__CFString *)v71;
      v126 = 2114;
      v127 = v72;
      v128 = 2114;
      v129 = v74;
      v130 = 2112;
      v131 = v76;
      _os_log_debug_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: %@: %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
      if (v73)
      {

      }
      v99 = 1;
    }
    else
    {
      v99 = 0;
    }

  }
  else
  {
    v77 = 0;
    v99 = 0;
  }
  v7 = (void *)objc_opt_new();
  v97 = (void *)objc_opt_new();
  -[NSMutableDictionary keysSortedByValueUsingComparator:](v104->_peerInfos, "keysSortedByValueUsingComparator:", &__block_literal_global_97);
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v114;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v114 != v9)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](v104->_peerInfos, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v10));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (_QWORD *)v11;
        if (v11)
          v13 = *(void **)(v11 + 16);
        else
          v13 = 0;
        v14 = v13;
        if ((objc_msgSend(v14, "me") & 1) == 0)
        {
          objc_msgSend(v14, "sourceDeviceID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "lastSeenDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16 && (objc_msgSend(v16, "timeIntervalSinceNow"), v18 >= -2678400.0))
            {
              +[_CDLogging syncChannel](_CDLogging, "syncChannel");
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend((id)objc_opt_class(), "description");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                ++v99;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                if (v12)
                  v20 = (void *)v12[2];
                else
                  v20 = 0;
                v86 = v20;
                v21 = -[__CFString me](v86, "me");
                v22 = &stru_1E26E9728;
                if (v21)
                  v22 = CFSTR("pseudo ");
                v85 = (__CFString *)v22;
                if (v12)
                  v23 = (void *)v12[2];
                else
                  v23 = 0;
                v83 = v23;
                objc_msgSend(v83, "identifier");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                if (v12)
                  v24 = (void *)v12[2];
                else
                  v24 = 0;
                v82 = v24;
                objc_msgSend(v82, "model");
                v100 = (id)objc_claimAutoreleasedReturnValue();
                v87 = &stru_1E26E9728;
                if (v100)
                {
                  if (v12)
                    v25 = (void *)v12[2];
                  else
                    v25 = 0;
                  v26 = (void *)MEMORY[0x1E0CB3940];
                  v79 = v25;
                  objc_msgSend(v79, "model");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "stringWithFormat:", CFSTR(" (%@)"), v81);
                  v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v87 = v80;
                }
                objc_msgSend(v12, "debugDescription");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v121 = v94;
                v122 = 2112;
                v123 = v91;
                v124 = 2114;
                v125 = v85;
                v126 = 2114;
                v127 = v88;
                v128 = 2114;
                v129 = v87;
                v130 = 2112;
                v131 = v27;
                _os_log_debug_impl(&dword_18DDBE000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: %@: %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
                if (v100)
                {

                }
              }

            }
            else
            {
              objc_msgSend(v7, "addObject:", v12);
            }

          }
          else
          {
            objc_msgSend(v97, "addObject:", v12);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v119, 16);
      v8 = v28;
    }
    while (v28);
  }

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v101 = v7;
  v29 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v110;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v110 != v30)
          objc_enumerationMutation(v101);
        v32 = *(_QWORD **)(*((_QWORD *)&v109 + 1) + 8 * v31);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          ++v99;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
            v34 = (void *)v32[2];
          else
            v34 = 0;
          v89 = v34;
          v35 = objc_msgSend(v89, "me");
          v36 = &stru_1E26E9728;
          if (v35)
            v36 = CFSTR("pseudo ");
          v87 = (__CFString *)v36;
          if (v32)
            v37 = (void *)v32[2];
          else
            v37 = 0;
          v38 = v37;
          objc_msgSend(v38, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
            v40 = (void *)v32[2];
          else
            v40 = 0;
          v41 = v40;
          objc_msgSend(v41, "model");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = &stru_1E26E9728;
          if (v42)
          {
            if (v32)
              v44 = (void *)v32[2];
            else
              v44 = 0;
            v45 = (void *)MEMORY[0x1E0CB3940];
            v83 = v44;
            objc_msgSend(v83, "model");
            v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringWithFormat:", CFSTR(" (%@)"), v86);
            v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v43 = v85;
          }
          objc_msgSend(v32, "debugDescription");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v121 = v95;
          v122 = 2112;
          v123 = v92;
          v124 = 2114;
          v125 = v87;
          v126 = 2114;
          v127 = v39;
          v128 = 2114;
          v129 = (__CFString *)v43;
          v130 = 2112;
          v131 = v46;
          _os_log_debug_impl(&dword_18DDBE000, v33, OS_LOG_TYPE_DEBUG, "%{public}@: %@: obsolete %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
          if (v42)
          {

          }
        }

        ++v31;
      }
      while (v29 != v31);
      v47 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
      v29 = v47;
    }
    while (v47);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v48 = v97;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v106;
    v84 = v48;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v106 != v50)
          objc_enumerationMutation(v48);
        v52 = *(_QWORD **)(*((_QWORD *)&v105 + 1) + 8 * v51);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend((id)objc_opt_class(), "description");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          ++v99;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
            v54 = (void *)v52[2];
          else
            v54 = 0;
          v93 = v54;
          v55 = objc_msgSend(v93, "me");
          v56 = &stru_1E26E9728;
          if (v55)
            v56 = CFSTR("pseudo ");
          v90 = v56;
          if (v52)
            v57 = (void *)v52[2];
          else
            v57 = 0;
          v58 = v57;
          objc_msgSend(v58, "identifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
            v60 = (void *)v52[2];
          else
            v60 = 0;
          v61 = v60;
          objc_msgSend(v61, "model");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = &stru_1E26E9728;
          if (v62)
          {
            if (v52)
              v64 = (void *)v52[2];
            else
              v64 = 0;
            v65 = (void *)MEMORY[0x1E0CB3940];
            v85 = v64;
            -[__CFString model](v85, "model");
            v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringWithFormat:", CFSTR(" (%@)"), v87);
            v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v63 = v86;
          }
          objc_msgSend(v52, "debugDescription");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v121 = v98;
          v122 = 2112;
          v123 = v96;
          v124 = 2114;
          v125 = (__CFString *)v90;
          v126 = 2114;
          v127 = v59;
          v128 = 2114;
          v129 = (__CFString *)v63;
          v130 = 2112;
          v131 = v66;
          _os_log_debug_impl(&dword_18DDBE000, v53, OS_LOG_TYPE_DEBUG, "%{public}@: %@: incomplete %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
          v48 = v84;
          if (v62)
          {

          }
        }

        ++v51;
      }
      while (v49 != v51);
      v67 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
      v49 = v67;
    }
    while (v67);
  }

  objc_sync_exit(v104);
}

- (void)setStorage:(id)a3
{
  objc_storeWeak((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_firstForeignPeersCountDate, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulActivityDates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pseudoPeer, 0);
  objc_storeStrong((id *)&self->_peerInfos, 0);
}

- (void)setSourceDeviceID:(uint64_t)a1 version:(NSObject *)a2 peer:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Invalid nil source device id", (uint8_t *)&v4, 0xCu);

}

- (void)existingPeerWithSourceDeviceID:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_0_12((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v6, v4, "%{public}@: No existing peer for source device id %@", v5);

}

- (void)existingPeerWithIDSDeviceIdentifier:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_0_12((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v6, v4, "%{public}@: No existing peer for device %@", v5);

}

- (void)_modifyActiveTransportInPeer:(NSObject *)a3 withNewTransportsBlock:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, a3, v7, "%{public}@: Calling %@ status change observers", (uint8_t *)&v8);

}

- (void)setLastSeenDate:(uint64_t)a3 onPeer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
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
  uint64_t v37;

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
  OUTLINED_FUNCTION_12_6(&dword_18DDBE000, v29, v37, "%{public}@: Unable to update last seen date on %{public}@peer %{public}@%{public}@", &a11);
  if (v35)
  {

  }
  OUTLINED_FUNCTION_19();
}

- (void)addStatusChangeObserverWithBlock:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v5 = OUTLINED_FUNCTION_18_3(a1, a2);
  v6 = (void *)MEMORY[0x193FEEAF4](v5);
  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(_QWORD *)(v3 + 14) = v6;
  _os_log_debug_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: Added status change observer: %@", (uint8_t *)v3, 0x16u);

  OUTLINED_FUNCTION_17_2();
}

@end
