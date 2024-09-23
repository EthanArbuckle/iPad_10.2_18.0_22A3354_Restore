@implementation NPKPaymentWebServiceStandaloneTargetDevice

+ (id)standalonePaymentWebServiceWithDelegate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NPKPaymentWebServiceStandaloneTargetDevice *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x24BE6ED30];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "sharedPaymentWebServiceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x24BE6EDC0]);
  v9 = v8;

  v10 = objc_alloc_init(NPKPaymentWebServiceStandaloneTargetDevice);
  -[NPKPaymentWebServiceStandaloneTargetDevice setDelegate:](v10, "setDelegate:", v4);

  v11 = objc_alloc(MEMORY[0x24BE6EDB0]);
  objc_msgSend(MEMORY[0x24BE6EED0], "sharedPaymentWebServiceArchiver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithContext:targetDevice:archiver:", v9, v10, v12);

  return v13;
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[NPKPaymentWebServiceStandaloneTargetDevice delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NPKPaymentWebServiceStandaloneTargetDevice delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "standaloneTargetDevice:requestsEnforceUpgradedPasscodePolicyWithCompletion:", self, v4);

  }
  else
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Target device: No delegate to enforce upgraded passcode policy!", v11, 2u);
      }

    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1000, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v10);

    }
  }

}

- (void)startRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v3 = a3;
  -[NPKPaymentWebServiceStandaloneTargetDevice delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NPKPaymentWebServiceStandaloneTargetDevice delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "standaloneTargetDevice:requestsStartRequiringUpgradedPasscodeWithPasscodeMeetsPolicy:", self, v3);

  }
  else
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Target device: No delegate to start requiring upgraded passcode!", buf, 2u);
      }

    }
  }
}

- (void)endRequiringUpgradedPasscodeIfNecessary
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  -[NPKPaymentWebServiceStandaloneTargetDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NPKPaymentWebServiceStandaloneTargetDevice delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "standaloneTargetDeviceRequestsEndRequiringUpgradedPasscodeIfNecessary:", self);

  }
  else
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Target device: No delegate to end requiring upgraded passcode!", buf, 2u);
      }

    }
  }
}

- (NPKPaymentWebServiceStandaloneTargetDeviceDelegate)delegate
{
  return (NPKPaymentWebServiceStandaloneTargetDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
