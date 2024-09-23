@implementation FIAppStoreAvailability

+ (void)fetchIsFitnessAvailableForDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if ((objc_msgSend(a1, "_isDeviceTablet") & 1) != 0)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke;
    v7[3] = &unk_24CC4E570;
    v9 = a1;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21168F000, v6, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability - device not tablet; calling completion with YES",
        buf,
        2u);
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

+ (BOOL)_isDeviceTablet
{
  if (_isDeviceTablet_onceToken != -1)
    dispatch_once(&_isDeviceTablet_onceToken, &__block_literal_global);
  return _isDeviceTablet___isDeviceTablet;
}

uint64_t __41__FIAppStoreAvailability__isDeviceTablet__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _isDeviceTablet___isDeviceTablet = (_DWORD)result == 3;
  return result;
}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_2;
  v25[3] = &unk_24CC4E548;
  v27 = &v28;
  v5 = v2;
  v26 = v5;
  objc_msgSend(v4, "isFitnessPlusStorefrontContentAvailableWithCompletion:", v25);
  dispatch_group_enter(v5);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v6 = *(void **)(a1 + 40);
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_3;
  v18[3] = &unk_24CC4E548;
  v20 = &v21;
  v7 = v5;
  v19 = v7;
  objc_msgSend(v6, "_isSupportedDeviceAvailableWithCompletion:", v18);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v7, v8))
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_cold_1(v11, v12, v9, v10, v13, v14, v15, v16);
  }
  if (*((_BYTE *)v29 + 24))
    v17 = *((_BYTE *)v22 + 24) != 0;
  else
    v17 = 0;
  (*(void (**)(_QWORD, _BOOL8, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v17, v9, v10);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v28, 8);

}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)isFitnessPlusStorefrontContentAvailableWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", CFSTR("Fitness"), CFSTR("1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BOOLForKey:", CFSTR("fitnessPlusEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke;
  v7[3] = &unk_24CC4E5D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "valueWithCompletion:", v7);

}

void __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  int v7;
  NSObject *v8;
  void (*v9)(void);
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a2)
  {
    v7 = objc_msgSend(a2, "BOOLValue");
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v7;
      _os_log_impl(&dword_21168F000, v8, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability fetched fitness plus enabled value: %d", (uint8_t *)v11, 8u);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke_cold_1(v10, v6);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

+ (void)_isSupportedDeviceAvailableWithCompletion:(id)a3
{
  void *v3;
  void (**v4)(id, BOOL);
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE0AC98];
  v4 = (void (**)(id, BOOL))a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  objc_msgSend(v5, "allAuthKitAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke;
  v11[3] = &unk_24CC4E668;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "hk_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v10 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = v9 != 0;
    _os_log_impl(&dword_21168F000, v10, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability - isSupportedDeviceAvailable: %d", buf, 8u);
  }
  v4[2](v4, v9 != 0);

}

BOOL __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "ams_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE0AD70]);
    objc_msgSend(v3, "ams_altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAltDSID:", v6);

    v32[0] = CFSTR("iOS");
    v32[1] = CFSTR("watchOS");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOperatingSystems:", v7);

    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__0;
    v30 = __Block_byref_object_dispose__0;
    v31 = 0;
    v8 = dispatch_semaphore_create(0);
    v9 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_216;
    v23[3] = &unk_24CC4E600;
    v25 = &v26;
    v10 = v8;
    v24 = v10;
    objc_msgSend(v9, "fetchDeviceListWithContext:completion:", v5, v23);
    v11 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x24BDD2FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
        __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      v20 = 0;
    }
    else
    {
      objc_msgSend((id)v27[5], "hk_firstObjectPassingTest:", &__block_literal_global_220);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v21 != 0;

    }
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_216(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x24BDD2FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
        __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_216_cold_1(v8, v7);
    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_218(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL4 v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(v2, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "operatingSystemVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_21168F000, v4, OS_LOG_TYPE_DEFAULT, "FIAppStoreAvailability remoteDevice model:%@ version:%@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(v2, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("iPhone")))
  {
    objc_msgSend(v2, "operatingSystemName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("iOS")))
    {
      objc_msgSend(v2, "operatingSystemVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10 >= 16.1;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v2, "operatingSystemName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("watchOS")))
  {
    objc_msgSend(v2, "operatingSystemVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14 >= 7.0;

  }
  else
  {
    v15 = 0;
  }

  return v11 | v15;
}

void __73__FIAppStoreAvailability_fetchIsFitnessAvailableForDeviceWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21168F000, a1, a3, "FIAppStoreAvailability failed to fetch Fitness availability for device; dispatch group timed out",
    a5,
    a6,
    a7,
    a8,
    0);
}

void __80__FIAppStoreAvailability_isFitnessPlusStorefrontContentAvailableWithCompletion___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21168F000, v5, v6, "FIAppStoreAvailability failed to fetch fitness plus enabled value: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

void __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21168F000, a1, a3, "FIAppStoreAvailability failed to fetch device list; semaphore timed out",
    a5,
    a6,
    a7,
    a8,
    0);
}

void __68__FIAppStoreAvailability__isSupportedDeviceAvailableWithCompletion___block_invoke_216_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21168F000, v5, v6, "FIAppStoreAvailability failed to fetch device list: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

@end
