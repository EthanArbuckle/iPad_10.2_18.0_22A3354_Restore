@implementation NSMutableURLRequest

void __112__NSMutableURLRequest_AccountHeaders__ndo_setDeviceListRequestBodyWithSerialNumber_localDevices_primaryAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10[0] = CFSTR("serialNumber");
  objc_msgSend(v3, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("modelInfo");
  objc_msgSend(v3, "productID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("deviceName");
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "colorCode"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v3, "colorCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("color"));

    v7 = v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  if (a2)
  {
    _NDOLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke_cold_1((uint64_t)v5, a2, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "credentialForAccount:serviceID:", *(_QWORD *)(a1 + 40), CFSTR("com.apple.gs.supportapp.auth"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "token");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __75__NSMutableURLRequest_AccountHeaders__addBAAAuthenticationHeadersWithBody___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  if (v4)
  {
    _NDOLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75__NSMutableURLRequest_AccountHeaders__addBAAAuthenticationHeadersWithBody___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

void __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_22D064000, log, OS_LOG_TYPE_ERROR, "No way to sign request with GS token because renewal of GS credential failed: %ld, %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __75__NSMutableURLRequest_AccountHeaders__addBAAAuthenticationHeadersWithBody___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D064000, a2, a3, "Device authentication failed while generating certificate with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
