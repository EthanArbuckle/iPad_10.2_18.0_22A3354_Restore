@implementation AMUIDefaultSelectedPosterCoordinator

- (void)setAmbientDefaults:(id)a3
{
  AMAmbientDefaults *v5;
  AMUILastSelectedPosterStore *v6;
  AMUILastSelectedPosterStore *lastSelectedPosterStore;
  AMAmbientDefaults *v8;

  v5 = (AMAmbientDefaults *)a3;
  if (self->_ambientDefaults != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_ambientDefaults, a3);
    v6 = -[AMUILastSelectedPosterStore initWithAmbientDefaults:]([AMUILastSelectedPosterStore alloc], "initWithAmbientDefaults:", self->_ambientDefaults);
    lastSelectedPosterStore = self->_lastSelectedPosterStore;
    self->_lastSelectedPosterStore = v6;

    v5 = v8;
  }

}

- (PRSPosterConfiguration)lastSelectedPosterConfiguration
{
  return self->_lastSelectedPosterConfiguration;
}

- (void)updateLastSelectedPosterConfiguration:(id)a3 fromUserAction:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  AMUILastSelectedPosterStore *lastSelectedPosterStore;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastSelectedPosterConfiguration, a3);
    if (v4)
    {
      AMUILogSwitcher();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_DEFAULT, "Selected Poster Coordinator updating selection to configuration %@", buf, 0xCu);
      }

      v9 = objc_alloc_init(MEMORY[0x24BE74C60]);
      v10 = *MEMORY[0x24BE74C78];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke;
      v16[3] = &unk_250763C78;
      v17 = v7;
      objc_msgSend(v9, "updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:", v10, v17, v16);

    }
    -[AMUIDefaultSelectedPosterCoordinator delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterSelectionCoordinator:didUpdateLastSelectedPosterConfiguration:", self, self->_lastSelectedPosterConfiguration);

  }
  if (v4)
  {
    lastSelectedPosterStore = self->_lastSelectedPosterStore;
    objc_msgSend(v7, "serverUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIDefaultSelectedPosterCoordinator _currentChargerIdentifier](self, "_currentChargerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUILastSelectedPosterStore setLastSelectedConfigurationUUID:forChargerIdentifier:providerBundleIdentifier:](lastSelectedPosterStore, "setLastSelectedConfigurationUUID:forChargerIdentifier:providerBundleIdentifier:", v13, v14, v15);

  }
}

void __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AMUILogSwitcher();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke_cold_1(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_23600A000, v5, OS_LOG_TYPE_INFO, "Selected Poster Coordinator completed updating selection to configuration %@", (uint8_t *)&v7, 0xCu);
  }

}

- (id)lastSelectedPosterConfigurationUUIDForProviderBundleIdentifier:(id)a3
{
  AMUILastSelectedPosterStore *lastSelectedPosterStore;
  id v5;
  void *v6;
  void *v7;

  lastSelectedPosterStore = self->_lastSelectedPosterStore;
  v5 = a3;
  -[AMUIDefaultSelectedPosterCoordinator _currentChargerIdentifier](self, "_currentChargerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUILastSelectedPosterStore lastSelectedConfigurationUUIDForChargerIdentifier:providerBundleIdentifier:](lastSelectedPosterStore, "lastSelectedConfigurationUUIDForChargerIdentifier:providerBundleIdentifier:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_currentChargerIdentifier
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  -[AMUIDefaultSelectedPosterCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterSelectionCoordinatorRequestsConnectedChargerId:", self);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("(none)");
  v6 = v4;

  return v6;
}

- (AMUIPosterSelectionCoordinatingDelegate)delegate
{
  return (AMUIPosterSelectionCoordinatingDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (AMAmbientDefaults)ambientDefaults
{
  return self->_ambientDefaults;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_lastSelectedPosterStore, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_lastSelectedPosterConfiguration, 0);
}

void __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_23600A000, log, OS_LOG_TYPE_ERROR, "Selected Poster Coordinator failed updating selection to configuration %@ with error %@", (uint8_t *)&v4, 0x16u);
}

@end
