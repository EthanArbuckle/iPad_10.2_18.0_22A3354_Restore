@implementation ATTrackingEnforcementManager

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_6()
{
  id v0;
  int v1;
  id v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = (id)objc_opt_class();
    v0 = v2;
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Connection was invalidated.", (uint8_t *)&v1, 0xCu);

  }
}

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_10(uint64_t a1, int a2, uint64_t a3, char a4)
{
  id v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = (id)objc_opt_class();
    v11 = 1024;
    v12 = a2;
    v13 = 2048;
    v14 = a3;
    v8 = v10;
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] EnforcementService call completed successfully: enforced: %d reason code: %ld.", (uint8_t *)&v9, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  _isDefaultReturned = a4;
  objc_storeStrong((id *)&_lastBagLookup, *(id *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  **(_QWORD **)(a1 + 80) = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
}

+ (BOOL)shouldEnforceTrackingWithReasonCode:(int64_t *)a3
{
  void *v5;
  void *v6;
  int v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, int, uint64_t, char);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  __int128 *v34;
  id v35;
  int64_t *v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[5];
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  void *v53;
  __int128 v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  *a3 = _lastReasonCode;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (_lastBagLookup)
  {
    v7 = _isDefaultReturned;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    if (v8 <= dbl_20AE57EB0[v7 == 0])
    {
      v9 = a1;
      objc_sync_enter(v9);
      goto LABEL_11;
    }
  }
  v9 = a1;
  objc_sync_enter(v9);
  if (_shouldEnforceTrackingInProgress == 1)
  {
LABEL_11:
    *a3 = _lastReasonCode;
    v19 = _lastEnforcement;
    objc_sync_exit(v9);
    goto LABEL_16;
  }
  _shouldEnforceTrackingInProgress = 1;
  objc_sync_exit(v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.AppTrackingTransparency.EnforcementService"));
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25462DC00);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v11);

    v12 = MEMORY[0x24BDAC760];
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke;
    v47[3] = &__block_descriptor_40_e5_v8__0l;
    v47[4] = v9;
    objc_msgSend(v10, "setInterruptionHandler:", v47);
    v46[0] = v12;
    v46[1] = 3221225472;
    v46[2] = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_6;
    v46[3] = &__block_descriptor_40_e5_v8__0l;
    v46[4] = v9;
    objc_msgSend(v10, "setInvalidationHandler:", v46);
    objc_msgSend(v10, "resume");
    *(_QWORD *)&v54 = 0;
    *((_QWORD *)&v54 + 1) = &v54;
    v55 = 0x2020000000;
    v56 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = _lastEnforcement;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = _lastReasonCode;
    v37[0] = v12;
    v37[1] = 3221225472;
    v37[2] = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_7;
    v37[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v37[4] = v9;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v12;
    v27 = 3221225472;
    v28 = __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_10;
    v29 = &unk_24C3DAA48;
    v35 = v9;
    v31 = &v42;
    v32 = &v38;
    v30 = v6;
    v33 = &v48;
    v34 = &v54;
    v36 = a3;
    objc_msgSend(v13, "appTrackingEnforcement:", &v26);

    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v53 = v16;
      v17 = v16;
      _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Returned from synchronous remote call to EnforcementService", buf, 0xCu);

    }
    if (!*(_BYTE *)(*((_QWORD *)&v54 + 1) + 24))
    {
      *((_BYTE *)v49 + 24) = _lastEnforcement;
      *a3 = _lastReasonCode;
    }
    v18 = v9;
    objc_sync_enter(v18);
    _lastEnforcement = *((_BYTE *)v43 + 24);
    _lastReasonCode = v39[3];
    _shouldEnforceTrackingInProgress = 0;
    objc_sync_exit(v18);

    objc_msgSend(v10, "invalidate", v26, v27, v28, v29);
    v19 = *((unsigned __int8 *)v49 + 24);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v54, 8);
  }
  else
  {
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      LODWORD(v54) = 138412290;
      *(_QWORD *)((char *)&v54 + 4) = v22;
      v23 = v22;
      _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Failed to create connection to EnforcementService. Using default values.", (uint8_t *)&v54, 0xCu);

    }
    v24 = v9;
    objc_sync_enter(v24);
    *a3 = _lastReasonCode;
    _shouldEnforceTrackingInProgress = 0;
    v19 = _lastEnforcement;
    objc_sync_exit(v24);

  }
  v9 = v10;
LABEL_16:

  _Block_object_dispose(&v48, 8);
  return v19 != 0;
}

+ (void)setLastBagLookup:(id)a3
{
  objc_storeStrong((id *)&_lastBagLookup, a3);
}

+ (NSDate)lastBagLookup
{
  return (NSDate *)(id)_lastBagLookup;
}

+ (void)setLastEnforcement:(BOOL)a3
{
  _lastEnforcement = a3;
}

+ (BOOL)lastEnforcement
{
  return _lastEnforcement;
}

+ (void)setLastReasonCode:(int64_t)a3
{
  _lastReasonCode = a3;
}

+ (int64_t)lastReasonCode
{
  return _lastReasonCode;
}

+ (void)setIsDefaultReturned:(BOOL)a3
{
  _isDefaultReturned = a3;
}

+ (BOOL)isDefaultReturned
{
  return _isDefaultReturned;
}

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke()
{
  id v0;
  int v1;
  id v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 138412290;
    v2 = (id)objc_opt_class();
    v0 = v2;
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Connection was interrupted.", (uint8_t *)&v1, 0xCu);

  }
}

void __68__ATTrackingEnforcementManager_shouldEnforceTrackingWithReasonCode___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a2;
    v4 = (void *)objc_opt_class();
    v5 = v4;
    v6 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412802;
    v9 = v4;
    v10 = 2048;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_20AE55000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%@] Received error code %ld from remote call to EnforcementService: %@", (uint8_t *)&v8, 0x20u);

  }
}

@end
