@implementation HDHAHealthPluginHostFeedGenerator

- (HDHAHealthPluginHostFeedGenerator)init
{
  HDHAHealthPluginHostFeedGenerator *v2;
  HDHAHealthAppPluginHostConnection *v3;
  HDHAHealthAppPluginHostConnection *pluginHostConnection;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *v5;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *orchestrationConnection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDHAHealthPluginHostFeedGenerator;
  v2 = -[HDHAHealthPluginHostFeedGenerator init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HDHAHealthAppPluginHostConnection);
    pluginHostConnection = v2->_pluginHostConnection;
    v2->_pluginHostConnection = v3;

    v5 = objc_alloc_init(_TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient);
    orchestrationConnection = v2->_orchestrationConnection;
    v2->_orchestrationConnection = v5;

  }
  return v2;
}

- (void)runBackgroundGenerationForPluginIdentifiers:(id)a3 commitUrgentTransaction:(BOOL)a4 feedItemsOnly:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  _TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient *orchestrationConnection;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  orchestrationConnection = self->_orchestrationConnection;
  if (v5)
    v10 = 0;
  else
    v10 = 2;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __119__HDHAHealthPluginHostFeedGenerator_runBackgroundGenerationForPluginIdentifiers_commitUrgentTransaction_feedItemsOnly___block_invoke;
  v12[3] = &unk_250E7E1B8;
  v13 = v8;
  v11 = v8;
  -[HealthAppHealthDaemonOrchestrationClient runBackgroundGenerationWithPlugins:commitAsUrgent:generationType:completion:](orchestrationConnection, "runBackgroundGenerationWithPlugins:commitAsUrgent:generationType:completion:", v11, v6, v10, v12);

}

void __119__HDHAHealthPluginHostFeedGenerator_runBackgroundGenerationForPluginIdentifiers_commitUrgentTransaction_feedItemsOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v3 == 0;
    v7 = 2112;
    v8 = v5;
    _os_log_impl(&dword_23DB70000, v4, OS_LOG_TYPE_DEFAULT, "Running background generation success %d for pluginIdentifiers %@", (uint8_t *)v6, 0x12u);
  }

}

- (void)runBackgroundGenerationForAllPlugins
{
  -[HealthAppHealthDaemonOrchestrationClient runBackgroundGenerationWithPlugins:commitAsUrgent:generationType:completion:](self->_orchestrationConnection, "runBackgroundGenerationWithPlugins:commitAsUrgent:generationType:completion:", 0, 0, 2, &__block_literal_global_0);
}

void __73__HDHAHealthPluginHostFeedGenerator_runBackgroundGenerationForAllPlugins__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2 == 0;
    _os_log_impl(&dword_23DB70000, v3, OS_LOG_TYPE_DEFAULT, "Running background generation success %d for all plugins", (uint8_t *)v4, 8u);
  }

}

- (void)handleJournaledSharingEntries:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[HDHAHealthPluginHostFeedGenerator healthAppPluginHost](self, "healthAppPluginHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23DB70000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to handle journaled sharing entries", v7, 2u);
  }
  objc_msgSend(v5, "handleJournaledSharingEntries:completion:", v4, &__block_literal_global_188);

}

void __67__HDHAHealthPluginHostFeedGenerator_handleJournaledSharingEntries___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_23DB70000, v5, OS_LOG_TYPE_DEFAULT, "Error handling journaled sharing entries %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)invalidateStoreCache
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23DB70000, v3, OS_LOG_TYPE_DEFAULT, "Wiping Health app store cache", v5, 2u);
  }
  -[HDHAHealthPluginHostFeedGenerator synchronousHealthAppPluginHost](self, "synchronousHealthAppPluginHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateStoreCache");

}

- (id)synchronousHealthAppPluginHost
{
  return -[HDHAHealthAppPluginHostConnection synchronousProxy](self->_pluginHostConnection, "synchronousProxy");
}

- (id)healthAppPluginHost
{
  return -[HDHAHealthAppPluginHostConnection proxy](self->_pluginHostConnection, "proxy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orchestrationConnection, 0);
  objc_storeStrong((id *)&self->_pluginHostConnection, 0);
}

@end
