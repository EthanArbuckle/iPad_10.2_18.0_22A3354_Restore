@implementation CMLUseCaseStatus

- (CMLUseCaseStatus)initWithUseCase:(id)a3 serializedDynamicConfig:(id)a4 lastUsed:(id)a5 keyGenerationTime:(id)a6 keyExpirationTime:(id)a7 status:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CMLUseCaseStatus *v18;
  CMLUseCaseStatus *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CMLUseCaseStatus;
  v18 = -[CMLUseCaseStatus init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_useCase, a3);
    objc_storeStrong((id *)&v19->_serializedDynamicConfig, a4);
    objc_storeStrong((id *)&v19->_lastUsed, a5);
    objc_storeStrong((id *)&v19->_keyGenerationTime, a6);
    objc_storeStrong((id *)&v19->_keyExpirationTime, a7);
    v19->_status = a8;
  }

  return v19;
}

+ (void)requestStatusForClientConfig:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  dispatch_queue_t v9;

  v7 = a5;
  v8 = a3;
  v9 = dispatch_queue_create("com.apple.CipherML.CMLUseCaseStatus", 0);
  objc_msgSend((id)objc_opt_class(), "requestStatusForClientConfig:options:dispatchQueue:completionHandler:", v8, a4, v9, v7);

}

+ (void)requestStatusForClientConfig:(id)a3 options:(unint64_t)a4 dispatchQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  SEL v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[CMLXPC createConnection](CMLXPC, "createConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke;
  aBlock[3] = &unk_2509A7EE8;
  v14 = v11;
  v32 = v14;
  v15 = v12;
  v31 = v15;
  v16 = _Block_copy(aBlock);
  +[CMLXPC asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:](CMLXPC, "asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:", v15, v10, v34 + 3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLLog client](CMLLog, "client");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v19;
    _os_log_impl(&dword_237BC8000, v18, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_3;
  v24[3] = &unk_2509A7F38;
  v28 = &v33;
  v29 = a2;
  v20 = v10;
  v25 = v20;
  v21 = v14;
  v27 = v21;
  v22 = v15;
  v26 = v22;
  objc_msgSend(v17, "queryStatusForClientConfig:options:reply:", v9, a4, v24);

  _Block_object_dispose(&v33, 8);
}

uint64_t __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[CMLLog client](CMLLog, "client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    v20 = 1024;
    v21 = v5 != 0;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_237BC8000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, status(%d) error:%{public}@", buf, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  if (v6)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 1100, v6, CFSTR("Unable to query status due to errors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = *(NSObject **)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_6;
  v13[3] = &unk_2509A7F10;
  v17 = *(id *)(a1 + 48);
  v14 = v5;
  v15 = v9;
  v16 = *(id *)(a1 + 40);
  v11 = v9;
  v12 = v5;
  dispatch_async(v10, v13);

}

uint64_t __89__CMLUseCaseStatus_requestStatusForClientConfig_options_dispatchQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

+ (id)statusForClientConfig:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  id v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  +[CMLXPC createConnection](CMLXPC, "createConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v9, &v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  +[CMLLog client](CMLLog, "client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v12;
    _os_log_impl(&dword_237BC8000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__CMLUseCaseStatus_statusForClientConfig_options_error___block_invoke;
  v20[3] = &unk_2509A7F60;
  v20[4] = &v21;
  v20[5] = &v27;
  v20[6] = a2;
  objc_msgSend(v10, "queryStatusForClientConfig:options:reply:", v8, a4, v20);
  if (a5)
  {
    v13 = v33;
    if (!v33)
      v13 = (id)v28[5];
    *a5 = objc_retainAutorelease(v13);
  }
  +[CMLLog client](CMLLog, "client");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v22[5] != 0;
    v17 = v28[5];
    *(_DWORD *)buf = 138412802;
    v35 = v15;
    v36 = 1024;
    v37 = v16;
    v38 = 2114;
    v39 = v17;
    _os_log_impl(&dword_237BC8000, v14, OS_LOG_TYPE_DEFAULT, "%@ Request complete, status(%d) error:%{public}@", buf, 0x1Cu);

  }
  objc_msgSend(v9, "invalidate");
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __56__CMLUseCaseStatus_statusForClientConfig_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 1024;
    v16 = v6 != 0;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, status(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 1100, v7, CFSTR("Unable to query status due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLUseCaseStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CMLUseCaseStatus *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("useCase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedDynamicConfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyGenerationTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyExpirationTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("status"));

  v11 = -[CMLUseCaseStatus initWithUseCase:serializedDynamicConfig:lastUsed:keyGenerationTime:keyExpirationTime:status:](self, "initWithUseCase:serializedDynamicConfig:lastUsed:keyGenerationTime:keyExpirationTime:status:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CMLUseCaseStatus useCase](self, "useCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("useCase"));

  -[CMLUseCaseStatus serializedDynamicConfig](self, "serializedDynamicConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("serializedDynamicConfig"));

  -[CMLUseCaseStatus lastUsed](self, "lastUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("lastUsed"));

  -[CMLUseCaseStatus keyGenerationTime](self, "keyGenerationTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("keyGenerationTime"));

  -[CMLUseCaseStatus keyExpirationTime](self, "keyExpirationTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("keyExpirationTime"));

  objc_msgSend(v9, "encodeInt64:forKey:", -[CMLUseCaseStatus status](self, "status"), CFSTR("status"));
}

- (NSString)useCase
{
  return self->_useCase;
}

- (NSData)serializedDynamicConfig
{
  return self->_serializedDynamicConfig;
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (NSDate)keyGenerationTime
{
  return self->_keyGenerationTime;
}

- (NSDate)keyExpirationTime
{
  return self->_keyExpirationTime;
}

- (unint64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyExpirationTime, 0);
  objc_storeStrong((id *)&self->_keyGenerationTime, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_serializedDynamicConfig, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

@end
