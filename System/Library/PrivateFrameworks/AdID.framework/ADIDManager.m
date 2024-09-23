@implementation ADIDManager

void __50__ADIDManager_Private__setDSID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadNoServicesRestrictions");

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]: Reloaded no services regional restriction: %d"), v4, objc_msgSend(v5, "isRestrictedRegion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if ((ADSimulatedCrashKillCode_InternalInconsistency_block_invoke_settingDSID & 1) != 0)
    goto LABEL_3;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v9);

  if ((_DWORD)v7)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ setDSID]: DSID already set to %@."), objc_opt_class(), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(*(id *)(a1 + 32), "saveDataForPCD");
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    return;
  }
  ADSimulatedCrashKillCode_InternalInconsistency_block_invoke_settingDSID = 1;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  if (v13)
  {
    if (objc_msgSend(v13, "length"))
      goto LABEL_10;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  v14 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = CFSTR("0");

LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "save");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "DSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("[%@]: Failed to save record for current DSID %@"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Request to set DSID to %@"), objc_opt_class(), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "DSID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v21, "isEqualToString:", v23);

  if ((v21 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: DSID already set to %@, skipping."), objc_opt_class(), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
LABEL_16:

    goto LABEL_17;
  }
  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "reloadRecords:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE02260]), "initWithDSID:serializedRecord:version:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0, 3);
    objc_msgSend(*(id *)(a1 + 32), "setActiveDSIDRecord:", v24);
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPersonalizedAdsTimestamp:", objc_msgSend(v28, "AD_toServerTime"));

  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "ensureiAdIDs");

  ADSimulatedCrashKillCode_InternalInconsistency_block_invoke_settingDSID = 0;
  v30 = *(_QWORD *)(a1 + 40);
  if (v30)
    (*(void (**)(void))(v30 + 16))();

}

void __28__ADIDManager_Private__init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Received clear monthly reset count notification"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "setMonthlyResetArray:", v5);

  objc_sync_exit(v4);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "save");

}

uint64_t __38__ADIDManager_Private__deleteRecords___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setActiveDSIDRecord:", 0);
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearDSIDRecords");

  v3 = ADWriteDataToKeychain();
  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error deleting APIDAccountsSettings: %d"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  v5 = ADWriteDataToKeychain();
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error deleting DPID: %d"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __50__ADIDManager_Private__incrementMonthlyResetCount__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "doubleValue");
  if (v3 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __54__ADIDManager_Private__finishedReconciling_withError___block_invoke()
{
  id v0;

  +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleAccountChange");

}

void __42__ADIDManager_Private__updateAccountData___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v3)
    {
LABEL_3:
      v5 = a1[5];
      v6 = WeakRetained;
      v7 = v3;
LABEL_8:
      objc_msgSend(v6, "finishedReconciling:withError:", v5, v7);
      goto LABEL_9;
    }
  }
  else
  {
    ADSimulateCrash();
    if (v3)
      goto LABEL_3;
  }
  +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAdEnabledLocality");

  if ((v9 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    objc_msgSend(a1[4], "activeDSIDRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "DSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iTunesStorefront");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@]: Not reconciling DPID nor sending segments to Ad Platforms. This is not an Ad-enabled locality (dsid: %@ storefront: %@)"), v12, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v6 = a1[4];
    v5 = a1[5];
    v7 = 0;
    goto LABEL_8;
  }
  +[ADClientDPIDManager sharedInstance](ADClientDPIDManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __42__ADIDManager_Private__updateAccountData___block_invoke_2;
  v18[3] = &unk_24D710948;
  objc_copyWeak(&v20, a1 + 6);
  v19 = a1[5];
  objc_msgSend(v10, "reconcileDPID:", v18);

  objc_destroyWeak(&v20);
LABEL_9:

}

void __42__ADIDManager_Private__updateAccountData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    ADSimulateCrash();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Error reconciling DPID - %@"), objc_opt_class(), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  objc_msgSend(WeakRetained, "activeDSIDRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__ADIDManager_Private__updateAccountData___block_invoke_3;
  v8[3] = &unk_24D710920;
  v7 = v3;
  v9 = v7;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v6, "sendPersonalizedAdsStatusToAdPlatforms:", v8);

  objc_destroyWeak(&v11);
}

void __42__ADIDManager_Private__updateAccountData___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (!v3)
    v3 = a1[4];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
    ADSimulateCrash();
  objc_msgSend(WeakRetained, "activeDSIDRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__ADIDManager_Private__updateAccountData___block_invoke_4;
  v7[3] = &unk_24D710920;
  v6 = v3;
  v8 = v6;
  objc_copyWeak(&v10, a1 + 6);
  v9 = a1[5];
  objc_msgSend(v5, "sendSegmentDataToAdPlatforms:", v7);

  objc_destroyWeak(&v10);
}

void __42__ADIDManager_Private__updateAccountData___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;

  v3 = a2;
  if (!v3)
    v3 = *(id *)(a1 + 32);
  v5 = v3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "finishedReconciling:withError:", *(_QWORD *)(a1 + 40), v5);

}

void __34__ADIDManager_Private__reconcile___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("weakSelf is nil in setDSID completionHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: weakSelf was nil in reconcile"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 13, v16);
    objc_msgSend(v17, "AD_Log:", CFSTR("iAdInternalLogging"));
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);

    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "activeDSIDRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_opt_class();
  v8 = v7;
  if (!v5)
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]: Failed to get or create record for DSID %@"), v7, *(_QWORD *)(a1 + 32));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 0, v16);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "AD_Log:", CFSTR("iAdInternalLogging"));
    objc_msgSend(v4, "finishedReconciling:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v4, "activeDSIDRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]: Set current DSID to %@. Beginning reconciliation process."), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iTunesStorefront");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("NONE")) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", CFSTR("ERROR")))
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __34__ADIDManager_Private__reconcile___block_invoke_2;
    v22[3] = &unk_24D710998;
    objc_copyWeak(&v25, v2);
    v24 = *(id *)(a1 + 40);
    v23 = v13;
    objc_msgSend(v14, "reloadStorefront:", v22);

    objc_destroyWeak(&v25);
  }
  else
  {
    objc_msgSend(v4, "updateAccountData:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NONE")) & 1) == 0)
      ADSaveToPromotedContentKeychain();
  }

LABEL_13:
}

uint64_t __34__ADIDManager_Private__reconcile___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "updateAccountData:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    result = objc_msgSend((id)result, "isEqualToString:", CFSTR("NONE"));
    if ((result & 1) == 0)
      return ADSaveToPromotedContentKeychain();
  }
  return result;
}

void __44__ADIDManager_Private__handleAccountChange___block_invoke(uint64_t a1)
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
  uint64_t v11;
  BOOL v12;
  int v13;
  BOOL v14;
  int v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesAccountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iCloudDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iCloudDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "activeDSIDRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "lastJingleAccountStatus");

  if (v3 && !objc_msgSend(v5, "isEqualToString:", v3))
  {
    v13 = 1;
    if (!v7)
      goto LABEL_13;
  }
  else
  {
    if (v3)
      v12 = 1;
    else
      v12 = v5 == 0;
    v13 = !v12;
    if (!v7)
      goto LABEL_13;
  }
  if (!objc_msgSend(v9, "isEqualToString:", v7))
  {
    v15 = 1;
    goto LABEL_20;
  }
LABEL_13:
  if (v7)
    v14 = 1;
  else
    v14 = v9 == 0;
  v15 = !v14;
LABEL_20:
  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = objc_opt_class();
  v18 = &stru_24D712ED8;
  if (v11 == -1)
    v18 = CFSTR("not ");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@ handleAccountChange]: iTunesAccountDSID is %@, current DSID is %@. iCloudAccountDSID is %@, current iCloud DSID is %@. Account has %@been reconciled once."), v17, v5, v3, v9, v7, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (((v13 | v15) & 1) != 0 || v11 == -1)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ handleAccountChange]: Current iTunes account has changed from %@ to %@."), objc_opt_class(), v3, v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ handleAccountChange]: Current iCloud account has changed from %@ to %@."), objc_opt_class(), v7, v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    if (v11 == -1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@ handleAccountChange]: Current DSID record has never been through reconcile."), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog();

    }
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __44__ADIDManager_Private__handleAccountChange___block_invoke_2;
    v26[3] = &unk_24D710400;
    v25 = *(void **)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    objc_msgSend(v25, "reconcile:", v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] handleAccountChange: Current accounts (iTunes: %@, iCloud: %@) have not changed."), objc_opt_class(), v5, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
  }

}

uint64_t __44__ADIDManager_Private__handleAccountChange___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __32__ADIDManager_Private__runTask___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "checkForLateReconcile");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__ADIDManager_Private__runTask___block_invoke_2;
  v3[3] = &unk_24D7109E8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  objc_msgSend(v4, "reconcile:", v3);

}

void __32__ADIDManager_Private__runTask___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]: Finished task %@ with error %@"), v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _ADLog();
  if ((objc_msgSend(*(id *)(a1 + 40), "finishTask") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] ERROR: Unable to mark the task as finished. Please file a radar..."), objc_opt_class());
    v8 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

@end
