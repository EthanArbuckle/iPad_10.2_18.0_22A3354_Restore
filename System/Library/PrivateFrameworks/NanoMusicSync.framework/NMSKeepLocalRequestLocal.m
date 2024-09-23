@implementation NMSKeepLocalRequestLocal

+ (id)sharedKeepLocalOperationQueue
{
  if (sharedKeepLocalOperationQueue_onceToken != -1)
    dispatch_once(&sharedKeepLocalOperationQueue_onceToken, &__block_literal_global_7);
  return (id)sharedKeepLocalOperationQueue_sharedQueue;
}

uint64_t __57__NMSKeepLocalRequestLocal_sharedKeepLocalOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)sharedKeepLocalOperationQueue_sharedQueue;
  sharedKeepLocalOperationQueue_sharedQueue = (uint64_t)v0;

  objc_msgSend((id)sharedKeepLocalOperationQueue_sharedQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)sharedKeepLocalOperationQueue_sharedQueue, "setName:", CFSTR("com.apple.NanoMusicSync.NMSKeepLocalRequestLocal"));
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  NMSKeepLocalRequestLocal *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NMSKeepLocalRequestValidator *v15;
  void *v16;
  NMSKeepLocalRequestValidator *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NMSKeepLocalRequest enableState](self, "enableState") + 1;
  if (v8 > 4)
  {
    v19 = (void *)MEMORY[0x24BDBCE88];
    v20 = *MEMORY[0x24BDBCAB0];
    v21 = CFSTR("Unsupported KeepLocal enable state specified.");
    goto LABEL_14;
  }
  if (v8 == 2)
  {
    if (!objc_msgSend(v6, "requiresValidation"))
    {
      v18 = objc_msgSend(v6, "resolvedConstraints:", objc_msgSend(MEMORY[0x24BDDC8E8], "nms_defaultKeepLocalConstraints"));
      v9 = objc_msgSend(v6, "qualityOfService");
      v10 = self;
      v11 = v18;
      goto LABEL_4;
    }
    NMLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[NMSKeepLocalRequest modelObject](self, "modelObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Running KeepLocal validation for modelObject: %@", buf, 0xCu);

    }
    objc_msgSend(v6, "cellularBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [NMSKeepLocalRequestValidator alloc];
      -[NMSKeepLocalRequest modelObject](self, "modelObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NMSKeepLocalRequestValidator initWithModelObject:](v15, "initWithModelObject:", v16);

      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __58__NMSKeepLocalRequestLocal_performWithOptions_completion___block_invoke;
      v23[3] = &unk_24D647CA0;
      v25 = v7;
      v23[4] = self;
      v24 = v6;
      -[NMSKeepLocalRequestValidator performWithOptions:completion:](v17, "performWithOptions:completion:", v24, v23);

      goto LABEL_5;
    }
    v19 = (void *)MEMORY[0x24BDBCE88];
    v20 = *MEMORY[0x24BDBCAB8];
    v21 = CFSTR("Required cellular bundle identifier missing during KeepLocalRequest validation.");
LABEL_14:
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v9 = objc_msgSend(v6, "qualityOfService");
  v10 = self;
  v11 = 0;
LABEL_4:
  -[NMSKeepLocalRequestLocal _performRequestWithConstraints:qualityOfService:completion:](v10, "_performRequestWithConstraints:qualityOfService:completion:", v11, v9, v7);
LABEL_5:

}

uint64_t __58__NMSKeepLocalRequestLocal_performWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_performRequestWithConstraints:qualityOfService:completion:", a2, objc_msgSend(*(id *)(a1 + 40), "qualityOfService"), *(_QWORD *)(a1 + 48));
}

- (void)_performRequestWithConstraints:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  int64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  int64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  NMLogForCategory(5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[NMSKeepLocalRequest enableState](self, "enableState");
    -[NMSKeepLocalRequest modelObject](self, "modelObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v25 = v10;
    v26 = 2048;
    v27 = a3;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Proceeding with KeepLocal request with state: %ld, constraints: %ld, modelObject: %@", buf, 0x20u);

  }
  v12 = objc_alloc_init(MEMORY[0x24BDDC8E8]);
  -[NMSKeepLocalRequest modelObject](self, "modelObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setModelObject:", v13);

  objc_msgSend(v12, "setEnableState:", -[NMSKeepLocalRequest enableState](self, "enableState"));
  objc_msgSend(v12, "setConstraints:", a3);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke;
  v21[3] = &unk_24D6472B8;
  v14 = v12;
  v22 = v14;
  v23 = v8;
  v15 = v8;
  v16 = (void *)objc_msgSend(v14, "newOperationWithResponseHandler:", v21);
  objc_msgSend(v16, "setQualityOfService:", a4);
  NMLogForCategory(5);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[NMSKeepLocalRequest modelObject](self, "modelObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = (int64_t)v16;
    v26 = 2112;
    v27 = (unint64_t)v18;
    _os_log_impl(&dword_216E27000, v17, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Adding KeepLocal operation(%@) for modelObject=%@", buf, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "sharedKeepLocalOperationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addOperation:", v16);
  v20 = v14;
  AnalyticsSendEventLazy();

}

void __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke_cold_1(a1, v5);

    v6 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD1398];
    v18[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("NMSKeepLocalRequestErrorDomain"), 0, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "enableState");
      v9 = objc_msgSend(*(id *)(a1 + 32), "constraints");
      objc_msgSend(*(id *)(a1 + 32), "modelObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestLocal] Successfully set KeepLocal state: %ld with constraints: %ld for modelObject: %@", (uint8_t *)&v11, 0x20u);

    }
    v7 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("constraints");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "constraints"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("enableState");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "enableState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __87__NMSKeepLocalRequestLocal__performRequestWithConstraints_qualityOfService_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(*(id *)(a1 + 32), "enableState");
  v5 = objc_msgSend(*(id *)(a1 + 32), "constraints");
  objc_msgSend(*(id *)(a1 + 32), "modelObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_216E27000, a2, OS_LOG_TYPE_ERROR, "[NMSKeepLocalRequestLocal] Error setting KeepLocal state: %ld with constraints: %ld for modelObject: %@", (uint8_t *)&v7, 0x20u);

}

@end
