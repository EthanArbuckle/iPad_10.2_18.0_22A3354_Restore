@implementation HFSetupStagedAccessoryPairingController

+ (BOOL)supportsSetupPayloadRetry
{
  return 0;
}

- (HFSetupStagedAccessoryPairingController)initWithContext:(id)a3
{
  id v5;
  HFSetupStagedAccessoryPairingController *v6;
  HFSetupStagedAccessoryPairingController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFSetupStagedAccessoryPairingController;
  v6 = -[HFSetupStagedAccessoryPairingController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_phase = 0;
  }

  return v7;
}

- (void)setPhase:(unint64_t)a3
{
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t phase;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_phase != a3)
  {
    self->_phase = a3;
    HFLogForCategory(0x3AuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[HFSetupStagedAccessoryPairingController phase](self, "phase");
      -[HFSetupStagedAccessoryPairingController pairingObservers](self, "pairingObservers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "-[HFSetupStagedAccessoryPairingController setPhase:]";
      v23 = 2048;
      v24 = v5;
      v25 = 2048;
      v26 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%s phaseDidChange to %ld.  Notifying %ld observers", buf, 0x20u);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[HFSetupStagedAccessoryPairingController pairingObservers](self, "pairingObservers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            phase = self->_phase;
            -[HFSetupStagedAccessoryPairingController statusTitle](self, "statusTitle");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFSetupStagedAccessoryPairingController statusDescription](self, "statusDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "pairingController:didTransitionToPhase:statusTitle:statusDescription:", self, phase, v14, v15);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
}

- (void)addPairingObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HFSetupStagedAccessoryPairingController pairingObservers](self, "pairingObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupStagedAccessoryPairingController setPairingObservers:](self, "setPairingObservers:", v6);

  }
  -[HFSetupStagedAccessoryPairingController pairingObservers](self, "pairingObservers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removePairingObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFSetupStagedAccessoryPairingController pairingObservers](self, "pairingObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)startWithHome:(id)a3
{
  id v5;
  void *v6;
  HFSetupStagedAccessoryPairingController *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  HFSetupStagedAccessoryPairingController *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFSetupStagedAccessoryPairingController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setupAccessoryDescription");
  v7 = (HFSetupStagedAccessoryPairingController *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x3AuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Request to start pairing controller: %@ with home: %@", buf, 0x16u);
  }

  if (v5)
  {
    if (v7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupStagedAccessoryPairingController.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v7)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSetupStagedAccessoryPairingController.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setupDescription"));

LABEL_5:
  -[HFSetupStagedAccessoryPairingController setHome:](self, "setHome:", v5);
  HFLogForCategory(0x3AuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "HFSetupStagedAccessoryPairingController startPairing with description: %@", buf, 0xCu);
  }

  -[HFSetupStagedAccessoryPairingController home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke;
  v14[3] = &unk_1EA7277A0;
  v14[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_13;
  v13[3] = &unk_1EA7316C8;
  objc_msgSend(v10, "startPairingWithAccessoryDescription:progress:completion:", v7, v14, v13);

}

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2;
  block[3] = &unk_1EA727778;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2(uint64_t a1)
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

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
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
  v13[2] = __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2_14;
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

void __57__HFSetupStagedAccessoryPairingController_startWithHome___block_invoke_2_14(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[22];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "phase") != 9)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      HFLogForCategory(0x3AuLL);
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v16 = 138412290;
      *(_QWORD *)&v16[4] = v15;
      v11 = "HFSetupStagedAccessoryPairingController startPairing finished with error: %@";
      v12 = v3;
      v13 = 12;
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      HFLogForCategory(0x3AuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      v3 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)v16 = 138412546;
          *(_QWORD *)&v16[4] = v8;
          *(_WORD *)&v16[12] = 2112;
          *(_QWORD *)&v16[14] = v9;
          _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFSetupStagedAccessoryPairingController startPairing finished with accessories: %@ info: %@", v16, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 48));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setPairedAccessories:", v10);

        objc_msgSend(*(id *)(a1 + 32), "setCompletedInfo:", *(_QWORD *)(a1 + 56));
        v4 = *(void **)(a1 + 32);
        v5 = 10;
        goto LABEL_12;
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        v4 = *(void **)(a1 + 32);
        v5 = 9;
LABEL_12:
        objc_msgSend(v4, "setPhase:", v5, *(_OWORD *)v16);
        return;
      }
      *(_WORD *)v16 = 0;
      v11 = "HFSetupStagedAccessoryPairingController startPairing finished with error: nil but no paired accessories; tre"
            "ating as a failure";
      v12 = v3;
      v13 = 2;
    }
    _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, v11, v16, v13);
    goto LABEL_7;
  }
  HFLogForCategory(0x3AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v16 = 138412290;
    *(_QWORD *)&v16[4] = v14;
    _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "HFSetupStagedAccessoryPairingController startPairing finished with error: %@, but pairing is already in a failed state, so ignoring completion. Maybe cancelling the pairing operation failed.", v16, 0xCu);
  }

}

- (id)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  HFSetupStagedAccessoryPairingController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (+[HFSetupPairingControllerUtilities isPairingPhaseIdle:](HFSetupPairingControllerUtilities, "isPairingPhaseIdle:", -[HFSetupStagedAccessoryPairingController phase](self, "phase"))|| (-[HFSetupStagedAccessoryPairingController home](self, "home"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    HFLogForCategory(0x3AuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Cancel requested for pairing controller: %@, but we're already in an idle state, so ignoring", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_mappedHMError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupStagedAccessoryPairingController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setupAccessoryDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCancellationReason:", v5);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__HFSetupStagedAccessoryPairingController_cancel__block_invoke;
    v11[3] = &unk_1EA7268C8;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSetupStagedAccessoryPairingController setPhase:](self, "setPhase:", 9);

    return v8;
  }
}

void __49__HFSetupStagedAccessoryPairingController_cancel__block_invoke(uint64_t a1, void *a2)
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

- (HFSetupPairingContext)context
{
  return self->_context;
}

- (HFSetupAccessoryResult)setupResult
{
  return self->_setupResult;
}

- (void)setSetupResult:(id)a3
{
  objc_storeStrong((id *)&self->_setupResult, a3);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSHashTable)pairingObservers
{
  return self->_pairingObservers;
}

- (void)setPairingObservers:(id)a3
{
  objc_storeStrong((id *)&self->_pairingObservers, a3);
}

- (NSSet)pairedAccessories
{
  return self->_pairedAccessories;
}

- (void)setPairedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAccessories, a3);
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

- (void)setDiscoveredAccessoryToPair:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
