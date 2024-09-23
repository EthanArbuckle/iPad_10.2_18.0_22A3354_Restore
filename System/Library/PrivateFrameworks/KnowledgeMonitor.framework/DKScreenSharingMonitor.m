@implementation DKScreenSharingMonitor

void __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "outputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = objc_msgSend(*(id *)(a1 + 32), "currentMirroringDeviceCount");
  objc_msgSend(MEMORY[0x24BE1AFC8], "contextChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 == v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke_cold_1(v4, v7);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "currentMirroringDeviceCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_219056000, v7, OS_LOG_TYPE_INFO, "Change in Mirroring devices count: %@ to %@", (uint8_t *)&v12, 0x16u);

    }
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE0CCF8]), "initWithIsStart:", v4 != 0);
    objc_msgSend(*(id *)(a1 + 32), "screenSharingStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:", v7);

    objc_msgSend(*(id *)(a1 + 32), "setCurrentMirroringDeviceCount:", v4);
  }

}

void __46___DKScreenSharingMonitor_mirroringDidChange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "No change in mirroring devices count: %@", (uint8_t *)&v4, 0xCu);

}

@end
