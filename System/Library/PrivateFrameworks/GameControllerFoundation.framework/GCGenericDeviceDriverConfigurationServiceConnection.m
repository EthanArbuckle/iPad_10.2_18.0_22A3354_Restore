@implementation GCGenericDeviceDriverConfigurationServiceConnection

void __75___GCGenericDeviceDriverConfigurationServiceConnection_fetchDeviceSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75___GCGenericDeviceDriverConfigurationServiceConnection_fetchDeviceSnapshot__block_invoke_2;
  v6[3] = &unk_1EA4D4130;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "fetchDeviceSnapshotWithReply:", v6);

}

uint64_t __75___GCGenericDeviceDriverConfigurationServiceConnection_fetchDeviceSnapshot__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke_2;
  v8[3] = &unk_1EA4D3E00;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "applyConfiguration:withReply:", v6, v8);

}

uint64_t __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
