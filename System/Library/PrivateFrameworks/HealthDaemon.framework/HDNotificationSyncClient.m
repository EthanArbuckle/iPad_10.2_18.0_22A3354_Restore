@implementation HDNotificationSyncClient

- (HDNotificationSyncClient)initWithProfile:(id)a3 clientIdentifier:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDNotificationSyncClient *v11;
  HDNotificationSyncClient *v12;
  uint64_t v13;
  NSString *clientIdentifier;
  NSMutableSet *v15;
  NSMutableSet *lock_messageIdentifiersInFlight;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDNotificationSyncClient;
  v11 = -[HDNotificationSyncClient init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    v13 = objc_msgSend(v9, "copy");
    clientIdentifier = v12->_clientIdentifier;
    v12->_clientIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_queue, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lock_messageIdentifiersInFlight = v12->_lock_messageIdentifiersInFlight;
    v12->_lock_messageIdentifiersInFlight = v15;

    objc_msgSend(v8, "registerProfileReadyObserver:queue:", v12, v12->_queue);
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v12);

  }
  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p client:%@>"), objc_opt_class(), self, self->_clientIdentifier);
}

- (HDNotificationInstructionManager)instructionManager
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationSyncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationInstructionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNotificationSyncClient.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

  }
  return (HDNotificationInstructionManager *)v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;

  -[HDNotificationSyncClient instructionManager](self, "instructionManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:forClientIdentifier:queue:", self, self->_clientIdentifier, self->_queue);

}

- (void)notificationInstructionManager:(id)a3 didInsertNotificationInstruction:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id WeakRetained;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = WeakRetained;
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying delegate %{public}@ of new instruction %{public}@", (uint8_t *)&v12, 0x20u);

  }
  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v11, "notificationSyncClient:didReceiveInstructionWithAction:", self, objc_msgSend(v5, "action"));

}

- (id)pendingNotificationDismissInstructionsWithError:(id *)a3
{
  return -[HDNotificationSyncClient _pendingNotificationInstructionsForAction:error:]((uint64_t)self, 1, a3);
}

- (HDPendingNotificationInstructions)_pendingNotificationInstructionsForAction:(_QWORD *)a3 error:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HDPendingNotificationInstructions *v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  if (a1)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__18;
    v30 = __Block_byref_object_dispose__18;
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)a1, "instructionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 16);
    v8 = MEMORY[0x1E0C809B0];
    v24[4] = &v26;
    v25 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke;
    v24[3] = &unk_1E6CEB0B0;
    v9 = objc_msgSend(v6, "enumerateValidNotificationInstructionsForClientIdentifier:action:error:enumerationBlock:", v7, a2, &v25, v24);
    v10 = v25;

    if ((v9 & 1) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      v11 = (void *)v27[5];
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke_2;
      v23[3] = &unk_1E6CEB0D8;
      v23[4] = a1;
      objc_msgSend(v11, "hk_filter:", v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v12, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

      v16 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v12, "allValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);

      objc_msgSend(*(id *)(a1 + 40), "unionSet:", v15);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      v19 = -[HDPendingNotificationInstructions initWithAction:instructions:]([HDPendingNotificationInstructions alloc], "initWithAction:instructions:", a2, v18);

    }
    else
    {
      v20 = v10;
      v21 = v20;
      if (v20)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v20);
        else
          _HKLogDroppedError();
      }

      v19 = 0;
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)pendingNotificationSendInstructionsWithError:(id *)a3
{
  return -[HDNotificationSyncClient _pendingNotificationInstructionsForAction:error:]((uint64_t)self, 3, a3);
}

uint64_t __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDPendingNotificationInstruction *v4;
  void *v5;
  void *v6;
  void *v7;
  HDPendingNotificationInstruction *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = [HDPendingNotificationInstruction alloc];
  objc_msgSend(v3, "messageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingDeviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDPendingNotificationInstruction initWithMessageIdentifier:categoryIdentifier:sendingDeviceName:](v4, "initWithMessageIdentifier:categoryIdentifier:sendingDeviceName:", v5, v6, v7);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v3, "messageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);
  return 1;
}

uint64_t __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", a2) ^ 1;
}

- (BOOL)markPendingNotificationInstructionsAsProcessed:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  os_unfair_lock_s *p_lock;
  NSMutableSet *lock_messageIdentifiersInFlight;
  void *v14;
  id v15;
  void *v17;
  id v18;

  v7 = a3;
  if (objc_msgSend(v7, "action") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDNotificationSyncClient.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pendingNotificationInstructions.action != HKNotificationInstructionActionHold"));

  }
  -[HDNotificationSyncClient instructionManager](self, "instructionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v10 = objc_msgSend(v8, "invalidateNotificationInstructionsWithMessageIdentifiers:error:", v9, &v18);
  v11 = v18;

  if ((v10 & 1) != 0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_messageIdentifiersInFlight = self->_lock_messageIdentifiersInFlight;
    objc_msgSend(v7, "messageIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet minusSet:](lock_messageIdentifiersInFlight, "minusSet:", v14);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v15 = v11;
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

  }
  return v10;
}

- (id)notificationHoldInstructionsWithError:(id *)a3
{
  void *v5;
  NSString *clientIdentifier;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18;
  v14 = __Block_byref_object_dispose__18;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[HDNotificationSyncClient instructionManager](self, "instructionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  clientIdentifier = self->_clientIdentifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HDNotificationSyncClient_notificationHoldInstructionsWithError___block_invoke;
  v9[3] = &unk_1E6CEB0B0;
  v9[4] = &v10;
  LODWORD(a3) = objc_msgSend(v5, "enumerateValidNotificationInstructionsForClientIdentifier:action:error:enumerationBlock:", clientIdentifier, 2, a3, v9);

  if ((_DWORD)a3)
    v7 = (void *)objc_msgSend((id)v11[5], "copy");
  else
    v7 = 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __66__HDNotificationSyncClient_notificationHoldInstructionsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "categoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

- (BOOL)sendNotificationInstruction:(id)a3 criteria:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HDNotificationInstructionMessage *v15;
  void *v16;
  uint64_t v17;
  NSString *clientIdentifier;
  void *v19;
  void *v20;
  HDNotificationInstructionMessage *v21;
  id WeakRetained;
  void *v23;
  void *v25;

  v7 = (void *)MEMORY[0x1E0CB6F18];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "currentDeviceDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentDeviceProductType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentOSBuild");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@;%@;%@"), v12, v13, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [HDNotificationInstructionMessage alloc];
  -[HDNotificationSyncClient _currentDate](self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v9, "action");
  clientIdentifier = self->_clientIdentifier;
  objc_msgSend(v9, "categoryIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expirationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[HDNotificationInstructionMessage initWithCreationDate:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:](v15, "initWithCreationDate:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:", v16, v25, v17, clientIdentifier, v19, v20, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationSyncManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = objc_msgSend(v23, "sendNotificationInstructionMessage:error:", v21, a5);

  return (char)v20;
}

- (_QWORD)_currentDate
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[7];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDNotificationInstructionMessage *v14;
  void *v15;
  HDNotificationInstructionMessage *v16;
  id WeakRetained;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "currentDeviceProductType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentOSBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@;%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDNotificationSyncClient _currentDate](self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", 2592000.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [HDNotificationInstructionMessage alloc];
  -[HDNotificationSyncClient _currentDate](self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDNotificationInstructionMessage initWithCreationDate:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:](v14, "initWithCreationDate:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:", v15, v11, 3, self->_clientIdentifier, CFSTR("DataAvailableOnNewDevice"), v13, 0);

  self = (HDNotificationSyncClient *)((char *)self + 8);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(WeakRetained, "notificationSyncManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sendNotificationInstructionMessage:error:", v16, a4);

  v20 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v20, "daemon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "healthAppNewDeviceNotificationService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v22, "sendNewDeviceNotificationWithMessageKind:error:", a3, a4);

  return a4 | v19;
}

- (void)fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 criteria:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *clientIdentifier;
  void *v17;
  void *v18;
  HDNotificationInstruction *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  HDNotificationInstruction *v26;
  id v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  HDNotificationInstruction *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = a6;
  v27 = a5;
  v10 = a4;
  v11 = a3;
  v26 = [HDNotificationInstruction alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNotificationSyncClient _currentDate](self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNotificationSyncClient _currentDate](self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNotificationSyncClient _currentDate](self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "action");
  clientIdentifier = self->_clientIdentifier;
  objc_msgSend(v11, "categoryIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expirationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v24) = 0;
  v19 = -[HDNotificationInstruction initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:](v26, "initWithMessageIdentifier:creationDate:receivedDate:modificationDate:sendingDeviceName:sendingDeviceInfo:action:clientIdentifier:categoryIdentifier:expirationDate:criteria:isInvalid:", v25, v12, v13, v14, v10, v10, v15, clientIdentifier, v17, v18, v27, v24);

  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
  {
    v22 = v20;
    *(_DWORD *)buf = 138543618;
    v31 = (id)objc_opt_class();
    v32 = 2114;
    v33 = v19;
    v23 = v31;
    _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Faking received instruction: %{public}@", buf, 0x16u);

  }
  -[HDNotificationSyncClient instructionManager](self, "instructionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertNotificationInstruction:completion:", v19, v29);

}

- (BOOL)obliterateNotificationInstructionsWithError:(id *)a3
{
  void *v4;

  -[HDNotificationSyncClient instructionManager](self, "instructionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "obliterateNotificationInstructionsWithError:", a3);

  return (char)a3;
}

- (id)diagnosticDescription
{
  id v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), self);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableSet count](self->_lock_messageIdentifiersInFlight, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Message Identifiers In-Flight (%@)\n"), v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_lock_messageIdentifiersInFlight;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t-%@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (HDNotificationSyncClientDelegate)delegate
{
  return (HDNotificationSyncClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_messageIdentifiersInFlight, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
