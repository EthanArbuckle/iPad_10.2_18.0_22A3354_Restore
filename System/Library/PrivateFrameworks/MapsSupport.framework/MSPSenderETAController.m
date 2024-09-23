@implementation MSPSenderETAController

- (MSPSenderETAController)initWithRelay:(id)a3
{
  id v4;
  MSPSenderETAController *v5;
  MSPSenderETAController *v6;
  uint64_t v7;
  MSPSharedTripStorageController *storageController;
  NSMutableSet *v9;
  NSMutableSet *destinations;
  MSPNavigationListener *v11;
  MSPNavigationListener *navigationListener;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSPSenderETAController;
  v5 = -[MSPSenderETAController init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_idsRelay, v4);
    objc_msgSend(v4, "storageController");
    v7 = objc_claimAutoreleasedReturnValue();
    storageController = v6->_storageController;
    v6->_storageController = (MSPSharedTripStorageController *)v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    destinations = v6->_destinations;
    v6->_destinations = v9;

    v11 = objc_alloc_init(MSPNavigationListener);
    navigationListener = v6->_navigationListener;
    v6->_navigationListener = v11;

    -[MSPSenderETAController _restoreLastSession](v6, "_restoreLastSession");
    objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isInternalInstall");

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:suspensionBehavior:", v6, sel__startLiveForVirtualReceiver_, CFSTR("MSPSharedTripVirtualReceiverStartLiveUpdates"), 0, 4);

      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:suspensionBehavior:", v6, sel__stopLiveForVirtualReceiver_, CFSTR("MSPSharedTripVirtualReceiverStopLiveUpdates"), 0, 4);

    }
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
    v6 = "-[MSPSenderETAController dealloc]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEBUG, "[Sender] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSenderETAController;
  -[MSPSenderETAController dealloc](&v4, sel_dealloc);
}

- (void)_updateStorage
{
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
  id v17;

  -[MSPSenderStrategy participants](self->_minimalSender, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[MSPGroupSessionStorage setMinimalStrategyIdentifiers:](self->_sessionStorage, "setMinimalStrategyIdentifiers:", v5);

  -[MSPSenderStrategy participants](self->_liveSender, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[MSPGroupSessionStorage setLiveStrategyIdentifiers:](self->_sessionStorage, "setLiveStrategyIdentifiers:", v8);

  -[MSPSenderStrategy participants](self->_iMessageSender, "participants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[MSPGroupSessionStorage setMessageStrategyIdentifiers:](self->_sessionStorage, "setMessageStrategyIdentifiers:", v11);

  -[MSPSenderStrategy participants](self->_smsSender, "participants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  -[MSPGroupSessionStorage setSmsStrategyIdentifiers:](self->_sessionStorage, "setSmsStrategyIdentifiers:", v14);

  -[MSPNavigationListener currentState](self->_navigationListener, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "copy");

  -[MSPSharedTripGroupSession identifier](self->_groupSession, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setGroupIdentifier:", v16);

  -[MSPGroupSessionStorage updateWithState:](self->_sessionStorage, "updateWithState:", v17);
  -[MSPSharedTripStorageController setSenderSessionStorage:](self->_storageController, "setSenderSessionStorage:", self->_sessionStorage);

}

- (void)_restoreLastSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  MSPSenderMessageStrategy *iMessageSender;
  void *v22;
  void *v23;
  MSPSenderMessageStrategy *smsSender;
  void *v25;
  MSPNavigationListener *v26;
  dispatch_time_t v27;
  MSPNavigationListener *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  MSPNavigationListener *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[MSPSharedTripStorageController senderSessionStorage](self->_storageController, "senderSessionStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "minimalStrategyIdentifiersCount"))
    {
      objc_msgSend(v4, "minimalStrategyIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v7);

    }
    if (objc_msgSend(v4, "messageStrategyIdentifiersCount"))
    {
      objc_msgSend(v4, "messageStrategyIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v8);

    }
    if (objc_msgSend(v4, "smsStrategyIdentifiersCount"))
    {
      objc_msgSend(v4, "smsStrategyIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v9);

    }
    MSPGetSharedTripLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "mspDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v11;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "[Sender] _restoreLastSession restoring state %@ to %@", buf, 0x16u);

    }
    if (objc_msgSend(v6, "count") && objc_msgSend(v5, "hasGroupIdentifier"))
    {
      objc_msgSend(v5, "groupIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSPSenderETAController _createGroupSessionIfNeededWithIdentifier:](self, "_createGroupSessionIfNeededWithIdentifier:", v12);

      objc_msgSend(MEMORY[0x1E0D34358], "_msp_IDSIdentifiersFor:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](self->_destinations, "addObjectsFromArray:", v13);
      -[MSPSharedTripGroupSession addSharingWith:](self->_groupSession, "addSharingWith:", v13);
      if (objc_msgSend(v4, "minimalStrategyIdentifiersCount"))
      {
        v14 = (void *)MEMORY[0x1E0D34358];
        objc_msgSend(v4, "minimalStrategyIdentifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_msp_IDSIdentifiersFor:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        -[MSPSenderMinimalStrategy addParticipants:](self->_minimalSender, "addParticipants:", v16);
        v13 = (void *)v16;
      }
      if (objc_msgSend(v4, "liveStrategyIdentifiersCount"))
      {
        v17 = (void *)MEMORY[0x1E0D34358];
        objc_msgSend(v4, "liveStrategyIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_msp_IDSIdentifiersFor:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        -[MSPSenderLiveStrategy addParticipants:](self->_liveSender, "addParticipants:", v19);
        v13 = (void *)v19;
      }
      objc_msgSend(v4, "messageStrategyIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        iMessageSender = self->_iMessageSender;
        objc_msgSend(v4, "messageStrategyIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPSenderMessageStrategy addParticipants:](iMessageSender, "addParticipants:", v22);

      }
      objc_msgSend(v4, "smsStrategyIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        smsSender = self->_smsSender;
        objc_msgSend(v4, "smsStrategyIdentifiers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPSenderMessageStrategy addParticipants:](smsSender, "addParticipants:", v25);

      }
      -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v5, 1);
      objc_initWeak((id *)buf, self);
      v26 = self->_navigationListener;
      v27 = dispatch_time(0, 3000000000);
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __45__MSPSenderETAController__restoreLastSession__block_invoke;
      v32 = &unk_1E66544D0;
      v33 = v26;
      v28 = v26;
      objc_copyWeak(&v34, (id *)buf);
      dispatch_after(v27, MEMORY[0x1E0C80D38], &v29);
      objc_destroyWeak(&v34);

      objc_destroyWeak((id *)buf);
    }
    -[MSPSenderETAController _invalidateActiveHandles](self, "_invalidateActiveHandles", v29, v30, v31, v32);

  }
}

void __45__MSPSenderETAController__restoreLastSession__block_invoke(uint64_t a1)
{
  id WeakRetained;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInNavigatingState") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "stopSharingWithReason:error:", 0, 0);

  }
}

- (void)_createGroupSessionIfNeededWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  MSPSharedTripGroupSession *v7;
  MSPSharedTripGroupSession *groupSession;
  MSPSenderMinimalStrategy *v9;
  MSPSenderMinimalStrategy *minimalSender;
  MSPSenderLiveStrategy *v11;
  MSPSenderLiveStrategy *liveSender;
  MSPSenderMessageStrategy *v13;
  MSPSenderMessageStrategy *iMessageSender;
  MSPSenderMessageStrategy *v15;
  MSPSenderMessageStrategy *smsSender;
  void *v17;
  int v18;
  MSPSenderVirtualMinimalStrategy *v19;
  MSPSenderVirtualMinimalStrategy *virtualMinimalSender;
  MSPSenderVirtualLiveStrategy *v21;
  MSPSenderVirtualLiveStrategy *virtualLiveSender;
  MSPSenderVirtualMessageStrategy *v23;
  MSPSenderVirtualMessageStrategy *virtualiMessageSender;
  MSPSenderVirtualMessageStrategy *v25;
  MSPSenderVirtualMessageStrategy *virtualSMSSender;
  MSPGroupSessionStorage *v27;
  MSPGroupSessionStorage *sessionStorage;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_groupSession)
  {
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138543362;
      v34 = v4;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "MSPSenderETAController creating group session for uuid %{public}@", (uint8_t *)&v33, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
    objc_msgSend(WeakRetained, "startSharingGroupSessionWithTripIdentifer:", v4);
    v7 = (MSPSharedTripGroupSession *)objc_claimAutoreleasedReturnValue();
    groupSession = self->_groupSession;
    self->_groupSession = v7;

    -[MSPSharedTripGroupSession setDelegate:](self->_groupSession, "setDelegate:", self);
    v9 = -[MSPSenderMinimalStrategy initWithGroupSession:]([MSPSenderMinimalStrategy alloc], "initWithGroupSession:", self->_groupSession);
    minimalSender = self->_minimalSender;
    self->_minimalSender = v9;

    v11 = -[MSPSenderLiveStrategy initWithGroupSession:]([MSPSenderLiveStrategy alloc], "initWithGroupSession:", self->_groupSession);
    liveSender = self->_liveSender;
    self->_liveSender = v11;

    v13 = -[MSPSenderMessageStrategy initWithDelegate:capabilityType:]([MSPSenderMessageStrategy alloc], "initWithDelegate:capabilityType:", self, 3);
    iMessageSender = self->_iMessageSender;
    self->_iMessageSender = v13;

    v15 = -[MSPSenderMessageStrategy initWithDelegate:capabilityType:]([MSPSenderMessageStrategy alloc], "initWithDelegate:capabilityType:", self, 2);
    smsSender = self->_smsSender;
    self->_smsSender = v15;

    objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isInternalInstall");

    if (v18)
    {
      v19 = -[MSPSenderVirtualMinimalStrategy initWithGroupSession:]([MSPSenderVirtualMinimalStrategy alloc], "initWithGroupSession:", self->_groupSession);
      virtualMinimalSender = self->_virtualMinimalSender;
      self->_virtualMinimalSender = v19;

      v21 = -[MSPSenderVirtualLiveStrategy initWithGroupSession:]([MSPSenderVirtualLiveStrategy alloc], "initWithGroupSession:", self->_groupSession);
      virtualLiveSender = self->_virtualLiveSender;
      self->_virtualLiveSender = v21;

      v23 = -[MSPSenderVirtualMessageStrategy initWithDelegate:capabilityType:]([MSPSenderVirtualMessageStrategy alloc], "initWithDelegate:capabilityType:", self, 3);
      virtualiMessageSender = self->_virtualiMessageSender;
      self->_virtualiMessageSender = v23;

      v25 = -[MSPSenderVirtualMessageStrategy initWithDelegate:capabilityType:]([MSPSenderVirtualMessageStrategy alloc], "initWithDelegate:capabilityType:", self, 2);
      virtualSMSSender = self->_virtualSMSSender;
      self->_virtualSMSSender = v25;

    }
    v27 = objc_alloc_init(MSPGroupSessionStorage);
    sessionStorage = self->_sessionStorage;
    self->_sessionStorage = v27;

    -[MSPSharedTripGroupSession identifier](self->_groupSession, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPGroupSessionStorage setGroupIdentifier:](self->_sessionStorage, "setGroupIdentifier:", v29);

    -[MSPSharedTripGroupSession initiatorIdentifier](self->_groupSession, "initiatorIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPGroupSessionStorage setOriginatorIdentifier:](self->_sessionStorage, "setOriginatorIdentifier:", v30);

    -[MSPSenderETAController _startNavigationListener](self, "_startNavigationListener");
    -[MSPSenderETAController delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPGroupSessionStorage groupIdentifier](self->_sessionStorage, "groupIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "senderController:didStartSharingWithGroupIdentifier:", self, v32);

  }
}

- (void)_startingGroupSession
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  id v5;

  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  -[MSPNavigationListener navigationSessionIdentifier](self->_navigationListener, "navigationSessionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _createGroupSessionIfNeededWithIdentifier:](self, "_createGroupSessionIfNeededWithIdentifier:", v5);

}

- (BOOL)startSharingWith:(id)a3 capabilityType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  const __CFString *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __CFString *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *virtualSMSSender;
  uint64_t v23;
  void *v24;
  int BOOL;
  void *smsSender;
  NSObject *v27;
  NSMutableSet *destinations;
  const __CFString *v29;
  _BYTE v31[12];
  __int16 v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!-[MSPSenderETAController _validateNavigationState:](self, "_validateNavigationState:", a5))
  {
    v11 = 0;
    goto LABEL_41;
  }
  if (objc_msgSend(v8, "count"))
  {
    MSPGetSharedTripLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (a4 > 4)
        v10 = CFSTR("Unknown");
      else
        v10 = off_1E66544F0[a4];
      *(_DWORD *)v31 = 138412546;
      *(_QWORD *)&v31[4] = v8;
      v32 = 2114;
      v33 = v10;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_DEFAULT, "[Sender] startSharingWith identifiers: %@, via %{public}@", v31, 0x16u);
    }

    -[MSPSenderETAController _startingGroupSession](self, "_startingGroupSession");
    objc_msgSend(MEMORY[0x1E0D34358], "_msp_IDSIdentifiersFor:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObjectsFromArray:](self->_destinations, "addObjectsFromArray:", v13);
    -[MSPSharedTripGroupSession addSharingWith:](self->_groupSession, "addSharingWith:", v13);
    objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isInternalInstall");

    if (!v16)
    {
LABEL_25:
      switch(a4)
      {
        case 2uLL:
          smsSender = self->_smsSender;
          break;
        case 3uLL:
          smsSender = self->_iMessageSender;
          break;
        case 4uLL:
          -[MSPSenderMinimalStrategy addParticipants:](self->_minimalSender, "addParticipants:", v13);
          objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v24, "isInternalInstall"))
          {

            goto LABEL_34;
          }
          BOOL = GEOConfigGetBOOL();

          if (!BOOL)
          {
LABEL_34:
            -[MSPSenderETAController _updateStorage](self, "_updateStorage");
            -[MSPSenderETAController _invalidateActiveHandles](self, "_invalidateActiveHandles");
            v14 = 0;
            goto LABEL_35;
          }
          smsSender = self->_liveSender;
          break;
        default:
          goto LABEL_34;
      }
      objc_msgSend(smsSender, "addParticipants:", v13);
      goto LABEL_34;
    }
    MSPSharedTripGetVirtualReceivers(v8);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString count](v17, "count"))
    {
LABEL_24:

      goto LABEL_25;
    }
    MSPGetSharedTripLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[__CFString count](v17, "count");
      *(_DWORD *)v31 = 134218242;
      *(_QWORD *)&v31[4] = v19;
      v32 = 2114;
      v33 = v17;
      _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_DEFAULT, "[Sender] found %lu virtual receivers: %{public}@", v31, 0x16u);
    }

    switch(a4)
    {
      case 2uLL:
        virtualSMSSender = self->_virtualSMSSender;
        break;
      case 3uLL:
        virtualSMSSender = self->_virtualiMessageSender;
        break;
      case 4uLL:
        -[MSPSenderMinimalStrategy addParticipants:](self->_virtualMinimalSender, "addParticipants:", v17);
        objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isInternalInstall"))
        {

          goto LABEL_23;
        }
        v21 = GEOConfigGetBOOL();

        if (!v21)
        {
LABEL_23:
          MSPSharedTripGetRealReceivers(v13);
          v23 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v23;
          goto LABEL_24;
        }
        virtualSMSSender = self->_virtualLiveSender;
        break;
      default:
        goto LABEL_23;
    }
    objc_msgSend(virtualSMSSender, "addParticipants:", v17);
    goto LABEL_23;
  }
  v34[0] = *MEMORY[0x1E0CB2938];
  *(_QWORD *)v31 = CFSTR("No contact handles provided");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
LABEL_35:

  MSPGetSharedTripLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    destinations = self->_destinations;
    if (a4 > 4)
      v29 = CFSTR("Unknown");
    else
      v29 = off_1E66544F0[a4];
    *(_DWORD *)v31 = 138478083;
    *(_QWORD *)&v31[4] = destinations;
    v32 = 2114;
    v33 = v29;
    _os_log_impl(&dword_1B39C0000, v27, OS_LOG_TYPE_DEFAULT, "[Sender] destinations is now %{private}@ (startSharingWith %{public}@)", v31, 0x16u);
  }

  v11 = v14 == 0;
LABEL_41:

  return v11;
}

- (BOOL)startSharingWithGroup:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)stopSharingWithGroup:(id)a3 reason:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)stopSharingWith:(id)a3 reason:(unint64_t)a4 error:(id *)a5
{
  id v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  int v31;
  _BOOL4 v32;
  _BOOL4 v33;
  NSObject *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  _BOOL4 v38;
  uint64_t v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  NSObject *v44;
  uint64_t v45;
  NSMutableSet *destinations;
  void *v47;
  id WeakRetained;
  MSPSharedTripGroupSession *v49;
  MSPSharedTripGroupSession *groupSession;
  BOOL v51;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSMutableSet *v56;
  id *v58;
  id v59;
  _BOOL4 v60;
  __CFString *v61;
  MSPSenderETAController *v62;
  _BOOL4 v63;
  _BOOL4 v64;
  uint64_t v65;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE buf[12];
  __int16 v73;
  __CFString *v74;
  __int16 v75;
  __CFString *v76;
  __int16 v77;
  __CFString *v78;
  __int16 v79;
  __CFString *v80;
  _BYTE v81[128];
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    v51 = 0;
    if (!a5)
      goto LABEL_52;
    goto LABEL_48;
  }
  v58 = a5;
  v59 = v7;
  objc_msgSend(MEMORY[0x1E0D34358], "_msp_IDSIdentifiersFor:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v67 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
  v9 = 0;
  if (!v67)
    goto LABEL_41;
  v65 = *(_QWORD *)v69;
  v61 = v8;
  v62 = self;
  do
  {
    for (i = 0; i != v67; ++i)
    {
      if (*(_QWORD *)v69 != v65)
        objc_enumerationMutation(v8);
      v11 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isInternalInstall");

      if (v13 && (MSPSharedTripVirtualReceiverIsValid(v11) & 1) != 0)
      {
        v14 = -[MSPSenderMinimalStrategy removeParticipant:forReason:](self->_virtualMinimalSender, "removeParticipant:forReason:", v11, a4);
        v15 = -[MSPSenderLiveStrategy removeParticipant:](self->_virtualLiveSender, "removeParticipant:", v11);
        v16 = -[MSPSenderStrategy removeParticipant:](self->_virtualiMessageSender, "removeParticipant:", v11);
        v17 = -[MSPSenderStrategy removeParticipant:](self->_virtualSMSSender, "removeParticipant:", v11);
        MSPGetSharedTripLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = CFSTR("NO");
          if (v14)
            v20 = CFSTR("YES");
          else
            v20 = CFSTR("NO");
          *(_DWORD *)buf = 138478851;
          *(_QWORD *)&buf[4] = v11;
          v63 = v15;
          if (v15)
            v21 = CFSTR("YES");
          else
            v21 = CFSTR("NO");
          v73 = 2114;
          if (v16)
            v22 = CFSTR("YES");
          else
            v22 = CFSTR("NO");
          v74 = v20;
          if (v17)
            v19 = CFSTR("YES");
          v75 = 2114;
          v76 = v21;
          v77 = 2114;
          v78 = v22;
          v79 = 2114;
          v80 = v19;
          v60 = v17;
          v23 = v16;
          v24 = v14;
          v25 = v9;
          v26 = v19;
          v27 = v22;
          v28 = v21;
          v29 = v20;
          v8 = v61;
          v30 = v29;
          _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_INFO, "stopSharingWith: %{private}@ wasInVirtualMinimal: %{public}@, wasInVirtualLive: %{public}@, wasInVirtualiMessage: %{public}@, wasInVirtualSMS: %{public}@", buf, 0x34u);

          v9 = v25;
          v14 = v24;
          v16 = v23;
          v17 = v60;

          self = v62;
          v15 = v63;
        }

        if ((v9 & 1) == 0)
        {
          v31 = v14 || v15;
          goto LABEL_36;
        }
      }
      else
      {
        v32 = -[MSPSenderMinimalStrategy removeParticipant:forReason:](self->_minimalSender, "removeParticipant:forReason:", v11, a4);
        v33 = -[MSPSenderLiveStrategy removeParticipant:](self->_liveSender, "removeParticipant:", v11);
        v16 = -[MSPSenderStrategy removeParticipant:](self->_iMessageSender, "removeParticipant:", v11);
        v17 = -[MSPSenderStrategy removeParticipant:](self->_smsSender, "removeParticipant:", v11);
        MSPGetSharedTripLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = CFSTR("NO");
          if (v32)
            v36 = CFSTR("YES");
          else
            v36 = CFSTR("NO");
          if (v33)
            v37 = CFSTR("YES");
          else
            v37 = CFSTR("NO");
          if (v16)
            v35 = CFSTR("YES");
          v64 = v32;
          v38 = v17;
          v39 = v9;
          v40 = v35;
          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v11;
          v73 = 2114;
          v74 = v36;
          v75 = 2114;
          v76 = v37;
          v77 = 2114;
          v78 = v40;
          v79 = 2114;
          v80 = v40;
          v41 = v37;
          v8 = v61;
          v42 = v41;
          v43 = v36;
          _os_log_impl(&dword_1B39C0000, v34, OS_LOG_TYPE_INFO, "stopSharingWith: %{public}@ wasInMinimal: %{public}@, wasInLive: %{public}@, wasIniMessage: %{public}@, wasInSMS: %{public}@", buf, 0x34u);

          v9 = v39;
          v17 = v38;
          v32 = v64;

          self = v62;
        }

        if ((v9 & 1) == 0)
        {
          v31 = v32 || v33;
LABEL_36:
          if (v31 | (v16 || v17))
            v9 = 1;
          else
            v9 = v9;
          continue;
        }
      }
    }
    v67 = -[__CFString countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
  }
  while (v67);
LABEL_41:
  MSPGetSharedTripLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = -[__CFString count](v8, "count");
    *(_DWORD *)buf = 134218243;
    *(_QWORD *)&buf[4] = v45;
    v73 = 2113;
    v74 = v8;
    _os_log_impl(&dword_1B39C0000, v44, OS_LOG_TYPE_INFO, "Removing %lu identifiers from sharing: %{private}@", buf, 0x16u);
  }

  destinations = self->_destinations;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](destinations, "minusSet:", v47);

  WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  objc_msgSend(WeakRetained, "removeSharingWith:", v8);
  v49 = (MSPSharedTripGroupSession *)objc_claimAutoreleasedReturnValue();
  groupSession = self->_groupSession;
  self->_groupSession = v49;

  -[MSPSenderETAController _updateStorage](self, "_updateStorage");
  a5 = v58;
  if (!-[NSMutableSet count](self->_destinations, "count"))
    -[MSPSenderETAController _cleanObjects](self, "_cleanObjects");
  -[MSPSenderETAController _invalidateActiveHandles](self, "_invalidateActiveHandles");

  v51 = v9 & 1;
  v7 = v59;
  if (v58)
  {
LABEL_48:
    if (!v51)
    {
      MSPGetSharedTripLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v52, OS_LOG_TYPE_ERROR, "[Sender] Asked to stop sharing but we didn't match with any of the handles", buf, 2u);
      }

      v82[0] = *MEMORY[0x1E0CB2938];
      *(_QWORD *)buf = CFSTR("Not currently sharing with contacts");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v82, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 13, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      *a5 = v54;
    }
  }
LABEL_52:
  MSPGetSharedTripLog();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = self->_destinations;
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v56;
    _os_log_impl(&dword_1B39C0000, v55, OS_LOG_TYPE_DEFAULT, "[Sender] destinations is now %{private}@ (stopSharingWith)", buf, 0xCu);
  }

  return v51;
}

- (BOOL)stopSharingWithReason:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];

  -[NSMutableSet allObjects](self->_destinations, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MSPSenderETAController stopSharingWith:reason:error:](self, "stopSharingWith:reason:error:", v7, a3, a4);

  if (-[NSMutableSet count](self->_destinations, "count"))
  {
    MSPGetSharedTripLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_FAULT, "[Sender] stopSharing didn't clear all destinations, forcing it now", v11, 2u);
    }

    -[MSPSenderETAController _updateStorage](self, "_updateStorage");
    -[MSPSenderETAController _cleanObjects](self, "_cleanObjects");
    -[MSPSenderETAController _invalidateActiveHandles](self, "_invalidateActiveHandles");
  }
  return v8;
}

- (NSArray)activeHandles
{
  return (NSArray *)-[NSMutableSet allObjects](self->_destinations, "allObjects");
}

- (void)_startLiveForVirtualReceiver:(id)a3
{
  uint64_t v4;
  void *v5;
  MSPSenderVirtualLiveStrategy *virtualLiveSender;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (self->_virtualLiveSender)
  {
    objc_msgSend(a3, "object");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      virtualLiveSender = self->_virtualLiveSender;
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSPSenderLiveStrategy addParticipants:](virtualLiveSender, "addParticipants:", v7);

    }
  }
}

- (void)_stopLiveForVirtualReceiver:(id)a3
{
  void *v4;
  void *v5;

  if (self->_virtualLiveSender)
  {
    objc_msgSend(a3, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      -[MSPSenderLiveStrategy removeParticipant:](self->_virtualLiveSender, "removeParticipant:", v4);
      v4 = v5;
    }

  }
}

- (void)_cleanObjects
{
  NSObject *v3;
  MSPGroupSessionStorage *sessionStorage;
  MSPSenderMinimalStrategy *minimalSender;
  MSPSenderLiveStrategy *liveSender;
  MSPSenderMessageStrategy *iMessageSender;
  MSPSenderMessageStrategy *smsSender;
  MSPSenderVirtualMinimalStrategy *virtualMinimalSender;
  MSPSenderVirtualLiveStrategy *virtualLiveSender;
  MSPSenderVirtualMessageStrategy *virtualiMessageSender;
  MSPSenderVirtualMessageStrategy *virtualSMSSender;
  id WeakRetained;
  MSPSharedTripGroupSession *groupSession;
  OS_os_transaction *transaction;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[MSPSenderETAController _cleanObjects]";
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[Sender] %s", (uint8_t *)&v16, 0xCu);
  }

  sessionStorage = self->_sessionStorage;
  self->_sessionStorage = 0;

  -[MSPSharedTripStorageController setSenderSessionStorage:](self->_storageController, "setSenderSessionStorage:", 0);
  minimalSender = self->_minimalSender;
  self->_minimalSender = 0;

  liveSender = self->_liveSender;
  self->_liveSender = 0;

  iMessageSender = self->_iMessageSender;
  self->_iMessageSender = 0;

  smsSender = self->_smsSender;
  self->_smsSender = 0;

  virtualMinimalSender = self->_virtualMinimalSender;
  self->_virtualMinimalSender = 0;

  virtualLiveSender = self->_virtualLiveSender;
  self->_virtualLiveSender = 0;

  virtualiMessageSender = self->_virtualiMessageSender;
  self->_virtualiMessageSender = 0;

  virtualSMSSender = self->_virtualSMSSender;
  self->_virtualSMSSender = 0;

  -[NSMutableSet removeAllObjects](self->_destinations, "removeAllObjects");
  -[MSPSenderETAController _stopNavigationListener](self, "_stopNavigationListener");
  WeakRetained = objc_loadWeakRetained((id *)&self->_idsRelay);
  objc_msgSend(WeakRetained, "stopSharing");

  groupSession = self->_groupSession;
  self->_groupSession = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)_invalidateSharedTripWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSPSenderETAController__invalidateSharedTripWithError___block_invoke;
  block[3] = &unk_1E6651C58;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__MSPSenderETAController__invalidateSharedTripWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "senderController:didInvalidateSharedTripWithError:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)_invalidateActiveHandles
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MSPSenderETAController__invalidateActiveHandles__block_invoke;
  block[3] = &unk_1E6651E88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __50__MSPSenderETAController__invalidateActiveHandles__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateActiveHandlesForSenderController:", *(_QWORD *)(a1 + 32));

}

- (void)_startNavigationListener
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[MSPNavigationListener delegate](self->_navigationListener, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "MSPSenderETAController start listening to navigation", v5, 2u);
    }

    -[MSPNavigationListener setDelegate:](self->_navigationListener, "setDelegate:", self);
  }
}

- (void)_stopNavigationListener
{
  MSPSenderETAController *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[MSPNavigationListener delegate](self->_navigationListener, "delegate");
  v3 = (MSPSenderETAController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "MSPSenderETAController stop listening to navigation", v5, 2u);
    }

    -[MSPNavigationListener setDelegate:](self->_navigationListener, "setDelegate:", 0);
  }
}

- (BOOL)_validateNavigationState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!-[MSPNavigationListener isInNavigatingState](self->_navigationListener, "isInNavigatingState"))
  {
    v12[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)v11 = CFSTR("Not navigating");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = 7;
    goto LABEL_9;
  }
  if (!-[MSPNavigationListener isCompatibleTransportType](self->_navigationListener, "isCompatibleTransportType"))
  {
    v12[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)v11 = CFSTR("Incompatible transport type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = 8;
    goto LABEL_9;
  }
  if (!-[MSPNavigationListener isCompatibleNavigationType](self->_navigationListener, "isCompatibleNavigationType"))
  {
    v12[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)v11 = CFSTR("Incompatible navigation type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = 9;
LABEL_9:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), v8, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_11;
    goto LABEL_10;
  }
  v5 = 0;
  if (a3)
LABEL_10:
    *a3 = objc_retainAutorelease(v5);
LABEL_11:
  if (v5)
  {
    MSPGetSharedTripLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 138412290;
      *(_QWORD *)&v11[4] = v5;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_ERROR, "[Sender] invalid navigation state for sharing: %@", v11, 0xCu);
    }

  }
  return v5 == 0;
}

- (void)_setState:(id)a3 forEvent:(unint64_t)a4
{
  MSPSenderMinimalStrategy *minimalSender;
  id v7;

  if (a3)
  {
    minimalSender = self->_minimalSender;
    v7 = a3;
    -[MSPSenderIDSStrategy setState:forEvent:](minimalSender, "setState:forEvent:", v7, a4);
    -[MSPSenderIDSStrategy setState:forEvent:](self->_liveSender, "setState:forEvent:", v7, a4);
    -[MSPSenderMessageStrategy setState:forEvent:](self->_iMessageSender, "setState:forEvent:", v7, a4);
    -[MSPSenderMessageStrategy setState:forEvent:](self->_smsSender, "setState:forEvent:", v7, a4);
    -[MSPSenderIDSStrategy setState:forEvent:](self->_virtualMinimalSender, "setState:forEvent:", v7, a4);
    -[MSPSenderIDSStrategy setState:forEvent:](self->_virtualLiveSender, "setState:forEvent:", v7, a4);
    -[MSPSenderMessageStrategy setState:forEvent:](self->_virtualiMessageSender, "setState:forEvent:", v7, a4);
    -[MSPSenderMessageStrategy setState:forEvent:](self->_virtualSMSSender, "setState:forEvent:", v7, a4);

  }
}

- (id)rulesForParticipant:(id)a3
{
  return -[MSPSharedTripStorageController sendingRulesForIdentifier:](self->_storageController, "sendingRulesForIdentifier:", a3);
}

- (void)touchedRules
{
  -[MSPSharedTripStorageController sendingRulesTouched](self->_storageController, "sendingRulesTouched");
}

- (void)navigationListenerWaypointsUpdated:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 3);
    -[MSPSenderETAController _updateStorage](self, "_updateStorage");
    v4 = v5;
  }

}

- (void)navigationListenerIsReady:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 0);
    -[MSPSenderETAController _updateStorage](self, "_updateStorage");
    v4 = v5;
  }

}

- (void)navigationListenerETAUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 2);

}

- (void)navigationListenerLocationUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 4);

}

- (void)navigationListenerRouteUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 5);

}

- (void)navigationListenerTrafficUpdated:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 6);

}

- (void)navigationListenerArrived:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 7);

}

- (void)navigationListenerResumed:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 8);

}

- (void)navigationListenerStopped:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSenderETAController _setState:forEvent:](self, "_setState:forEvent:", v4, 9);
  -[MSPSenderETAController stopSharingWithReason:error:](self, "stopSharingWithReason:error:", 0, 0);

}

- (void)groupSession:(id)a3 participantDidJoin:(id)a4
{
  id v5;
  NSObject *v6;
  MSPSenderLiveStrategy *liveSender;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Sender] new stream participants %@", buf, 0xCu);
  }

  if (v5)
  {
    liveSender = self->_liveSender;
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSenderLiveStrategy addParticipants:](liveSender, "addParticipants:", v8);

    -[MSPSenderETAController _updateStorage](self, "_updateStorage");
    -[MSPSenderETAController _invalidateActiveHandles](self, "_invalidateActiveHandles");
  }

}

- (void)groupSession:(id)a3 participantDidLeave:(id)a4
{
  id v5;
  NSObject *v6;
  MSPSenderLiveStrategy *liveSender;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[Sender] new stream participants %@", buf, 0xCu);
  }

  if (v5)
  {
    liveSender = self->_liveSender;
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPSenderLiveStrategy removeParticipants:](liveSender, "removeParticipants:", v8);

    -[MSPSenderETAController _updateStorage](self, "_updateStorage");
    -[MSPSenderETAController _invalidateActiveHandles](self, "_invalidateActiveHandles");
  }

}

- (void)groupSessionEnded:(id)a3 withError:(id)a4
{
  id v5;

  v5 = a4;
  -[MSPSenderETAController stopSharingWithReason:error:](self, "stopSharingWithReason:error:", 0, 0);
  -[MSPSenderETAController _invalidateSharedTripWithError:](self, "_invalidateSharedTripWithError:", v5);

}

- (MSPSenderETAControllerDelegate)delegate
{
  return (MSPSenderETAControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_virtualSMSSender, 0);
  objc_storeStrong((id *)&self->_virtualiMessageSender, 0);
  objc_storeStrong((id *)&self->_virtualLiveSender, 0);
  objc_storeStrong((id *)&self->_virtualMinimalSender, 0);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_sessionStorage, 0);
  objc_storeStrong((id *)&self->_smsSender, 0);
  objc_storeStrong((id *)&self->_iMessageSender, 0);
  objc_storeStrong((id *)&self->_liveSender, 0);
  objc_storeStrong((id *)&self->_minimalSender, 0);
  objc_storeStrong((id *)&self->_groupSession, 0);
  objc_destroyWeak((id *)&self->_idsRelay);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
