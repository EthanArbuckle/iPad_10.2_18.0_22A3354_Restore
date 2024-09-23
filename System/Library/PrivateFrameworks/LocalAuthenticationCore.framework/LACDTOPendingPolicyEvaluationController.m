@implementation LACDTOPendingPolicyEvaluationController

- (LACDTOPendingPolicyEvaluationController)initWithRatchetStateProvider:(id)a3 ratchetHandler:(id)a4 device:(id)a5 evaluationIdentifierFactory:(id)a6 persistentStore:(id)a7 workQueue:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  LACDTOPendingPolicyEvaluationController *v19;
  LACDTONotificationManager *v20;
  LACDTONotificationManager *notificationManager;
  _TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore *v22;
  _TtP23LocalAuthenticationCore38LACDTOPendingPolicyEvaluationStoreType_ *evaluationStore;
  uint64_t v24;
  NSHashTable *observers;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)LACDTOPendingPolicyEvaluationController;
  v19 = -[LACDTOPendingPolicyEvaluationController init](&v29, sel_init);
  if (v19)
  {
    v20 = -[LACDTONotificationManager initWithReplyQueue:]([LACDTONotificationManager alloc], "initWithReplyQueue:", v18, v27, v28);
    notificationManager = v19->_notificationManager;
    v19->_notificationManager = v20;

    -[LACDTONotificationManager setDelegate:](v19->_notificationManager, "setDelegate:", v19);
    v22 = -[LACDTOPendingPolicyEvaluationStore initWithPersistentStore:workQueue:]([_TtC23LocalAuthenticationCore34LACDTOPendingPolicyEvaluationStore alloc], "initWithPersistentStore:workQueue:", v17, v18);
    evaluationStore = v19->_evaluationStore;
    v19->_evaluationStore = (_TtP23LocalAuthenticationCore38LACDTOPendingPolicyEvaluationStoreType_ *)v22;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v24 = objc_claimAutoreleasedReturnValue();
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v24;

    v19->_shouldPostRestartRatchetPrompt = 0;
    objc_storeStrong((id *)&v19->_ratchetStateProvider, a3);
    objc_storeStrong((id *)&v19->_ratchetHandler, a4);
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeStrong((id *)&v19->_evaluationIdentifierFactory, a6);
    objc_storeStrong((id *)&v19->_workQueue, a8);
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[LACDarwinNotificationCenter sharedInstance](LACDarwinNotificationCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)LACDTOPendingPolicyEvaluationController;
  -[LACDTOPendingPolicyEvaluationController dealloc](&v4, sel_dealloc);
}

- (void)startController
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[LACDTOPendingPolicyEvaluationController _loadPendingEvaluations](self, "_loadPendingEvaluations");
  -[LACDTOPendingPolicyEvaluationController _registerNotificationObservers](self, "_registerNotificationObservers");
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke_2;
  v6[3] = &unk_2510C22F8;
  v7 = v4;
  v5 = v4;
  -[LACDTOPendingPolicyEvaluationController _updatePendingEvaluationsWithUpdateBlock:observerFilter:](self, "_updatePendingEvaluationsWithUpdateBlock:observerFilter:", &__block_literal_global_11, v6);

}

uint64_t __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke()
{
  return 1;
}

uint64_t __55__LACDTOPendingPolicyEvaluationController_addObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)cancelPendingEvaluationForClient:(id)a3 ratchetIdentifier:(id)a4 reason:(id)a5 completion:(id)a6
{
  id v10;
  LACDTOPolicyEvaluationIdentifierFactory *evaluationIdentifierFactory;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  evaluationIdentifierFactory = self->_evaluationIdentifierFactory;
  v12 = (void (**)(id, _QWORD))a6;
  -[LACDTOPolicyEvaluationIdentifierFactory evaluationIdentifierForClient:ratchetIdentifier:](evaluationIdentifierFactory, "evaluationIdentifierForClient:ratchetIdentifier:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:](self->_evaluationStore, "pendingEvaluationWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogDTOEvaluation();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v17 = 138412802;
      v18 = v10;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_2409DC000, v15, OS_LOG_TYPE_DEFAULT, "Canceling pending evaluation with reason: %@, identifier: %@, did find instance: %@", (uint8_t *)&v17, 0x20u);
    }

    -[LACDTOPendingPolicyEvaluationController _removePendingEvaluationRecordWithIdentifier:completion:](self, "_removePendingEvaluationRecordWithIdentifier:completion:", v13, v12);
  }
  else
  {
    if (v16)
    {
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2409DC000, v15, OS_LOG_TYPE_DEFAULT, "Skipping cancellation of pending evaluation with reason: %@, identifier: %@", (uint8_t *)&v17, 0x16u);
    }

    v12[2](v12, 0);
  }

}

- (void)handleEvent:(id)a3 sender:(id)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  if (!objc_msgSend(v8, "rawValue"))
  {
    objc_msgSend(v8, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOPendingPolicyEvaluationController _handleRatchetStateChanged:](self, "_handleRatchetStateChanged:", v7);

    }
  }

}

- (void)policyController:(id)a3 willStartPolicyEvaluation:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isInteractiveRatchetEvaluation"))
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __86__LACDTOPendingPolicyEvaluationController_policyController_willStartPolicyEvaluation___block_invoke;
    v8[3] = &unk_2510C2320;
    objc_copyWeak(&v10, &location);
    v9 = v7;
    -[LACDTOPendingPolicyEvaluationController _checkShouldAddPendingEvaluationRecordForRequest:completion:](self, "_checkShouldAddPendingEvaluationRecordForRequest:completion:", v9, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __86__LACDTOPendingPolicyEvaluationController_policyController_willStartPolicyEvaluation___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && a2)
    objc_msgSend(WeakRetained, "_addPendingEvaluationRecordForRequest:currentState:", *(_QWORD *)(a1 + 32), v7);

}

- (void)policyController:(id)a3 didFinishPolicyEvaluation:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isInteractiveRatchetEvaluation"))
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __93__LACDTOPendingPolicyEvaluationController_policyController_didFinishPolicyEvaluation_result___block_invoke;
    v11[3] = &unk_2510C2320;
    objc_copyWeak(&v13, &location);
    v12 = v9;
    -[LACDTOPendingPolicyEvaluationController _checkShouldKeepPendingEvaluationRecordForResult:completion:](self, "_checkShouldKeepPendingEvaluationRecordForResult:completion:", v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __93__LACDTOPendingPolicyEvaluationController_policyController_didFinishPolicyEvaluation_result___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (a2)
    {
      if ((objc_msgSend(WeakRetained, "_hasPendingEvaluationRecordForRequest:", v7) & 1) == 0)
        objc_msgSend(v6, "_addPendingEvaluationRecordForRequest:currentState:", *(_QWORD *)(a1 + 32), v8);
    }
    else
    {
      objc_msgSend(WeakRetained, "_removePendingEvaluationRecordForRequest:completion:", v7, 0);
    }
  }

}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  id v6;
  NSObject *workQueue;
  id *v8;
  _QWORD *v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  if (LACDarwinNotificationsEqual(a4, CFSTR("SignificantTimeChangeNotification")))
  {
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke;
    v12[3] = &unk_2510C0EB0;
    v8 = &v13;
    objc_copyWeak(&v13, &location);
    v9 = v12;
LABEL_5:
    dispatch_async(workQueue, v9);
    objc_destroyWeak(v8);
    goto LABEL_6;
  }
  if (LACDarwinNotificationsEqual(a4, CFSTR("com.apple.springboard.lockstate")))
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke_2;
    block[3] = &unk_2510C0EB0;
    v8 = &v11;
    objc_copyWeak(&v11, &location);
    v9 = block;
    goto LABEL_5;
  }
LABEL_6:
  objc_destroyWeak(&location);

}

void __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_rescheduleNotifications");
    WeakRetained = v2;
  }

}

void __85__LACDTOPendingPolicyEvaluationController_notificationCenter_didReceiveNotification___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_postNotificationForRatchetRestartIfNeeded");
    WeakRetained = v2;
  }

}

- (void)_registerNotificationObservers
{
  void *v3;
  id v4;

  +[LACDarwinNotificationCenter sharedInstance](LACDarwinNotificationCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:notification:", self, CFSTR("SignificantTimeChangeNotification"));

  +[LACDarwinNotificationCenter sharedInstance](LACDarwinNotificationCenter, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:notification:", self, CFSTR("com.apple.springboard.lockstate"));

}

- (void)_rescheduleNotifications
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__LACDTOPendingPolicyEvaluationController__rescheduleNotifications__block_invoke;
  v3[3] = &unk_2510C2348;
  objc_copyWeak(&v4, &location);
  -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:](self, "_checkIsRatchetStateIn:completion:", &unk_2510F6D10, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __67__LACDTOPendingPolicyEvaluationController__rescheduleNotifications__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(WeakRetained[3], "pendingEvaluations", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v7, "_cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:", v13, 0);
            v14 = 0.0;
            if (objc_msgSend(v5, "rawValue") == 1)
            {
              objc_msgSend(v5, "duration");
              v14 = v15;
            }
            objc_msgSend(v5, "resetDuration");
            objc_msgSend(v7, "_scheduleNotificationForPendingEvaluationRecord:after:validity:", v13, v14, v16);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v10);
      }

      objc_msgSend(v7[3], "persistEvaluations");
      LACLogDTOEvaluation();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7[3], "pendingEvaluations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_impl(&dword_2409DC000, v17, OS_LOG_TYPE_DEFAULT, "Updated pending evaluations after significant time change: %@", buf, 0xCu);

      }
    }
    else
    {
      LACLogDTOEvaluation();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2409DC000, v17, OS_LOG_TYPE_DEFAULT, "Did not update pending evaluations after significant time change because we are not in the state of interest", buf, 2u);
      }
    }

  }
}

- (void)notificationManager:(id)a3 didReceiveUserAction:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  int v10;
  LACDTOPendingPolicyEvaluationController *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  LACLogDTONotifications();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - will handle notification action %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.coreauthd.notifications.action.securityDelay.dismiss")))
  {
    -[LACDTOPendingPolicyEvaluationController _pruneInvalidatedEvaluations](self, "_pruneInvalidatedEvaluations");
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.coreauthd.notifications.action.securityDelay.start")))
  {
    -[LACDTOPendingPolicyEvaluationController _restartRatchetForInvalidatedEvaluations](self, "_restartRatchetForInvalidatedEvaluations");
  }
  v8[2](v8);

}

- (void)_checkShouldAddPendingEvaluationRecordForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __103__LACDTOPendingPolicyEvaluationController__checkShouldAddPendingEvaluationRecordForRequest_completion___block_invoke;
  v10[3] = &unk_2510C2370;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:](self, "_checkIsRatchetStateIn:completion:", &unk_2510F6D28, v10);

}

void __103__LACDTOPendingPolicyEvaluationController__checkShouldAddPendingEvaluationRecordForRequest_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    LACLogDTOEvaluation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Does not need pending evaluation record for '%@' for current ratchet state: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_checkShouldKeepPendingEvaluationRecordForResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isSuccess"))
  {
    LACLogDTOEvaluation();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      v10 = "Does not need pending evaluation record for '%@' after success";
LABEL_8:
      _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v6, "error");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          objc_msgSend(v6, "error"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = +[LACError error:hasCode:](LACError, "error:hasCode:", v13, -2),
          v13,
          v12,
          !v14))
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __103__LACDTOPendingPolicyEvaluationController__checkShouldKeepPendingEvaluationRecordForResult_completion___block_invoke;
      v15[3] = &unk_2510C2370;
      v16 = v6;
      v17 = v7;
      -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:](self, "_checkIsRatchetStateIn:completion:", &unk_2510F6D40, v15);

      goto LABEL_11;
    }
    LACLogDTOEvaluation();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      v10 = "Does not need pending evaluation record for '%@' after user cancel";
      goto LABEL_8;
    }
  }

  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
LABEL_11:

}

void __103__LACDTOPendingPolicyEvaluationController__checkShouldKeepPendingEvaluationRecordForResult_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  LACLogDTOEvaluation();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      v9 = "Does need pending evaluation record for '%@' for current ratchet state: %@";
LABEL_6:
      _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);

    }
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    v9 = "Does not need pending evaluation record for '%@' for current ratchet state: %@";
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v10);
}

- (void)_handleRatchetStateChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOPendingPolicyEvaluationController _prunePendingEvaluationsWithUUID:](self, "_prunePendingEvaluationsWithUUID:", v4);

  -[LACDTOPendingPolicyEvaluationController _handleSwitchToCoolOffState:](self, "_handleSwitchToCoolOffState:", v5);
  -[LACDTOPendingPolicyEvaluationController _handleSwitchToFinalState:](self, "_handleSwitchToFinalState:", v5);
  -[LACDTOPendingPolicyEvaluationController _cancelPreviousNotificationForRatchetRestartWithRatchetState:](self, "_cancelPreviousNotificationForRatchetRestartWithRatchetState:", v5);

}

- (void)_handleSwitchToCoolOffState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "rawValue") == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __71__LACDTOPendingPolicyEvaluationController__handleSwitchToCoolOffState___block_invoke;
    v12 = &unk_2510C2398;
    objc_copyWeak(&v15, &location);
    v13 = v4;
    v6 = v5;
    v14 = v6;
    -[LACDTOPendingPolicyEvaluationController _updatePendingEvaluationsWithBlock:](self, "_updatePendingEvaluationsWithBlock:", &v9);
    LACLogDTOEvaluation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations", v9, v10, v11, v12, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Updated pending evaluations after switch to cool off state: %@", buf, 0xCu);

    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

BOOL __71__LACDTOPendingPolicyEvaluationController__handleSwitchToCoolOffState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  void *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "resetDuration");
  objc_msgSend(WeakRetained, "_scheduleNotificationForPendingEvaluationRecord:after:validity:", v3, v6, v7);

  objc_msgSend(v3, "coolOffStarted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v3, "setCoolOffStarted:", *(_QWORD *)(a1 + 40));

  return v8 == 0;
}

- (void)_handleSwitchToFinalState:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *workQueue;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (-[LACDTOPendingPolicyEvaluationController _canFinishPendingEvaluationsForRatchetState:](self, "_canFinishPendingEvaluationsForRatchetState:", v4))
  {
    objc_initWeak(&location, self);
    v5 = dispatch_time(0, 500000000);
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__LACDTOPendingPolicyEvaluationController__handleSwitchToFinalState___block_invoke;
    v7[3] = &unk_2510C0F98;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    v8 = v4;
    dispatch_after(v5, workQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __69__LACDTOPendingPolicyEvaluationController__handleSwitchToFinalState___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "pendingEvaluations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          v10 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "resetDuration");
          objc_msgSend(v10, "_scheduleNotificationForPendingEvaluationRecord:after:validity:", v9, 0.0, v11);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_isRatchetRestartRequest:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("com.apple.coreauthd.dto.request.identifier.restart"));

  return v4;
}

- (BOOL)_hasPendingEvaluationRecordForRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[LACDTOPendingPolicyEvaluationController _isRatchetRestartRequest:](self, "_isRatchetRestartRequest:", v4))
  {
    objc_msgSend(v4, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  if (objc_msgSend(v7, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      v12 = 1;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:](self->_evaluationStore, "pendingEvaluationWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v12 &= v14 != 0;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_addPendingEvaluationRecordForRequest:(id)a3 currentState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LACDTOPendingPolicyEvaluationController _isRatchetRestartRequest:](self, "_isRatchetRestartRequest:", v6);
  v11 = MEMORY[0x24BDAC760];
  v38 = v6;
  v39 = v9;
  if (v10)
  {
    v12 = (id)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v17, "isInvalidated", v38))
          {
            objc_msgSend(v17, "identifier");
            v18 = v12;
            v19 = v8;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[LACDTOPendingPolicyEvaluationController _coolOffStartedTimestampForIdentifier:currentState:](self, "_coolOffStartedTimestampForIdentifier:currentState:", v20, v7);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v19;
            v12 = v18;
            objc_msgSend(v17, "setNotificationScheduledAt:", 0);
            objc_msgSend(v17, "setRatchetUUID:", v39);
            objc_msgSend(v17, "setCoolOffStarted:", v21);
            objc_msgSend(v17, "setIsInvalidated:", 0);
            objc_msgSend(v8, "addObject:", v17);
            objc_msgSend(v17, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v22);

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v14);
    }

    objc_msgSend(v38, "payload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    v25 = v24;
    if (v24)
      v26 = v24;
    else
      v26 = (id)objc_opt_new();
    v29 = v26;

    objc_msgSend(v29, "setObject:forKeyedSubscript:", v12, CFSTR("kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"));
    objc_msgSend(v38, "updatePayload:", v29);
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOPendingPolicyEvaluationController _coolOffStartedTimestampForIdentifier:currentState:](self, "_coolOffStartedTimestampForIdentifier:currentState:", v27, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v11;
    v46[1] = 3221225472;
    v46[2] = __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke;
    v46[3] = &unk_2510C23C0;
    v47 = v27;
    v48 = v6;
    v49 = v9;
    v50 = v28;
    v29 = v28;
    v12 = v27;
    __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke((uint64_t)v46);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v30);

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = v8;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        -[LACDTOPendingPolicyEvaluationController _addPendingEvaluationRecord:currentState:](self, "_addPendingEvaluationRecord:currentState:", v36, v7, v38);
        objc_msgSend(v36, "coolOffStarted");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke_2;
          v41[3] = &unk_2510C23E8;
          v41[4] = v36;
          -[LACDTOPendingPolicyEvaluationController _updatePendingEvaluationsWithBlock:](self, "_updatePendingEvaluationsWithBlock:", v41);
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v33);
  }

  -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
}

_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *__94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke(uint64_t a1)
{
  _TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = -[LACDTOMutablePendingPolicyEvaluation initWithIdentifier:]([_TtC23LocalAuthenticationCore36LACDTOMutablePendingPolicyEvaluation alloc], "initWithIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1063);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePendingPolicyEvaluation setCallbackReason:](v2, "setCallbackReason:", v5);

  objc_msgSend(*(id *)(a1 + 40), "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1064);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePendingPolicyEvaluation setCallbackURL:](v2, "setCallbackURL:", v8);

  -[LACDTOMutablePendingPolicyEvaluation setNotificationScheduledAt:](v2, "setNotificationScheduledAt:", 0);
  -[LACDTOMutablePendingPolicyEvaluation setRatchetUUID:](v2, "setRatchetUUID:", *(_QWORD *)(a1 + 48));
  -[LACDTOMutablePendingPolicyEvaluation setCoolOffStarted:](v2, "setCoolOffStarted:", *(_QWORD *)(a1 + 56));
  return v2;
}

uint64_t __94__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecordForRequest_currentState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (id)_coolOffStartedTimestampForIdentifier:(id)a3 currentState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:](self->_evaluationStore, "pendingEvaluationWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    LACLogDTOEvaluation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x24BDD1500];
      objc_msgSend(v8, "coolOffStarted");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringFromDate:dateStyle:timeStyle:", v11, 0, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "The pending evaluation for %@ is using the existing cool off timestamp: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v8, "coolOffStarted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "rawValue") == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogDTOEvaluation();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v13, 0, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "The pending evaluation for %@ will use the current time for cool off timestamp: %@", (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    LACLogDTOEvaluation();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_2409DC000, v16, OS_LOG_TYPE_DEFAULT, "The pending evaluation for %@ has no cool off timestamp yet", (uint8_t *)&v18, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (void)_addPendingEvaluationRecord:(id)a3 currentState:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isInvalidated");
  LACLogDTOEvaluation();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "Not adding new pending evaluation with identifier: %@, the evaluation is invalidated", buf, 0xCu);

    }
  }
  else
  {
    if (v10)
    {
      objc_msgSend(v6, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "Will add new pending evaluation with identifier: %@", buf, 0xCu);

    }
    if (objc_msgSend(v7, "rawValue") != 1 && objc_msgSend(v7, "rawValue") != 2)
      -[LACDTOPendingPolicyEvaluationController _cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:](self, "_cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:", v6, 0);
    if (objc_msgSend(v7, "rawValue") == 1)
    {
      objc_msgSend(v7, "duration");
      v14 = v13;
      objc_msgSend(v7, "resetDuration");
      -[LACDTOPendingPolicyEvaluationController _scheduleNotificationForPendingEvaluationRecord:after:validity:](self, "_scheduleNotificationForPendingEvaluationRecord:after:validity:", v6, v14, v15);
    }
    -[LACDTOPendingPolicyEvaluationStoreType addPendingEvaluation:](self->_evaluationStore, "addPendingEvaluation:", v6);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __84__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecord_currentState___block_invoke;
    v16[3] = &unk_2510C2410;
    v16[4] = self;
    -[LACDTOPendingPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v16);
  }

}

uint64_t __84__LACDTOPendingPolicyEvaluationController__addPendingEvaluationRecord_currentState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pendingEvaluationControllerDidStartTrackingPendingEvaluations:", *(_QWORD *)(a1 + 32));
}

- (void)_removePendingEvaluationRecordForRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *workQueue;
  void *v17;
  id v18;
  void *v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = a4;
  if (-[LACDTOPendingPolicyEvaluationController _isRatchetRestartRequest:](self, "_isRatchetRestartRequest:", v6))
  {
    objc_msgSend(v6, "payload", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kLACDTOPolicyEvaluationRequestPayloadKeyAssociatedIdentifiers"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "identifier", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v19, "count"))
  {
    v9 = dispatch_group_create();
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__6;
    v30[4] = __Block_byref_object_dispose__6;
    v31 = 0;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v19;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    v12 = MEMORY[0x24BDAC760];
    if (v11)
    {
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          dispatch_group_enter(v9);
          v23[0] = v12;
          v23[1] = 3221225472;
          v23[2] = __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke;
          v23[3] = &unk_2510C2438;
          v25 = v30;
          v24 = v9;
          -[LACDTOPendingPolicyEvaluationController _removePendingEvaluationRecordWithIdentifier:completion:](self, "_removePendingEvaluationRecordWithIdentifier:completion:", v15, v23);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v11);
    }

    workQueue = self->_workQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke_2;
    block[3] = &unk_2510C2460;
    v21 = v18;
    v22 = v30;
    dispatch_group_notify(v9, workQueue, block);

    _Block_object_dispose(v30, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }

}

void __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a2 = v6;
  objc_storeStrong(v5, a2);
  v8 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __95__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordForRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)_removePendingEvaluationRecordWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD aBlock[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_2510C0D20;
  v9 = v7;
  v20 = v9;
  v10 = _Block_copy(aBlock);
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluationWithIdentifier:](self->_evaluationStore, "pendingEvaluationWithIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
  LACLogDTOEvaluation();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl(&dword_2409DC000, v12, OS_LOG_TYPE_DEFAULT, "Will remove pending evaluation with identifier: %@", buf, 0xCu);
  }

  -[LACDTOPendingPolicyEvaluationStoreType removePendingEvaluationWith:](self->_evaluationStore, "removePendingEvaluationWith:", v6);
  -[LACDTOPendingPolicyEvaluationController _cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:](self, "_cancelPreviousNotificationForPendingEvaluationRecord:scheduledOnly:", v11, 1);
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") == 0;

  if (v14)
  {
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_28;
    v18[3] = &unk_2510C2410;
    v18[4] = self;
    -[LACDTOPendingPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v18);
    objc_initWeak((id *)buf, self);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_2;
    v15[3] = &unk_2510C2488;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v10;
    -[LACDTOPendingPolicyEvaluationController _checkIsRatchetStateIn:completion:](self, "_checkIsRatchetStateIn:completion:", &unk_2510F6D58, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_5:
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pendingEvaluationControllerDidStopTrackingPendingEvaluations:", *(_QWORD *)(a1 + 32));
}

void __99__LACDTOPendingPolicyEvaluationController__removePendingEvaluationRecordWithIdentifier_completion___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  __int16 v9[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained
    && a2
    && (objc_msgSend(WeakRetained[3], "pendingEvaluations"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v7))
  {
    LACLogDTOEvaluation();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 0;
      _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "Reseting Ratchet as there are no pending evaluations", (uint8_t *)v9, 2u);
    }

    objc_msgSend(v5, "_resetRatchetWithCompletion:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_updatePendingEvaluationsWithBlock:(id)a3
{
  -[LACDTOPendingPolicyEvaluationController _updatePendingEvaluationsWithUpdateBlock:observerFilter:](self, "_updatePendingEvaluationsWithUpdateBlock:observerFilter:", a3, &__block_literal_global_31_0);
}

uint64_t __78__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithBlock___block_invoke()
{
  return 1;
}

- (void)_updatePendingEvaluationsWithUpdateBlock:(id)a3 observerFilter:(id)a4
{
  unsigned int (**v6)(id, _QWORD);
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, _QWORD))a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v6[2](v6, v13))
        {
          objc_initWeak(&location, self);
          v14[0] = MEMORY[0x24BDAC760];
          v14[1] = 3221225472;
          v14[2] = __99__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithUpdateBlock_observerFilter___block_invoke;
          v14[3] = &unk_2510C24D0;
          v15 = v7;
          objc_copyWeak(&v16, &location);
          v14[4] = v13;
          -[LACDTOPendingPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v14);
          objc_destroyWeak(&v16);

          objc_destroyWeak(&location);
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
  }
  else
  {

  }
}

void __99__LACDTOPendingPolicyEvaluationController__updatePendingEvaluationsWithUpdateBlock_observerFilter___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v4, "pendingEvaluationController:updatedPendingEvaluation:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_canFinishPendingEvaluationsForRatchetState:(id)a3
{
  id v3;
  id v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__LACDTOPendingPolicyEvaluationController__canFinishPendingEvaluationsForRatchetState___block_invoke;
  v7[3] = &unk_2510C24F8;
  v8 = v3;
  v4 = v3;
  v5 = objc_msgSend(&unk_2510F6D70, "indexOfObjectPassingTest:", v7) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

BOOL __87__LACDTOPendingPolicyEvaluationController__canFinishPendingEvaluationsForRatchetState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  _BOOL8 result;

  v6 = objc_msgSend(a2, "integerValue");
  result = v6 == objc_msgSend(*(id *)(a1 + 32), "rawValue");
  *a4 = result;
  return result;
}

- (void)_cancelPreviousNotificationForPendingEvaluationRecord:(id)a3 scheduledOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "setNotificationScheduledAt:", 0);
  -[LACDTONotificationManager cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:scheduledOnly:completion:](self->_notificationManager, "cancelPreviousSecurityDelayFinishedNotificationForPendingEvaluation:scheduledOnly:completion:", v6, v4, &__block_literal_global_38);

}

- (void)_cancelPreviousNotificationForRatchetRestartWithRatchetState:(id)a3
{
  if (objc_msgSend(a3, "rawValue") >= 1)
    -[LACDTONotificationManager cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:](self->_notificationManager, "cancelPreviousNewSecurityDelayRequiredNotificationWithCompletion:", &__block_literal_global_39_0);
}

- (void)_scheduleNotificationForRatchetRestart
{
  self->_shouldPostRestartRatchetPrompt = 1;
  -[LACDTOPendingPolicyEvaluationController _postNotificationForRatchetRestartIfNeeded](self, "_postNotificationForRatchetRestartIfNeeded");
}

- (void)_postNotificationForRatchetRestartIfNeeded
{
  int v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(*a1, "hasCompletedSetup");
  v5 = objc_msgSend(*a1, "hasBeenUnlockedSinceBoot");
  v6[0] = 67109376;
  v6[1] = v4;
  v7 = 1024;
  v8 = v5;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "Skipping notification for security delay restart migration: %d, unlock: %d", (uint8_t *)v6, 0xEu);
}

void __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LACLogDTOEvaluation();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

      WeakRetained[48] = 1;
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Posted notification for security delay restart", v13, 2u);
      }

    }
  }

}

- (void)_scheduleNotificationForPendingEvaluationRecord:(id)a3 after:(double)a4 validity:(double)a5
{
  id v8;
  void *v9;
  LACDTONotificationManager *notificationManager;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isNotificationScheduledForDate:", v9) & 1) == 0
    && (objc_msgSend(v8, "hasNotifiedUserAboutCompletion") & 1) == 0)
  {
    objc_msgSend(v8, "setNotificationScheduledAt:", v9);
    objc_initWeak(&location, self);
    notificationManager = self->_notificationManager;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke;
    v11[3] = &unk_2510C2568;
    objc_copyWeak(v13, &location);
    v12 = v8;
    v13[1] = *(id *)&a4;
    -[LACDTONotificationManager scheduleSecurityDelayFinishedNotificationForPendingEvaluation:after:validity:completion:](notificationManager, "scheduleSecurityDelayFinishedNotificationForPendingEvaluation:after:validity:completion:", v12, v11, a4, a5);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }

}

void __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  uint64_t *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = *(void **)(a1 + 32);
      v5 = (uint64_t *)(a1 + 32);
      objc_msgSend(v6, "setNotificationScheduledAt:", 0);
      LACLogDTOEvaluation();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke_cold_1(v5, (uint64_t)v3, v7);
    }
    else
    {
      LACLogDTOEvaluation();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 48);
        v10 = 138543618;
        v11 = v8;
        v12 = 2048;
        v13 = v9;
        _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Scheduled notification for evaluation: %{public}@ after: %.2f secs", (uint8_t *)&v10, 0x16u);
      }
    }

    objc_msgSend(WeakRetained[3], "persistEvaluations");
  }

}

- (void)_checkIsRatchetStateIn:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LACDTORatchetStateProvider *ratchetStateProvider;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  ratchetStateProvider = self->_ratchetStateProvider;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__LACDTOPendingPolicyEvaluationController__checkIsRatchetStateIn_completion___block_invoke;
  v11[3] = &unk_2510C2590;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[LACDTORatchetStateProvider ratchetStateWithCompletion:](ratchetStateProvider, "ratchetStateWithCompletion:", v11);

}

void __77__LACDTOPendingPolicyEvaluationController__checkIsRatchetStateIn_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "rawValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6), v7);

  }
}

- (void)_forEachObserver:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)MEMORY[0x24BDBCE30];
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_resetRatchetWithCompletion:(id)a3
{
  id v4;
  LACDTORatchetHandler *ratchetHandler;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  ratchetHandler = self->_ratchetHandler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__LACDTOPendingPolicyEvaluationController__resetRatchetWithCompletion___block_invoke;
  v7[3] = &unk_2510C1470;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTORatchetHandler resetRatchetWithCompletion:](ratchetHandler, "resetRatchetWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __71__LACDTOPendingPolicyEvaluationController__resetRatchetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (!v4)
      objc_msgSend(WeakRetained[4], "ratchetStateWithCompletion:", &__block_literal_global_41_0);
  }

}

- (void)_restartRatchetForInvalidatedEvaluations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "isInvalidated") & 1) != 0)
        {

          LACLogDTOEvaluation();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "Restarting security delay for invalidated evaluations", v10, 2u);
          }

          -[LACDTORatchetHandler restartRatchetWithIdentifier:](self->_ratchetHandler, "restartRatchetWithIdentifier:", CFSTR("com.apple.coreauthd.dto.request.identifier.restart"));
          return;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }

  LACLogDTOEvaluation();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "Not restarting security delay - no invalidated evaluations", v10, 2u);
  }

}

- (void)_loadPendingEvaluations
{
  LACDTORatchetStateProvider *ratchetStateProvider;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  ratchetStateProvider = self->_ratchetStateProvider;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke;
  v4[3] = &unk_2510C0E88;
  objc_copyWeak(&v5, &location);
  -[LACDTORatchetStateProvider ratchetStateWithCompletion:](ratchetStateProvider, "ratchetStateWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOEvaluation();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    }
    else
    {
      v17 = (void *)*((_QWORD *)WeakRetained + 3);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42;
      v18[3] = &unk_2510C25B8;
      objc_copyWeak(&v20, v7);
      v19 = v5;
      objc_msgSend(v17, "loadPersistedEvaluationsWithCompletion:", v18);

      objc_destroyWeak(&v20);
    }
  }

}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOEvaluation();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v15 = v5;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
      {
        v17 = v16;
        v27 = v5;
        v18 = 0;
        v28 = 0;
        v19 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if (objc_msgSend(v21, "isInvalidated"))
            {
              objc_msgSend(WeakRetained[3], "addPendingEvaluation:", v21);
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(WeakRetained, "_shouldPrunePendingEvaluation:uuid:", v21, v22);

              if (v23)
              {
                objc_msgSend(*(id *)(a1 + 32), "uuid");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                v18 = 1;
                if (!v24)
                {
                  objc_msgSend(v21, "setIsInvalidated:", 1);
                  objc_msgSend(WeakRetained[3], "addPendingEvaluation:", v21);
                  v28 = 1;
                }
              }
              else
              {
                objc_msgSend(v21, "ratchetUUID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v25)
                {
                  objc_msgSend(*(id *)(a1 + 32), "uuid");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setRatchetUUID:", v26);

                }
                objc_msgSend(WeakRetained, "_addPendingEvaluationRecord:currentState:", v21, *(_QWORD *)(a1 + 32));
              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v17);

        if ((v28 & 1) != 0)
          objc_msgSend(WeakRetained, "_scheduleNotificationForRatchetRestart");
        v6 = 0;
        v5 = v27;
        if ((v18 & 1) != 0)
          objc_msgSend(WeakRetained[3], "persistEvaluations");
      }
      else
      {

      }
    }
  }

}

- (void)_pruneInvalidatedEvaluations
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _TtP23LocalAuthenticationCore38LACDTOPendingPolicyEvaluationStoreType_ *evaluationStore;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  LACLogDTOEvaluation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "Pruning invalidated evaluations", buf, 2u);
  }

  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isInvalidated", (_QWORD)v15))
        {
          evaluationStore = self->_evaluationStore;
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[LACDTOPendingPolicyEvaluationStoreType removePendingEvaluationWith:](evaluationStore, "removePendingEvaluationWith:", v14);

          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);

    if ((v9 & 1) != 0)
      -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
  }
  else
  {

  }
}

- (void)_prunePendingEvaluationsWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOEvaluation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v4;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "Pruning pending evaluations with uuid: %{public}@", buf, 0xCu);
  }

  -[LACDTOPendingPolicyEvaluationStoreType pendingEvaluations](self->_evaluationStore, "pendingEvaluations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[LACDTOPendingPolicyEvaluationController _shouldPrunePendingEvaluation:uuid:](self, "_shouldPrunePendingEvaluation:uuid:", v14, v4, (_QWORD)v17))
        {
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[LACDTOPendingPolicyEvaluationController _removePendingEvaluationRecordWithIdentifier:completion:](self, "_removePendingEvaluationRecordWithIdentifier:completion:", v15, &__block_literal_global_44);

        }
        else
        {
          objc_msgSend(v14, "ratchetUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(v14, "setRatchetUUID:", v4);
            v11 = 1;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);

    if ((v11 & 1) != 0)
      -[LACDTOPendingPolicyEvaluationStoreType persistEvaluations](self->_evaluationStore, "persistEvaluations");
  }
  else
  {

  }
}

- (BOOL)_shouldPrunePendingEvaluation:(id)a3 uuid:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "ratchetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "ratchetUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8) ^ 1;

  }
  else
  {
    LOBYTE(v9) = v6 == 0;
  }

  return v9;
}

- (LACDTONotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ratchetHandler, 0);
  objc_storeStrong((id *)&self->_evaluationIdentifierFactory, 0);
  objc_storeStrong((id *)&self->_ratchetStateProvider, 0);
  objc_storeStrong((id *)&self->_evaluationStore, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __85__LACDTOPendingPolicyEvaluationController__postNotificationForRatchetRestartIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "Did not post notification for security delay restart error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __106__LACDTOPendingPolicyEvaluationController__scheduleNotificationForPendingEvaluationRecord_after_validity___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "Did not schedule notification for evaluation: %{public}@ due to error: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "Unable to load pending evaluations, ratchet state failure: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __66__LACDTOPendingPolicyEvaluationController__loadPendingEvaluations__block_invoke_42_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, a2, a3, "Unable to load pending evaluations with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
