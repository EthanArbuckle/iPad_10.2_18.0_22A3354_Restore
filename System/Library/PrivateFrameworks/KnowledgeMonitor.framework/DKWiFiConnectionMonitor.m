@implementation DKWiFiConnectionMonitor

void __33___DKWiFiConnectionMonitor_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint8_t v34[16];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  if (+[_DKWiFiConnectionMonitor writeToBiome](_DKWiFiConnectionMonitor, "writeToBiome"))
  {
    BiomeLibrary();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "Device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Wireless");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "WiFi");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 144);
    *(_QWORD *)(v7 + 144) = v6;

  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE29F18]), "initWithServiceType:", 3);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 152);
  *(_QWORD *)(v10 + 152) = v9;

  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __33___DKWiFiConnectionMonitor_start__block_invoke_2;
  v37[3] = &unk_24DA67110;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v12, "setEventHandler:", v37);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "activate");
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v36 = 0;
  v14 = objc_msgSend(v13, "startMonitoringEventType:error:", 2, &v36);
  v15 = v36;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __33___DKWiFiConnectionMonitor_start__block_invoke_cold_2((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  v23 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  v35 = v15;
  v24 = objc_msgSend(v23, "startMonitoringEventType:error:", 30, &v35);
  v25 = v35;

  if ((v24 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      __33___DKWiFiConnectionMonitor_start__block_invoke_cold_1((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);

  }
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_219056000, v33, OS_LOG_TYPE_DEFAULT, "WiFi Connection Monitor started", v34, 2u);
  }

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __33___DKWiFiConnectionMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33___DKWiFiConnectionMonitor_start__block_invoke_3;
    block[3] = &unk_24DA66D60;
    block[4] = v4;
    v8 = v6;
    dispatch_sync(v5, block);

  }
}

uint64_t __33___DKWiFiConnectionMonitor_start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWiFiEvent:", *(_QWORD *)(a1 + 40));
}

uint64_t __67___DKWiFiConnectionMonitor__handleKnownNetworkProfileChangedEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

void __32___DKWiFiConnectionMonitor_stop__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "invalidate");
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_219056000, v1, OS_LOG_TYPE_DEFAULT, "WiFi Connection Monitor stopped", v2, 2u);
  }

}

void __33___DKWiFiConnectionMonitor_start__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219056000, a2, a3, "Failed to register for known network changes with error %@", a5, a6, a7, a8, 2u);
}

void __33___DKWiFiConnectionMonitor_start__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219056000, a2, a3, "Failed to register for SSID changes with error %@", a5, a6, a7, a8, 2u);
}

@end
