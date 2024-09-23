@implementation HKIngestSettingsViewController

void __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD block[5];

  v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (v5)
    v13 = a2;
  else
    v13 = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1049) = v13;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_184;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_184(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

void __46___HKIngestSettingsViewController_reloadData___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

void __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      *((_BYTE *)WeakRetained + 1048) = *(_BYTE *)(a1 + 40);
    }
    else
    {
      _HKInitializeLogging();
      v6 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(v6, v5, a1);
    }
  }

}

uint64_t __72___HKIngestSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66___HKIngestSettingsViewController_fetchEnabledStatusForPeripheral__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "fetchEnabledStatusForPeripheral getEnabledStatusForPeripheral failed: %{public}@", a5, a6, a7, a8, 2u);
}

void __64___HKIngestSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = *(unsigned __int8 *)(a3 + 40);
  v11 = 138543874;
  v12 = v6;
  if (v9)
    v10 = CFSTR("ON");
  else
    v10 = CFSTR("OFF");
  v13 = 2114;
  v14 = v7;
  v15 = 2114;
  v16 = v10;
  _os_log_error_impl(&dword_1D7813000, v5, OS_LOG_TYPE_ERROR, "Could not set the enabled status of device %{public}@, '%{public}@', to %{public}@", (uint8_t *)&v11, 0x20u);

}

@end
