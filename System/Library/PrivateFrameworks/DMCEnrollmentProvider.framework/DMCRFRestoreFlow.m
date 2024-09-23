@implementation DMCRFRestoreFlow

- (DMCRFRestoreFlow)initWithSnapshotSource:(id)a3 interactionClient:(id)a4 deviceEnvironment:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DMCRFRestoreFlow *v15;
  DMCRFRestoreFlow *v16;
  uint64_t v17;
  id completion;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DMCRFRestoreFlow;
  v15 = -[DMCRFRestoreFlow init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_snapshotSource, a3);
    objc_storeStrong((id *)&v16->_interactionClient, a4);
    objc_storeStrong((id *)&v16->_deviceEnvironment, a5);
    v17 = objc_msgSend(v14, "copy");
    completion = v16->_completion;
    v16->_completion = (id)v17;

  }
  return v16;
}

- (void)startManagedRestoreWorkflow
{
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  DMCRFRestoreFlow *v10;
  _QWORD *v11;
  _QWORD block[5];
  _QWORD v13[3];
  char v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v3 = dispatch_queue_create("fetch_restorable_snapshots_queue", 0);
  v4 = dispatch_time(0, 30000000000);
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke;
  block[3] = &unk_24D52E928;
  block[4] = v13;
  dispatch_after(v4, v3, block);
  -[DMCRFRestoreFlow snapshotSource](self, "snapshotSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_6;
  v8[3] = &unk_24D52EEB0;
  v7 = v3;
  v10 = self;
  v11 = v13;
  v9 = v7;
  objc_msgSend(v6, "fetchRestorableSnapshotsWithCompletion:", v8);

  _Block_object_dispose(v13, 8);
}

void __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "fetch_restorable_snapshots";
      v7 = 2048;
      v8 = 0x403E000000000000;
      _os_log_impl(&dword_216358000, v1, OS_LOG_TYPE_ERROR, "Task %s hasn't finished within %.1f seconds", (uint8_t *)&v5, 0x16u);
    }
    objc_msgSend(CFSTR("fetch_restorable_snapshots"), "stringByAppendingString:", CFSTR("_stackshot.ips"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BE2A7C8];
    DMCHangTracerDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dumpStackshotToPath:fileName:", v4, v2);

  }
}

void __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_2;
  block[3] = &unk_24D52E928;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(v7, block);
  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE2A690];
    DMCErrorArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v9, 59002, v10, v6, *MEMORY[0x24BE2A5A0], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "completion");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleSnapshots:", v5);
  }

}

uint64_t __47__DMCRFRestoreFlow_startManagedRestoreWorkflow__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_handleSnapshots:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  uint8_t v9[16];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCRFRestoreFlow _checkSnapshotForConflictingApps:](self, "_checkSnapshotForConflictingApps:", v6);

  }
  else
  {
    v7 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_DEFAULT, "managed restore skipped because no restorable snapshots are available", v9, 2u);
    }
    -[DMCRFRestoreFlow completion](self, "completion");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0);

  }
}

- (void)_checkSnapshotForConflictingApps:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  DMCRFRestoreFlow *v14;
  id v15;
  _QWORD *v16;
  _QWORD block[5];
  _QWORD v18[3];
  char v19;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v6 = dispatch_queue_create("fetch_app_bundle_ids_queue", 0);
  v7 = dispatch_time(0, 30000000000);
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke;
  block[3] = &unk_24D52E928;
  block[4] = v18;
  dispatch_after(v7, v6, block);
  -[DMCRFRestoreFlow snapshotSource](self, "snapshotSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_15;
  v12[3] = &unk_24D52EED8;
  v10 = v6;
  v16 = v18;
  v13 = v10;
  v14 = self;
  v11 = v4;
  v15 = v11;
  objc_msgSend(v9, "fetchAppBundleIDsForSnapshot:completion:", v5, v12);

  _Block_object_dispose(v18, 8);
}

void __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v1 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "fetch_app_bundle_ids";
      v7 = 2048;
      v8 = 0x403E000000000000;
      _os_log_impl(&dword_216358000, v1, OS_LOG_TYPE_ERROR, "Task %s hasn't finished within %.1f seconds", (uint8_t *)&v5, 0x16u);
    }
    objc_msgSend(CFSTR("fetch_app_bundle_ids"), "stringByAppendingString:", CFSTR("_stackshot.ips"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BE2A7C8];
    DMCHangTracerDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dumpStackshotToPath:fileName:", v4, v2);

  }
}

void __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_2;
  block[3] = &unk_24D52E928;
  block[4] = *(_QWORD *)(a1 + 56);
  dispatch_async(v7, block);
  if (v6)
  {
    v8 = *(NSObject **)(DMCLogObjects() + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      objc_msgSend(v6, "DMCVerboseDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_ERROR, "managed restore failed because list of app bundle identifers in snapshot was not available: %{public}@", buf, 0xCu);

    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE2A690];
    DMCErrorArray();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v12, 59003, v13, v6, *MEMORY[0x24BE2A5A0], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "completion");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_compareAppsOnDeviceToAppBundleIdentifiers:fromSnapshot:", v5, *(_QWORD *)(a1 + 48));
  }

}

uint64_t __53__DMCRFRestoreFlow__checkSnapshotForConflictingApps___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_compareAppsOnDeviceToAppBundleIdentifiers:(id)a3 fromSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[DMCRFRestoreFlow deviceEnvironment](self, "deviceEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "installedAppBundleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_intersectionOfSet:set:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCRFRestoreFlow interactionClient](self, "interactionClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__DMCRFRestoreFlow__compareAppsOnDeviceToAppBundleIdentifiers_fromSnapshot___block_invoke;
  v15[3] = &unk_24D52EF00;
  v15[4] = self;
  v16 = v6;
  v17 = v11;
  v13 = v11;
  v14 = v6;
  objc_msgSend(v12, "doesUserWantToRestoreSnapshot:withConflictingApps:completion:", v14, v13, v15);

}

void __76__DMCRFRestoreFlow__compareAppsOnDeviceToAppBundleIdentifiers_fromSnapshot___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void (**v13)(_QWORD, _QWORD);
  _BOOL4 v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(NSObject **)(DMCLogObjects() + 32);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "DMCVerboseDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_ERROR, "managed restore failed, user could not choose conflict action: %{public}@", buf, 0xCu);

    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE2A690];
    DMCErrorArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v10, 59006, v11, v5, *MEMORY[0x24BE2A588], 0);
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "completion");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[2](v13, v12);

  }
  else
  {
    v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_DEFAULT, "managed restore, user wants to restore and skip conflicting apps (if any)", buf, 2u);
      }
      v15 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_restoreSnapshot:skippingApps:", v12, *(_QWORD *)(a1 + 48));
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_DEFAULT, "managed restore, user does not want to restore", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0);
    }
  }

}

+ (id)_intersectionOfSet:(id)a3 set:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "intersectSet:", v5);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (void)_restoreSnapshotNoConflicts:(id)a3
{
  -[DMCRFRestoreFlow _restoreSnapshot:skippingApps:](self, "_restoreSnapshot:skippingApps:", a3, 0);
}

- (void)_restoreSnapshot:(id)a3 skippingApps:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = *(NSObject **)(DMCLogObjects() + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[DMCRFRestoreFlow _appBundleIdentifiersSetDebugDescription:](self, "_appBundleIdentifiersSetDebugDescription:", v6);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v14 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_DEFAULT, "managed restore, starting restore, skipping apps [%s]", buf, 0xCu);

  }
  -[DMCRFRestoreFlow snapshotSource](self, "snapshotSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__DMCRFRestoreFlow__restoreSnapshot_skippingApps___block_invoke;
  v12[3] = &unk_24D52EF28;
  v12[4] = self;
  objc_msgSend(v11, "startRestoreForSnapshot:excludingAppBundleIdentifiers:completion:", v7, v6, v12);

}

void __50__DMCRFRestoreFlow__restoreSnapshot_skippingApps___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  if (a2)
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BE2A690];
    v5 = a2;
    DMCErrorArray();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 59004, v6, v5, *MEMORY[0x24BE2A5A0], 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "completion");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v7)[2](v7, v8);

}

- (id)_appBundleIdentifiersSetDebugDescription:(id)a3
{
  if (!a3)
    return &stru_24D52F990;
  objc_msgSend(a3, "debugDescription");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (DMCRFSnapshotSource)snapshotSource
{
  return self->_snapshotSource;
}

- (void)setSnapshotSource:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotSource, a3);
}

- (DMCRFInteractionClient)interactionClient
{
  return self->_interactionClient;
}

- (void)setInteractionClient:(id)a3
{
  objc_storeStrong((id *)&self->_interactionClient, a3);
}

- (DMCRFDeviceEnvironment)deviceEnvironment
{
  return self->_deviceEnvironment;
}

- (void)setDeviceEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_deviceEnvironment, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_deviceEnvironment, 0);
  objc_storeStrong((id *)&self->_interactionClient, 0);
  objc_storeStrong((id *)&self->_snapshotSource, 0);
}

@end
