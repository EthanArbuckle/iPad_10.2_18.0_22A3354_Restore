@implementation LACDTOSensorTrustVerifier

- (LACDTOSensorTrustVerifier)initWithTrustStateProvider:(id)a3 featureStateProvider:(id)a4 repairStateProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACDTOSensorTrustVerifier *v12;
  LACDTOSensorTrustVerifier *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOSensorTrustVerifier;
  v12 = -[LACDTOSensorTrustVerifier init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_trustStateProvider, a3);
    objc_storeStrong((id *)&v13->_featureStateProvider, a4);
    objc_storeStrong((id *)&v13->_repairStateProvider, a5);
  }

  return v13;
}

- (void)verifySensorTrustWithCompletion:(id)a3
{
  id v4;
  LACDTOSensorTrustVerifyService *v5;
  LACDTOFeatureStateProviding *featureStateProvider;
  id v7;
  LACDTOSensorTrustVerifyService *v8;
  _QWORD v9[4];
  LACDTOSensorTrustVerifyService *v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(LACDTOSensorTrustVerifyService);
  featureStateProvider = self->_featureStateProvider;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke;
  v9[3] = &unk_2510C1538;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8 = v5;
  v10 = v8;
  -[LACDTOFeatureStateProviding fetchStateWithCompletion:](featureStateProvider, "fetchStateWithCompletion:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 1);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_2;
    v7[3] = &unk_2510C1510;
    objc_copyWeak(&v11, a1 + 6);
    v10 = a1[5];
    v8 = a1[4];
    v9 = v3;
    objc_msgSend(v6, "fetchSensorTrustStateWithCompletion:", v7);

    objc_destroyWeak(&v11);
  }

}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void (*v8)(void);
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = (void (*)(void))*((_QWORD *)a1[6] + 2);
LABEL_9:
      v8();
      goto LABEL_10;
    }
    if ((objc_msgSend(a1[4], "shouldVerifySensorTrustWithFeatureState:trustState:", a1[5], v5) & 1) == 0)
    {
      LACLogDTOSensor();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2409DC000, v10, OS_LOG_TYPE_DEFAULT, "Skipping redundant repair checks", buf, 2u);
      }

      v8 = (void (*)(void))*((_QWORD *)a1[6] + 2);
      goto LABEL_9;
    }
    v9 = (void *)WeakRetained[3];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1;
    v11[3] = &unk_2510C14E8;
    objc_copyWeak(&v16, a1 + 7);
    v15 = a1[6];
    v12 = a1[4];
    v13 = a1[5];
    v14 = v5;
    objc_msgSend(v9, "fetchRepairStateWithCompletion:", v11);

    objc_destroyWeak(&v16);
  }
LABEL_10:

}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  void (*v11)(void);
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      v12 = *MEMORY[0x24BDD1398];
      v13[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACError errorWithCode:subcode:userInfo:](LACError, "errorWithCode:subcode:userInfo:", -1, 31, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      LACLogDTOSensor();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1_cold_1((uint64_t)v6, (uint64_t)v9, v10);

      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "verifySensorTrustWithFeatureState:trustState:repairState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v11();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairStateProvider, 0);
  objc_storeStrong((id *)&self->_featureStateProvider, 0);
  objc_storeStrong((id *)&self->_trustStateProvider, 0);
}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "Mapping %{public}@ into %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
