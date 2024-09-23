@implementation NPKFidoAuthCoordinator

- (void)requestAuthorizationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  NPKFidoAuthCoordinator *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x2199B6780](v4);
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: request authorization with completion: %@", buf, 0xCu);

    }
  }
  if (-[NPKFidoAuthCoordinator _isDeviceLocked](self, "_isDeviceLocked"))
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: noting that device is locked; requesting unlock",
          buf,
          2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPKErrorDomain"), -1004, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, uint64_t, _QWORD, id))v4 + 2))(v4, 0, 1, 0, v12);
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BDDA938]);
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: About to evaluate device owner authentication policy for context: %@", buf, 0xCu);
      }

    }
    if (-[NPKFidoAuthCoordinator _isWristDetectDisabled](self, "_isWristDetectDisabled"))
      +[NPKAudioPlayer playWarsawHaptic](NPKAudioPlayer, "playWarsawHaptic");
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke;
    v17[3] = &unk_24CFEBDC0;
    v18 = v13;
    v19 = self;
    v20 = v4;
    v12 = v13;
    objc_msgSend(v12, "evaluatePolicy:options:reply:", 1023, 0, v17);

  }
}

void __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke_2;
  v9[3] = &unk_24CFE86A0;
  v10 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __61__NPKFidoAuthCoordinator_requestAuthorizationWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: Context evaluated; error: %@",
        (uint8_t *)&v12,
        0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 32))
    v6 = 0;
  else
    v6 = *(void **)(a1 + 40);
  v7 = v6;
  if (objc_msgSend(*(id *)(a1 + 32), "code") == -2)
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDDA908]);

  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(v9 + 8);
  *(_QWORD *)(v9 + 8) = v7;
  v11 = v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)clearContext
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  LAContext *context;
  LAContext *v7;
  int v8;
  LAContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      context = self->_context;
      v8 = 138412290;
      v9 = context;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKFidoAuthCoordinator: clearing context: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  -[LAContext invalidate](self->_context, "invalidate");
  v7 = self->_context;
  self->_context = 0;

}

- (BOOL)_isDeviceLocked
{
  return PKDevicePasscodeLocked() != 0;
}

- (BOOL)_isWristDetectDisabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("DisableWristDetection"), CFSTR("com.apple.Carousel"), 0) != 0;
}

- (LAContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
