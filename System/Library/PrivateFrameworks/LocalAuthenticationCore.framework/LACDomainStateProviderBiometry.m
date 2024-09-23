@implementation LACDomainStateProviderBiometry

- (LACDomainStateProviderBiometry)initWithBiometryHelper:(id)a3
{
  id v5;
  LACDomainStateProviderBiometry *v6;
  LACDomainStateProviderBiometry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDomainStateProviderBiometry;
  v6 = -[LACDomainStateProviderBiometry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_helper, a3);

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_5);
  return (id)sharedInstance_sharedInstace;
}

void __48__LACDomainStateProviderBiometry_sharedInstance__block_invoke()
{
  LACDomainStateProviderBiometry *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [LACDomainStateProviderBiometry alloc];
  +[LACBiometryHelper sharedInstance](LACBiometryHelper, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[LACDomainStateProviderBiometry initWithBiometryHelper:](v0, "initWithBiometryHelper:", v3);
  v2 = (void *)sharedInstance_sharedInstace;
  sharedInstance_sharedInstace = v1;

}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  LACBiometryHelper *helper;
  id v8;
  uint64_t v9;
  LACBiometryHelper *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, _QWORD))a4;
  helper = self->_helper;
  v8 = a3;
  v9 = -[LACBiometryHelper biometryType](helper, "biometryType");
  v10 = self->_helper;
  objc_msgSend(v8, "userID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  -[LACBiometryHelper biometryDatabaseHashForUser:error:](v10, "biometryDatabaseHashForUser:error:", v11, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;

  if (v13)
  {
    LACLogBiometry();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[LACDomainStateProviderBiometry domainStateForRequest:completion:].cold.1((uint64_t)v13, v14);

  }
  v26 = CFSTR("kLACDomainStateResultKeyAvailableBiometryTypes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  v25 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    v23 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("kLACDomainStateResultKeyBiometryStateHashes"));

  }
  v6[2](v6, v18, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
}

- (void)domainStateForRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "biometryDatabaseHashForUser returned error: %@", (uint8_t *)&v2, 0xCu);
}

@end
