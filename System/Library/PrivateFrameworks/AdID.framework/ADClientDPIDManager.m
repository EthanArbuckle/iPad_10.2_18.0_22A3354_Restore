@implementation ADClientDPIDManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __37__ADClientDPIDManager_sharedInstance__block_invoke()
{
  ADClientDPIDManager *v0;
  void *v1;

  v0 = objc_alloc_init(ADClientDPIDManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

+ (id)DPIDOperationTypeToString:(unint64_t)a3
{
  if (a3 < 0xA)
    return off_24D710708[a3];
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Unexpected DPIDOperationType."));
  return 0;
}

- (ADClientDPIDManager)init
{
  ADClientDPIDManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  ADClientDPIDManager *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *backupFlowQueue;
  _QWORD v20[4];
  ADClientDPIDManager *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ADClientDPIDManager;
  v2 = -[ADClientDPIDManager init](&v22, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDB8E60];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __27__ADClientDPIDManager_init__block_invoke;
    v20[3] = &unk_24D710298;
    v6 = v2;
    v21 = v6;
    v7 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v20);

    -[ADClientDPIDManager setSandboxEnvironment:](v6, "setSandboxEnvironment:", 0);
    v8 = objc_alloc(MEMORY[0x24BDB91F8]);
    v9 = (void *)objc_msgSend(v8, "initWithZoneName:ownerName:", CFSTR("DPIDZone"), *MEMORY[0x24BDB8E88]);
    -[ADClientDPIDManager setZoneID:](v6, "setZoneID:", v9);

    v10 = objc_alloc(MEMORY[0x24BDB91E8]);
    -[ADClientDPIDManager zoneID](v6, "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithRecordName:zoneID:", CFSTR("DPIDRecordID"), v11);
    -[ADClientDPIDManager setRecordIDLegacy:](v6, "setRecordIDLegacy:", v12);

    v13 = objc_alloc(MEMORY[0x24BDB91E8]);
    -[ADClientDPIDManager zoneID](v6, "zoneID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithRecordName:zoneID:", CFSTR("DPIDRecordIDForATP"), v14);
    -[ADClientDPIDManager setRecordID:](v6, "setRecordID:", v15);

    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ADClientDPIDManager setOperationsInProgress:](v6, "setOperationsInProgress:", v16);

    -[ADClientDPIDManager setQualityOfService:](v6, "setQualityOfService:", 17);
    -[ADClientDPIDManager setDpidReconcileState:](v6, "setDpidReconcileState:", 0);
    -[ADClientDPIDManager setDpidReconcileStartDate:](v6, "setDpidReconcileStartDate:", 0);
    v17 = dispatch_queue_create("com.apple.ap.adprivacyd.DPIDBackupFlow", 0);
    backupFlowQueue = v6->_backupFlowQueue;
    v6->_backupFlowQueue = (OS_dispatch_queue *)v17;

  }
  return v2;
}

void __27__ADClientDPIDManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __27__ADClientDPIDManager_init__block_invoke_2;
  v3[3] = &unk_24D710270;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "addOperationWithBlock:", v3);

}

void __27__ADClientDPIDManager_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  objc_msgSend(*(id *)(a1 + 32), "secureContainer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)v7[5];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __27__ADClientDPIDManager_init__block_invoke_26;
  v3[3] = &unk_24D710248;
  v4 = *(id *)(a1 + 32);
  v5 = &v6;
  objc_msgSend(v2, "accountInfoWithCompletionHandler:", v3);

  _Block_object_dispose(&v6, 8);
}

void __27__ADClientDPIDManager_init__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __27__ADClientDPIDManager_init__block_invoke_2_27;
  v12[3] = &unk_24D710220;
  v13 = v6;
  v14 = *(id *)(a1 + 32);
  v15 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "addOperationWithBlock:", v12);

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

uint64_t __27__ADClientDPIDManager_init__block_invoke_2_27(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] ERROR: There was an error getting the account info of the user: %@"), objc_opt_class(), *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v3 = objc_msgSend(*(id *)(a1 + 48), "supportsDeviceToDeviceEncryption");
  result = objc_msgSend(*(id *)(a1 + 40), "supportsDeviceToDeviceEncryption");
  if (v3 != (_DWORD)result)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = objc_opt_class();
    v7 = objc_msgSend(*(id *)(a1 + 40), "supportsDeviceToDeviceEncryption");
    v8 = CFSTR("No");
    if (v7)
      v9 = CFSTR("Yes");
    else
      v9 = CFSTR("No");
    if (v3)
      v8 = CFSTR("Yes");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@] Resetting the local container due to Manatee state change from %@ to %@"), v6, v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    return objc_msgSend(*(id *)(a1 + 40), "setPrivateContainer:", 0);
  }
  return result;
}

- (void)updateActiveRecordICloudDSID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDSIDRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iCloudDSID");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iCloudDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Changing the record's iCloud Identifier: %@ => %@"), v11, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iCloudDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeDSIDRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setICloudDSID:", v8);

  }
}

- (BOOL)canContinueProcessing:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v4 = a3;
  if (-[ADClientDPIDManager dpidReconcileState](self, "dpidReconcileState") == 1)
  {
    -[ADClientDPIDManager dpidReconcileStartDate](self, "dpidReconcileStartDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = -[ADClientDPIDManager dpidReconcileState](self, "dpidReconcileState");
  objc_msgSend(v4, "AD_doubleDateTimeAsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADClientDPIDManager dpidReconcileStartDate](self, "dpidReconcileStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "AD_doubleDateTimeAsString");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("Wont");
  if (v6)
    v13 = CFSTR("Will");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("DPID Reconcile state is %lu. Caller started at %@. Current flow started at %@. %@ continue."), v8, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return v6;
}

- (void)reconcileDPID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *DPID;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  NSObject *backupFlowQueue;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  ADClientDPIDManager *v35;
  id v36;
  _QWORD block[5];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Starting DPID Reconcile."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (-[ADClientDPIDManager dpidReconcileState](self, "dpidReconcileState"))
    -[ADClientDPIDManager reconcileDPID:].cold.1(self);
  -[ADClientDPIDManager startOperation:](self, "startOperation:", 0);
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idForClientType:", 5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  DPID = self->_DPID;
  self->_DPID = v7;

  if (-[ADClientDPIDManager isRestrictedByApple](self, "isRestrictedByApple"))
  {
    objc_msgSend(MEMORY[0x24BE02228], "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke;
    v45[3] = &unk_24D7102C0;
    v45[4] = self;
    v46 = v4;
    objc_msgSend(v9, "addOperationWithBlock:", v45);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "activeDSIDRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = objc_msgSend(v11, "isDPIDLocal");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isDPIDLocal flag is %d"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if ((v10 & 1) == 0)
    {
      -[ADClientDPIDManager setDPID:](self, "setDPID:", 0);
      -[ADClientDPIDManager setupLocalDPID](self, "setupLocalDPID");
    }
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInteger:forKey:", 1, CFSTR("CKDPIDSyncState"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We need to sync with iCloud"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (-[ADClientDPIDManager shouldSyncDPID](self, "shouldSyncDPID"))
    {
      -[ADClientDPIDManager secureContainer](self, "secureContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_privateContainer, v15);
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID reconcile with iCloud"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        self->_dpidReconcileState = 1;
        objc_storeStrong((id *)&self->_dpidReconcileStartDate, v17);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Creating the backup DPID flow."));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        v19 = dispatch_time(0, 120000000000);
        v20 = MEMORY[0x24BDAC760];
        backupFlowQueue = self->_backupFlowQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_4;
        block[3] = &unk_24D710310;
        block[4] = self;
        v22 = v17;
        v38 = v22;
        v23 = v4;
        v39 = v23;
        dispatch_after(v19, backupFlowQueue, block);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Starting to wait for the account status."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        v33[0] = v20;
        v33[1] = 3221225472;
        v33[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_5;
        v33[3] = &unk_24D7103B0;
        v34 = v22;
        v35 = self;
        v36 = v23;
        v25 = v22;
        objc_msgSend(v15, "accountInfoWithCompletionHandler:", v33);

        v26 = v38;
      }
      else
      {
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = *MEMORY[0x24BE02108];
        v47 = *MEMORY[0x24BDD0FC8];
        v48[0] = CFSTR("DPID reconcile: Couldn't create CKContainer");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 9, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[ADClientDPIDManager finishOperation:](self, "finishOperation:", 0);
        objc_msgSend(MEMORY[0x24BE02228], "workQueue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_3;
        v40[3] = &unk_24D7102E8;
        v41 = v31;
        v42 = v4;
        v25 = v31;
        objc_msgSend(v32, "addOperationWithBlock:", v40);

        v26 = v42;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE02228], "workQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_2;
      v43[3] = &unk_24D7102C0;
      v43[4] = self;
      v44 = v4;
      objc_msgSend(v27, "addOperationWithBlock:", v43);

    }
  }

}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateActiveRecordICloudDSID");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateActiveRecordICloudDSID");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backupFlowForCloudKitWorkAtTime:with:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __37__ADClientDPIDManager_reconcileDPID___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_6;
  v11[3] = &unk_24D710388;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v14 = v6;
  v8 = *(void **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = v8;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v11);

}

void __37__ADClientDPIDManager_reconcileDPID___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v2 = objc_msgSend(*(id *)(a1 + 32), "accountStatus");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v5 = v4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("DPID reconcile (started at %@): accountStatusWithCompletionHandler called after %f seconds: accountStatus %ld, error %@"), v7, v5, v2, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v9 = objc_msgSend(*(id *)(a1 + 56), "canContinueProcessing:", *(_QWORD *)(a1 + 40));
  v10 = *(void **)(a1 + 56);
  if (v9)
  {
    objc_msgSend(v10, "setDpidReconcileState:", 2);
    objc_msgSend(*(id *)(a1 + 56), "setSupportsDeviceToDeviceEncryption:", objc_msgSend(*(id *)(a1 + 32), "supportsDeviceToDeviceEncryption"));
    if ((objc_msgSend(*(id *)(a1 + 56), "supportsDeviceToDeviceEncryption") & 1) != 0 && !*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("privateContainer matched what we needed. isPrivateContainerSecure is %d"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 56) + 17));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(*(id *)(a1 + 56), "resolveAccountVsStoredManateeState:andError:with:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = objc_msgSend(*(id *)(a1 + 56), "supportsDeviceToDeviceEncryption");
      v13 = CFSTR("No");
      if (v12)
        v13 = CFSTR("Yes");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Falling back to insecure container due to manatee available (%@) or error: %@"), v13, *(_QWORD *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(*(id *)(a1 + 56), "insecureContainer");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(void **)(v16 + 64);
      *(_QWORD *)(v16 + 64) = v15;

      v18 = *(_QWORD *)(a1 + 56);
      v19 = *(void **)(a1 + 64);
      v20 = *(void **)(v18 + 64);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_7;
      v23[3] = &unk_24D710360;
      v23[4] = v18;
      v24 = v19;
      objc_msgSend(v20, "accountInfoWithCompletionHandler:", v23);

    }
  }
  else
  {
    if (objc_msgSend(v10, "dpidReconcileState") == 2)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The fallback flow is actively being run right now. Maybe we should extend the delay?"));
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The DPID manager was not able to find the CloudKit Account Status in time. An error has already been propagated."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

void __37__ADClientDPIDManager_reconcileDPID___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_8;
  v12[3] = &unk_24D710338;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v12);

}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "resolveAccountVsStoredManateeState:andError:with:", objc_msgSend(*(id *)(a1 + 32), "accountStatus"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)resolveAccountVsStoredManateeState:(int64_t)a3 andError:(id)a4 with:(id)a5
{
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *DPID;
  void *v20;
  void *v21;
  _BOOL4 v22;
  const __CFString *v23;
  void *v24;
  id v25;

  v25 = a4;
  v8 = a5;
  if (self->_isPrivateContainerSecure)
    v9 = CFSTR("Container is secure.");
  else
    v9 = CFSTR("Container is NOT secure.");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeDSIDRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "isDPIDManatee");
  if (v13)
    v14 = CFSTR("DPID was previously stored as Manatee.");
  else
    v14 = CFSTR("DPID was not previously stored as Manatee.");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (self->_isPrivateContainerSecure == v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Container type matches DPID type."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "idForClientType:", 5);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    DPID = self->_DPID;
    self->_DPID = v18;

  }
  else
  {
    -[ADClientDPIDManager setDPID:](self, "setDPID:", 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Container type does not match DPID type. Creating a new DPID locally"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADClientDPIDManager setupLocalDPID](self, "setupLocalDPID");
  }
  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = -[ADClientDPIDManager supportsDeviceToDeviceEncryption](self, "supportsDeviceToDeviceEncryption");
  v23 = CFSTR("NO");
  if (v22)
    v23 = CFSTR("YES");
  objc_msgSend(v21, "stringWithFormat:", CFSTR("iCloud container supportsDeviceToDeviceEncryption: %@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  -[ADClientDPIDManager continueReconcileWithAccountStatus:andError:with:](self, "continueReconcileWithAccountStatus:andError:with:", a3, v25, v8);
}

- (void)backupFlowForCloudKitWorkAtTime:(id)a3 with:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ADClientDPIDManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__ADClientDPIDManager_backupFlowForCloudKitWorkAtTime_with___block_invoke;
  v11[3] = &unk_24D710310;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v11);

}

void __60__ADClientDPIDManager_backupFlowForCloudKitWorkAtTime_with___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "AD_doubleDateTimeAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("The backup flow started at %@ has been fired. Checking to see if we need to run."), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (objc_msgSend(*(id *)(a1 + 40), "canContinueProcessing:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We are still waiting for the iCloud Account Status. Continue with backup flow and provide an error so the DPID can be resolved later."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(*(id *)(a1 + 40), "setDpidReconcileState:", 2);
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 9, CFSTR("Something went wrong while attempting to get the iCloud Account Status."));
    objc_msgSend(*(id *)(a1 + 40), "continueReconcileWithAccountStatus:andError:with:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We are no longer waiting for the account status (%lu)."), objc_msgSend(*(id *)(a1 + 40), "dpidReconcileState"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

}

- (void)continueReconcileWithAccountStatus:(int64_t)a3 andError:(id)a4 with:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(id, id);
  _QWORD v18[5];
  void (**v19)(id, id);

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  if (a3 != 1 || v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID reconcile - iCloud account not available accountStatus %ld"), a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADClientDPIDManager setupLocalDPID](self, "setupLocalDPID");
    -[ADClientDPIDManager setDpidReconcileState:](self, "setDpidReconcileState:", 0);
    if (!v8)
      -[ADClientDPIDManager updateActiveRecordICloudDSID](self, "updateActiveRecordICloudDSID");
    -[ADClientDPIDManager finishOperation:](self, "finishOperation:", 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Done reconciling the DPID."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (v9)
      v9[2](v9, v8);
  }
  else
  {
    if (-[ADClientDPIDManager iCloudAccountSubscribed](self, "iCloudAccountSubscribed"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID reconcile - iCloud account already subscribed for push notifications. "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_3;
      v16[3] = &unk_24D7103D8;
      v16[4] = self;
      v11 = (id *)&v17;
      v17 = v9;
      -[ADClientDPIDManager retryIfNeeded:](self, "retryIfNeeded:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID reconcile - iCloud account not subscribed for push notifications. "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke;
      v18[3] = &unk_24D7103D8;
      v18[4] = self;
      v11 = (id *)&v19;
      v19 = v9;
      -[ADClientDPIDManager setupiCloudSubscription:](self, "setupiCloudSubscription:", v18);
    }

    -[ADClientDPIDManager finishOperation:](self, "finishOperation:", 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Done reconciling the DPID."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

void __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 0);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_2;
    v6[3] = &unk_24D7103D8;
    v6[4] = v4;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "syncDPIDWithiCloud:", v6);

  }
}

void __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID sync failed with error: %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateActiveRecordICloudDSID");
  }
  objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 0);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v7;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    v6 = v7;
  }

}

void __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 0);
  v3 = v5;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateActiveRecordICloudDSID");
    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    v3 = v5;
  }

}

- (void)handlePushNotification:(id)a3 completionHandler:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke;
  v7[3] = &unk_24D710428;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

void __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID handlePushNotification"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForPushNotification");

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", 2, CFSTR("CKDPIDSyncState"));

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke_2;
  v6[3] = &unk_24D710400;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "reconcile:", v6);

}

uint64_t __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resetDPID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID reset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (-[ADClientDPIDManager canGenerateDPID](self, "canGenerateDPID"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Resetting DPID Locally"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADClientDPIDManager generateDPID](self, "generateDPID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADClientDPIDManager setDPID:](self, "setDPID:", v7);

    -[ADClientDPIDManager setIsDPIDLocalTo:](self, "setIsDPIDLocalTo:", 1);
    if (-[ADClientDPIDManager shouldSyncDPID](self, "shouldSyncDPID"))
    {
      -[ADClientDPIDManager DPID](self, "DPID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADClientDPIDManager saveDPIDtoiCloud:completionHandler:](self, "saveDPIDtoiCloud:completionHandler:", v8, 0);

      objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("Not resetting DPID in iCloud");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removing DPID Locally"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADClientDPIDManager setDPID:](self, "setDPID:", 0);
    -[ADClientDPIDManager setIsDPIDLocalTo:](self, "setIsDPIDLocalTo:", 0);
    if (-[ADClientDPIDManager shouldSyncDPID](self, "shouldSyncDPID"))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __33__ADClientDPIDManager_resetDPID___block_invoke;
      v13[3] = &unk_24D710400;
      v14 = v4;
      -[ADClientDPIDManager removeDPIDfromiCloud:](self, "removeDPIDfromiCloud:", v13);

      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("Not removing DPID from iCloud");
  }
  objc_msgSend(v11, "stringWithFormat:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();
LABEL_9:

  if (v4)
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_11:

}

uint64_t __33__ADClientDPIDManager_resetDPID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setIsDPIDLocalTo:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDSIDRecord");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsDPIDLocal:", v3);
}

- (BOOL)isLoggedIntoiTunes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDSIDRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "DSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("0")) ^ 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isLoggedIntoiTunes: DSID is NULL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)primaryiCloudAccountAltDSID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSIDForAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Primary account AltDSID %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return v5;
}

- (unint64_t)primaryiCloudAccountSecurityLevel
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[ADClientDPIDManager primaryiCloudAccountAltDSID](self, "primaryiCloudAccountAltDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "authKitAccountWithAltDSID:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_msgSend(v3, "securityLevelForAccount:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not get account for altDSID %@"), v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isRestrictedByApple
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDSIDRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isRestrictedByApple");
  return (char)v2;
}

- (BOOL)devicePersonalizedAdsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPersonalizedAdsEnabled");

  return v3;
}

- (void)writeDPIDtoKeychain
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  int v23;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDSIDRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v23 = 0;
    GetKeychainPropertyListForKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No DPID record found in keychain, creating new entry"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v6 = (void *)MEMORY[0x24BDBD1B8];
    }
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    -[ADClientDPIDManager DPID](self, "DPID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE021C0], "initWithFlags:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setReconcileOperations:", v11);

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADClientDPIDManager DPID](self, "DPID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("ADClientDPIDRecordKey"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v5);
    }
    else
    {
      objc_msgSend(v8, "removeObjectForKey:", v5);
    }
    v22 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v22;
    v16 = v15;
    if (v15)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = objc_msgSend(v15, "code");
      objc_msgSend(v16, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Error serializing property list. Error %lu.\n%@"), v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    else
    {
      v21 = ADWriteDataToKeychain();
      if (!(_DWORD)v21)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error writing DPID to keychain: %d"), v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (id)subscriptionIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iCloudAccountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ADClientDPIDManager supportsDeviceToDeviceEncryption](self, "supportsDeviceToDeviceEncryption"))
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-secure"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (-[ADClientDPIDManager sandboxEnvironment](self, "sandboxEnvironment"))
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-sandbox"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (BOOL)iCloudAccountSubscribed
{
  ADClientDPIDManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v11;
  int v12;

  v2 = self;
  objc_sync_enter(v2);
  -[ADClientDPIDManager subscriptionIdentifier](v2, "subscriptionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = 0;
    ADCopyDataFromKeychain();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No data to read from keychain for key %@."), CFSTR("ADClientiCloudSubscribedAccountsKey"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      _ADLog();
      v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not read from keychain for %@. Error %ld"), CFSTR("ADClientiCloudSubscribedAccountsKey"), v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    else if (v6)
    {
      v9 = objc_msgSend(v6, "containsObject:", v3);
      goto LABEL_11;
    }
    v9 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  objc_sync_exit(v2);
  return v9;
}

- (void)setiCloudAccountSubscribed:(BOOL)a3
{
  _BOOL4 v3;
  ADClientDPIDManager *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  int v23;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ADClientDPIDManager subscriptionIdentifier](v4, "subscriptionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v23 = 0;
    ADCopyDataFromKeychain();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v22;
      if (v9 || !v8)
        v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      else
        v10 = (id)objc_msgSend(v8, "mutableCopy");
      v12 = v10;
      if (v3)
      {
        if ((objc_msgSend(v10, "containsObject:", v5) & 1) == 0)
          objc_msgSend(v12, "addObject:", v5);
      }
      else
      {
        objc_msgSend(v10, "removeObject:", v5);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nothing previously stored in keychain for key %@"), CFSTR("ADClientiCloudSubscribedAccountsKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    }
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v12, 200, 0, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    v15 = v14;
    if (v14)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      v17 = objc_msgSend(v14, "code");
      objc_msgSend(v15, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Error serializing property list. Error %lu.\n%@"), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    else
    {
      v20 = ADWriteDataToKeychain();
      if ((_DWORD)v20)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error writing ADClientiCloudSubscribedAccountsKey to keychain: %d"), v20);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Added subscribed iCloud account to keychain"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();
    }

  }
  objc_sync_exit(v4);

}

- (id)operationQueueLog
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ADClientDPIDManager operationsInProgress](self, "operationsInProgress", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        +[ADClientDPIDManager DPIDOperationTypeToString:](ADClientDPIDManager, "DPIDOperationTypeToString:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "integerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)startOperation:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ADClientDPIDManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ADClientDPIDManager operationsInProgress](obj, "operationsInProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = (void *)MEMORY[0x24BDD17C8];
  +[ADClientDPIDManager DPIDOperationTypeToString:](ADClientDPIDManager, "DPIDOperationTypeToString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("startOperation: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v9 = (void *)MEMORY[0x24BDD17C8];
  -[ADClientDPIDManager operationQueueLog](obj, "operationQueueLog");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("    operationsInProgress: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_sync_exit(obj);
}

- (void)finishOperation:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ADClientDPIDManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ADClientDPIDManager operationsInProgress](obj, "operationsInProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) != 0)
  {
    -[ADClientDPIDManager operationsInProgress](obj, "operationsInProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "indexOfObject:", v8);

    -[ADClientDPIDManager operationsInProgress](obj, "operationsInProgress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", v9);

    v11 = (void *)MEMORY[0x24BDD17C8];
    +[ADClientDPIDManager DPIDOperationTypeToString:](ADClientDPIDManager, "DPIDOperationTypeToString:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("finishOperation: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v14 = (void *)MEMORY[0x24BDD17C8];
    -[ADClientDPIDManager operationQueueLog](obj, "operationQueueLog");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("    operationsInProgress: %@"), v15);
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    +[ADClientDPIDManager DPIDOperationTypeToString:](ADClientDPIDManager, "DPIDOperationTypeToString:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("******** Attempt to remove operation that wasn't present %@"), v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_sync_exit(obj);
}

- (id)containerWithIDString:(id)a3
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  if (self->_sandboxEnvironment)
    v3 = 2;
  else
    v3 = 1;
  v4 = (objc_class *)MEMORY[0x24BDB9038];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContainerIdentifier:environment:", v5, v3);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9030]), "initWithContainerID:", v6);
  return v7;
}

- (id)secureContainer
{
  void *v3;
  void *v4;

  -[ADClientDPIDManager containerWithIDString:](self, "containerWithIDString:", CFSTR("com.apple.iad-cloudkit-secure"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceApplicationBundleIdentifier:", *MEMORY[0x24BE02148]);
  self->_isPrivateContainerSecure = 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Created secure privateContainer %@ %@. isPrivateContainerSecure is %d."), CFSTR("com.apple.iad-cloudkit-secure"), v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return v3;
}

- (id)insecureContainer
{
  void *v3;
  void *v4;

  -[ADClientDPIDManager containerWithIDString:](self, "containerWithIDString:", CFSTR("com.apple.iad-cloudkit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceApplicationBundleIdentifier:", *MEMORY[0x24BE02148]);
  self->_isPrivateContainerSecure = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Created insecure privateContainer %@ %@. isPrivateContainerSecure is %d;"),
    CFSTR("com.apple.iad-cloudkit"),
    v3,
    0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return v3;
}

- (void)setDPID:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  if ((-[NSString isEqual:](self->_DPID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_DPID, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Setting DPID to %@."), self->_DPID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADClientDPIDManager writeDPIDtoKeychain](self, "writeDPIDtoKeychain");
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDSIDRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "setID:forClientType:", v10, 5);
      if (-[ADClientDPIDManager supportsDeviceToDeviceEncryption](self, "supportsDeviceToDeviceEncryption"))
      {
        v8 = v7;
        v9 = 1;
      }
      else
      {
        v8 = v7;
        v9 = 0;
      }
      objc_msgSend(v8, "setIsDPIDManatee:", v9);
    }
    else
    {
      objc_msgSend(v7, "removeIDForClientType:", 5);
    }

  }
}

- (void)setupLocalDPID
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("setupLocalDPID:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v4 = -[ADClientDPIDManager canGenerateDPID](self, "canGenerateDPID");
  -[ADClientDPIDManager DPID](self, "DPID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Keeping NULL DPID %@"), self->_DPID);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      _ADLog();
      goto LABEL_10;
    }
    -[ADClientDPIDManager setDPID:](self, "setDPID:", 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removing DPID locally."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    -[ADClientDPIDManager setIsDPIDLocalTo:](self, "setIsDPIDLocalTo:", 0);
    goto LABEL_8;
  }

  if (!v6)
  {
    -[ADClientDPIDManager setIsDPIDLocalTo:](self, "setIsDPIDLocalTo:", 1);
    -[ADClientDPIDManager generateDPID](self, "generateDPID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADClientDPIDManager setDPID:](self, "setDPID:", v12);

    v13 = (void *)MEMORY[0x24BDD17C8];
    -[ADClientDPIDManager DPID](self, "DPID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Storing NEW DPID locally. %@."), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

LABEL_8:
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInteger:forKey:", 1, CFSTR("CKDPIDSyncState"));
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DPID %@ Already exists, checking for isDPIDLocal flag"), self->_DPID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "activeDSIDRecord");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v16, "isDPIDLocal");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("isDPIDLocal flag is %d"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if ((v8 & 1) == 0)
  {
    -[ADClientDPIDManager generateDPID](self, "generateDPID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADClientDPIDManager setDPID:](self, "setDPID:", v10);

    -[ADClientDPIDManager setIsDPIDLocalTo:](self, "setIsDPIDLocalTo:", 1);
  }
LABEL_10:

}

- (id)generateDPID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("DPID-"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldSyncDPID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  char v13;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iCloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeDSIDRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "DSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iCloudDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = objc_msgSend(v8, "isEqualToString:", v6);
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    objc_msgSend(v9, "stringWithFormat:", CFSTR("\nshouldSyncDPID:\t%@\niCloudDSID:\t%@\niTunesDSID:\t%@\n"), v11, v8, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v13 = objc_msgSend(v8, "isEqualToString:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("shouldSyncDPID: No iCloud Account, not syncing"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    v13 = 0;
  }

  return v13;
}

- (BOOL)canGenerateDPID
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = -[ADClientDPIDManager isLoggedIntoiTunes](self, "isLoggedIntoiTunes");
  v4 = -[ADClientDPIDManager isRestrictedByApple](self, "isRestrictedByApple");
  v5 = -[ADClientDPIDManager devicePersonalizedAdsEnabled](self, "devicePersonalizedAdsEnabled");
  v6 = v5 && !v4;
  v7 = CFSTR("NO");
  if (v3)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v3 & v6;
  if ((v3 & v6) != 0)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (v4)
    v11 = CFSTR("NO");
  else
    v11 = CFSTR("YES");
  if (v5)
    v7 = CFSTR("YES");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nCan Generate DPID:\t\t%@\niTunes Logged In:\t\t%@\nNot Restricted By Apple:\t%@\nPersonalized Ads Enabled:\t\t\t%@"), v10, v8, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return v9;
}

- (void)retryIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", CFSTR("CKDPIDSyncState"));

  switch(v6)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Retrying DPID Sync"), objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __37__ADClientDPIDManager_retryIfNeeded___block_invoke;
      v17[3] = &unk_24D710400;
      v18 = v4;
      -[ADClientDPIDManager syncDPIDWithiCloud:](self, "syncDPIDWithiCloud:", v17);
      v8 = v18;
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Retrying DPID Fetch"), objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __37__ADClientDPIDManager_retryIfNeeded___block_invoke_3;
      v13[3] = &unk_24D710450;
      v13[4] = self;
      v14 = v4;
      -[ADClientDPIDManager fetchDPIDfromiCloud:](self, "fetchDPIDfromiCloud:", v13);
      v8 = v14;
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Retrying DPID Save"), objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      -[ADClientDPIDManager DPID](self, "DPID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADClientDPIDManager saveDPIDtoiCloud:completionHandler:](self, "saveDPIDtoiCloud:completionHandler:", v11, 0);

      goto LABEL_5;
    case 4:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Retrying DPID Remove"), objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __37__ADClientDPIDManager_retryIfNeeded___block_invoke_2;
      v15[3] = &unk_24D710400;
      v16 = v4;
      -[ADClientDPIDManager removeDPIDfromiCloud:](self, "removeDPIDfromiCloud:", v15);
      v8 = v16;
LABEL_8:

      break;
    default:
LABEL_5:
      if (v4)
        (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      break;
  }

}

void __37__ADClientDPIDManager_retryIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Retry: Failed to sync DPID in iCloud with error: %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __37__ADClientDPIDManager_retryIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Retry: Failed to remove DPID record from iCloud with error: %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __37__ADClientDPIDManager_retryIfNeeded___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Retry: Failed to fetch DPID from iCloud with error: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDPID:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setIsDPIDLocalTo:", 0);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);

}

- (void)resetEncryptedZone:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  ADClientDPIDManager *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[ADClientDPIDManager dpidReconcileStartDate](self, "dpidReconcileStartDate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Deleting inaccessible encrypted container"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  -[ADClientDPIDManager privateContainer](self, "privateContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateCloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ADClientDPIDManager startOperation:](self, "startOperation:", 9);
  v8 = objc_alloc(MEMORY[0x24BDB9150]);
  -[ADClientDPIDManager zoneID](self, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v10);

  objc_msgSend(v11, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __42__ADClientDPIDManager_resetEncryptedZone___block_invoke;
  v16 = &unk_24D7104A0;
  v17 = self;
  v18 = v4;
  v12 = v4;
  objc_msgSend(v11, "setModifyRecordZonesCompletionBlock:", &v13);
  -[ADClientDPIDManager setDpidReconcileState:](self, "setDpidReconcileState:", 1, v13, v14, v15, v16, v17);
  objc_msgSend(v7, "addOperation:", v11);

}

void __42__ADClientDPIDManager_resetEncryptedZone___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a2;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__ADClientDPIDManager_resetEncryptedZone___block_invoke_2;
  v12[3] = &unk_24D710478;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v12);

}

uint64_t __42__ADClientDPIDManager_resetEncryptedZone___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "canContinueProcessing:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setiCloudAccountSubscribed:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 2);
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 48), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Deleted DPID zone %@ with error %@."), v3, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("We were unable to delete the encrypted zone in enough time. (Started at %@)"), v3, v7);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  return objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 9);
}

- (void)setupiCloudSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, void *);
  void *v19;
  ADClientDPIDManager *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ADClientDPIDManager dpidReconcileStartDate](self, "dpidReconcileStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Beginning DPID Subscription Installation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  -[ADClientDPIDManager privateContainer](self, "privateContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "privateCloudDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ADClientDPIDManager startOperation:](self, "startOperation:", 1);
    v9 = objc_alloc(MEMORY[0x24BDB91F0]);
    -[ADClientDPIDManager zoneID](self, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithZoneID:", v10);

    v12 = objc_alloc(MEMORY[0x24BDB9150]);
    v24[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v13, 0);

    objc_msgSend(v14, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke;
    v19 = &unk_24D710518;
    v20 = self;
    v21 = v5;
    v15 = v8;
    v22 = v15;
    v23 = v4;
    objc_msgSend(v14, "setModifyRecordZonesCompletionBlock:", &v16);
    -[ADClientDPIDManager setDpidReconcileState:](self, "setDpidReconcileState:", 1, v16, v17, v18, v19, v20);
    objc_msgSend(v15, "addOperation:", v14);

  }
  else
  {
    -[ADClientDPIDManager createErrorForPrivateDB:completionHandler:](self, "createErrorForPrivateDB:completionHandler:", CFSTR("Unable to set up iCloud subscription due to missing iCloud container"), v4);
  }

}

void __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v6 = a2;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2;
  v12[3] = &unk_24D7104F0;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v6;
  v15 = v7;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "addOperationWithBlock:", v12);

}

uint64_t __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  if ((objc_msgSend(*(id *)(a1 + 32), "canContinueProcessing:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 2);
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 48), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("Created DPID zone %@ with error code %ld %@ "), v3, objc_msgSend(*(id *)(a1 + 56), "code"), *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed To create DPID zone with error %@. Handling CloudKit error."), *(_QWORD *)(a1 + 56));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(*(id *)(a1 + 32), "handleCloudKitError:", *(_QWORD *)(a1 + 56));
      v6 = *(_QWORD *)(a1 + 72);
      if (v6)
        (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 56));
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x24BDB9210]);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithZoneID:subscriptionID:", v12, CFSTR("com.apple.AdSheetPhone.DPID.push.subscription"));

      if (!v13)
        __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2_cold_1();
      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setShouldSendContentAvailable:", 1);
      objc_msgSend(v13, "setNotificationInfo:", v14);
      objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 1);
      v15 = *(void **)(a1 + 64);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_3;
      v17[3] = &unk_24D7104C8;
      v16 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v16;
      v19 = *(id *)(a1 + 72);
      objc_msgSend(v15, "saveSubscription:completionHandler:", v13, v17);

    }
    return objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 1);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("We were unable to Create a CloudKit zone to create a subscription in enough time. (Started at %@)"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    return objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 1);
  }
}

void __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_4;
  v11[3] = &unk_24D710388;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v6;
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "addOperationWithBlock:", v11);

}

uint64_t __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;
  void *v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "canContinueProcessing:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 2);
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed To create DPID subscription %@ with error %@."), *(_QWORD *)(a1 + 56), v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Created DPID subscription %@ "), *(_QWORD *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(*(id *)(a1 + 32), "setiCloudAccountSubscribed:", 1);
    }
    result = *(_QWORD *)(a1 + 64);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("We were unable to finish the CloudKit subscription process on time. (Started at %@)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    return objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 1);
  }
  return result;
}

- (void)teardowniCloudSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Beginning DPID Teardown action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  -[ADClientDPIDManager privateContainer](self, "privateContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateCloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ADClientDPIDManager startOperation:](self, "startOperation:", 2);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke;
    v8[3] = &unk_24D710608;
    v8[4] = self;
    v10 = v4;
    v9 = v7;
    objc_msgSend(v9, "fetchAllSubscriptionsWithCompletionHandler:", v8);

  }
  else
  {
    -[ADClientDPIDManager createErrorForPrivateDB:completionHandler:](self, "createErrorForPrivateDB:completionHandler:", CFSTR("Unable to tear down iCloud subscription due to missing iCloud container"), v4);
  }

}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_2;
  v10[3] = &unk_24D7105E0;
  v11 = v6;
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "addOperationWithBlock:", v10);

}

uint64_t __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v5 = objc_alloc(MEMORY[0x24BDB91F0]);
      objc_msgSend(*(id *)(a1 + 48), "zoneID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithZoneID:", v6);

      v8 = objc_alloc(MEMORY[0x24BDB9150]);
      v19[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v9, 0);

      objc_msgSend(v10, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 48), "qualityOfService"));
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_3;
      v14[3] = &unk_24D710518;
      v15 = *(id *)(a1 + 40);
      v11 = *(id *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 48);
      v16 = v11;
      v17 = v12;
      v18 = *(id *)(a1 + 64);
      objc_msgSend(v10, "setModifyRecordZonesCompletionBlock:", v14);
      objc_msgSend(*(id *)(a1 + 56), "addOperation:", v10);

      return objc_msgSend(*(id *)(a1 + 48), "finishOperation:", 2);
    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fetchAllSubscriptionsWithCompletionHandler subscriptions %@ error %@."), *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(*(id *)(a1 + 48), "setiCloudAccountSubscribed:", 0);
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 48), "finishOperation:", 2);
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_4;
  v17[3] = &unk_24D7105B8;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v21 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(a1 + 56);
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v10, "addOperationWithBlock:", v17);

}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id obj;
  _QWORD v15[6];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Saved DPID zone: savedRecordZones %@ deletedRecordZoneIDs %@ with error %@."), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (*(_QWORD *)(a1 + 48))
  {
    v3 = *(_QWORD *)(a1 + 80);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = *(id *)(a1 + 56);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      v7 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v10 = *(void **)(a1 + 64);
          objc_msgSend(v9, "subscriptionID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v7;
          v15[1] = 3221225472;
          v15[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_5;
          v15[3] = &unk_24D710590;
          v12 = *(_QWORD *)(a1 + 72);
          v13 = *(void **)(a1 + 80);
          v15[4] = v9;
          v15[5] = v12;
          v18 = v13;
          v16 = *(id *)(a1 + 64);
          v17 = *(id *)(a1 + 48);
          objc_msgSend(v10, "deleteSubscriptionWithID:completionHandler:", v11, v15);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }

  }
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_6;
  v8[3] = &unk_24D710568;
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v6;
  v13 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v7 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v8);

}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Deleted DPID subscription %@ with error %@."), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 72);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setiCloudAccountSubscribed:", 0);
    v4 = objc_alloc(MEMORY[0x24BDB9150]);
    objc_msgSend(*(id *)(a1 + 48), "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v6);

    objc_msgSend(v7, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 48), "qualityOfService"));
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_7;
    v8[3] = &unk_24D710540;
    v9 = *(id *)(a1 + 72);
    objc_msgSend(v7, "setModifyRecordZonesCompletionBlock:", v8);
    objc_msgSend(*(id *)(a1 + 56), "addOperation:", v7);

  }
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_8;
  v14[3] = &unk_24D710338;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = *(id *)(a1 + 32);
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "addOperationWithBlock:", v14);

}

uint64_t __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_8(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Deleted DPID zone: savedRecordZones %@ deletedRecordZoneIDs %@ with error %@."), a1[4], a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[6]);
  return result;
}

- (void)createErrorForPrivateDB:(id)a3 completionHandler:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a4;
  v5 = (objc_class *)MEMORY[0x24BDD1540];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithAdCode:andDescription:", 9, v6);

  objc_msgSend(v7, "AD_Log:", CFSTR("DPIDLogging"));
  if (v8)
    v8[2](v8, v7);

}

- (id)conformDPIDToUseWithRecord:(id)a3 legacyRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("[%@] Found a migrated DPID record!"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The error is real. No DPID found in iCloud. Returning nil DPID."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v18 = 0;
      goto LABEL_9;
    }
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("[%@] Found a legacy DPID record!"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
  }
  _ADLog();

  v16 = v13;
  if (-[ADClientDPIDManager supportsDeviceToDeviceEncryption](self, "supportsDeviceToDeviceEncryption"))
  {
    objc_msgSend(v16, "encryptedValuesByKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DPID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reading encrypted DPID %@"), v18);
  }
  else
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("DPID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reading unencrypted DPID %@"), v18);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  _ADLog();

  return v18;
}

- (void)fetchDPIDfromiCloud:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  ADClientDPIDManager *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ADClientDPIDManager dpidReconcileStartDate](self, "dpidReconcileStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ADClientDPIDManager devicePersonalizedAdsEnabled](self, "devicePersonalizedAdsEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Attempting to fetch the DPID from iCloud."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInteger:forKey:", 2, CFSTR("CKDPIDSyncState"));

    -[ADClientDPIDManager startOperation:](self, "startOperation:", 5);
    -[ADClientDPIDManager privateContainer](self, "privateContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "privateCloudDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ADClientDPIDManager setDpidReconcileState:](self, "setDpidReconcileState:", 1);
      v10 = objc_alloc(MEMORY[0x24BDB90E8]);
      -[ADClientDPIDManager recordID](self, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      -[ADClientDPIDManager recordIDLegacy](self, "recordIDLegacy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v10, "initWithRecordIDs:", v13);

      objc_msgSend(v14, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_2;
      v20 = &unk_24D710630;
      v21 = self;
      v22 = v5;
      v23 = v4;
      objc_msgSend(v14, "setFetchRecordsCompletionBlock:", &v17);
      objc_msgSend(v9, "addOperation:", v14, v17, v18, v19, v20, v21);

    }
    else
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke;
      v24[3] = &unk_24D7103D8;
      v24[4] = self;
      v25 = v4;
      -[ADClientDPIDManager createErrorForPrivateDB:completionHandler:](self, "createErrorForPrivateDB:completionHandler:", CFSTR("Unable to fetch iCloud DPID due to missing iCloud container"), v24);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fetchDPIDfromiCloud: Personalized Ads is disabled, not fetching"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));

    if (v4)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
  }

}

void __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 5);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v3 + 16))(v3, 0, v4, 0);

}

void __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_3;
  v11[3] = &unk_24D710388;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v5;
  v14 = v6;
  v15 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v11);

}

void __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  if ((objc_msgSend(*(id *)(a1 + 32), "canContinueProcessing:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("We were unable to fetch the record in time. (Started at %@)"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 5);
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "setDpidReconcileState:", 2);
  v2 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "recordIDLegacy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(id *)(a1 + 56);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "code");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iCloud returned an error fetching records: %@ code %ld. Checking if there is an actual error."), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (v9 == 11 || v9 == 2)
    {

      objc_msgSend(*(id *)(a1 + 32), "conformDPIDToUseWithRecord:legacyRecord:", v25, v6);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v6)
        v13 = v11 == 0;
      else
        v13 = 1;
      v15 = !v13 && v25 == 0;
      objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));

      v8 = 0;
      goto LABEL_24;
    }
    objc_msgSend(*(id *)(a1 + 32), "handleCloudKitError:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v25)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "supportsDeviceToDeviceEncryption"))
      {
        objc_msgSend(v25, "encryptedValuesByKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("DPID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reading encrypted DPID %@"), v12);
      }
      else
      {
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("DPID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reading unencrypted DPID %@"), v12);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));

      v8 = 0;
      v15 = 0;
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iCloud Returned no error but failed to fetch record, please file a radar."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v8 = 0;
  }
  v15 = 0;
  v12 = 0;
LABEL_24:
  objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 5);
  v24 = *(_QWORD *)(a1 + 64);
  if (v24)
    (*(void (**)(uint64_t, void *, void *, uint64_t))(v24 + 16))(v24, v12, v8, v15);

}

- (void)removeDPIDfromiCloud:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Beginning DPID Remove action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  -[ADClientDPIDManager privateContainer](self, "privateContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateCloudDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInteger:forKey:", 4, CFSTR("CKDPIDSyncState"));

    -[ADClientDPIDManager startOperation:](self, "startOperation:", 8);
    if (v4)
      v4[2](v4, 0);
    v9 = objc_alloc(MEMORY[0x24BDB9158]);
    -[ADClientDPIDManager recordID](self, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithRecordsToSave:recordIDsToDelete:", MEMORY[0x24BDBD1A8], v11);

    objc_msgSend(v12, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke;
    v13[3] = &unk_24D710680;
    v13[4] = self;
    objc_msgSend(v12, "setModifyRecordsCompletionBlock:", v13);
    objc_msgSend(v7, "addOperation:", v12);

  }
  else
  {
    -[ADClientDPIDManager createErrorForPrivateDB:completionHandler:](self, "createErrorForPrivateDB:completionHandler:", CFSTR("Unable to remove iCloud DPID due to missing iCloud container"), v4);
  }

}

void __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke_2;
  v9[3] = &unk_24D710658;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v9);

}

uint64_t __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to remove DPID record in iCloud with error: %@"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Removed DPID record in iCloud for current user."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));
  }

  return objc_msgSend(*(id *)(a1 + 40), "finishOperation:", 8);
}

- (void)handleCloudKitError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
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
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] handleCloudKitError. error code %ld"), objc_opt_class(), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (v5 == 5006)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We have attempted to use an encrypted container on a non HSA2 account CKErrorInternaliCDPRequired, please file a radar."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 5008)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We need to wait and try again later because of CKErrorInternalUnsyncedKeychain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _ADLog();

LABEL_6:
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB8EA8];
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Correctly identified as cloudkit domain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    if (v5 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got error code as CKErrorPartialFailure. Need to get the exact reason for partial failure."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(v4, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BDB8EE8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v29 = v18;
      objc_msgSend(v18, "allValues");
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
            objc_msgSend(v24, "domain");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "isEqualToString:", v9))
            {
              v26 = objc_msgSend(v24, "code");

              if (v26 == 112)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found error code as CKErrorPrivateMissingManateeIdentity"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                _ADLog();

                goto LABEL_23;
              }
            }
            else
            {

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v21);
      }

    }
    else if (v5 == 112)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got error code as CKErrorPrivateMissingManateeIdentity"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

LABEL_23:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We need to delete and re-create the zone due to CKErrorPrivateMissingManateeIdentity"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      -[ADClientDPIDManager resetEncryptedZone:](self, "resetEncryptedZone:", &__block_literal_global_340);
    }
  }
  else
  {
    objc_msgSend(v4, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Incorrectly identified domain. Domain is %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

void __43__ADClientDPIDManager_handleCloudKitError___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error resetting Encrypted zone %@, please file a radar."), a2);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

- (void)saveDPIDtoiCloud:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Beginning DPID Save action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteger:forKey:", 3, CFSTR("CKDPIDSyncState"));

  -[ADClientDPIDManager privateContainer](self, "privateContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "privateCloudDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDB91D8]);
    -[ADClientDPIDManager recordID](self, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithRecordType:recordID:", CFSTR("DPIDRecord"), v13);

    if (-[ADClientDPIDManager supportsDeviceToDeviceEncryption](self, "supportsDeviceToDeviceEncryption"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Writing encrypted DPID %@"), v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(v14, "encryptedValuesByKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, CFSTR("DPID"));

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Writing unencrypted DPID %@"), v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

      objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("DPID"));
    }
    -[ADClientDPIDManager startOperation:](self, "startOperation:", 7);
    v18 = objc_alloc(MEMORY[0x24BDB9158]);
    v23[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithRecordsToSave:recordIDsToDelete:", v19, 0);

    objc_msgSend(v20, "setSavePolicy:", 1);
    objc_msgSend(v20, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke;
    v21[3] = &unk_24D7106E8;
    v21[4] = self;
    v22 = v7;
    objc_msgSend(v20, "setModifyRecordsCompletionBlock:", v21);
    objc_msgSend(v11, "addOperation:", v20);

  }
  else
  {
    -[ADClientDPIDManager createErrorForPrivateDB:completionHandler:](self, "createErrorForPrivateDB:completionHandler:", CFSTR("Unable to save iCloud DPID due to missing iCloud container"), v7);
  }

}

void __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke_2;
  v10[3] = &unk_24D710310;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11 = v5;
  v12 = v7;
  v13 = v8;
  v9 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v10);

}

uint64_t __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to save DPID record to iCloud with error: %@"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(*(id *)(a1 + 40), "handleCloudKitError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Updated DPID record in iCloud"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));

    objc_msgSend(*(id *)(a1 + 40), "setIsDPIDLocalTo:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "finishOperation:", 7);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)syncDPIDWithiCloud:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ADClientDPIDManager startOperation:](self, "startOperation:", 4);
  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", 1, CFSTR("CKDPIDSyncState"));

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke;
  v7[3] = &unk_24D710450;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ADClientDPIDManager fetchDPIDfromiCloud:](self, "fetchDPIDfromiCloud:", v7);

}

void __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;

  v7 = a2;
  v8 = a3;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 4);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_15:
      v10();
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v7)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("syncDPIDWithiCloud: Downloaded DPID %@"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(*(id *)(a1 + 32), "setDPID:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setIsDPIDLocalTo:", 0);
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = objc_opt_class();
  if ((a4 & 1) != 0)
  {
    objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@] The DPID requires migration to the new iCloud container"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

LABEL_7:
    if ((objc_msgSend(*(id *)(a1 + 32), "canGenerateDPID") & 1) != 0)
    {
      if (!v7 || (a4 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "generateDPID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setDPID:", v15);

        objc_msgSend(*(id *)(a1 + 32), "setIsDPIDLocalTo:", 1);
      }
      v16 = *(void **)(a1 + 32);
      objc_msgSend(v16, "DPID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke_2;
      v22[3] = &unk_24D7103D8;
      v18 = *(void **)(a1 + 40);
      v22[4] = *(_QWORD *)(a1 + 32);
      v23 = v18;
      objc_msgSend(v16, "saveDPIDtoiCloud:completionHandler:", v17, v22);

      goto LABEL_16;
    }
    goto LABEL_13;
  }
  objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@] No migration required. Done syncing with iCloud."), v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));

LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 4);
  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
  {
    v10 = *(void (**)(void))(v21 + 16);
    goto LABEL_15;
  }
LABEL_16:

}

void __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "setInteger:forKey:", 3, CFSTR("CKDPIDSyncState"));
  }
  else
  {
    objc_msgSend(v3, "setInteger:forKey:", 0, CFSTR("CKDPIDSyncState"));

    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "DPID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("syncDPIDWithiCloud: Uploaded new DPID %@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_msgSend(*(id *)(a1 + 32), "finishOperation:", 4);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

- (BOOL)isTest
{
  return self->_isTest;
}

- (unint64_t)dpidReconcileState
{
  return self->_dpidReconcileState;
}

- (void)setDpidReconcileState:(unint64_t)a3
{
  self->_dpidReconcileState = a3;
}

- (NSDate)dpidReconcileStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDpidReconcileStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (CKRecordID)recordIDLegacy
{
  return self->_recordIDLegacy;
}

- (void)setRecordIDLegacy:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDLegacy, a3);
}

- (CKContainer)privateContainer
{
  return self->_privateContainer;
}

- (void)setPrivateContainer:(id)a3
{
  objc_storeStrong((id *)&self->_privateContainer, a3);
}

- (BOOL)isPrivateContainerSecure
{
  return self->_isPrivateContainerSecure;
}

- (void)setIsPrivateContainerSecure:(BOOL)a3
{
  self->_isPrivateContainerSecure = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSString)DPID
{
  return self->_DPID;
}

- (BOOL)updateInProgress
{
  return self->_updateInProgress;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (NSMutableArray)operationsInProgress
{
  return self->_operationsInProgress;
}

- (void)setOperationsInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_operationsInProgress, a3);
}

- (BOOL)sandboxEnvironment
{
  return self->_sandboxEnvironment;
}

- (void)setSandboxEnvironment:(BOOL)a3
{
  self->_sandboxEnvironment = a3;
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_supportsDeviceToDeviceEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationsInProgress, 0);
  objc_storeStrong((id *)&self->_DPID, 0);
  objc_storeStrong((id *)&self->_privateContainer, 0);
  objc_storeStrong((id *)&self->_recordIDLegacy, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_dpidReconcileStartDate, 0);
  objc_storeStrong((id *)&self->_backupFlowQueue, 0);
}

- (void)reconcileDPID:(void *)a1 .cold.1(void *a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] We have gotten into an impossible state (%lu). We are going to crash now. Goodbye."), objc_opt_class(), objc_msgSend(a1, "dpidReconcileState"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  __assert_rtn("-[ADClientDPIDManager reconcileDPID:]", "ADClientDPIDManager.m", 257, "false");
}

void __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2_cold_1()
{
  __assert_rtn("-[ADClientDPIDManager setupiCloudSubscription:]_block_invoke_2", "ADClientDPIDManager.m", 1023, "subscription");
}

@end
