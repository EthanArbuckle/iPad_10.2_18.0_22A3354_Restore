@implementation MSPReceiverETAController

- (MSPReceiverETAController)initWithRelay:(id)a3
{
  id v4;
  MSPReceiverETAController *v5;
  MSPReceiverETAController *v6;
  uint64_t v7;
  MSPSharedTripBlocklist *blockedList;
  NSMutableDictionary *v9;
  NSMutableDictionary *sharedSessions;
  NSMutableDictionary *v11;
  NSMutableDictionary *sharedNavStates;
  NSMutableDictionary *v13;
  NSMutableDictionary *waitingNavStates;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *orderedNavStateIdentifiers;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v21[16];
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MSPReceiverETAController;
  v5 = -[MSPReceiverETAController init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_idsRelay, v4);
    +[MSPSharedTripBlocklist sharedInstance](MSPSharedTripBlocklist, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    blockedList = v6->_blockedList;
    v6->_blockedList = (MSPSharedTripBlocklist *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharedSessions = v6->_sharedSessions;
    v6->_sharedSessions = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharedNavStates = v6->_sharedNavStates;
    v6->_sharedNavStates = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    waitingNavStates = v6->_waitingNavStates;
    v6->_waitingNavStates = v13;

    v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    orderedNavStateIdentifiers = v6->_orderedNavStateIdentifiers;
    v6->_orderedNavStateIdentifiers = v15;

    objc_msgSend(v4, "storageController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v6);

    objc_msgSend(v4, "setDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v6, sel_updateContacts, *MEMORY[0x1E0C96870], 0);

  }
  MSPGetSharedTripLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_DEBUG, "MSPReceiverETAController initialized", v21, 2u);
  }

  return v6;
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
    v6 = "-[MSPReceiverETAController dealloc]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[Receiver] %{private}s", buf, 0xCu);
  }

  -[NSTimer invalidate](self->_cleanupTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MSPReceiverETAController;
  -[MSPReceiverETAController dealloc](&v4, sel_dealloc);
}

- (void)_setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_mapsNotificationCenter, a3);
}

- (void)cleanTimer
{
  NSTimer *cleanupTimer;

  -[NSTimer invalidate](self->_cleanupTimer, "invalidate");
  cleanupTimer = self->_cleanupTimer;
  self->_cleanupTimer = 0;

}

- (NSArray)allTrips
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSMutableOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  objc_msgSend(WeakRetained, "storageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialiseStoredSessionsIfNeeded");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_orderedNavStateIdentifiers, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_orderedNavStateIdentifiers;
  v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedNavStates, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v12;
}

- (BOOL)subscribeToUpdatesToSharedTrip:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  OS_os_transaction *v18;
  OS_os_transaction *transaction;
  void *v20;
  void *v21;
  uint8_t v23[16];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MSPGetSharedTripLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v23 = 138412290;
    *(_QWORD *)&v23[4] = v6;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController subscribeToUpdatesToSharedTrip sharedTripIdentifier: %@", v23, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  objc_msgSend(WeakRetained, "storageController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupSessionInfoForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hasState"))
  {
    objc_msgSend(v10, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "closed"))
    {

      goto LABEL_7;
    }
    objc_msgSend(v10, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "arrived");

    if (v13)
    {
LABEL_7:
      if (a4)
      {
        v24[0] = *MEMORY[0x1E0CB2938];
        *(_QWORD *)v23 = CFSTR("Trip already ended");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 18, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0;
        *a4 = v15;
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_13;
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(WeakRetained, "groupSessionForIdentifier:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedSessions, "setObject:forKeyedSubscript:", v17, v6);
    if (!self->_transaction)
    {
      v18 = (OS_os_transaction *)os_transaction_create();
      transaction = self->_transaction;
      self->_transaction = v18;

    }
  }
  objc_msgSend(v10, "receivingHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "receivingAccountIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v17, "joinLiveModeFromHandle:fromAccountID:error:", v20, v21, a4);

LABEL_13:
  return v16;
}

- (BOOL)unsubscribeFromUpdatesToSharedTrip:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  OS_os_transaction *transaction;
  BOOL v11;
  void *v12;
  void *v13;
  uint8_t v15[16];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MSPGetSharedTripLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v15 = 138412290;
    *(_QWORD *)&v15[4] = v6;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController unsubscribeFromUpdatesToSharedTrip sharedTripIdentifier: %@", v15, 0xCu);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if (a4)
    {
      v16[0] = *MEMORY[0x1E0CB2938];
      *(_QWORD *)v15 = CFSTR("Invalid trip ID");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 17, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      *a4 = v13;
      goto LABEL_11;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v8, "leaveLiveModeIfNeeded:", a4))
    goto LABEL_10;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedSessions, "setObject:forKeyedSubscript:", 0, v6);
  if (!-[NSMutableDictionary count](self->_sharedSessions, "count"))
  {
    transaction = self->_transaction;
    self->_transaction = 0;

  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (void)blockSharedTrip:(id)a3
{
  MSPSharedTripBlocklist *v4;
  NSObject *v5;
  NSObject *v6;
  MSPSharedTripBlocklist *blockedList;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  MSPSharedTripBlocklist *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  MSPSharedTripBlocklist *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (MSPSharedTripBlocklist *)a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController blockSharedTrip identifier: %@", buf, 0xCu);
  }

  -[MSPReceiverETAController unsubscribeFromUpdatesToSharedTrip:error:](self, "unsubscribeFromUpdatesToSharedTrip:error:", v4, 0);
  -[MSPSharedTripBlocklist blockIdentifier:](self->_blockedList, "blockIdentifier:", v4);
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    blockedList = self->_blockedList;
    *(_DWORD *)buf = 138412290;
    v25 = blockedList;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController blockSharedTrip _blockedList: %@", buf, 0xCu);
  }

  -[NSMutableDictionary allValues](self->_sharedNavStates, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v16 = self->_blockedList;
        objc_msgSend(v15, "groupIdentifier", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v16) = -[MSPSharedTripBlocklist containsIdentifier:](v16, "containsIdentifier:", v17);

        if ((_DWORD)v16)
        {
          objc_msgSend(v15, "groupIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSPReceiverETAController _cleanGroup:](self, "_cleanGroup:", v18);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)clearBlockedTripIdentifiers
{
  NSObject *v3;
  uint8_t v4[16];

  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController clear blocked trip identifiers", v4, 2u);
  }

  -[MSPSharedTripBlocklist clearBlockedIdentifiers](self->_blockedList, "clearBlockedIdentifiers");
}

- (void)purgeExpiredBlockedTripIdentifiers
{
  NSObject *v3;
  uint8_t v4[16];

  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "MSPReceiverETAController purge expired blocked trip identifiers", v4, 2u);
  }

  -[MSPSharedTripBlocklist purgeExpiredIdentifiers](self->_blockedList, "purgeExpiredIdentifiers");
}

- (void)_showOrUpdateNotificationIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  MDNotificationCenter *mapsNotificationCenter;
  void *v27;
  NSObject *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOConfigGetBOOL())
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedNavStates, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasClosed") && objc_msgSend(v5, "closed"))
    {
      MSPGetSharedTripLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = v4;
        v7 = "[SR] _showOrUpdateNotification trip closed id %@";
LABEL_10:
        _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v29, 0xCu);
        goto LABEL_31;
      }
      goto LABEL_31;
    }
    if (objc_msgSend(v5, "hasMuted") && objc_msgSend(v5, "muted"))
    {
      MSPGetSharedTripLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = v4;
        v7 = "[SR] _showOrUpdateNotification trip muted id %@";
        goto LABEL_10;
      }
LABEL_31:

      goto LABEL_32;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject inLiveMode](v6, "inLiveMode"))
    {
      MSPGetSharedTripLog();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 138412290;
        v30 = v4;
        _os_log_impl(&dword_1B39C0000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification while in live mode %@", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_30;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
    -[NSObject storageController](WeakRetained, "storageController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "receivingRulesForIdentifier:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "destinationWaypointInfo");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(v5, "etaInfo");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v5, "senderInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v5, "etaInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "etaTimestamp");
            v19 = v18;
            objc_msgSend(v5, "updatedTimestamp");
            objc_msgSend(v10, "didReceiveUpdateWithETA:lastUpdated:", v19, v20);

            v21 = objc_msgSend(v10, "currentlyNecessaryNotificationTypeForState:", v5);
            MSPGetSharedTripLog();
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            if (v21)
            {
              if (v23)
              {
                objc_msgSend(v5, "mspDescription");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                MSPSharedTripNotificationTypeAsString(v21);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = 138412802;
                v30 = v4;
                v31 = 2112;
                v32 = v24;
                v33 = 2114;
                v34 = v25;
                _os_log_impl(&dword_1B39C0000, v22, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification id %@ state %@ notificationType: %{public}@", (uint8_t *)&v29, 0x20u);

              }
              mapsNotificationCenter = self->_mapsNotificationCenter;
              objc_msgSend(v5, "data");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[MDNotificationCenter showSharedTripNotification:ofType:forState:](mapsNotificationCenter, "showSharedTripNotification:ofType:forState:", v4, v21, v27);

              objc_msgSend(v10, "didPostNotificationType:forState:", v21, v5);
            }
            else
            {
              if (v23)
              {
                LOWORD(v29) = 0;
                _os_log_impl(&dword_1B39C0000, v22, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification not showing notification as type is none", (uint8_t *)&v29, 2u);
              }

            }
            -[NSObject storageController](WeakRetained, "storageController");
            v28 = objc_claimAutoreleasedReturnValue();
            -[NSObject receivingRulesTouched](v28, "receivingRulesTouched");
LABEL_29:

LABEL_30:
            goto LABEL_31;
          }
        }
        else
        {

        }
      }
    }
    MSPGetSharedTripLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_1B39C0000, v28, OS_LOG_TYPE_DEFAULT, "[SR] _showOrUpdateNotification skipping notification, rules: %@ currentState: %@", (uint8_t *)&v29, 0x16u);
    }
    goto LABEL_29;
  }
LABEL_32:

}

- (void)_resolveContactIfNeeded:(id)a3 fromId:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSMutableDictionary *sharedNavStates;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  int v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(_QWORD);
  void (**v29)(_QWORD);
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  sharedNavStates = self->_sharedNavStates;
  v11 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](sharedNavStates, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "senderInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromIdentifier:", v14);

  objc_msgSend(v12, "senderInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasLocalName");

  if ((v17 & 1) != 0)
  {
    v9[2](v9);
  }
  else
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke;
    v30[3] = &unk_1E6651C08;
    v18 = v12;
    v31 = v18;
    v19 = v14;
    v32 = v19;
    v20 = (void (**)(_QWORD))MEMORY[0x1B5E2B4E8](v30);
    v21 = objc_msgSend(MEMORY[0x1E0C97298], "_maps_isAuthorized");
    MSPGetSharedTripLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v18, "mspDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v34 = v19;
        v35 = 2112;
        v36 = v8;
        v37 = 2112;
        v38 = v24;
        _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_INFO, "[SR] _resolveContact %{private}@ (id %@ state %@)", buf, 0x20u);

      }
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke_19;
      v26[3] = &unk_1E6651C30;
      v27 = v18;
      v28 = v20;
      v29 = v9;
      +[MSPContact contactWithAccountIdentifier:completion:](MSPContact, "contactWithAccountIdentifier:completion:", v19, v26);

    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "mspDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v34 = v19;
        v35 = 2112;
        v36 = v8;
        v37 = 2112;
        v38 = v25;
        _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_ERROR, "[SR] _resolveContact [not authorized for Contacts access] %{private}@ (id %@ state %@)", buf, 0x20u);

      }
      v20[2](v20);
      v9[2](v9);
    }

  }
}

void __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "senderInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fromDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "senderInfo");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fromDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "senderInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalName:", v5);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "senderInfo");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalName:", v7);
  }

}

void __70__MSPReceiverETAController__resolveContactIfNeeded_fromId_completion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v8, "length") && objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "senderInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalName:", v8);

    objc_msgSend(*(id *)(a1 + 32), "senderInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalContactIdentifier:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)updateContacts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v13[5];
  id v14;
  id location;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_sharedNavStates, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "senderInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLocalName:", 0);

        objc_msgSend(v6, "senderInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLocalContactIdentifier:", 0);

        objc_initWeak(&location, self);
        objc_msgSend(v6, "groupIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "senderInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fromIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __42__MSPReceiverETAController_updateContacts__block_invoke;
        v13[3] = &unk_1E6651C58;
        objc_copyWeak(&v14, &location);
        v13[4] = v6;
        -[MSPReceiverETAController _resolveContactIfNeeded:fromId:completion:](self, "_resolveContactIfNeeded:fromId:completion:", v9, v11, v13);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

void __42__MSPReceiverETAController_updateContacts__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 10);
    v4 = v7[3];
    objc_msgSend(*(id *)(a1 + 32), "groupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "etaController:didUpdateETAForSharedTrip:", v7, v6);

    WeakRetained = v7;
  }

}

- (BOOL)_allowMessageWithState:(id)a3 forGroup:(id)a4 fromID:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  MSPSharedTripBlocklist *blockedList;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  NSObject *v30;
  BOOL v31;
  int v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a4;
  v8 = (__CFString *)a5;
  if (-[__CFString length](v7, "length"))
  {
    if (-[MSPSharedTripBlocklist containsIdentifier:](self->_blockedList, "containsIdentifier:", v7))
    {
      MSPGetSharedTripLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        blockedList = self->_blockedList;
        v33 = 138412546;
        v34 = (const __CFString *)blockedList;
        v35 = 2112;
        v36 = v7;
        v11 = "[SR] _allowMessageWithState NO blocklist %@ contains identifier %@";
        v12 = v9;
        v13 = OS_LOG_TYPE_DEFAULT;
        v14 = 22;
LABEL_7:
        _os_log_impl(&dword_1B39C0000, v12, v13, v11, (uint8_t *)&v33, v14);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[__CFString componentsSeparatedByString:](v8, "componentsSeparatedByString:", CFSTR(":"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "length"))
      {
LABEL_21:

        goto LABEL_22;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "initiatorIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v8);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accountIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v16);

      if ((v19 & 1) == 0 && (v22 & 1) == 0)
      {
        MSPGetSharedTripLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v33 = 138412290;
          v34 = v8;
          _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_ERROR, "fromID %@", (uint8_t *)&v33, 0xCu);
        }

        MSPGetSharedTripLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v7);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "initiatorIdentifier");
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v33 = 138412290;
          v34 = v26;
          _os_log_impl(&dword_1B39C0000, v24, OS_LOG_TYPE_ERROR, "initiatorIdentifier %@", (uint8_t *)&v33, 0xCu);

        }
        MSPGetSharedTripLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedSessions, "objectForKeyedSubscript:", v7);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "accountIdentifiers");
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v33 = 138412290;
          v34 = v29;
          _os_log_impl(&dword_1B39C0000, v27, OS_LOG_TYPE_ERROR, "accountIdentifiers %@", (uint8_t *)&v33, 0xCu);

        }
        MSPGetSharedTripLog();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v33 = 138412546;
          v34 = CFSTR("NO");
          v35 = 2112;
          v36 = CFSTR("NO");
          _os_log_impl(&dword_1B39C0000, v30, OS_LOG_TYPE_ERROR, "_allowMessageWithState NO senderIsGroupInitiator %@, groupContainsSender %@", (uint8_t *)&v33, 0x16u);
        }

        goto LABEL_21;
      }

    }
    v31 = 1;
    goto LABEL_23;
  }
  MSPGetSharedTripLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v33) = 0;
    v11 = "[SR] _allowMessageWithState NO nil group identifier";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 2;
    goto LABEL_7;
  }
LABEL_22:
  v31 = 0;
LABEL_23:

  return v31;
}

- (void)_updateData:(id)a3 forGroup:(id)a4 fromID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSTimer *v23;
  NSTimer *cleanupTimer;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  id v36;
  BOOL v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27540]), "initWithData:", v8);
  if ((objc_msgSend(v11, "hasEtaInfo") & 1) != 0
    || (objc_msgSend(v11, "hasRouteInfo") & 1) != 0
    || (objc_msgSend(v11, "hasDestinationInfo") & 1) != 0
    || objc_msgSend(v11, "waypointInfosCount")
    || (objc_msgSend(v11, "hasSenderInfo") & 1) != 0)
  {
    if (-[MSPReceiverETAController _allowMessageWithState:forGroup:fromID:](self, "_allowMessageWithState:forGroup:fromID:", v11, v9, v10))
    {
      objc_msgSend(v11, "setGroupIdentifier:", v9);
      MSPGetSharedTripLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "mspDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_DEFAULT, "[SR] processing incoming state %@", buf, 0xCu);

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedNavStates, "objectForKeyedSubscript:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v11, "copy");
      WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
      objc_msgSend(WeakRetained, "storageController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateGroupSessionStorageWithState:", v32);

      if (v14)
      {
        -[NSObject merge:](v14, "merge:", v11);
        MSPGetSharedTripLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          -[NSObject mspDescription](v14, "mspDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v18;
          _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "[SR] merge with existing state %@", buf, 0xCu);

        }
        v19 = v14;
      }
      else
      {
        v25 = v11;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_waitingNavStates, "objectForKeyedSubscript:", v9);
        v26 = objc_claimAutoreleasedReturnValue();
        v17 = v26;
        if (v26)
        {
          -[NSObject merge:](v26, "merge:", v25);
          v19 = v17;

          MSPGetSharedTripLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            -[NSObject mspDescription](v19, "mspDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v39 = v28;
            _os_log_impl(&dword_1B39C0000, v27, OS_LOG_TYPE_INFO, "[SR] merge with waiting state %@", buf, 0xCu);

          }
        }
        else
        {
          v19 = v25;
        }
        if ((-[NSObject hasDestinationInfo](v19, "hasDestinationInfo") & 1) == 0
          && !-[NSObject waypointInfosCount](v19, "waypointInfosCount")
          || (-[NSObject hasSenderInfo](v19, "hasSenderInfo") & 1) == 0)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_waitingNavStates, "setObject:forKeyedSubscript:", v19, v9);
          MSPGetSharedTripLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            -[NSObject mspDescription](v19, "mspDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v39 = v30;
            _os_log_impl(&dword_1B39C0000, v29, OS_LOG_TYPE_INFO, "[SR] wait state %@", buf, 0xCu);

          }
          goto LABEL_33;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_waitingNavStates, "setObject:forKeyedSubscript:", 0, v9);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedNavStates, "setObject:forKeyedSubscript:", v19, v9);
        if ((-[NSMutableOrderedSet containsObject:](self->_orderedNavStateIdentifiers, "containsObject:", v9) & 1) == 0)
          -[NSMutableOrderedSet insertObject:atIndex:](self->_orderedNavStateIdentifiers, "insertObject:atIndex:", v9, 0);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      -[NSObject setLocalUpdatedTimestamp:](v19, "setLocalUpdatedTimestamp:");

      if (-[MSPReceiverETAController _cleanUpNecessaryForGroup:](self, "_cleanUpNecessaryForGroup:", v9))
      {
        -[MSPReceiverETAController _cleanGroup:](self, "_cleanGroup:", v9);
      }
      else
      {
        if (!self->_cleanupTimer)
        {
          v22 = (void *)MEMORY[0x1E0C99E88];
          GEOConfigGetDouble();
          objc_msgSend(v22, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__cleanupIfNecessary, 0, 1);
          v23 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          cleanupTimer = self->_cleanupTimer;
          self->_cleanupTimer = v23;

        }
        objc_initWeak((id *)buf, self);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __56__MSPReceiverETAController__updateData_forGroup_fromID___block_invoke;
        v33[3] = &unk_1E6651C80;
        objc_copyWeak(&v36, (id *)buf);
        v34 = v32;
        v19 = v19;
        v35 = v19;
        v37 = v14 == 0;
        -[MSPReceiverETAController _resolveContactIfNeeded:fromId:completion:](self, "_resolveContactIfNeeded:fromId:completion:", v9, v10, v33);

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
LABEL_33:

      goto LABEL_34;
    }
    MSPGetSharedTripLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "mspDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v21;
      _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_DEFAULT, "[SR] discarding message %@", buf, 0xCu);

    }
  }
  else
  {
    MSPGetSharedTripLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "mspDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v31;
      _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_ERROR, "[SR] incoming state is missing too many fields: %@", buf, 0xCu);

    }
  }
LABEL_34:

}

void __56__MSPReceiverETAController__updateData_forGroup_fromID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateDelegateWithUpdateState:to:freshAvailable:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));

}

- (void)_updateDelegateWithUpdateState:(id)a3 to:(id)a4 freshAvailable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int v10;
  int v11;
  int v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *WeakRetained;
  void *v27;
  MSPReceiverETAController *v28;
  int v29;
  int v30;
  char v31;
  int v32;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v5 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "hasRouteInfo");
  v11 = objc_msgSend(v8, "hasDestinationInfo");
  v12 = objc_msgSend(v8, "hasEtaInfo");
  LODWORD(v13) = objc_msgSend(v8, "arrived");
  v32 = objc_msgSend(v8, "closed");
  if (objc_msgSend(v8, "hasMuted") && objc_msgSend(v8, "muted"))
  {
    MSPGetSharedTripIDSTransportLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "mspDescription");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[SR] _updateDelegateWithUpdateState update muted %@", buf, 0xCu);

    }
  }
  else
  {
    MSPGetSharedTripLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (char)v13;
      if (v11)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v28 = self;
      v18 = v17;
      if (v10)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      v20 = v19;
      if (v12)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      v30 = v12;
      v22 = v21;
      if ((_DWORD)v13)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v29 = v10;
      v24 = v23;
      if (v32)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v13 = v25;
      *(_DWORD *)buf = 138413314;
      v34 = v18;
      v35 = 2112;
      v36 = v20;
      v37 = 2112;
      v38 = v22;
      v39 = 2112;
      v40 = v24;
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_1B39C0000, v16, OS_LOG_TYPE_DEFAULT, "[SR] update delegate destination %@ route %@ eta %@ arrived %@ closed %@", buf, 0x34u);

      LOBYTE(v13) = v31;
      v10 = v29;

      v12 = v30;
      self = v28;
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = WeakRetained;
    if (v5)
      -[NSObject etaController:sharedTripDidBecomeAvailable:](WeakRetained, "etaController:sharedTripDidBecomeAvailable:", self, v9);
    if (v32)
    {
      objc_msgSend(v9, "stripArrivedOrClosedTrip");
      -[NSObject etaController:sharedTripDidClose:](v14, "etaController:sharedTripDidClose:", self, v9);
    }
    else if ((v13 & 1) != 0)
    {
      objc_msgSend(v9, "stripArrivedOrClosedTrip");
      -[NSObject etaController:didUpdateReachedDestinationForSharedTrip:](v14, "etaController:didUpdateReachedDestinationForSharedTrip:", self, v9);
    }
    else
    {
      if (v11)
        -[NSObject etaController:didUpdateDestinationForSharedTrip:](v14, "etaController:didUpdateDestinationForSharedTrip:", self, v9);
      if ((v10 | v12) == 1)
      {
        objc_msgSend(v9, "truncatePointDataForPrivacy");
        -[NSObject etaController:didUpdateRouteForSharedTrip:](v14, "etaController:didUpdateRouteForSharedTrip:", self, v9);
      }
      if (v12)
        -[NSObject etaController:didUpdateETAForSharedTrip:](v14, "etaController:didUpdateETAForSharedTrip:", self, v9);
    }
    objc_msgSend(v9, "groupIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPReceiverETAController _showOrUpdateNotificationIfNeeded:](self, "_showOrUpdateNotificationIfNeeded:", v27);

  }
}

- (void)_cleanupIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](self->_sharedNavStates, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (-[MSPReceiverETAController _cleanUpNecessaryForGroup:](self, "_cleanUpNecessaryForGroup:", v8))
          -[MSPReceiverETAController _cleanGroup:](self, "_cleanGroup:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)_cleanUpNecessaryForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  unsigned int v21;
  double v22;
  uint64_t v23;
  double v24;
  int v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  int v33;
  id v34;
  __int16 v35;
  double v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedNavStates, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "hasLocalUpdatedTimestamp") & 1) == 0)
    {
      MSPGetSharedTripLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v33 = 138412290;
        v34 = v4;
        _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_ERROR, "_cleanUpNecessaryForGroup called for group %@ without update timestamp", (uint8_t *)&v33, 0xCu);
      }
      goto LABEL_38;
    }
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "localUpdatedTimestamp");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceNow](v8, "timeIntervalSinceNow");
    v10 = v9;
    GEOConfigGetDouble();
    if (v10 < -v11)
    {
      MSPGetSharedTripLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 138412290;
        v34 = v4;
        _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_DEFAULT, "_cleanUpNecessaryForGroup cleaning group %@ as abandoned", (uint8_t *)&v33, 0xCu);
      }
LABEL_37:

LABEL_38:
      v13 = 1;
LABEL_39:

      goto LABEL_40;
    }
    v14 = objc_msgSend(v6, "hasArrived")
       && objc_msgSend(v6, "arrived")
       && objc_msgSend(v6, "numberOfIntermediateStopsRemaining") == 0;
    if (objc_msgSend(v6, "hasClosed"))
      v15 = objc_msgSend(v6, "closed");
    else
      v15 = 0;
    v16 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "etaInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "etaTimestamp");
    objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceNow");
    v20 = v19;

    if (objc_msgSend(v6, "hasClosureReason"))
    {
      v21 = objc_msgSend(v6, "closureReason");
      if (v21 == 1)
      {
        v22 = 0.0;
        v23 = 1;
LABEL_22:
        v13 = 0;
        v25 = v14 | v15;
        if (v20 < 0.0)
          v25 = 1;
        if (v10 >= -v22 || !v25)
          goto LABEL_39;
        MSPGetSharedTripLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          if (v14)
            v26 = CFSTR("YES");
          else
            v26 = CFSTR("NO");
          v27 = v26;
          if (v15)
            v28 = CFSTR("YES");
          else
            v28 = CFSTR("NO");
          v29 = v28;
          if (v20 >= 0.0)
            v30 = CFSTR("NO");
          else
            v30 = CFSTR("YES");
          v31 = v30;
          v33 = 138544898;
          v34 = v4;
          v35 = 2048;
          v36 = v22;
          v37 = 2114;
          v38 = CFSTR("YES");
          v39 = 2114;
          v40 = v27;
          v41 = 2114;
          v42 = v29;
          v43 = 2048;
          v44 = v23;
          v45 = 2114;
          v46 = v31;
          _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_DEFAULT, "_cleanUpNecessaryForGroup %{public}@ (updateLongerAgoThanExpiryInterval %#.1lfs %{public}@, arrived %{public}@, closed %{public}@ for reason %lu, etaInPast %{public}@)", (uint8_t *)&v33, 0x48u);

        }
        goto LABEL_37;
      }
      v23 = v21;
    }
    else
    {
      v23 = 0;
    }
    GEOConfigGetDouble();
    v22 = v24;
    goto LABEL_22;
  }
  v13 = 0;
LABEL_40:

  return v13;
}

- (void)_cleanGroup:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSTimer *cleanupTimer;
  OS_os_transaction *transaction;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  MSPReceiverETAController *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripIDSTransportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[SR] cleanGroup %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  objc_msgSend(WeakRetained, "storageController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeSession:", v4);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedNavStates, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedSessions, "setObject:forKeyedSubscript:", 0, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_waitingNavStates, "setObject:forKeyedSubscript:", 0, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedNavStates, "setObject:forKeyedSubscript:", 0, v4);
  -[NSMutableOrderedSet removeObject:](self->_orderedNavStateIdentifiers, "removeObject:", v4);
  if (v8)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __40__MSPReceiverETAController__cleanGroup___block_invoke;
    v16 = &unk_1E6651C08;
    v17 = self;
    v18 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], &v13);

  }
  -[NSMutableDictionary allKeys](self->_sharedNavStates, "allKeys", v13, v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    -[NSTimer invalidate](self->_cleanupTimer, "invalidate");
    cleanupTimer = self->_cleanupTimer;
    self->_cleanupTimer = 0;

  }
  if (!-[NSMutableDictionary count](self->_sharedSessions, "count"))
  {
    transaction = self->_transaction;
    self->_transaction = 0;

  }
}

void __40__MSPReceiverETAController__cleanGroup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "etaController:sharedTripDidBecomeUnavailable:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)relay:(id)a3 receiveData:(id)a4 info:(id)a5 fromID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  _QWORD *v22;
  const char *label;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  uint64_t (*v29)(uint64_t);
  void *v30;
  MSPReceiverETAController *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  MSPGetSharedTripIDSTransportLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v12;
    _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[SR] receiveData from %@", buf, 0xCu);
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", 0x1E6658C08);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C80D38];
  v17 = MEMORY[0x1E0C80D38];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __58__MSPReceiverETAController_relay_receiveData_info_fromID___block_invoke;
  v30 = &unk_1E6651CA8;
  v31 = self;
  v18 = v11;
  v32 = v18;
  v19 = v15;
  v33 = v19;
  v20 = v13;
  v34 = v20;
  v21 = v16;
  v22 = v28;
  label = dispatch_queue_get_label(v16);
  v24 = dispatch_queue_get_label(0);
  if (label == v24 || label && v24 && (v24 = (const char *)strcmp(label, v24), !(_DWORD)v24))
  {
    v26 = (void *)MEMORY[0x1B5E2B350](v24, v25);
    v29((uint64_t)v22);
    objc_autoreleasePoolPop(v26);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v22);
  }

  v27 = (void *)MEMORY[0x1E0C80D38];
}

uint64_t __58__MSPReceiverETAController_relay_receiveData_info_fromID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateData:forGroup:fromID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)relay:(id)a3 sharingClosed:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  const char *label;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  uint64_t (*v20)(uint64_t);
  void *v21;
  MSPReceiverETAController *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MSPGetSharedTripIDSTransportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_INFO, "[SR] sharingClosed %@", buf, 0xCu);
  }

  v9 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C80D38];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = __48__MSPReceiverETAController_relay_sharingClosed___block_invoke;
  v21 = &unk_1E6651C08;
  v22 = self;
  v11 = v7;
  v23 = v11;
  v12 = v9;
  v13 = v19;
  label = dispatch_queue_get_label(v9);
  v15 = dispatch_queue_get_label(0);
  if (label == v15 || label && v15 && (v15 = (const char *)strcmp(label, v15), !(_DWORD)v15))
  {
    v17 = (void *)MEMORY[0x1B5E2B350](v15, v16);
    v20((uint64_t)v13);
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v13);
  }

  v18 = (void *)MEMORY[0x1E0C80D38];
}

uint64_t __48__MSPReceiverETAController_relay_sharingClosed___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cleanUpNecessaryForGroup:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_cleanGroup:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)storageController:(id)a3 updatedSharedTripGroupStorage:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "[SR] updatedSharedTripGroupStorage %@", buf, 0xCu);
  }

  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        MSPGetSharedTripLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v13;
          _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_INFO, "[SR] keys %@", buf, 0xCu);
        }

        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "state");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedNavStates, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          MSPGetSharedTripLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v13;
            _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_DEFAULT, "[SR] restore %@", buf, 0xCu);
          }

          objc_msgSend(v16, "data");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fromID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSPReceiverETAController _updateData:forGroup:fromID:](self, "_updateData:forGroup:fromID:", v19, v13, v20);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (void)groupSessionEnded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  const char *label;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  uint64_t (*v17)(uint64_t);
  void *v18;
  MSPReceiverETAController *v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __46__MSPReceiverETAController_groupSessionEnded___block_invoke;
  v18 = &unk_1E6651C08;
  v19 = self;
  v8 = v5;
  v20 = v8;
  v9 = v6;
  v10 = v16;
  label = dispatch_queue_get_label(v6);
  v12 = dispatch_queue_get_label(0);
  if (label == v12 || label && v12 && (v12 = (const char *)strcmp(label, v12), !(_DWORD)v12))
  {
    v14 = (void *)MEMORY[0x1B5E2B350](v12, v13);
    v17((uint64_t)v10);
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v10);
  }

  v15 = (void *)MEMORY[0x1E0C80D38];
}

uint64_t __46__MSPReceiverETAController_groupSessionEnded___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cleanUpNecessaryForGroup:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_cleanGroup:", *(_QWORD *)(a1 + 40));
  return result;
}

- (MSPReceiverETAControllerDelegate)delegate
{
  return (MSPReceiverETAControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_blockedList, 0);
  objc_destroyWeak((id *)&self->_idsRelay);
  objc_storeStrong((id *)&self->_mapsNotificationCenter, 0);
  objc_storeStrong((id *)&self->_orderedNavStateIdentifiers, 0);
  objc_storeStrong((id *)&self->_waitingNavStates, 0);
  objc_storeStrong((id *)&self->_sharedNavStates, 0);
  objc_storeStrong((id *)&self->_sharedSessions, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
