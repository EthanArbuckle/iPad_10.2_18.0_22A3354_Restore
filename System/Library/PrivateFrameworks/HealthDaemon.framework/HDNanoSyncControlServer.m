@implementation HDNanoSyncControlServer

- (void)remote_fetchNanoSyncPairedDevicesWithCompletion:(id)a3
{
  HDNanoSyncManager *nanoSyncManager;
  id v5;
  id v6;

  nanoSyncManager = self->_nanoSyncManager;
  v5 = a3;
  -[HDNanoSyncManager pairedDevicesSnapshot](nanoSyncManager, "pairedDevicesSnapshot");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)remote_forceNanoSyncWithOptions:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  -[HDStandardTaskServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "process");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("External request from %@"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HDNanoSyncManager syncHealthDataWithOptions:reason:completion:](self->_nanoSyncManager, "syncHealthDataWithOptions:reason:completion:", a3, v11, v7);
}

- (void)remote_resetNanoSyncWithCompletion:(id)a3
{
  -[HDNanoSyncManager resetSyncWithCompletion:](self->_nanoSyncManager, "resetSyncWithCompletion:", a3);
}

- (void)remote_waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5
{
  -[HDNanoSyncManager waitForLastChanceSyncWithDevicePairingID:timeout:completion:](self->_nanoSyncManager, "waitForLastChanceSyncWithDevicePairingID:timeout:completion:", a3, a5, a4);
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDNanoSyncControlServer *v17;
  HDNanoSyncManager *v18;
  HDNanoSyncManager *nanoSyncManager;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "nanoSyncManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDNanoSyncControlServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
    v18 = v16;
    nanoSyncManager = v17->_nanoSyncManager;
    v17->_nanoSyncManager = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    nanoSyncManager = (HDNanoSyncManager *)(id)objc_claimAutoreleasedReturnValue();
    if (nanoSyncManager)
    {
      if (a7)
        *a7 = objc_retainAutorelease(nanoSyncManager);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6908], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoSyncManager, 0);
}

@end
