@implementation AKAccountTelemetryHook

- (AKAccountTelemetryHook)initWithAltDSID:(id)a3
{
  id v4;
  AKAccountTelemetryHook *v5;
  void *v6;
  uint64_t v7;
  ACAccount *account;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAccountTelemetryHook;
  v5 = -[AKAccountTelemetryHook init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authKitAccountWithAltDSID:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v7;

  }
  return v5;
}

- (AKAccountTelemetryHook)initWithAccount:(id)a3
{
  id v5;
  AKAccountTelemetryHook *v6;
  AKAccountTelemetryHook *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAccountTelemetryHook;
  v6 = -[AKAccountTelemetryHook init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AKAccountTelemetryHook _setAccountAccessTelemetryOptIn:](self, "_setAccountAccessTelemetryOptIn:", a6, a4, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  -[AKAccountTelemetryHook _setAccountAccessTelemetryOptIn:](self, "_setAccountAccessTelemetryOptIn:", a4);
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("account:telemetry"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("account:telemetry"));
  return (char)v3;
}

- (void)_setAccountAccessTelemetryOptIn:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__AKAccountTelemetryHook__setAccountAccessTelemetryOptIn___block_invoke;
  v7[3] = &unk_1E7678CF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__AKAccountTelemetryHook__setAccountAccessTelemetryOptIn___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = 0;
  objc_msgSend(v2, "setAccountAccessTelemetryOptIn:forAccount:error:", 1, v3, &v5);
  v4 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
