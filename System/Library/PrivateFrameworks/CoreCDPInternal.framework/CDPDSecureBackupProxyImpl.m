@implementation CDPDSecureBackupProxyImpl

- (CDPDSecureBackupProxyImpl)initWithContext:(id)a3
{
  id v5;
  CDPDSecureBackupProxyImpl *v6;
  CDPDSecureBackupProxyImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPDSecureBackupProxyImpl;
  v6 = -[CDPDSecureBackupProxyImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cdpContext, a3);

  return v7;
}

- (id)secureBackupContext
{
  return -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", MEMORY[0x24BDBD1B8]);
}

- (id)activityTypeString
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CDPContext type](self->_cdpContext, "type");
  CDPContextTypeAnalyticsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CDPContext endpoint](self->_cdpContext, "endpoint");
  v6 = CFSTR("Unknown");
  if (v5 <= 266770438)
  {
    if (v5 > -754113827)
    {
      if (v5 > -344522787)
      {
        if (v5 > -61689622)
        {
          if (v5 == -61689621)
          {
            v6 = CFSTR("RecoverAndSynchronizeSquirrel");
          }
          else if (v5 == -45788238)
          {
            v6 = CFSTR("FinishOfflineLocalSecretChange");
          }
        }
        else if (v5 == -344522786)
        {
          v6 = CFSTR("AttemptToEscrowPreRecord");
        }
        else if (v5 == -275221680)
        {
          v6 = CFSTR("GenerateRandomRecoveryKey");
        }
      }
      else if (v5 > -569191000)
      {
        if (v5 == -569190999)
        {
          v6 = CFSTR("ClearFollowUp");
        }
        else if (v5 == -428461448)
        {
          v6 = CFSTR("RemoveNonViewAwarePeersFromCircle");
        }
      }
      else if (v5 == -754113826)
      {
        v6 = CFSTR("WalrusStatus");
      }
      else if (v5 == -617686711)
      {
        v6 = CFSTR("SaveTermsAcceptance");
      }
    }
    else if (v5 > -1249140061)
    {
      if (v5 > -993238036)
      {
        if (v5 == -993238035)
        {
          v6 = CFSTR("GenerateNewRecoveryKey");
        }
        else if (v5 == -936527855)
        {
          v6 = CFSTR("IsUserVisibleKeychainSyncEnabled");
        }
      }
      else if (v5 == -1249140060)
      {
        v6 = CFSTR("PostFollowUp");
      }
      else if (v5 == -1152544766)
      {
        v6 = CFSTR("HandleCloudDataProtectionState");
      }
    }
    else if (v5 > -1589433122)
    {
      if (v5 == -1589433121)
      {
        v6 = CFSTR("PerformRecovery");
      }
      else if (v5 == -1280150785)
      {
        v6 = CFSTR("IsICDPEnabledForDSID");
      }
    }
    else if (v5 == -1748609038)
    {
      v6 = CFSTR("BroadcastWalrusStateChange");
    }
    else if (v5 == -1737446029)
    {
      v6 = CFSTR("UpdateWebAccessStatus");
    }
  }
  else if (v5 <= 1512741305)
  {
    if (v5 > 819347452)
    {
      if (v5 > 1288689616)
      {
        if (v5 == 1288689617)
        {
          v6 = CFSTR("FetchEscrowRecordDevices");
        }
        else if (v5 == 1504201822)
        {
          v6 = CFSTR("WebAccessStatus");
        }
      }
      else if (v5 == 819347453)
      {
        v6 = CFSTR("FetchTermsAcceptanceForAccount");
      }
      else if (v5 == 844041777)
      {
        v6 = CFSTR("RepairCloudDataProtectionState");
      }
    }
    else if (v5 > 546710379)
    {
      if (v5 == 546710380)
      {
        v6 = CFSTR("ShouldPerformRepairForContext");
      }
      else if (v5 == 581976373)
      {
        v6 = CFSTR("SetUserVisibleKeychainSyncEnabled");
      }
    }
    else if (v5 == 266770439)
    {
      v6 = CFSTR("IsRecoveryKeyAvailable");
    }
    else if (v5 == 540884795)
    {
      v6 = CFSTR("HasLocalSecret");
    }
  }
  else if (v5 <= 1956379799)
  {
    if (v5 > 1660047999)
    {
      if (v5 == 1660048000)
      {
        v6 = CFSTR("VerifyRecoveryKey");
      }
      else if (v5 == 1888483151)
      {
        v6 = CFSTR("DeviceEscrowRecordRecoverable");
      }
    }
    else if (v5 == 1512741306)
    {
      v6 = CFSTR("DeleteRecoveryKey");
    }
    else if (v5 == 1547867365)
    {
      v6 = CFSTR("UpdateWalrusStatus");
    }
  }
  else if (v5 <= 1996176789)
  {
    if (v5 == 1956379800)
    {
      v6 = CFSTR("PcsKeysForServices");
    }
    else if (v5 == 1979543336)
    {
      v6 = CFSTR("FinishCyrusFlowAfterTermsAgreement");
    }
  }
  else
  {
    switch(v5)
    {
      case 1996176790:
        v6 = CFSTR("LocalSecretChangedTo");
        break;
      case 2013313151:
        v6 = CFSTR("RecoverSquirrel");
        break;
      case 2121843186:
        v6 = CFSTR("StartCircleApplicationApprovalServer");
        break;
    }
  }
  v7 = -[CDPContext backupActivity](self->_cdpContext, "backupActivity");
  v8 = CFSTR("Unknown");
  if (v7 <= -189876308)
  {
    if (v7 <= -1236246174)
    {
      if (v7 > -1686228710)
      {
        if (v7 == -1686228709)
        {
          v8 = CFSTR("CheckAndRemoveExistingThenEnableSecureBackupRecord");
        }
        else if (v7 == -1385651654)
        {
          v8 = CFSTR("IsEligibleForCDP");
        }
      }
      else if (v7 == -2145163342)
      {
        v8 = CFSTR("PerformEscrowRecoveryWithRecoveryContext");
      }
      else if (v7 == -2040123582)
      {
        v8 = CFSTR("BackupRecordsArePresent");
      }
    }
    else if (v7 <= -486826559)
    {
      if (v7 == -1236246173)
      {
        v8 = CFSTR("DisableRecoveryKey");
      }
      else if (v7 == -671128312)
      {
        v8 = CFSTR("SupportsRecoveryKey");
      }
    }
    else
    {
      switch(v7)
      {
        case -486826558:
          v8 = CFSTR("EnableSecureBackup");
          break;
        case -475716065:
          v8 = CFSTR("ClearAccountInfoCache");
          break;
        case -417863379:
          v8 = CFSTR("RecoverSecureBackup");
          break;
      }
    }
  }
  else if (v7 > 1142884429)
  {
    if (v7 <= 1412515334)
    {
      if (v7 == 1142884430)
      {
        v8 = CFSTR("DisableSecureBackup");
      }
      else if (v7 == 1401497941)
      {
        v8 = CFSTR("EnableSecureBackupWithRecoveryKey");
      }
    }
    else
    {
      switch(v7)
      {
        case 1412515335:
          v8 = CFSTR("CheckForExistingRecordWithPeerId");
          break;
        case 1808484763:
          v8 = CFSTR("UncacheAllSecrets");
          break;
        case 1846835407:
          v8 = CFSTR("CheckForExistingRecordMatchingPredicate");
          break;
      }
    }
  }
  else if (v7 <= -61353304)
  {
    if (v7 == -189876307)
    {
      v8 = CFSTR("UpgradeICSCRecordsThenEnableSecureBackup");
    }
    else if (v7 == -186675152)
    {
      v8 = CFSTR("DeleteAllBackupRecords");
    }
  }
  else
  {
    switch(v7)
    {
      case -61353303:
        v8 = CFSTR("SynchronizeKeyValueStore");
        break;
      case 407282594:
        v8 = CFSTR("CheckForExistingRecord");
        break;
      case 707469235:
        v8 = CFSTR("GetBackupRecordDevicesWithOptionForceFetch");
        break;
    }
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type=%@; endpoint=%@; backupActivity=%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)secureBackupContextWithInfo:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BE17B80];
  v5 = a3;
  v6 = [v4 alloc];
  -[CDPDSecureBackupProxyImpl activityTypeString](self, "activityTypeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUserActivityLabel:", v7);

  objc_msgSend(v8, "populateWithInfo:", v5);
  return v8;
}

- (void)accountInfoWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v16;
  CDPContext *cdpContext;
  id v18;
  _QWORD v19[4];
  id v20;
  os_signpost_id_t v21;
  uint64_t v22;
  uint8_t buf[4];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _CDPSignpostLogSystem();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CDPSignpostCreate();
  v11 = v10;

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AccountInfoWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v9;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AccountInfoWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  cdpContext = self->_cdpContext;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke;
  v19[3] = &unk_24C81C668;
  v21 = v9;
  v22 = v11;
  v20 = v6;
  v18 = v6;
  -[CDPExponentialRetryScheduler retryFetchAccountInfo:cdpContext:completionHandler:](v16, "retryFetchAccountInfo:cdpContext:completionHandler:", v15, cdpContext, v19);

}

void __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void (*v17)(void);
  NSObject *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_2();

  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 40);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v20 = 67240192;
    LODWORD(v21) = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v10, OS_SIGNPOST_INTERVAL_END, v11, "AccountInfoWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v20, 8u);
  }

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v14 = *(_QWORD *)(a1 + 40);
    v15 = objc_msgSend(v6, "code");
    v20 = 134218496;
    v21 = v14;
    v22 = 2048;
    v23 = v13;
    v24 = 1026;
    v25 = v15;
    _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountInfoWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v20, 0x1Cu);
  }

  if (!v5 || v6)
  {
    _CDPLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_1();

    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
    {
      v17 = *(void (**)(void))(v19 + 16);
      goto LABEL_16;
    }
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      v17 = *(void (**)(void))(v16 + 16);
LABEL_16:
      v17();
    }
  }

}

- (id)accountInfoWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v22;
  uint8_t buf[4];
  os_signpost_id_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _CDPSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AccountInfoWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v8;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: AccountInfoWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(v12, "getAccountInfoWithError:", &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;

  if (a4)
    *a4 = objc_retainAutorelease(v14);
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = objc_msgSend(v14, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v24) = v18;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v17, OS_SIGNPOST_INTERVAL_END, v8, "AccountInfoWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v14, "code");
    *(_DWORD *)buf = 134218496;
    v24 = v8;
    v25 = 2048;
    v26 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v27 = 1026;
    v28 = v20;
    _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: AccountInfoWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", buf, 0x1Cu);
  }

  return v13;
}

- (void)enableWithInfo:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  CDPDSecureBackupProxyImpl *v22;
  id v23;
  os_signpost_id_t v24;
  uint64_t v25;
  uint8_t buf[4];
  os_signpost_id_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _CDPSignpostLogSystem();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CDPSignpostCreate();
  v11 = v10;

  _CDPSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnableBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v27 = v9;
    _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EnableBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __60__CDPDSecureBackupProxyImpl_enableWithInfo_completionBlock___block_invoke;
  v21 = &unk_24C81C690;
  v24 = v9;
  v25 = v11;
  v22 = self;
  v23 = v6;
  v15 = v6;
  v16 = _Block_copy(&v18);
  -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", v7, v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "enableWithCompletionBlock:", v16);
}

void __60__CDPDSecureBackupProxyImpl_enableWithInfo_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t Nanoseconds;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cdpContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDidAttemptSecureBackupEnablement:", 1);

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_cleanUpPostEscrowCreationStates");
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v13 = 67240192;
    LODWORD(v14) = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v7, OS_SIGNPOST_INTERVAL_END, v8, "EnableBackupWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v13, 8u);
  }

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v11 = *(_QWORD *)(a1 + 48);
    v12 = objc_msgSend(v3, "code");
    v13 = 134218496;
    v14 = v11;
    v15 = 2048;
    v16 = v10;
    v17 = 1026;
    v18 = v12;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EnableBackupWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", (uint8_t *)&v13, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)enableWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t Nanoseconds;
  NSObject *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  void *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  os_signpost_id_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE17C68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    v8 = *MEMORY[0x24BE17CC0];
    goto LABEL_4;
  }
  v8 = *MEMORY[0x24BE17CC0];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE17CC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A668], *MEMORY[0x24BE1A860]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A5F8]);
    goto LABEL_6;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE17C80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A700], *MEMORY[0x24BE1A860]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  _CDPSignpostLogSystem();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EnableBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v34 = v13;
    _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EnableBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v18 = objc_msgSend(v17, "enableWithError:", &v32);
  v19 = v32;

  -[CDPDSecureBackupProxyImpl cdpContext](self, "cdpContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDidAttemptSecureBackupEnablement:", 1);

  if (a4)
    *a4 = objc_retainAutorelease(v19);
  _CDPLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupProxyImpl enableWithInfo:error:].cold.1();

  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v22, OS_LOG_TYPE_DEFAULT, "\"SecureBackup enabled\", buf, 2u);
    }

    -[CDPDSecureBackupProxyImpl _cleanUpPostEscrowCreationStates](self, "_cleanUpPostEscrowCreationStates");
  }
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    v26 = objc_msgSend(v19, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v34) = v26;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v25, OS_SIGNPOST_INTERVAL_END, v13, "EnableBackupWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v19, "code");
    *(_DWORD *)buf = 134218496;
    v34 = v13;
    v35 = 2048;
    v36 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v37 = 1026;
    v38 = v28;
    _os_log_impl(&dword_20DB2C000, v27, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: EnableBackupWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE1A640]);

  if (v19)
    objc_msgSend(v10, "populateUnderlyingErrorsStartingWithRootError:", v19);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sendEvent:", v10);

  return v18;
}

- (id)recoverWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t Nanoseconds;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v22;
  uint8_t buf[4];
  os_signpost_id_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _CDPSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecoverBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v8;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(v12, "recoverWithError:", &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;

  if (a4)
    *a4 = objc_retainAutorelease(v14);
  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = objc_msgSend(v14, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v24) = v18;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v17, OS_SIGNPOST_INTERVAL_END, v8, "RecoverBackupWithInfo", " error=%{public,signpost.telemetry:number1,name=error}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v14, "code");
    *(_DWORD *)buf = 134218496;
    v24 = v8;
    v25 = 2048;
    v26 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v27 = 1026;
    v28 = v20;
    _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverBackupWithInfo  error=%{public,signpost.telemetry:number1,name=error}d ", buf, 0x1Cu);
  }

  return v13;
}

- (BOOL)disableWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t Nanoseconds;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  id v33;
  uint8_t buf[4];
  os_signpost_id_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A678], *MEMORY[0x24BE1A860]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE17CF8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A680]);
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CDPContext telemetryFlowID](self->_cdpContext, "telemetryFlowID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE17C30]);

  }
  -[CDPContext telemetryDeviceSessionID](self->_cdpContext, "telemetryDeviceSessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CDPContext telemetryDeviceSessionID](self->_cdpContext, "telemetryDeviceSessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE17BF0]);

  }
  _CDPSignpostLogSystem();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _CDPSignpostCreate();

  _CDPSignpostLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "DisableBackupWithInfo", " enableTelemetry=YES ", buf, 2u);
  }

  _CDPSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v15;
    _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisableBackupWithInfo  enableTelemetry=YES ", buf, 0xCu);
  }

  -[CDPDSecureBackupProxyImpl secureBackupContextWithInfo:](self, "secureBackupContextWithInfo:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v20 = objc_msgSend(v19, "disableWithError:", &v33);
  v21 = v33;

  if (a4)
    *a4 = objc_retainAutorelease(v21);
  _CDPLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupProxyImpl disableWithInfo:error:].cold.2();
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[CDPDSecureBackupProxyImpl disableWithInfo:error:].cold.1();
  }

  Nanoseconds = _CDPSignpostGetNanoseconds();
  _CDPSignpostLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    v27 = objc_msgSend(v21, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v35) = v27;
    _os_signpost_emit_with_name_impl(&dword_20DB2C000, v26, OS_SIGNPOST_INTERVAL_END, v15, "DisableBackupWithInfo", " enableError=%{public,signpost.telemetry:number1,name=enableError}d ", buf, 8u);
  }

  _CDPSignpostLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(v21, "code");
    *(_DWORD *)buf = 134218496;
    v35 = v15;
    v36 = 2048;
    v37 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v38 = 1026;
    v39 = v29;
    _os_log_impl(&dword_20DB2C000, v28, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisableBackupWithInfo  enableError=%{public,signpost.telemetry:number1,name=enableError}d ", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE1A640]);

  if (v21)
    objc_msgSend(v7, "populateUnderlyingErrorsStartingWithRootError:", v21);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sendEvent:", v7);

  return v20;
}

- (void)cacheRecoveryKey:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupProxyImpl cacheRecoveryKey:completionBlock:].cold.1();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  -[CDPDSecureBackupProxyImpl secureBackupContext](self, "secureBackupContext");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15[5], "setRecoveryKey:", v6);
  v9 = (void *)v15[5];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke;
  v11[3] = &unk_24C81C6B8;
  v10 = v7;
  v12 = v10;
  v13 = &v14;
  objc_msgSend(v9, "cacheRecoveryKeyWithCompletionBlock:", v11);

  _Block_object_dispose(&v14, 8);
}

void __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_1();
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (void)uncacheAllSecrets
{
  id v2;

  -[CDPDSecureBackupProxyImpl secureBackupContext](self, "secureBackupContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uncachePassphrase");

}

- (void)_cleanUpPostEscrowCreationStates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Saving account failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)isRecoveryKeySet:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  -[CDPContext cliqueConfiguration](self->_cdpContext, "cliqueConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(MEMORY[0x24BDE84B0], "isRecoveryKeySetInSOS:error:", v4, &v9);
  v6 = v9;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupProxyImpl isRecoveryKeySet:].cold.1();

    v5 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v5;
}

- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;

  v6 = a3;
  -[CDPDSecureBackupProxyImpl secureBackupContext](self, "secureBackupContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "verifyRecoveryKey:error:", v6, &v12);

  v9 = v12;
  if (v9)
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupProxyImpl verifyRecoveryKey:error:].cold.1();

    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (BOOL)setRecoveryKeyInSOS:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v29 = 0;
  v7 = SOSCCCopyMyPeerInfo();
  if (!v7)
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.1();

    if (a4)
    {
      v11 = 0;
      *a4 = v29;
      goto LABEL_40;
    }
    goto LABEL_37;
  }
  v8 = (const void *)v7;
  v9 = (const void *)SOSPeerInfoCopyBackupKey();
  if (!v9)
  {
    v28 = 0;
    v15 = SecPasswordGenerate();
    if (v15)
    {
      v10 = v15;
      -[NSObject dataUsingEncoding:](v15, "dataUsingEncoding:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v17 = (const void *)SOSCCCopyMyPeerWithNewDeviceRecoverySecret();
      _CDPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.6();

        CFRelease(v17);
        goto LABEL_5;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.3();

      if (a4)
        *a4 = v27;
      if (v27)
        CFRelease(v27);

    }
    else
    {
      _CDPLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.2();

      if (a4)
        *a4 = v28;
    }
LABEL_37:
    v11 = 0;
    goto LABEL_40;
  }
  CFRelease(v9);
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.7();
LABEL_5:

  CFRelease(v8);
  v26 = 0;
  v11 = -[CDPDSecureBackupProxyImpl _createAndRegisterBackupPublicKeyInSOS:error:](self, "_createAndRegisterBackupPublicKeyInSOS:error:", v6, &v26);
  v12 = v26;
  v13 = v12;
  if (v12)
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    -[CDPDSecureBackupProxyImpl secureBackupContext](self, "secureBackupContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "backupForRecoveryKeyWithInfo:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.5();

      v11 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v21);
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[CDPDSecureBackupProxyImpl setRecoveryKeyInSOS:error:].cold.4();

    }
  }

LABEL_40:
  return v11;
}

- (BOOL)_createAndRegisterBackupPublicKeyInSOS:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  NSObject *v7;
  char v8;

  SecRKCreateRecoveryKeyWithError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPDSecureBackupProxyImpl _createAndRegisterBackupPublicKeyInSOS:error:].cold.2();

    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }
  else
  {
    v8 = SecRKRegisterBackupPublicKey();
  }

  return v8;
}

- (BOOL)removeRecoveryKeyFromSOS:(id *)a3
{
  return SOSCCRegisterRecoveryPublicKey();
}

- (CDPContext)cdpContext
{
  return self->_cdpContext;
}

- (void)setCdpContext:(id)a3
{
  objc_storeStrong((id *)&self->_cdpContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

void __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Fetched account info error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __60__CDPDSecureBackupProxyImpl_accountInfoWithInfo_completion___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_DEBUG, "\"Fetched account info: %@\", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)enableWithInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to enable SecureBackup: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)disableWithInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Disabled SecureBackup!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)disableWithInfo:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to disable SecureBackup with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)cacheRecoveryKey:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Attempting to update recovery key cache...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Recovery key cache updated\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __62__CDPDSecureBackupProxyImpl_cacheRecoveryKey_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to cache recovery key with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)isRecoveryKeySet:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Received error while checking if RK is set in SOS: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)verifyRecoveryKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to verify recovery key with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setRecoveryKeyInSOS:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "CFSTR(\"SOSCCCopyMyPeerInfo() failed: %@\")", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setRecoveryKeyInSOS:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "CFSTR(\"SecPasswordGenerate() failed: %@\")", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setRecoveryKeyInSOS:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "CFSTR(\"SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed: %@\")", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setRecoveryKeyInSOS:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"successfully created a backup for recovery key\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)setRecoveryKeyInSOS:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"failed to perform backup: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)setRecoveryKeyInSOS:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "CFSTR(\"registered backup key\")", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)setRecoveryKeyInSOS:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "CFSTR(\"backup key already registered\")", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_createAndRegisterBackupPublicKeyInSOS:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to register RK into SOS: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_createAndRegisterBackupPublicKeyInSOS:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to create SOS RK for copying RK into SOS with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)removeRecoveryKeyFromSOS:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to remove RK from SOS: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
