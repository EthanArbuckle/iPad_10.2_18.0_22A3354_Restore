@implementation HFSetupSingleAccessoryPairingController

+ (BOOL)supportsSetupPayloadRetry
{
  return 1;
}

- (HFSetupSingleAccessoryPairingController)initWithContext:(id)a3 discoveredAccessory:(id)a4
{
  id v7;
  id v8;
  HFSetupSingleAccessoryPairingController *v9;
  HFSetupSingleAccessoryPairingController *v10;
  void *v11;
  uint64_t v12;
  NSDate *phaseStartDate;
  NAFuture *v14;
  NAFuture *pairingFuture;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFSetupSingleAccessoryPairingController;
  v9 = -[HFSetupSingleAccessoryPairingController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_discoveredAccessoryToPair, a4);
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](v10, "discoveredAccessoryToPair");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_accessoryRequiresCode = objc_msgSend(v11, "requiresSetupCode");

    v10->_phase = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    phaseStartDate = v10->_phaseStartDate;
    v10->_phaseStartDate = (NSDate *)v12;

    v14 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    pairingFuture = v10->_pairingFuture;
    v10->_pairingFuture = v14;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addHomeObserver:", v10);

  }
  return v10;
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
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  HFSetupSingleAccessoryPairingController *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  phase = self->_phase;
  if (phase != a3)
  {
    -[HFSetupSingleAccessoryPairingController _assertValidTransitionFromPhase:toPhase:](self, "_assertValidTransitionFromPhase:toPhase:", self->_phase, a3);
    HFLogForCategory(0x3AuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", phase);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = self;
      v37 = 2112;
      v38 = v7;
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Transitioning phase: %@ -> %@", buf, 0x20u);

    }
    self->_phase = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupSingleAccessoryPairingController setPhaseStartDate:](self, "setPhaseStartDate:", v9);

  }
  -[HFSetupSingleAccessoryPairingController statusTitle](self, "statusTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupSingleAccessoryPairingController statusDescription](self, "statusDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupSingleAccessoryPairingController _updateStatusTextAndNotifyDelegate:](self, "_updateStatusTextAndNotifyDelegate:", 0);
  -[HFSetupSingleAccessoryPairingController statusTitle](self, "statusTitle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  v14 = v13;
  v29 = v11;
  if (v12 == v13)
  {

    goto LABEL_10;
  }
  if (v12)
  {
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if (!v15)
      goto LABEL_14;
LABEL_10:
    -[HFSetupSingleAccessoryPairingController statusDescription](self, "statusDescription");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    if (v16 == v17)
    {
      v18 = 0;
    }
    else if (v16)
    {
      v18 = objc_msgSend(v16, "isEqual:", v17) ^ 1;
    }
    else
    {
      v18 = 1;
    }

    if (phase == a3 && !v18)
      goto LABEL_29;
    goto LABEL_19;
  }

LABEL_14:
LABEL_19:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HFSetupSingleAccessoryPairingController pairingObservers](self, "pairingObservers", v14, v29, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v25 = self->_phase;
          -[HFSetupSingleAccessoryPairingController statusTitle](self, "statusTitle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFSetupSingleAccessoryPairingController statusDescription](self, "statusDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "pairingController:didTransitionToPhase:statusTitle:statusDescription:", self, v25, v26, v27);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  v14 = v28;
LABEL_29:

}

- (void)setSetupResult:(id)a3
{
  id v5;
  HFSetupAccessoryResult **p_setupResult;
  HFSetupAccessoryResult *setupResult;
  HFSetupAccessoryResult *v8;
  HFSetupAccessoryResult *v9;
  HFSetupAccessoryResult *v10;
  char v11;
  NSObject *v12;
  void *v13;
  HFSetupSingleAccessoryPairingController *v14;
  uint64_t v15;
  NSObject *v16;
  HFSetupAccessoryResult *v17;
  int v18;
  HFSetupAccessoryResult *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_setupResult = &self->_setupResult;
  setupResult = self->_setupResult;
  v8 = (HFSetupAccessoryResult *)v5;
  v9 = setupResult;
  if (v9 == v8)
  {

  }
  else
  {
    v10 = v9;
    if (v8)
    {
      v11 = -[HFSetupAccessoryResult isEqual:](v8, "isEqual:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_setupResult, a3);
    HFLogForCategory(0x3AuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "Received setup result: %@", (uint8_t *)&v18, 0xCu);
    }

    if (*p_setupResult)
    {
      if (-[HFSetupSingleAccessoryPairingController phase](self, "phase") == 1)
      {
        -[HFSetupAccessoryResult error](*p_setupResult, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = self;
        if (!v13)
        {
          -[HFSetupSingleAccessoryPairingController _tryPairing](self, "_tryPairing");
          goto LABEL_20;
        }
        v15 = 9;
        goto LABEL_15;
      }
      HFLogForCategory(0x3AuLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", -[HFSetupSingleAccessoryPairingController phase](self, "phase"));
        v17 = (HFSetupAccessoryResult *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Received setup code, but we're still in the %@ phase. Waiting until we're ready to handle the setup code before calling -_tryPairing", (uint8_t *)&v18, 0xCu);

      }
    }
    else if (!+[HFSetupPairingControllerUtilities isPairingPhaseIdle:](HFSetupPairingControllerUtilities, "isPairingPhaseIdle:", -[HFSetupSingleAccessoryPairingController phase](self, "phase")))
    {
      v14 = self;
      v15 = 1;
LABEL_15:
      -[HFSetupSingleAccessoryPairingController setPhase:](v14, "setPhase:", v15);
    }
  }
LABEL_20:

}

- (void)addPairingObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HFSetupSingleAccessoryPairingController pairingObservers](self, "pairingObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupSingleAccessoryPairingController setPairingObservers:](self, "setPairingObservers:", v6);

  }
  -[HFSetupSingleAccessoryPairingController pairingObservers](self, "pairingObservers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removePairingObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFSetupSingleAccessoryPairingController pairingObservers](self, "pairingObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)startWithHome:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HFSetupSingleAccessoryPairingController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFSetupSingleAccessoryPairingController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  HFSetupSingleAccessoryPairingController *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x3AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = self;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Request to start pairing controller: %@ with home: %@", buf, 0x16u);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupSingleAccessoryPairingController.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  -[HFSetupSingleAccessoryPairingController setHome:](self, "setHome:", v5);
  -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HFSetupSingleAccessoryPairingController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setupAccessoryDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithAccessory:", v8);

    HFLogForCategory(0x3AuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HFSetupSingleAccessoryPairingController context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setupAccessoryDescription");
      v13 = (HFSetupSingleAccessoryPairingController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "HFSetupSingleAccessoryPairingController startPairing with description: %@", buf, 0xCu);

    }
    -[HFSetupSingleAccessoryPairingController home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupSingleAccessoryPairingController context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setupAccessoryDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke;
    v25[3] = &unk_1EA7277A0;
    v25[4] = self;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_14;
    v23[3] = &unk_1EA7277F0;
    v23[4] = self;
    v24 = v8;
    objc_msgSend(v14, "startPairingWithAccessoryDescription:progress:completion:", v16, v25, v23);

  }
  -[HFSetupSingleAccessoryPairingController setupResult](self, "setupResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else if (-[HFSetupSingleAccessoryPairingController accessoryRequiresCode](self, "accessoryRequiresCode"))
  {
    v18 = self;
    v19 = 1;
    goto LABEL_15;
  }
  -[HFSetupSingleAccessoryPairingController setupResult](self, "setupResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = self;
  if (!v21)
  {
    -[HFSetupSingleAccessoryPairingController _tryPairing](self, "_tryPairing");
    goto LABEL_17;
  }
  v19 = 9;
LABEL_15:
  -[HFSetupSingleAccessoryPairingController setPhase:](v18, "setPhase:", v19);
LABEL_17:

}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2;
  block[3] = &unk_1EA727778;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2(uint64_t a1)
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

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2_15;
  block[3] = &unk_1EA727078;
  v10 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v7;
  v17 = v8;
  v18 = v10;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_2_15(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "phase") == 9)
  {
    HFLogForCategory(0x3AuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "HFSetupSingleAccessoryPairingController startPairing finished with error: %@, but pairing is already in a failed state, so ignoring completion. Maybe cancelling the pairing operation failed.", buf, 0xCu);
    }
LABEL_8:

    return;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    HFLogForCategory(0x3AuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "HFSetupSingleAccessoryPairingController startPairing finished with error: %@", buf, 0xCu);
    }

    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "discoveredAccessoryToPair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_failPairingWithDiscoveredAccessory:error:", v6, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "pairingFuture");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject finishWithError:](v2, "finishWithError:", *(_QWORD *)(a1 + 40));
    goto LABEL_8;
  }
  v7 = objc_msgSend(*(id *)(a1 + 48), "count");
  HFLogForCategory(0x3AuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v27 = v10;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "HFSetupSingleAccessoryPairingController startPairing finished with accessories: %@ info: %@", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_finishPairingWithAccessories:completedInfo:", v13, *(_QWORD *)(a1 + 56));

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_18;
    v23 = &unk_1EA7277C8;
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(id *)(a1 + 64);
    objc_msgSend(v14, "dispatchHomeObserverMessage:sender:", &v20, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "pairingFuture", v20, v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NAEmptyResult();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithResult:", v16);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "HFSetupSingleAccessoryPairingController startPairing finished with error: nil but no paired accessories; treating as a failure",
        buf,
        2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "pairingFuture");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finishWithError:", v18);

  }
}

void __57__HFSetupSingleAccessoryPairingController_startWithHome___block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didAddAccessory:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (id)cancel
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  HFSetupSingleAccessoryPairingController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[2];
  uint8_t buf[4];
  HFSetupSingleAccessoryPairingController *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = +[HFSetupPairingControllerUtilities isPairingPhaseIdle:](HFSetupPairingControllerUtilities, "isPairingPhaseIdle:", -[HFSetupSingleAccessoryPairingController phase](self, "phase"));
  HFLogForCategory(0x3AuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@, but we're already in an idle state, so ignoring", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
      v7 = (HFSetupSingleAccessoryPairingController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Cancel requested for accessory: (%@)", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateStatus:error:", 3, v9);

    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke;
      v24[3] = &unk_1EA7268C8;
      v24[4] = self;
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      v23[1] = 3221225472;
      v23[2] = __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_2;
      v23[3] = &unk_1EA726968;
      v23[4] = self;
      v14 = (id)objc_msgSend(v13, "addFailureBlock:", v23);
      v22[0] = v12;
      v22[1] = 3221225472;
      v22[2] = __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_25;
      v22[3] = &unk_1EA726338;
      v22[4] = self;
      v15 = (id)objc_msgSend(v13, "addSuccessBlock:", v22);
      v16 = (void *)MEMORY[0x1E0D519C0];
      -[HFSetupSingleAccessoryPairingController pairingFuture](self, "pairingFuture");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      v25[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "combineAllFutures:ignoringErrors:scheduler:", v18, 1, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v20;
    }
    -[HFSetupSingleAccessoryPairingController setPhase:](self, "setPhase:", 9);
  }
  return v6;
}

void __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryToPair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelPairingForAccessoryWithUUID:completionHandler:", v6, v4);

}

void __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3AuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryToPair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to cancel pairing for accessory: (%@). Error: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "pairingFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithNoResult");

}

void __49__HFSetupSingleAccessoryPairingController_cancel__block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x3AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "discoveredAccessoryToPair");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Cancel done for accessory: (%@)", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "pairingFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithNoResult");

}

- (void)_tryPairing
{
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x3AuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HFSetupSingleAccessoryPairingController accessoryRequiresCode](self, "accessoryRequiresCode"))
      v6 = CFSTR("requires");
    else
      v6 = CFSTR("does not require");
    -[HFSetupSingleAccessoryPairingController setupResult](self, "setupResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setupPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v5;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Trying to pair with accessory: %@ (%@ code) payload: %@", buf, 0x20u);

  }
  -[HFSetupSingleAccessoryPairingController setupResult](self, "setupResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isValidForPairing") & 1) != 0)
    goto LABEL_7;
  v10 = -[HFSetupSingleAccessoryPairingController accessoryRequiresCode](self, "accessoryRequiresCode");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupSingleAccessoryPairingController.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.setupResult.isValidForPairing || !self.accessoryRequiresCode"));
LABEL_7:

  }
  -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupSingleAccessoryPairingController.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.discoveredAccessoryToPair"));

  }
  -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateStatus:error:", 1, 0);

  -[HFSetupSingleAccessoryPairingController setPhase:](self, "setPhase:", 4);
  HFLogForCategory(0x3AuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v15;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Trying to pair with accessory: %@. Calling -continuePairing.", buf, 0xCu);

  }
  if (-[HFSetupSingleAccessoryPairingController accessoryRequiresCode](self, "accessoryRequiresCode"))
  {
    objc_initWeak((id *)buf, self);
    -[HFSetupSingleAccessoryPairingController home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupSingleAccessoryPairingController setupResult](self, "setupResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setupPayload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setupCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rawSetupPayloadString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __54__HFSetupSingleAccessoryPairingController__tryPairing__block_invoke;
    v25[3] = &unk_1EA727818;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v16, "continuePairingForAccessoryWithUUID:setupCode:onboardingSetupPayloadString:completionHandler:", v18, v21, v23, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

void __54__HFSetupSingleAccessoryPairingController__tryPairing__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(WeakRetained, "discoveredAccessoryToPair");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_failPairingWithDiscoveredAccessory:error:", v4, v5);

  }
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
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = 0;
  v5 = -[HFSetupSingleAccessoryPairingController phase](self, "phase");
  -[HFSetupSingleAccessoryPairingController phaseStartDate](self, "phaseStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupSingleAccessoryPairingController setupResult](self, "setupResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSetupSingleAccessoryPairingController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetupPairingControllerUtilities getStatusTitle:statusDescription:forPairingPhase:phaseStartDate:discoveredAccessory:setupResult:context:setupError:](HFSetupPairingControllerUtilities, "getStatusTitle:statusDescription:forPairingPhase:phaseStartDate:discoveredAccessory:setupResult:context:setupError:", &v38, &v37, v5, v6, v7, v8, v9, 0);
  v10 = v38;
  v11 = v37;

  -[HFSetupSingleAccessoryPairingController statusTitle](self, "statusTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  v14 = v12;
  v15 = v14;
  if (v13 == v14)
  {

  }
  else
  {
    v16 = v14;
    if (!v13)
    {
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    v17 = objc_msgSend(v13, "isEqual:", v14);

    if (!v17)
      goto LABEL_13;
  }
  -[HFSetupSingleAccessoryPairingController statusDescription](self, "statusDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = v18;
  if (v19 == v20)
  {

LABEL_27:
    goto LABEL_28;
  }
  v16 = v20;
  if (!v19)
  {

    goto LABEL_12;
  }
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) != 0)
    goto LABEL_28;
LABEL_14:
  -[HFSetupSingleAccessoryPairingController setStatusTitle:](self, "setStatusTitle:", v13);
  -[HFSetupSingleAccessoryPairingController setStatusDescription:](self, "setStatusDescription:", v11);
  HFLogForCategory(0x3AuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v13;
    v42 = 2112;
    v43 = v11;
    _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "Updating status title: \"%@\" description: \"%@\", buf, 0x16u);
  }

  if (v3)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HFSetupSingleAccessoryPairingController pairingObservers](self, "pairingObservers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v23)
    {
      v24 = v23;
      v31 = v13;
      v32 = v11;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v15);
          v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v28 = -[HFSetupSingleAccessoryPairingController phase](self, "phase");
            -[HFSetupSingleAccessoryPairingController statusTitle](self, "statusTitle");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFSetupSingleAccessoryPairingController statusDescription](self, "statusDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "pairingController:didTransitionToPhase:statusTitle:statusDescription:", self, v28, v29, v30);

          }
        }
        v24 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v24);
      v13 = v31;
      v11 = v32;
    }
    goto LABEL_27;
  }
LABEL_28:

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HFSetupSingleAccessoryPairingController home](self, "home");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    HFLogForCategory(0x3AuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Notified that an accessory (%@) was added to the home. Our accessory to pair is: %@", buf, 0x16u);

    }
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqual:", v13))
    {

      goto LABEL_8;
    }
    v14 = +[HFSetupPairingControllerUtilities isPairingPhaseIdle:](HFSetupPairingControllerUtilities, "isPairingPhaseIdle:", -[HFSetupSingleAccessoryPairingController phase](self, "phase"));

    if (!v14)
    {
      -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAccessory:", v6);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "uniqueIdentifiersForBridgedAccessories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke;
      v21[3] = &unk_1EA727868;
      v21[4] = self;
      objc_msgSend(v19, "na_map:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObjectsFromSet:", v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFSetupSingleAccessoryPairingController _finishPairingWithAccessories:completedInfo:](self, "_finishPairingWithAccessories:completedInfo:", v11, 0);
LABEL_8:

    }
  }

}

id __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke_2;
  v9[3] = &unk_1EA727840;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __64__HFSetupSingleAccessoryPairingController_home_didAddAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
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
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x3AuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_prettyDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Finished pairing with accessories: %@, info: %@", (uint8_t *)&v11, 0x16u);

  }
  -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateStatus:error:", 2, 0);

  -[HFSetupSingleAccessoryPairingController setPairedAccessories:](self, "setPairedAccessories:", v6);
  -[HFSetupSingleAccessoryPairingController setCompletedInfo:](self, "setCompletedInfo:", v7);
  -[HFSetupSingleAccessoryPairingController setPhase:](self, "setPhase:", 10);

}

- (void)_failPairingWithDiscoveredAccessory:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[HFSetupSingleAccessoryPairingController phase](self, "phase") != 9)
  {
    -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStatus:error:", 3, v5);

    HFLogForCategory(0x3AuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[HFSetupSingleAccessoryPairingController discoveredAccessoryToPair](self, "discoveredAccessoryToPair");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Failed pairing with accessory: %@ error: %@", (uint8_t *)&v9, 0x16u);

    }
    -[HFSetupSingleAccessoryPairingController setPhase:](self, "setPhase:", 9);
  }

}

- (void)_assertValidTransitionFromPhase:(unint64_t)a3 toPhase:(unint64_t)a4
{
  void *v8;
  _BOOL4 v9;
  void *v12;
  void *v13;
  id v14;

  if (a4 - 6 >= 4)
  {
    switch(a3)
    {
      case 0uLL:
        if (a4 != 1 && a4 != 4)
          goto LABEL_20;
        break;
      case 1uLL:
        if (a4 == 4)
        {
          -[HFSetupSingleAccessoryPairingController setupResult](self, "setupResult");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8 != 0;

        }
        else
        {
          v9 = 0;
        }
        if (a4 != 3 && a4 != 10 && !v9)
          goto LABEL_20;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
        if (a4 > 0xA || ((1 << a4) & 0x422) == 0)
          goto LABEL_20;
        break;
      default:
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupSingleAccessoryPairingController.m"), 412, CFSTR("Invalid phase transition: %@ -> %@"), v12, v13);

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

- (HFDiscoveredAccessory)discoveredAccessoryToPair
{
  return self->_discoveredAccessoryToPair;
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

- (BOOL)accessoryRequiresCode
{
  return self->_accessoryRequiresCode;
}

- (void)setAccessoryRequiresCode:(BOOL)a3
{
  self->_accessoryRequiresCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseStartDate, 0);
  objc_storeStrong((id *)&self->_pairingFuture, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
