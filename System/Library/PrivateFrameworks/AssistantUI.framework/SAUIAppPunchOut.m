@implementation SAUIAppPunchOut

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(MEMORY[0x24BE081E0], "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerBagKeySet:forProfile:profileVersion:", v3, v4, v5);

  v6 = (void *)MEMORY[0x24BE08050];
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE081E0], "bagSubProfileVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bagForProfile:profileVersion:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BE081E0]);
  v11 = (void *)objc_msgSend(v10, "initWithBag:caller:keyProfile:", v9, *(_QWORD *)(a1 + 32), *MEMORY[0x24BE07E40]);
  v18[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performLookupWithBundleIdentifiers:itemIdentifiers:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 40));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2;
  v14[3] = &unk_24D7A3038;
  objc_copyWeak(&v16, &location);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v13, "addFinishBlock:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD block[4];
  id v41;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v5, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v10 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_3((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      if (v9)
      {
        objc_msgSend(WeakRetained, "appDisplayName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          objc_msgSend(v9, "displayName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setAppDisplayName:", v28);

        }
        objc_msgSend(WeakRetained, "appStoreUri");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          objc_msgSend(v9, "productPageURL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setAppStoreUri:", v30);

        }
        objc_msgSend(WeakRetained, "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v9, CFSTR("AFUIStoreServicesData"));

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_50;
        block[3] = &unk_24D7A1BA8;
        v41 = *(id *)(a1 + 32);
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        goto LABEL_17;
      }
      v32 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_2(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);
LABEL_17:

    goto LABEL_18;
  }
  v18 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
  v26 = *(_QWORD *)(a1 + 32);
  if (v26)
    (*(void (**)(uint64_t, _QWORD))(v26 + 16))(v26, 0);
LABEL_18:

}

uint64_t __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_50(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __82__SAUIAppPunchOut_AssistantUIAdditions__afui_getInstallAppPunchoutWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_afui_installAppPunchout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s Discarding AMS Lookup Result due to block deallocation.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_217514000, a1, a3, "%s Error performing AMS Lookup - item not found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_217514000, a2, a3, "%s Error performing AMS Lookup: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
