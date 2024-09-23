@implementation HFSetupAutomaticDiscoveryPairingController

+ (BOOL)supportsSetupPayloadRetry
{
  return 0;
}

- (HFSetupAutomaticDiscoveryPairingController)initWithContext:(id)a3
{
  id v5;
  HFSetupAutomaticDiscoveryPairingController *v6;
  HFSetupAutomaticDiscoveryPairingController *v7;
  uint64_t v8;
  NSDate *phaseStartDate;
  NAFuture *v10;
  NAFuture *pairingFuture;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFSetupAutomaticDiscoveryPairingController;
  v6 = -[HFSetupAutomaticDiscoveryPairingController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_phase = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    phaseStartDate = v7->_phaseStartDate;
    v7->_phaseStartDate = (NSDate *)v8;

    v10 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    pairingFuture = v7->_pairingFuture;
    v7->_pairingFuture = v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_accessoryNotFoundSoftTimeoutTimer, "invalidate");
  -[NSTimer invalidate](self->_accessoryNotFoundFatalTimeoutTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HFSetupAutomaticDiscoveryPairingController;
  -[HFSetupAutomaticDiscoveryPairingController dealloc](&v3, sel_dealloc);
}

- (void)setPhase:(unint64_t)a3
{
  unint64_t phase;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  id v25;
  id v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  HFSetupAutomaticDiscoveryPairingController *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  phase = self->_phase;
  if (phase != a3)
  {
    -[HFSetupAutomaticDiscoveryPairingController _assertValidTransitionFromPhase:toPhase:](self, "_assertValidTransitionFromPhase:toPhase:", self->_phase, a3);
    HFLogForCategory(0x3AuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", phase);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = self;
      v49 = 2112;
      v50 = v7;
      v51 = 2112;
      v52 = v8;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Transitioning phase: %@ -> %@", buf, 0x20u);

    }
    self->_phase = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupAutomaticDiscoveryPairingController setPhaseStartDate:](self, "setPhaseStartDate:", v9);

    -[HFSetupAutomaticDiscoveryPairingController accessoryNotFoundSoftTimeoutTimer](self, "accessoryNotFoundSoftTimeoutTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[HFSetupAutomaticDiscoveryPairingController setAccessoryNotFoundSoftTimeoutTimer:](self, "setAccessoryNotFoundSoftTimeoutTimer:", 0);
    -[HFSetupAutomaticDiscoveryPairingController accessoryNotFoundFatalTimeoutTimer](self, "accessoryNotFoundFatalTimeoutTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[HFSetupAutomaticDiscoveryPairingController setAccessoryNotFoundFatalTimeoutTimer:](self, "setAccessoryNotFoundFatalTimeoutTimer:", 0);
    if (a3 == 2)
    {
      objc_initWeak((id *)buf, self);
      v12 = (void *)MEMORY[0x1E0C99E88];
      +[HFSetupPairingControllerUtilities accessoryDiscoverySoftTimeout](HFSetupPairingControllerUtilities, "accessoryDiscoverySoftTimeout");
      v14 = v13;
      v15 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke;
      v44[3] = &unk_1EA7316A0;
      objc_copyWeak(&v45, (id *)buf);
      objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, v44, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFSetupAutomaticDiscoveryPairingController setAccessoryNotFoundSoftTimeoutTimer:](self, "setAccessoryNotFoundSoftTimeoutTimer:", v16);

      v17 = (void *)MEMORY[0x1E0C99E88];
      +[HFSetupPairingControllerUtilities accessoryDiscoveryFatalTimeout](HFSetupPairingControllerUtilities, "accessoryDiscoveryFatalTimeout");
      v19 = v18;
      v42[0] = v15;
      v42[1] = 3221225472;
      v42[2] = __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke_7;
      v42[3] = &unk_1EA7316A0;
      objc_copyWeak(&v43, (id *)buf);
      objc_msgSend(v17, "scheduledTimerWithTimeInterval:repeats:block:", 0, v42, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFSetupAutomaticDiscoveryPairingController setAccessoryNotFoundFatalTimeoutTimer:](self, "setAccessoryNotFoundFatalTimeoutTimer:", v20);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
  }
  -[HFSetupAutomaticDiscoveryPairingController statusTitle](self, "statusTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAutomaticDiscoveryPairingController statusDescription](self, "statusDescription");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAutomaticDiscoveryPairingController _updateStatusTextAndNotifyDelegate:](self, "_updateStatusTextAndNotifyDelegate:", 0);
  -[HFSetupAutomaticDiscoveryPairingController statusTitle](self, "statusTitle");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  v37 = v23;
  if (v22 == v23)
  {

    goto LABEL_11;
  }
  if (v22)
  {
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_15;
LABEL_11:
    -[HFSetupAutomaticDiscoveryPairingController statusDescription](self, "statusDescription");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v36;
    if (v25 == v26)
    {
      v27 = 0;
    }
    else if (v25)
    {
      v27 = objc_msgSend(v25, "isEqual:", v26) ^ 1;
    }
    else
    {
      v27 = 1;
    }

    if (((phase != a3) | v27) != 1)
      goto LABEL_29;
    goto LABEL_19;
  }

LABEL_15:
LABEL_19:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HFSetupAutomaticDiscoveryPairingController pairingObservers](self, "pairingObservers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v33 = self->_phase;
          -[HFSetupAutomaticDiscoveryPairingController statusTitle](self, "statusTitle");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFSetupAutomaticDiscoveryPairingController statusDescription](self, "statusDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "pairingController:didTransitionToPhase:statusTitle:statusDescription:", self, v33, v34, v35);

        }
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v29);
  }

LABEL_29:
}

void __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t buf[4];
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x3AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v5 = WeakRetained;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "Accessory not found soft timeout timer fired %@", buf, 0xCu);
  }

  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "phase") == 2)
    {
      objc_msgSend(WeakRetained, "_updateStatusTextAndNotifyDelegate:", 1);
    }
    else
    {
      +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", objc_msgSend(WeakRetained, "phase"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("The 'accessory not found' soft timeout timer should only fire if we remain in the 'discoverAccessories' phase for too long, but instead, we're in the %@ phase"), v3);

    }
  }

}

void __55__HFSetupAutomaticDiscoveryPairingController_setPhase___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x3AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "Accessory not found fatal timeout timer fired", buf, 2u);
  }

  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "phase") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_mappedHMError:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setupAccessoryDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCancellationReason:", v4);

      v7 = (id)objc_msgSend(WeakRetained, "_sendCancellationRequestToHomeKit");
      objc_msgSend(WeakRetained, "_failPairingWithError:", v3);
    }
    else
    {
      +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", objc_msgSend(WeakRetained, "phase"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("The 'accessory not found' fatal timeout timer should only fire if we remain in the 'discoverAccessories' phase for too long, but instead, we're in the %@ phase"), v3);
    }

  }
}

- (void)setSetupResult:(id)a3
{
  HFSetupAccessoryResult *v5;
  NSObject *v6;
  HFSetupAccessoryResult *setupResult;
  HFSetupAccessoryResult *v8;
  HFDiscoveredAccessory *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HFDiscoveredAccessory *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  HFSetupAccessoryResult *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (HFSetupAccessoryResult *)a3;
  HFLogForCategory(0x3AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Received setup result: %@", buf, 0xCu);
  }

  if (-[HFSetupAutomaticDiscoveryPairingController phase](self, "phase"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", -[HFSetupAutomaticDiscoveryPairingController phase](self, "phase"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupAutomaticDiscoveryPairingController.m"), 128, CFSTR("HFSetupAutomaticDiscoveryPairingController can't handle changing the setup result (payload) after pairing has already started. Set the setup result before calling -startWithHome:, and create a new pairing controller if you need to change it later. Current phase = %@"), v17);

  }
  if (!-[HFSetupAccessoryResult isValidForPairing](v5, "isValidForPairing"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupAutomaticDiscoveryPairingController.m"), 130, CFSTR("HFSetupAutomaticDiscoveryPairingController only works with setup results (payloads) containing a setup ID or an error, not old ones that only have a setup code."));

  }
  setupResult = self->_setupResult;
  self->_setupResult = v5;
  v8 = v5;

  v9 = [HFDiscoveredAccessory alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAccessoryResult setupPayload](v8, "setupPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessoryName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAccessoryResult setupPayload](v8, "setupPayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "category");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFDiscoveredAccessory initWithAccessoryUUID:accessoryName:accessoryCategory:](v9, "initWithAccessoryUUID:accessoryName:accessoryCategory:", v10, v12, v14);
  -[HFSetupAutomaticDiscoveryPairingController setDiscoveredAccessoryToPair:](self, "setDiscoveredAccessoryToPair:", v15);

}

- (void)addPairingObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HFSetupAutomaticDiscoveryPairingController pairingObservers](self, "pairingObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupAutomaticDiscoveryPairingController setPairingObservers:](self, "setPairingObservers:", v6);

  }
  -[HFSetupAutomaticDiscoveryPairingController pairingObservers](self, "pairingObservers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removePairingObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFSetupAutomaticDiscoveryPairingController pairingObservers](self, "pairingObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", -[HFSetupAutomaticDiscoveryPairingController phase](self, "phase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("phase"));

  -[HFSetupAutomaticDiscoveryPairingController setupResult](self, "setupResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("setupResult"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)startWithHome:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HFSetupAutomaticDiscoveryPairingController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  HFSetupAutomaticDiscoveryPairingController *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x3AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Request to start pairing controller: %@ with home: %@", buf, 0x16u);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupAutomaticDiscoveryPairingController.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  -[HFSetupAutomaticDiscoveryPairingController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupAccessoryDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupAutomaticDiscoveryPairingController.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.context.setupAccessoryDescription"));

  }
  -[HFSetupAutomaticDiscoveryPairingController setHome:](self, "setHome:", v5);
  -[HFSetupAutomaticDiscoveryPairingController setupResult](self, "setupResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HFSetupAutomaticDiscoveryPairingController setPhase:](self, "setPhase:", 9);
  }
  else
  {
    -[HFSetupAutomaticDiscoveryPairingController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setupAccessoryDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupAutomaticDiscoveryPairingController setupResult](self, "setupResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setupPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateWithSetupAccessoryPayload:", v14);

    -[HFSetupAutomaticDiscoveryPairingController setPhase:](self, "setPhase:", 2);
    HFLogForCategory(0x3AuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HFSetupAutomaticDiscoveryPairingController context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setupAccessoryDescription");
      v17 = (HFSetupAutomaticDiscoveryPairingController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "HFSetupAutomaticDiscoveryPairingController startPairing with description: %@", buf, 0xCu);

    }
    -[HFSetupAutomaticDiscoveryPairingController home](self, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupAutomaticDiscoveryPairingController context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setupAccessoryDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = self;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke;
    v24[3] = &unk_1EA7277A0;
    v24[4] = self;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_36;
    v23[3] = &unk_1EA7316C8;
    objc_msgSend(v18, "startPairingWithAccessoryDescription:progress:completion:", v20, v24, v23);

  }
}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2;
  block[3] = &unk_1EA727778;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "phase");
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSetupAccessoryDescription:", v3);

  v5 = *(_QWORD *)(a1 + 48);
  v6 = objc_msgSend(*(id *)(a1 + 32), "phase");
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryToPair");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setupResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", +[HFSetupPairingControllerUtilities processFirstPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:](HFSetupPairingControllerUtilities, "processFirstPartyAccessorySetupProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:", v5, v6, v7, v8, v9, v10, objc_opt_class()));

  HFLogForCategory(0x3AuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", v2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 32), "phase");
    +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", objc_msgSend(*(id *)(a1 + 32), "phase"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413570;
    v18 = v12;
    v19 = 2048;
    v20 = v2;
    v21 = 2112;
    v22 = v13;
    v23 = 2048;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    v27 = 2048;
    v28 = v16;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%@ pairing phase transition %ld (%@) -> %ld (%@).  Progress: %ld", buf, 0x3Eu);

  }
}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_36(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2_37;
  v13[3] = &unk_1EA7271B0;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __60__HFSetupAutomaticDiscoveryPairingController_startWithHome___block_invoke_2_37(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "phase") == 9)
  {
    HFLogForCategory(0x3AuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 40);
      v14 = 138412290;
      v15 = v12;
      _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "HFSetupAutomaticDiscoveryPairingController startPairing finished with error: %@, but pairing is already in a failed state, so ignoring completion. Maybe cancelling the pairing operation failed.", (uint8_t *)&v14, 0xCu);
    }
LABEL_4:

    return;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    HFLogForCategory(0x3AuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 40);
      v14 = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "HFSetupAutomaticDiscoveryPairingController startPairing finished with error: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_failPairingWithError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "count");
    HFLogForCategory(0x3AuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "HFSetupAutomaticDiscoveryPairingController startPairing finished with error: nil but no paired accessories; tr"
          "eating as a failure",
          (uint8_t *)&v14,
          2u);
      }

      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_failPairingWithError:", v2);
      goto LABEL_4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HFSetupAutomaticDiscoveryPairingController startPairing finished with accessories: %@ info: %@", (uint8_t *)&v14, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_finishPairingWithAccessories:completedInfo:", v10, *(_QWORD *)(a1 + 56));

  }
}

- (id)cancel
{
  NSObject *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HFSetupAutomaticDiscoveryPairingController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[HFSetupPairingControllerUtilities isPairingPhaseIdle:](HFSetupPairingControllerUtilities, "isPairingPhaseIdle:", -[HFSetupAutomaticDiscoveryPairingController phase](self, "phase")))
  {
    HFLogForCategory(0x3AuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@, but we're already in an idle state, so ignoring", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupAutomaticDiscoveryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStatus:error:", 3, v5);

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_mappedHMError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupAutomaticDiscoveryPairingController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupAccessoryDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCancellationReason:", v7);

    -[HFSetupAutomaticDiscoveryPairingController _sendCancellationRequestToHomeKit](self, "_sendCancellationRequestToHomeKit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupAutomaticDiscoveryPairingController setPhase:](self, "setPhase:", 9);

    return v10;
  }
}

- (id)_sendCancellationRequestToHomeKit
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[2];
  uint8_t buf[4];
  HFSetupAutomaticDiscoveryPairingController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x3AuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@", buf, 0xCu);
  }

  v4 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke;
  v16[3] = &unk_1EA7268C8;
  v16[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_2;
  v15[3] = &unk_1EA726968;
  v15[4] = self;
  v6 = (id)objc_msgSend(v5, "addFailureBlock:", v15);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_42;
  v14[3] = &unk_1EA726338;
  v14[4] = self;
  v7 = (id)objc_msgSend(v5, "addSuccessBlock:", v14);
  v8 = (void *)MEMORY[0x1E0D519C0];
  -[HFSetupAutomaticDiscoveryPairingController pairingFuture](self, "pairingFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "combineAllFutures:ignoringErrors:scheduler:", v10, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setupAccessoryDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelPairingForAccessoryWithDescription:completionHandler:", v6, v4);

}

void __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3AuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel pairing for pairing controller: (%@). Error: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "pairingFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithNoResult");

}

void __79__HFSetupAutomaticDiscoveryPairingController__sendCancellationRequestToHomeKit__block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x3AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Cancel done for pairing controller: (%@)", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "pairingFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithNoResult");

}

- (void)_failPairingWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  HFSetupAutomaticDiscoveryPairingController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HFSetupAutomaticDiscoveryPairingController phase](self, "phase") != 9)
  {
    HFLogForCategory(0x3AuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = self;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed pairing with error: %@ (%@)", (uint8_t *)&v8, 0x16u);
    }

    -[HFSetupAutomaticDiscoveryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStatus:error:", 3, v4);

    -[HFSetupAutomaticDiscoveryPairingController setPhase:](self, "setPhase:", 9);
    -[HFSetupAutomaticDiscoveryPairingController pairingFuture](self, "pairingFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v4);

  }
}

- (void)_finishPairingWithAccessories:(id)a3 completedInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  HFSetupAutomaticDiscoveryPairingController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x3AuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_prettyDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Finished pairing with accessories: %@ & info: %@ (%@)", (uint8_t *)&v11, 0x20u);

  }
  -[HFSetupAutomaticDiscoveryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateStatus:error:", 2, 0);

  -[HFSetupAutomaticDiscoveryPairingController setPairedAccessories:](self, "setPairedAccessories:", v6);
  -[HFSetupAutomaticDiscoveryPairingController setCompletedInfo:](self, "setCompletedInfo:", v7);
  -[HFSetupAutomaticDiscoveryPairingController setPhase:](self, "setPhase:", 10);

}

- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = 0;
  v5 = -[HFSetupAutomaticDiscoveryPairingController phase](self, "phase");
  -[HFSetupAutomaticDiscoveryPairingController phaseStartDate](self, "phaseStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAutomaticDiscoveryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAutomaticDiscoveryPairingController setupResult](self, "setupResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupAutomaticDiscoveryPairingController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetupPairingControllerUtilities getStatusTitle:statusDescription:forPairingPhase:phaseStartDate:discoveredAccessory:setupResult:context:setupError:](HFSetupPairingControllerUtilities, "getStatusTitle:statusDescription:forPairingPhase:phaseStartDate:discoveredAccessory:setupResult:context:setupError:", &v29, &v28, v5, v6, v7, v8, v9, 0);
  v10 = v29;
  v11 = v28;

  -[HFSetupAutomaticDiscoveryPairingController setStatusTitle:](self, "setStatusTitle:", v10);
  -[HFSetupAutomaticDiscoveryPairingController setStatusDescription:](self, "setStatusDescription:", v11);
  HFLogForCategory(0x3AuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Updating status title: \"%@\" description: \"%@\", buf, 0x16u);
  }

  if (v3)
  {
    v22 = v11;
    v23 = v10;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[HFSetupAutomaticDiscoveryPairingController pairingObservers](self, "pairingObservers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v19 = -[HFSetupAutomaticDiscoveryPairingController phase](self, "phase");
            -[HFSetupAutomaticDiscoveryPairingController statusTitle](self, "statusTitle");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFSetupAutomaticDiscoveryPairingController statusDescription](self, "statusDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "pairingController:didTransitionToPhase:statusTitle:statusDescription:", self, v19, v20, v21);

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v15);
    }

    v11 = v22;
    v10 = v23;
  }

}

- (void)_assertValidTransitionFromPhase:(unint64_t)a3 toPhase:(unint64_t)a4
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (a4 - 6 >= 4)
  {
    switch(a3)
    {
      case 0uLL:
        if (a4 != 2)
          goto LABEL_11;
        return;
      case 2uLL:
        if (a4 > 0xA)
          goto LABEL_11;
        v8 = 1 << a4;
        v9 = 1048;
        goto LABEL_9;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
        if (a4 <= 0xA)
        {
          v8 = 1 << a4;
          v9 = 1060;
LABEL_9:
          if ((v8 & v9) != 0)
            return;
        }
        goto LABEL_11;
      default:
LABEL_11:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupAutomaticDiscoveryPairingController.m"), 344, CFSTR("Invalid phase transition: %@ -> %@"), v10, v11);

        break;
    }
  }
}

- (HFSetupPairingContext)context
{
  return self->_context;
}

- (HFSetupAccessoryResult)setupResult
{
  return self->_setupResult;
}

- (HMAccessorySetupCompletedInfo)completedInfo
{
  return self->_completedInfo;
}

- (void)setCompletedInfo:(id)a3
{
  objc_storeStrong((id *)&self->_completedInfo, a3);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (NSString)statusTitle
{
  return self->_statusTitle;
}

- (void)setStatusTitle:(id)a3
{
  objc_storeStrong((id *)&self->_statusTitle, a3);
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
  objc_storeStrong((id *)&self->_statusDescription, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFDiscoveredAccessory)discoveredAccessoryToPair
{
  return self->_discoveredAccessoryToPair;
}

- (void)setDiscoveredAccessoryToPair:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, a3);
}

- (NSSet)pairedAccessories
{
  return self->_pairedAccessories;
}

- (void)setPairedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAccessories, a3);
}

- (NSHashTable)pairingObservers
{
  return self->_pairingObservers;
}

- (void)setPairingObservers:(id)a3
{
  objc_storeStrong((id *)&self->_pairingObservers, a3);
}

- (NAFuture)pairingFuture
{
  return self->_pairingFuture;
}

- (void)setPairingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_pairingFuture, a3);
}

- (NSDate)phaseStartDate
{
  return self->_phaseStartDate;
}

- (void)setPhaseStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_phaseStartDate, a3);
}

- (NSTimer)accessoryNotFoundFatalTimeoutTimer
{
  return self->_accessoryNotFoundFatalTimeoutTimer;
}

- (void)setAccessoryNotFoundFatalTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNotFoundFatalTimeoutTimer, a3);
}

- (NSTimer)accessoryNotFoundSoftTimeoutTimer
{
  return self->_accessoryNotFoundSoftTimeoutTimer;
}

- (void)setAccessoryNotFoundSoftTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryNotFoundSoftTimeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryNotFoundSoftTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_accessoryNotFoundFatalTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_phaseStartDate, 0);
  objc_storeStrong((id *)&self->_pairingFuture, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
