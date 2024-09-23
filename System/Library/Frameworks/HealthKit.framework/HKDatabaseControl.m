@implementation HKDatabaseControl

- (HKDatabaseControl)initWithHealthStore:(id)a3
{
  id v4;
  HKDatabaseControl *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKDatabaseControl;
  v5 = -[HKDatabaseControl init](&v12, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)healthDatabaseIdentifierWithError:(id *)a3
{
  HKProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20;
  v21 = __Block_byref_object_dispose__20;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v9[4] = &v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke;
  v10[3] = &unk_1E37EE0C0;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_3;
  v9[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError(v5);
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_2;
  v3[3] = &unk_1E37EE098;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getHealthDatabaseIdentifierWithCompletion:", v3);
}

void __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __55__HKDatabaseControl_healthDatabaseIdentifierWithError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getHealthDirectorySizeInBytesWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke;
  v10[3] = &unk_1E37EE0E8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthDirectorySizeInBytesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __65__HKDatabaseControl_getHealthDirectorySizeInBytesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)obliterateHealthDataWithOptions:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke;
  v12[3] = &unk_1E37EE110;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_obliterateHealthDataWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __64__HKDatabaseControl_obliterateHealthDataWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performMigrationWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke;
  v10[3] = &unk_1E37EE0E8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performMigrationWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__HKDatabaseControl_performMigrationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hkqa_generateDemoDataWithDurationInDays:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke;
  v12[3] = &unk_1E37EE110;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_hkqa_generateDemoDataWithDurationInDays:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__HKDatabaseControl_hkqa_generateDemoDataWithDurationInDays_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hkqa_statisticsWithCompletion:(id)a3
{
  void *v4;
  HKProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke;
  v10[3] = &unk_1E37EE0E8;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_hkqa_statisticsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__HKDatabaseControl_hkqa_statisticsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
