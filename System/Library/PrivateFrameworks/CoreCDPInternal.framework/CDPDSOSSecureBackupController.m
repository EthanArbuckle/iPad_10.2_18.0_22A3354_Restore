@implementation CDPDSOSSecureBackupController

- (CDPDSOSSecureBackupController)initWithContext:(id)a3 uiProvider:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPDSOSSecureBackupController *v12;
  CDPDSOSSecureBackupController *v13;
  CDPDSecureBackupProxyImpl *v14;
  CDPDSecureBackupProxy *secureBackupProxy;
  uint64_t v16;
  CDPDSecureBackupConfiguration *configuration;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CDPDSOSSecureBackupController;
  v12 = -[CDPDSOSSecureBackupController init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_uiProvider, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = -[CDPDSecureBackupProxyImpl initWithContext:]([CDPDSecureBackupProxyImpl alloc], "initWithContext:", v9);
    secureBackupProxy = v13->_secureBackupProxy;
    v13->_secureBackupProxy = (CDPDSecureBackupProxy *)v14;

    +[CDPDSecureBackupConfiguration configurationWithContext:](CDPDSecureBackupConfiguration, "configurationWithContext:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    configuration = v13->_configuration;
    v13->_configuration = (CDPDSecureBackupConfiguration *)v16;

  }
  return v13;
}

- (void)synchronizeKeyValueStoreWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__CDPDSOSSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke;
  v6[3] = &unk_24C81BFF0;
  v7 = v4;
  v5 = v4;
  -[CDPDSOSSecureBackupController accountInfoWithCompletion:](self, "accountInfoWithCompletion:", v6);

}

uint64_t __72__CDPDSOSSecureBackupController_synchronizeKeyValueStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)accountInfoWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_cachedAccountInfo)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CDPDSOSSecureBackupController accountInfoWithCompletion:].cold.1();

    if (v5)
      ((void (**)(_QWORD, NSDictionary *, _QWORD))v5)[2](v5, self->_cachedAccountInfo, 0);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke;
    v7[3] = &unk_24C81BFC8;
    v7[4] = self;
    v8 = v4;
    -[CDPDSOSSecureBackupController _accountInfoWithCompletion:](self, "_accountInfoWithCompletion:", v7);

  }
}

void __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;

  v6 = a2;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1();

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v7);

}

- (void)clearAccountInfoCache
{
  NSObject *v3;
  NSDictionary *cachedAccountInfo;
  uint8_t v5[16];

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DB2C000, v3, OS_LOG_TYPE_DEFAULT, "\"Clearing account cache...\", v5, 2u);
  }

  cachedAccountInfo = self->_cachedAccountInfo;
  self->_cachedAccountInfo = 0;

}

- (void)_accountInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20DB2C000, "cdp: Fetching Account Info", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  -[CDPDSecureBackupConfiguration accountInfoFetchSetupDictionary](self->_configuration, "accountInfoFetchSetupDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17C98]);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    +[CDPDSOSSecureBackupController _sanitizedInfoDictionary:](CDPDSOSSecureBackupController, "_sanitizedInfoDictionary:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSOSSecureBackupController _accountInfoWithCompletion:].cold.1(v9, (uint64_t)v11, v8);
  }

  -[CDPDSecureBackupProxy accountInfoWithInfo:completion:](self->_secureBackupProxy, "accountInfoWithInfo:completion:", v7, v4);
  os_activity_scope_leave(&v10);

}

- (void)isEligibleForCDPWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, void *);
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(id, uint64_t, void *);

  v3 = (void (**)(id, uint64_t, void *))a3;
  if (v3)
  {
    v7 = v3;
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasLocalSecret");

    if ((v5 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      _CDPStateError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7[2](v7, v5, v6);

    v3 = v7;
  }

}

- (void)backupRecordsArePresentWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke;
  v6[3] = &unk_24C81BFF0;
  v7 = v4;
  v5 = v4;
  -[CDPDSOSSecureBackupController accountInfoWithCompletion:](self, "accountInfoWithCompletion:", v6);

}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_3();

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_12:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_2();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE17C50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE17CF0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_1(v12 != 0, v14 != 0, v15);

    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      v10 = *(void (**)(void))(v16 + 16);
      goto LABEL_12;
    }
  }

}

- (void)getBackupRecordDevicesWithOptionForceFetch:(BOOL)a3 completion:(id)a4
{
  -[CDPDSOSSecureBackupController _getBackupRecordDevicesIncludingUnrecoverableRecords:completion:](self, "_getBackupRecordDevicesIncludingUnrecoverableRecords:completion:", 0, a4);
}

- (void)_getBackupRecordDevicesIncludingUnrecoverableRecords:(BOOL)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v5 = a4;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"getBackupRecordDevicesWithCompletion: called, fetching account info from SecureBackup\", buf, 2u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke;
  v8[3] = &unk_24C81BFC8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[CDPDSOSSecureBackupController accountInfoWithCompletion:](self, "accountInfoWithCompletion:", v8);

}

void __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v51;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke_cold_1();

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "desiresAllRecords");
  v8 = (_QWORD *)MEMORY[0x24BE17BA0];
  if (!v7)
    v8 = (_QWORD *)MEMORY[0x24BE17CF0];
  v48 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", *v8);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_41;
  }
  v10 = v9;
  v11 = 0;
  v51 = *(_QWORD *)v55;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v55 != v51)
        objc_enumerationMutation(obj);
      v53 = v12;
      v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v12);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A410]), "initWithSecureBackupRecordInfo:", v13);
      v15 = v14;
      if (objc_msgSend(*(id *)(a1 + 32), "fakeNearlyDepletedRecords"))
      {
        _CDPLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v59 = (uint64_t)v15;
          _os_log_debug_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEBUG, "\"**** DEBUG **** Setting fake remaining attempts value of 1 for %@\", buf, 0xCu);
        }

        v14 = v15;
        objc_msgSend(v15, "setRemainingAttempts:", 1);
      }
      if (v14)
      {
        if (objc_msgSend(v14, "remainingAttempts"))
        {
          objc_msgSend(v49, "addObject:", v14);
        }
        else if (!objc_msgSend(v14, "remainingAttempts"))
        {
          _CDPLogSystem();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = objc_msgSend(v15, "remainingAttempts");
            *(_DWORD *)buf = 138412546;
            v59 = (uint64_t)v15;
            v60 = 2048;
            v61 = v18;
            _os_log_impl(&dword_20DB2C000, v17, OS_LOG_TYPE_DEFAULT, "\"Disqualified device %@ because the remaining attempts is %lu\", buf, 0x16u);
          }

        }
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("metadata"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ClientMetadata"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SecureBackupMetadataTimestamp"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        objc_msgSend(*(id *)(a1 + 32), "_dateWithSecureBackupDateString:", v21);
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
        v24 = v23;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        v23 = v21;
        goto LABEL_27;
      }
      v22 = v21;
      v24 = 0;
LABEL_29:
      objc_msgSend(v15, "setRecordDate:", v24);
      _CDPLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v59 = (uint64_t)v15;
        v60 = 2112;
        v61 = (uint64_t)v24;
        v62 = 2112;
        v63 = v26;
        v27 = v26;
        _os_log_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEFAULT, "\"Backup record found for device %@ with date %@ (%@)\", buf, 0x20u);

      }
      if (!v11
        || v24
        && (objc_msgSend(v11, "laterDate:", v24),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v28,
            v28 == v24))
      {
        _CDPLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v59 = (uint64_t)v24;
          v60 = 2112;
          v61 = (uint64_t)v11;
          v62 = 2112;
          v63 = v15;
          _os_log_impl(&dword_20DB2C000, v29, OS_LOG_TYPE_DEFAULT, "\"Backup record date %@ is later than the previously known newest record (%@), promoting %@ as newest device record\", buf, 0x20u);
        }

        v30 = v24;
        v11 = v30;
      }

      v12 = v53 + 1;
    }
    while (v10 != v53 + 1);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  }
  while (v10);
LABEL_41:

  _CDPLogSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = (uint64_t)v11;
    _os_log_impl(&dword_20DB2C000, v31, OS_LOG_TYPE_DEFAULT, "\"Finished parsing multiple-iCSC records and found the newest record to be %@\", buf, 0xCu);
  }

  v32 = v49;
  v33 = v47;
  v34 = v48;
  if (objc_msgSend(v49, "count"))
  {
    v35 = 1;
  }
  else
  {
    v36 = *MEMORY[0x24BE17C50];
    objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BE17C50]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v37 == 0;
    if (v37)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", v36);
      v38 = objc_claimAutoreleasedReturnValue();
      _CDPLogSystem();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v59 = (uint64_t)v38;
        _os_log_impl(&dword_20DB2C000, v39, OS_LOG_TYPE_DEFAULT, "\"Found a single-iCSC metadata record. Returning that as a faux-device using %@\", buf, 0xCu);
      }

      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A410]), "initWithSecureBackupMetadataInfo:", v38);
      objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x24BE17CE0]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setHasRandomSecret:", objc_msgSend(v41, "BOOLValue"));

      v34 = v48;
      objc_msgSend(v49, "removeAllObjects");
      objc_msgSend(v49, "addObject:", v40);

      v33 = v47;
    }
    else
    {
      _CDPLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v38, OS_LOG_TYPE_DEFAULT, "\"No single-iCSC metadata record is present\", buf, 2u);
      }
    }

    v32 = v49;
  }
  _CDPLogSystem();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 134218240;
    v59 = v43;
    v60 = 1024;
    LODWORD(v61) = v35;
    _os_log_impl(&dword_20DB2C000, v42, OS_LOG_TYPE_DEFAULT, "\"Finished parsing backup records, returning %lu devices and isUsingMultipleICSC=%i\", buf, 0x12u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v32, "sortedArrayUsingComparator:", &__block_literal_global_0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *(_QWORD *)(a1 + 40);
    v46 = (void *)objc_msgSend(v44, "copy");
    (*(void (**)(uint64_t, _BOOL8, void *, void *))(v45 + 16))(v45, v35, v46, v33);

    v32 = v49;
  }

}

uint64_t __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "recordDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_dateWithSecureBackupDateString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setDateFormat:", CFSTR("dd-MM-yyyy HH:mm:ss"));
  objc_msgSend(v4, "dateFromString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v9);

    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(v4, "dateFromString:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  return v10;
}

- (void)checkForExistingRecord:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CDPDSOSSecureBackupController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "circlePeerIDForSecureBackupController:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CDPDSOSSecureBackupController checkForExistingRecordWithPeerId:completion:](self, "checkForExistingRecordWithPeerId:completion:", v6, v4);
}

- (void)checkForExistingRecordWithPeerId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Checking if the peer has a secure backup: %@\", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x24BDD1758];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__CDPDSOSSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke;
  v12[3] = &unk_24C81C058;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "predicateWithBlock:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSOSSecureBackupController checkForExistingRecordMatchingPredicate:forceFetch:completion:](self, "checkForExistingRecordMatchingPredicate:forceFetch:completion:", v11, 1, v7);

}

uint64_t __77__CDPDSOSSecureBackupController_checkForExistingRecordWithPeerId_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)checkForExistingRecordMatchingPredicate:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  _CDPLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CDPDSOSSecureBackupController checkForExistingRecordMatchingPredicate:forceFetch:completion:].cold.1();

  if (v9)
  {
    if (v8)
    {
      if (v6)
        -[CDPDSOSSecureBackupController clearAccountInfoCache](self, "clearAccountInfoCache");
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke;
      v11[3] = &unk_24C81BEF8;
      v12 = v8;
      v13 = v9;
      -[CDPDSOSSecureBackupController _getBackupRecordDevicesIncludingUnrecoverableRecords:completion:](self, "_getBackupRecordDevicesIncludingUnrecoverableRecords:completion:", 0, v11);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }
  }

}

void __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(a3, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject count](v7, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"Found %@ matching devices\", (uint8_t *)&v11, 0xCu);

    }
    if (-[NSObject count](v7, "count"))
    {
      -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_clientMetadataWithSecretType:(unint64_t)a3 length:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x24BE17CC8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x24BE17CD8]);

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x24BE17C60]);

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24C836650, CFSTR("device_platform"));
  v10 = (void *)MGCopyAnswer();
  if (v10)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("device_name"));
  v11 = (void *)MGCopyAnswer();
  if (v11)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("device_model"));
  v12 = (void *)MGCopyAnswer();
  if (v12)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("device_model_version"));
  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("device_model_class"));
  v15 = (void *)MGCopyAnswer();
  if (v15)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("device_color"));
  v16 = (void *)MGCopyAnswer();
  if (v16)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("device_enclosure_color"));
  v17 = (void *)objc_msgSend(v6, "copy");

  return v17;
}

- (void)recoverSecureBackupWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id *v11;
  uint64_t v12;
  void *v13;
  CDPContext *context;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v28 = 0;
    v29 = (id *)&v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    obj = 0;
    -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:](self, "_recoverBackupDictionaryWithContext:fallbackState:error:", v6, 0, &obj);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v33, obj);
    v9 = (void *)v23[5];
    v23[5] = v8;

    if (objc_msgSend(v29[5], "indicatesRecoveryCanBeRetried"))
    {
      v10 = v29[5];
      v29[5] = 0;

      v11 = v29;
      v20 = v29[5];
      -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:](self, "_recoverBackupDictionaryWithContext:fallbackState:error:", v6, 1, &v20);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v11 + 5, v20);
      v13 = (void *)v23[5];
      v23[5] = v12;

    }
    if (objc_msgSend(v29[5], "isAuthenticationError"))
    {
      context = self->_context;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __75__CDPDSOSSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke;
      v15[3] = &unk_24C81C080;
      v19 = &v22;
      v18 = &v28;
      v15[4] = self;
      v16 = v6;
      v17 = v7;
      -[CDPContext reauthenticateUserWithCompletion:](context, "reauthenticateUserWithCompletion:", v15);

    }
    else
    {
      (*((void (**)(id, uint64_t, id))v7 + 2))(v7, v23[5], v29[5]);
    }
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }

}

uint64_t __75__CDPDSOSSecureBackupController_recoverSecureBackupWithContext_completion___block_invoke(_QWORD *a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  id obj;

  if (!a2)
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "_recoverBackupDictionaryWithContext:fallbackState:error:", v6, 0, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "indicatesRecoveryCanBeRetried"))
  {
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    v13 = (void *)a1[4];
    v14 = a1[5];
    v15 = *(_QWORD *)(a1[7] + 8);
    v20 = *(id *)(v15 + 40);
    objc_msgSend(v13, "_recoverBackupDictionaryWithContext:fallbackState:error:", v14, 1, &v20);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v15 + 40), v20);
    v17 = *(_QWORD *)(a1[8] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (BOOL)_shouldUseSBDCacheWithSecureBackupContext:(id)a3 fallbackState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  char v8;

  v6 = a3;
  if (CFPreferencesGetAppBooleanValue(CFSTR("ForceUseCachedSecret"), CFSTR("com.apple.corecdp"), 0))
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CDPDSOSSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:].cold.1();

  }
  else
  {
    if (a4 == 2
      || !objc_msgSend(MEMORY[0x24BE1A4A0], "useCDPContextSecretInsteadOfSBDSecretFeatureEnabled"))
    {
      v8 = objc_msgSend(v6, "usePreviouslyCachedSecret");
      goto LABEL_11;
    }
    if (a4 != 1)
    {
      v8 = -[CDPContext type](self->_context, "type") == 10;
      goto LABEL_11;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)_recoverBackupDictionaryWithContext:(id)a3 fallbackState:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  CDPDRemoteSecretValidationResult *v17;
  CDPDSecureBackupProxy *secureBackupProxy;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v28;
  os_activity_scope_state_s state;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = _os_activity_create(&dword_20DB2C000, "cdp: Recovery Backup", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  -[CDPDSOSSecureBackupController _recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:](self, "_recoveryInfoDictionaryFromContext:usePreviouslyCachedSecret:", v8, -[CDPDSOSSecureBackupController _shouldUseSBDCacheWithSecureBackupContext:fallbackState:](self, "_shouldUseSBDCacheWithSecureBackupContext:fallbackState:", v8, a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17C98]);
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDPDSOSSecureBackupController _sanitizedInfoDictionary:](CDPDSOSSecureBackupController, "_sanitizedInfoDictionary:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.4(v12, v13, (uint64_t)v30, v11);
  }

  if ((objc_msgSend(v8, "silentRecovery") & 1) != 0)
  {
    v14 = (_QWORD *)MEMORY[0x24BE1A7D0];
  }
  else
  {
    objc_msgSend(v8, "recoveryKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (_QWORD *)MEMORY[0x24BE1A718];
    if (!v15)
      v14 = (_QWORD *)MEMORY[0x24BE1A778];
  }
  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_context, *v14, *MEMORY[0x24BE1A860]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(CDPDRemoteSecretValidationResult);
  secureBackupProxy = self->_secureBackupProxy;
  v28 = 0;
  -[CDPDSecureBackupProxy recoverWithInfo:error:](secureBackupProxy, "recoverWithInfo:error:", v10, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;
  if (v20)
  {
    v21 = v20;
    if (v19)
    {
      _CDPLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.3();

      objc_msgSend(v21, "errorByExtendingUserInfoWithDictionary:", v19);
      v23 = objc_claimAutoreleasedReturnValue();

      v17 = 0;
      v21 = (void *)v23;
    }
    _CDPLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.2();

    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
    objc_msgSend(v16, "populateUnderlyingErrorsStartingWithRootError:", v21);
  }
  else
  {
    -[CDPDRemoteSecretValidationResult setRecoveredInfo:](v17, "setRecoveredInfo:", v19);
    _CDPLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[CDPDSOSSecureBackupController _recoverBackupDictionaryWithContext:fallbackState:error:].cold.1();

    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A640]);
    v21 = 0;
  }
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendEvent:", v16);

  if (a5)
    *a5 = objc_retainAutorelease(v21);

  os_activity_scope_leave(&state);
  return v17;
}

- (id)_recoveryInfoDictionaryFromContext:(id)a3 usePreviouslyCachedSecret:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDSecureBackupConfiguration escrowAuthInfo](self->_configuration, "escrowAuthInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v9);

  objc_msgSend(v6, "recoverySecret");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "recoverySecret");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x24BE17C68]);

  }
  else
  {
    objc_msgSend(v6, "recoveryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "recoveryKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x24BE17C80]);

      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17BE0]);
    }
  }
  if (v4)
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CC0]);
  if ((objc_msgSend(v8, "isUsingMultipleiCSC") & 1) != 0 || objc_msgSend(v6, "silentRecovery"))
  {
    v14 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CD0]);
    objc_msgSend(v7, "setObject:forKey:", v14, *MEMORY[0x24BE17BE0]);
  }
  objc_msgSend(v8, "recordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "recordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v16, *MEMORY[0x24BE17C78]);

  }
  if (objc_msgSend(v6, "silentRecovery"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE17CA0]);

  return v7;
}

+ (id)_sanitizedInfoDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = *MEMORY[0x24BE17C68];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17C68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v4);
  v6 = *MEMORY[0x24BE17BC8];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17BC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v6);
  v8 = *MEMORY[0x24BE17BB0];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17BB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v8);
  v10 = *MEMORY[0x24BE17C80];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE17C80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("< REDACTED >"), v10);
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (CDPDSecureBackupProxy)secureBackupProxy
{
  return self->_secureBackupProxy;
}

- (void)setSecureBackupProxy:(id)a3
{
  objc_storeStrong((id *)&self->_secureBackupProxy, a3);
}

- (BOOL)fakeNearlyDepletedRecords
{
  return self->fakeNearlyDepletedRecords;
}

- (void)setFakeNearlyDepletedRecords:(BOOL)a3
{
  self->fakeNearlyDepletedRecords = a3;
}

- (NSDictionary)cachedAccountInfo
{
  return self->_cachedAccountInfo;
}

- (void)setCachedAccountInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAccountInfo, a3);
}

- (CDPDSecureBackupDelegate)delegate
{
  return (CDPDSecureBackupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CDPDSecureBackupConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedAccountInfo, 0);
  objc_storeStrong((id *)&self->_secureBackupProxy, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)accountInfoWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Using cache account info\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __59__CDPDSOSSecureBackupController_accountInfoWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Non-cached SecureBackup account info fetched\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_accountInfoWithCompletion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, a3, (uint64_t)a3, "\"Fetching account info with %@\", (uint8_t *)a2);

}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_1(char a1, char a2, NSObject *a3)
{
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = CFSTR("NO");
  v9 = *MEMORY[0x24BDAC8D0];
  if ((a1 & 1) != 0)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v3 = CFSTR("YES");
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_7(&dword_20DB2C000, a3, (uint64_t)a3, "\"Secure backup hasSingleICSCBackup=%@ hasMultipleICSCBackups=%@\", (uint8_t *)&v5);
  OUTLINED_FUNCTION_4();
}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"backupRecordsArePresentWithCompletion got account info %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __71__CDPDSOSSecureBackupController_backupRecordsArePresentWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to check for secure backup records: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __97__CDPDSOSSecureBackupController__getBackupRecordDevicesIncludingUnrecoverableRecords_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"SecureBackup returned error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)checkForExistingRecordMatchingPredicate:forceFetch:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_20DB2C000, v0, v1, "\"Checking if the peer has a secure backup: %@\", v2);
  OUTLINED_FUNCTION_4();
}

void __95__CDPDSOSSecureBackupController_checkForExistingRecordMatchingPredicate_forceFetch_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Check for existing backup failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_shouldUseSBDCacheWithSecureBackupContext:fallbackState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Forcing use of cached secret by preference (com.apple.corecdp: ForceUseCachedSecret)\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Recovered SecureBackup\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Failed to recover SecureBackup with error %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_recoverBackupDictionaryWithContext:fallbackState:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Recovery error had additional info: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_recoverBackupDictionaryWithContext:(uint64_t)a3 fallbackState:(NSObject *)a4 error:.cold.4(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_7(&dword_20DB2C000, a4, a3, "\"Attempting to recover SecureBackup secret from device %@ using info %@\", (uint8_t *)a3);

}

@end
