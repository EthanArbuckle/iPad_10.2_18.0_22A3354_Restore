@implementation AFMachServiceSiriTaskDeliverer

- (AFMachServiceSiriTaskDeliverer)initWithMachServiceName:(id)a3
{
  id v4;
  AFMachServiceSiriTaskDeliverer *v5;
  uint64_t v6;
  NSString *machServiceName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFMachServiceSiriTaskDeliverer;
  v5 = -[AFMachServiceSiriTaskDeliverer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v6;

  }
  return v5;
}

- (NSString)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendString:", CFSTR("machServiceName="));
  objc_msgSend(v3, "appendString:", self->_machServiceName);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t *v38;
  _QWORD v39[5];
  dispatch_queue_t v40;
  _QWORD v41[3];
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  AFMachServiceSiriTaskDeliverer *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__30831;
  v47 = __Block_byref_object_dispose__30832;
  v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_machServiceName, 0);
  v8 = (void *)v44[5];
  objc_msgSend(MEMORY[0x1E0CB3B50], "af_siriTaskDeliveringInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__30831;
  v39[4] = __Block_byref_object_dispose__30832;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v40 = dispatch_queue_create("Mach Service Task Delivery Completion Handler", v10);

  v11 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke;
  v34[3] = &unk_1E3A33D48;
  v36 = v39;
  v37 = v41;
  v12 = v7;
  v35 = v12;
  v38 = &v43;
  v32[0] = v11;
  v32[1] = 3221225472;
  v32[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3;
  v32[3] = &unk_1E3A36BB8;
  v13 = (id)MEMORY[0x1A1AC0C3C](v34);
  v33 = v13;
  v14 = (void *)MEMORY[0x1A1AC0C3C](v32);
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v50 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]";
    v51 = 2112;
    v52 = self;
    v53 = 2080;
    v54 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]";
    v55 = 2112;
    v56 = v6;
    _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s %@ %s %@", buf, 0x2Au);
  }
  v16 = (void *)v44[5];
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_27;
  v30[3] = &unk_1E3A36FA0;
  v30[4] = self;
  v17 = v14;
  v31 = v17;
  objc_msgSend(v16, "setInvalidationHandler:", v30);
  v18 = (void *)v44[5];
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_28;
  v28[3] = &unk_1E3A36FA0;
  v28[4] = self;
  v19 = v17;
  v29 = v19;
  objc_msgSend(v18, "setInterruptionHandler:", v28);
  objc_msgSend((id)v44[5], "resume");
  v20 = (void *)v44[5];
  v23 = v11;
  v24 = 3221225472;
  v25 = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_29;
  v26 = &unk_1E3A35B08;
  v21 = v13;
  v27 = v21;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", &v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "deliverSiriTask:completionHandler:", v6, v21, v23, v24, v25, v26);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = *(_QWORD *)(a1[5] + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v6 = *(NSObject **)(v5 + 40);
  v8[2] = __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2;
  v8[3] = &unk_1E3A33D20;
  v11 = a1[6];
  v8[1] = 3221225472;
  v9 = v3;
  v10 = v4;
  v12 = a1[7];
  v7 = v3;
  dispatch_async(v6, v8);

}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[AFError errorWithCode:](AFError, "errorWithCode:", 701);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 136315394;
    v6 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]_block_invoke";
    v7 = 2114;
    v8 = v4;
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s connection to task service %{public}@ was invalidated", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 136315394;
    v6 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]_block_invoke";
    v7 = 2114;
    v8 = v4;
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s connection to task service %{public}@ was interrupted", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFMachServiceSiriTaskDeliverer deliverSiriTask:completionHandler:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s task service was unable to deliver task: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__AFMachServiceSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setInvalidationHandler:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setInterruptionHandler:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "invalidate");
    v3 = *(_QWORD *)(a1[7] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

+ (id)machServiceSiriTaskDelivererForAppWithBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;

  +[AFSiriTaskService _machServiceNameForAppTaskServiceWithBundleIdentifier:](AFSiriTaskService, "_machServiceNameForAppTaskServiceWithBundleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMachServiceName:", v4);

  return v5;
}

@end
