@implementation FMDEmergencyCallInfoPublisher

- (FMDEmergencyCallInfoPublisher)initWithConfiguration:(id)a3
{
  char *v5;
  FMDEmergencyCallInfoPublisher *v6;
  NSObject *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDEmergencyCallInfoPublisher;
  v6 = -[FMDEmergencyCallInfoPublisher init](&v10, sel_init);
  if (v6)
  {
    LogCategory_Unspecified();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[FMDEmergencyCallInfoPublisher initWithConfiguration:]";
      _os_log_impl(&dword_1C9939000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_publisherConfig, a3);
  }

  return v6;
}

- (void)publishInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[FMDEmergencyCallInfoPublisher publishInfo:completion:]";
    _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v24[0] = CFSTR("kFMDEmergencyCallInfoPublisherConfigKey");
  -[FMDEmergencyCallInfoPublisher publisherConfig](self, "publisherConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = CFSTR("kFMDEmergencyCallInfoPublisherInfoKey");
  v25[0] = v9;
  v25[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[FMNSXPCConnectionCache sharedCache](FMNSXPCConnectionCache, "sharedCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FMNSXPCConnectionConfiguration emergencyCallInfoPublisherConfiguration](FMNSXPCConnectionConfiguration, "emergencyCallInfoPublisherConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resumeConnectionWithConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke;
  v22[3] = &unk_1E829C100;
  v15 = v6;
  v23 = v15;
  objc_msgSend(v13, "addFailureBlock:", v22);
  objc_msgSend(v13, "remoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_4;
  v19[3] = &unk_1E829C380;
  v20 = v13;
  v21 = v15;
  v17 = v13;
  v18 = v15;
  objc_msgSend(v16, "publishInfo:completion:", v10, v19);

}

void __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;

  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_cold_1(a2, v4);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kFMDErrorDomain, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

uint64_t __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (FMDEmergencyCallInfoPublisherConfiguration)publisherConfig
{
  return self->_publisherConfig;
}

- (void)setPublisherConfig:(id)a3
{
  objc_storeStrong((id *)&self->_publisherConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherConfig, 0);
}

void __56__FMDEmergencyCallInfoPublisher_publishInfo_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9939000, a2, OS_LOG_TYPE_ERROR, "XPC error for publishInfo:completion: %li", (uint8_t *)&v2, 0xCu);
}

@end
