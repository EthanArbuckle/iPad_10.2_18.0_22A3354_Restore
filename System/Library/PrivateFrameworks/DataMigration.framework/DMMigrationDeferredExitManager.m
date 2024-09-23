@implementation DMMigrationDeferredExitManager

+ (id)_serialQueue
{
  if (_serialQueue_onceToken != -1)
    dispatch_once(&_serialQueue_onceToken, &__block_literal_global);
  return (id)_serialQueue_serialQueue;
}

void __46__DMMigrationDeferredExitManager__serialQueue__block_invoke()
{
  void *v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  _isMigrating_onSerialQueue = 0;
  _shouldDefer_onSerialQueue = 0;
  v0 = (void *)_transaction_onSerialQueue;
  _transaction_onSerialQueue = 0;

  v1 = (void *)_transactionIdentifier_onSerialQueue;
  _transactionIdentifier_onSerialQueue = 0;

  v2 = dispatch_queue_create("com.apple.datamigrator.deferredExitManager", 0);
  v3 = (void *)_serialQueue_serialQueue;
  _serialQueue_serialQueue = (uint64_t)v2;

}

- (void)migrationDidStart
{
  NSObject *v2;

  +[DMMigrationDeferredExitManager _serialQueue](DMMigrationDeferredExitManager, "_serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_3);

}

void __51__DMMigrationDeferredExitManager_migrationDidStart__block_invoke()
{
  uint64_t v0;

  _DMLogFunc(v0, 7, CFSTR("migrationDidStart"));
  _isMigrating_onSerialQueue = 1;
}

- (void)migrationDidEnd
{
  NSObject *v3;
  _QWORD block[5];

  +[DMMigrationDeferredExitManager _serialQueue](DMMigrationDeferredExitManager, "_serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke;
  block[3] = &unk_1E951EEA0;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  _DMLogFunc(v1, 7, CFSTR("migrationDidEnd"));
  _isMigrating_onSerialQueue = 0;
  if (_shouldDefer_onSerialQueue == 1)
  {
    _shouldDefer_onSerialQueue = 0;
    v3 = os_transaction_create();
    v4 = (void *)_transaction_onSerialQueue;
    _transaction_onSerialQueue = v3;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&_transactionIdentifier_onSerialQueue, v6);
    objc_msgSend(*(id *)(a1 + 32), "_deferralDuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, 1000000000 * objc_msgSend(v7, "unsignedIntegerValue"));
    +[DMMigrationDeferredExitManager _serialQueue](DMMigrationDeferredExitManager, "_serialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke_2;
    v12[3] = &unk_1E951EE78;
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v14 = v10;
    v11 = v6;
    dispatch_after(v8, v9, v12);

  }
}

void __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  if (_transaction_onSerialQueue
    && objc_msgSend((id)_transactionIdentifier_onSerialQueue, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    _DMLogFunc(v1, 7, CFSTR("deferred exit did timeout. will end transaction and exit"));
    v3 = (void *)_transaction_onSerialQueue;
    _transaction_onSerialQueue = 0;

    v4 = (void *)_transactionIdentifier_onSerialQueue;
    _transactionIdentifier_onSerialQueue = 0;

    objc_msgSend(*(id *)(a1 + 40), "_exitClean");
  }
  else
  {
    _DMLogFunc(v1, 7, CFSTR("deferred exit timer fired for stale transaction"));
  }
}

- (void)deferExitWithConnection:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  if (objc_msgSend(a3, "hasEntitlement:", CFSTR("com.apple.datamigrator.deferexit")))
  {
    +[DMMigrationDeferredExitManager _serialQueue](DMMigrationDeferredExitManager, "_serialQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, &__block_literal_global_14);

  }
  else
  {
    _DMLogFunc(v3, 3, CFSTR("deferExitWithConnection: client not entitled"));
  }
}

void __58__DMMigrationDeferredExitManager_deferExitWithConnection___block_invoke()
{
  uint64_t v0;

  if (_isMigrating_onSerialQueue == 1)
  {
    _DMLogFunc(v0, 7, CFSTR("deferExitWithConnection: will defer exit when migration completes"));
    _shouldDefer_onSerialQueue = 1;
  }
  else
  {
    _DMLogFunc(v0, 3, CFSTR("deferExitWithConnection: not migrating"));
  }
}

- (void)cancelDeferredExitWithConnection:(id)a3
{
  uint64_t v3;
  NSObject *v5;
  _QWORD block[5];

  if (objc_msgSend(a3, "hasEntitlement:", CFSTR("com.apple.datamigrator.deferexit")))
  {
    +[DMMigrationDeferredExitManager _serialQueue](DMMigrationDeferredExitManager, "_serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__DMMigrationDeferredExitManager_cancelDeferredExitWithConnection___block_invoke;
    block[3] = &unk_1E951EEA0;
    block[4] = self;
    dispatch_sync(v5, block);

  }
  else
  {
    _DMLogFunc(v3, 3, CFSTR("cancelDeferredExitWithConnection: client not entitled"));
  }
}

void __67__DMMigrationDeferredExitManager_cancelDeferredExitWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  _shouldDefer_onSerialQueue = 0;
  if (_transaction_onSerialQueue)
  {
    _DMLogFunc(v1, 7, CFSTR("cancelDeferredExitWithConnection: will end transaction and exit"));
    v3 = (void *)_transaction_onSerialQueue;
    _transaction_onSerialQueue = 0;

    v4 = (void *)_transactionIdentifier_onSerialQueue;
    _transactionIdentifier_onSerialQueue = 0;

    objc_msgSend(*(id *)(a1 + 32), "_exitClean");
  }
  else
  {
    _DMLogFunc(v1, 7, CFSTR("cancelDeferredExitWithConnection: no transaction to end"));
  }
}

- (void)_resetGlobalState
{
  NSObject *v2;

  +[DMMigrationDeferredExitManager _serialQueue](DMMigrationDeferredExitManager, "_serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_27);

}

void __51__DMMigrationDeferredExitManager__resetGlobalState__block_invoke()
{
  void *v0;
  void *v1;

  _isMigrating_onSerialQueue = 0;
  _shouldDefer_onSerialQueue = 0;
  v0 = (void *)_transaction_onSerialQueue;
  _transaction_onSerialQueue = 0;

  v1 = (void *)_transactionIdentifier_onSerialQueue;
  _transactionIdentifier_onSerialQueue = 0;

}

- (id)_deferralDuration
{
  return &unk_1E95210E8;
}

- (BOOL)_isDeferringExit
{
  NSObject *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  +[DMMigrationDeferredExitManager _serialQueue](DMMigrationDeferredExitManager, "_serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__DMMigrationDeferredExitManager__isDeferringExit__block_invoke;
  block[3] = &unk_1E951EF08;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __50__DMMigrationDeferredExitManager__isDeferringExit__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = _shouldDefer_onSerialQueue & 1 | (_transaction_onSerialQueue != 0);
  return result;
}

@end
