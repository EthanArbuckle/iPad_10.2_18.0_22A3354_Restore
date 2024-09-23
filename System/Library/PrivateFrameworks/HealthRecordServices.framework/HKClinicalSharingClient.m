@implementation HKClinicalSharingClient

- (HKClinicalSharingClient)init
{
  void *v3;
  HKClinicalSharingClient *v4;

  +[HKHealthRecordsDaemonConnection sharedConnection](HKHealthRecordsDaemonConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKClinicalSharingClient initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (HKClinicalSharingClient)initWithConnection:(id)a3
{
  id v4;
  HKClinicalSharingClient *v5;
  HKHealthRecordsDaemonProxyProvider *v6;
  HKProxyProvider *proxyProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKClinicalSharingClient;
  v5 = -[HKClinicalSharingClient init](&v9, sel_init);
  if (v5)
  {
    v6 = -[HKHealthRecordsDaemonProxyProvider initWithConnection:serviceIdentifier:exportedObject:]([HKHealthRecordsDaemonProxyProvider alloc], "initWithConnection:serviceIdentifier:exportedObject:", v4, CFSTR("ClinicalSharing"), v5);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = &v6->super;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v5;
}

- (void)shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  -[HKClinicalSharingClient shareHealthDataWithOptions:reason:date:completion:](self, "shareHealthDataWithOptions:reason:date:completion:", a3, a4, 0, a5);
}

- (void)shareHealthDataWithOptions:(unint64_t)a3 reason:(int64_t)a4 date:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  unint64_t v20;
  int64_t v21;

  v10 = a5;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke;
  v17[3] = &unk_24D54A698;
  v20 = a3;
  v21 = a4;
  v18 = v10;
  v19 = v11;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v19;
  v13 = v19;
  v14 = v10;
  -[HKClinicalSharingClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_shareHealthDataWithOptions:reason:date:completion:", a1[6], a1[7], a1[4], a1[5]);
}

uint64_t __77__HKClinicalSharingClient_shareHealthDataWithOptions_reason_date_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scheduleSharingHealthDataWithReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke;
  v11[3] = &unk_24D54A6C0;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke_2;
  v9[3] = &unk_24D549308;
  v10 = v12;
  v8 = v12;
  -[HKClinicalSharingClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_scheduleSharingHealthDataWithReason:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__HKClinicalSharingClient_scheduleSharingHealthDataWithReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)gatherQueryDiagnosticsWithOptions:(unint64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a4;
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke;
  v15[3] = &unk_24D54A6E8;
  v18 = a3;
  v16 = v8;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke_2;
  v13[3] = &unk_24D549308;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[HKClinicalSharingClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_gatherQueryDiagnosticsWithOptions:date:completion:", a1[6], a1[4], a1[5]);
}

uint64_t __77__HKClinicalSharingClient_gatherQueryDiagnosticsWithOptions_date_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)submitDailyAnalyticsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke;
  v9[3] = &unk_24D54A710;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke_2;
  v7[3] = &unk_24D549308;
  v8 = v10;
  v6 = v10;
  -[HKClinicalSharingClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v9, v7);

}

uint64_t __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_submitDailyAnalyticsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__HKClinicalSharingClient_submitDailyAnalyticsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)submitOnboardingAnalyticsForStepIdentifier:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke;
  v17[3] = &unk_24D54A738;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke_2;
  v15[3] = &unk_24D549308;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[HKClinicalSharingClient _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v17, v15);

}

uint64_t __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_submitOnboardingAnalyticsForStepIdentifier:context:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKClinicalSharingClient_submitOnboardingAnalyticsForStepIdentifier_context_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

+ (id)defaultSyncActivityCriteria
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC6C0], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC6E0], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  return empty;
}

- (id)exportedInterface
{
  return objc_alloc_init(MEMORY[0x24BDD1990]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
