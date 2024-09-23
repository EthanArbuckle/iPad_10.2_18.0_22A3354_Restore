@implementation HDMCDiagnosticsServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x24BE46AC8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUUID:configuration:client:delegate:profileExtension:", v11, v12, v13, v14, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("No profile extension found for %@"), objc_opt_class());
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

- (HDMCDiagnosticsServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v13;
  id v14;
  HDMCDiagnosticsServer *v15;
  void *v16;
  objc_super v18;

  v13 = a5;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDMCDiagnosticsServer;
  v15 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v18, sel_initWithUUID_configuration_client_delegate_, a3, a4, v13, a6);
  if (v15)
  {
    objc_msgSend(v13, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v15->_profile, v16);

    objc_storeStrong((id *)&v15->_profileExtension, a7);
    objc_storeStrong((id *)&v15->_client, a5);
  }

  return v15;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE468F8];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDD3120];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)remote_triggerAnalysisForDiagnosticsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_21961B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Trigger analysis for diagnostics", buf, 0xCu);

  }
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__HDMCDiagnosticsServer_remote_triggerAnalysisForDiagnosticsWithCompletion___block_invoke;
  v10[3] = &unk_24DB22500;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, v10);

}

void __76__HDMCDiagnosticsServer_remote_triggerAnalysisForDiagnosticsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "analysisManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "_analyzeWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:", 1, 1, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;

  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3 != 0, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
