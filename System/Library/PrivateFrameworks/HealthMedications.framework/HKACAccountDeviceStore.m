@implementation HKACAccountDeviceStore

- (HKACAccountDeviceStore)initWithAccountStore:(id)a3
{
  id v5;
  HKACAccountDeviceStore *v6;
  HKACAccountDeviceStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKACAccountDeviceStore;
  v6 = -[HKACAccountDeviceStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountStore, a3);

  return v7;
}

- (void)fetchDevicesWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HKACAccountDeviceStore_fetchDevicesWithRequest_completion___block_invoke;
  v7[3] = &unk_1E6CD54B0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "performRequestWithHandler:", v7);

}

void __61__HKACAccountDeviceStore_fetchDevicesWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void (*v6)(void);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a4)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    v6();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  objc_msgSend(v9, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_map:", &__block_literal_global_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_7:

}

HKACAccountDevice *__61__HKACAccountDeviceStore_fetchDevicesWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HKACAccountDevice *v3;

  v2 = a2;
  v3 = -[HKACAccountDevice initWithDevice:]([HKACAccountDevice alloc], "initWithDevice:", v2);

  return v3;
}

- (HKACAccountStoreProtocol)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (HKACDeviceListRequestProtocol)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
