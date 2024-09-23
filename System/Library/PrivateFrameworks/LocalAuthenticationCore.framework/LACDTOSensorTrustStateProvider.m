@implementation LACDTOSensorTrustStateProvider

- (LACDTOSensorTrustStateProvider)initWithStore:(id)a3
{
  id v5;
  LACDTOSensorTrustStateProvider *v6;
  LACDTOSensorTrustStateProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOSensorTrustStateProvider;
  v6 = -[LACDTOSensorTrustStateProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (void)checkIsSensorTrustedWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__LACDTOSensorTrustStateProvider_checkIsSensorTrustedWithCompletion___block_invoke;
  v6[3] = &unk_2510C1890;
  v7 = v4;
  v5 = v4;
  -[LACDTOSensorTrustStateProvider fetchSensorTrustStateWithCompletion:](self, "fetchSensorTrustStateWithCompletion:", v6);

}

void __69__LACDTOSensorTrustStateProvider_checkIsSensorTrustedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
    v6 = objc_msgSend(a2, "isDisapproved") ^ 1;
  else
    v6 = 0;
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);

}

- (void)fetchSensorTrustStateWithCompletion:(id)a3
{
  id v4;
  LACDTOKVStore *store;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  store = self->_store;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke;
  v7[3] = &unk_2510C1118;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTOKVStore valueForKey:completion:](store, "valueForKey:completion:", 5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v9 = (void *)*((_QWORD *)WeakRetained + 1);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke_2;
      v10[3] = &unk_2510C18B8;
      objc_copyWeak(&v13, (id *)(a1 + 40));
      v12 = *(id *)(a1 + 32);
      v11 = v5;
      objc_msgSend(v9, "valueForKey:completion:", 6, v10);

      objc_destroyWeak(&v13);
    }
  }

}

void __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  LACDTOMutableSensorTrustState *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v7 = objc_alloc_init(LACDTOMutableSensorTrustState);
      objc_msgSend(*(id *)(a1 + 32), "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOMutableSensorTrustState setInstalledSensorID:](v7, "setInstalledSensorID:", v8);

      objc_msgSend(v10, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOMutableSensorTrustState setTrustedSensorID:](v7, "setTrustedSensorID:", v9);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
