@implementation KSCloudKitManager

void __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[_KSCloudKitManager queryAccountStatusWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  >>> checking account status", buf, 0xCu);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_69;
  v4[3] = &unk_24E204B90;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_checkAccountStatusWithCompletionHandler:withRetryCount:", v4, 0);

}

void __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((*(_QWORD *)(a1 + 48) | 4) == 4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[_KSCloudKitManager queryAccountStatusWithCompletionHandler:]_block_invoke_2";
      _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  >>> account is set up", buf, 0xCu);
    }

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_70;
    v6[3] = &unk_24E204B40;
    v3 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 48);
    v8 = v4;
    v9 = v5;
    v10 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v7, "shouldDetectAccountChangeWithResponse:", v6);

  }
}

void __47___KSCloudKitManager_userIdentityWithResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___KSCloudKitManager_userIdentityWithResponse___block_invoke_2;
  block[3] = &unk_24E204A00;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  int64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB8EA8])
    || objc_msgSend(v6, "code") != 3 && objc_msgSend(v6, "code") != 4 && objc_msgSend(v6, "code") != 9)
  {

    goto LABEL_9;
  }
  v8 = a1[6];

  if (v8 > 1)
  {
LABEL_9:
    v17 = (void *)a1[5];
    v18 = *(NSObject **)(a1[4] + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_76;
    block[3] = &unk_24E204C58;
    v29 = v17;
    v28 = v5;
    dispatch_async(v18, block);

    v19 = v29;
    goto LABEL_14;
  }
  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDB8EB8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    v16 = (uint64_t)(v15 * 1000000000.0);
  }
  else
  {
    v16 = 60000000000;
  }
  v20 = dispatch_time(0, v16);
  v21 = a1[4];
  v22 = (void *)a1[5];
  v23 = *(NSObject **)(v21 + 8);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_2;
  v30[3] = &unk_24E204C30;
  v30[4] = v21;
  v24 = v22;
  v25 = a1[6];
  v31 = v24;
  v32 = v25;
  dispatch_after(v20, v23, v30);
  KSCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_cold_1();

  v19 = v31;
LABEL_14:

}

void __44___KSCloudKitManager_setupAccountDidChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("KSCloudKitAccountDidChangeStatusKey");
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("KSCloudKitAccountDidChangeAccountChangedKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("KSCloudKitAccountDidChangeUserChangedKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v12[3] = CFSTR("KSCloudKitAccountDidChangeDeviceToDeviceKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 50));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  v12[4] = CFSTR("KSCloudKitAccountDidSuccessfullyCreateZone");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("KSCloudKitAccountDidChange"), v5, v11);

}

void __60___KSCloudKitManager_shouldDetectAccountChangeWithResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  if (objc_msgSend(a3, "code") == 9)
  {
    v5 = 0;
    goto LABEL_13;
  }
  v6 = (unint64_t)v19;
  v7 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithSuiteName:", v8);

  objc_msgSend(*(id *)(a1 + 32), "lastKnownUserKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "stringForKey:", CFSTR("KSLastKnownUserID"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = (unint64_t)v13;

  if (v6 | v14)
  {
    if (v6 || !v14)
    {
      v5 = objc_msgSend((id)v14, "isEqualToString:", v6) ^ 1;
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "lastKnownUserKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v6, v18);

        goto LABEL_12;
      }
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastKnownUserKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v15);

  objc_msgSend(v9, "removeObjectForKey:", CFSTR("KSLastKnownUserID"));
LABEL_12:

LABEL_13:
  v16 = v19;
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
  {
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, v5);
    v16 = v19;
  }

}

void __47___KSCloudKitManager_userIdentityWithResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "recordName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

void __44___KSCloudKitManager_setupAccountDidChange___block_invoke_2(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[6];
  char v13;
  char v14;
  char v15;

  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke_3;
  v12[3] = &unk_24E204A50;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = a2;
  v13 = *(_BYTE *)(a1 + 40);
  v14 = a4;
  v15 = a3;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207A8D04](v12);
  if (a2 == 1 && ((a3 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "needsDeviceToDevice") & 1) == 0))
  {
    v9 = *(void **)(a1 + 32);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke_4;
    v10[3] = &unk_24E204A78;
    v10[4] = v9;
    v11 = v8;
    objc_msgSend(v9, "setupRecordZoneWithCompletionHandler:ignoreDefaults:", v10, 0);

  }
  else
  {
    v8[2](v8, 0);
  }

}

uint64_t __44___KSCloudKitManager_setupAccountDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44___KSCloudKitManager_setupAccountDidChange___block_invoke_2;
  v3[3] = &unk_24E204AA0;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "queryAccountStatusWithCompletionHandler:", v3);
}

void __40___KSCloudKitManager_isAccountAvailable__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40___KSCloudKitManager_isAccountAvailable__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40___KSCloudKitManager_isAccountAvailable__block_invoke_2;
  v4[3] = &unk_24E204BE0;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_checkAccountStatusWithCompletionHandler:withRetryCount:", v4, 0);

}

uint64_t __44___KSCloudKitManager_setupAccountDidChange___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    KSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[_KSCloudKitManager setupAccountDidChange:]_block_invoke_4";
      _os_log_impl(&dword_21DFEB000, v3, OS_LOG_TYPE_INFO, "%s  Failed to set up record zone", (uint8_t *)&v5, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setupSubscription");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __45___KSCloudKitManager_accountStatusDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, _QWORD);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "setupAccountDidChange:", 1);
  v3[2](v3, 0);

}

void __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_69(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  char v11;

  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_24E204B68;
  v8[1] = 3221225472;
  v10 = a2;
  v7 = v5;
  v11 = a3;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  dispatch_async(v6, v8);

}

uint64_t __62___KSCloudKitManager_queryAccountStatusWithCompletionHandler___block_invoke_70(uint64_t a1, int a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    KSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[_KSCloudKitManager queryAccountStatusWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v3, OS_LOG_TYPE_INFO, "%s  >>> user logged in has changed", (uint8_t *)&v10, 0xCu);
    }

    v4 = objc_alloc(MEMORY[0x24BDBCF50]);
    +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithSuiteName:", v5);

    objc_msgSend(*(id *)(a1 + 32), "recordZoneKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    objc_msgSend(*(id *)(a1 + 32), "subscriptionKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v8);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkAccountStatusWithCompletionHandler:withRetryCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) + 1);
}

uint64_t __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "accountStatus"), objc_msgSend(*(id *)(a1 + 32), "supportsDeviceToDeviceEncryption"));
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    if (!v5)
    {
      objc_msgSend(a2, "zoneID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "zoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "recordZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "zoneName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqualToString:", v11);

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "recordZoneKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBool:forKey:", 1, v14);

      }
    }
  }
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(NSObject **)(v15 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2;
  block[3] = &unk_24E204CA8;
  block[4] = v15;
  v17 = *(id *)(a1 + 48);
  v20 = v6;
  v21 = v17;
  v18 = v6;
  dispatch_async(v16, block);

}

uint64_t __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRecordZoneOperationInProgress:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "recordZoneOperationInProgress") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRecordZoneOperationInProgress:", 1);
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[_KSCloudKitManager setupRecordZoneWithCompletionHandler:ignoreDefaults:]_block_invoke_3";
      _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  >>> creating record zone", buf, 0xCu);
    }

    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "recordZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_79;
    v7[3] = &unk_24E204D20;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v3, "_ckFetchRecordZoneWithID:completionHandler:", v5, v7);

  }
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

  if (v8)
  {
    v9 = objc_msgSend(v6, "code");
    switch(v9)
    {
      case 26:
        goto LABEL_5;
      case 112:
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(NSObject **)(v14 + 8);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_81;
        v16[3] = &unk_24E204BB8;
        v16[4] = v14;
        v17 = *(id *)(a1 + 48);
        dispatch_async(v15, v16);
        v13 = v17;
        goto LABEL_8;
      case 28:
LABEL_5:
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v10, "recordZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_80;
        v18[3] = &unk_24E204CF8;
        v12 = *(void **)(a1 + 40);
        v18[4] = *(_QWORD *)(a1 + 32);
        v19 = v12;
        objc_msgSend(v10, "_ckSaveRecordZone:completionHandler:", v11, v18);

        v13 = v19;
LABEL_8:

        goto LABEL_9;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_9:

}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    KSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_80_cold_1(a1, v6, v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_81(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRecordZoneOperationInProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "resetZoneWithDelete:withCompletionHandler:", 2, *(_QWORD *)(a1 + 40));
}

void __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "recordZoneOperationInProgress") & 1) != 0)
    return;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 2)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "recordZoneKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v6 = 1;
  }
  else
  {
    if (v2)
      goto LABEL_7;
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "recordZoneKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = 0;
  }
  objc_msgSend(v5, "setBool:forKey:", v6, v4);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "recordZoneKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "BOOLForKey:", v9);

  v10 = *(void **)(a1 + 32);
  if ((_DWORD)v8)
  {
    objc_msgSend(v10, "setRecordZoneOperationInProgress:", 1);
    KSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[_KSCloudKitManager resetZoneWithDelete:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v11, OS_LOG_TYPE_INFO, "%s  >>> deleting record zone", buf, 0xCu);
    }

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "recordZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "zoneID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[2] = __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke_82;
    v17[3] = &unk_24E204D70;
    v16 = *(void **)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v17[4] = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v17[1] = 3221225472;
    v19 = v16;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v12, "_ckDeleteRecordZoneWithID:completionHandler:", v14, v17);

  }
  else
  {
    objc_msgSend(v10, "setupRecordZoneWithCompletionHandler:ignoreDefaults:", *(_QWORD *)(a1 + 48), 0);
  }
}

void __64___KSCloudKitManager_resetZoneWithDelete_withCompletionHandler___block_invoke_82(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRecordZoneOperationInProgress:", 0);
  if (!v8)
    goto LABEL_6;
  if (*(_QWORD *)(a1 + 56) == 2)
  {
    objc_msgSend(v8, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB8EA8]) & 1) != 0)
    {
      v5 = objc_msgSend(v8, "code");

      if (v5 == 26)
      {

LABEL_6:
        v6 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "recordZoneKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBool:forKey:", 0, v7);

        objc_msgSend(*(id *)(a1 + 32), "setupRecordZoneWithCompletionHandler:ignoreDefaults:", *(_QWORD *)(a1 + 48), 0);
        return;
      }
    }
    else
    {

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __79___KSCloudKitManager_recordWithName_type_cloudData_attributes_encryptedFields___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "encryptedValuesByKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

uint64_t __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __69___KSCloudKitManager_recordWithName_type_attributes_encryptedFields___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "encryptedValuesByKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

void __39___KSCloudKitManager_setupSubscription__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "subscriptionOperationInProgress") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSubscriptionOperationInProgress:", 1);
    KSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[_KSCloudKitManager setupSubscription]_block_invoke";
      _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  Creating subscription", buf, 0xCu);
    }

    v3 = objc_alloc(MEMORY[0x24BDB9210]);
    objc_msgSend(*(id *)(a1 + 32), "recordZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithZoneID:subscriptionID:", v5, *(_QWORD *)(a1 + 40));

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setShouldBadge:", 0);
    objc_msgSend(v6, "setNotificationInfo:", v7);
    v8 = objc_alloc(MEMORY[0x24BDB9160]);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v9, 0);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __39___KSCloudKitManager_setupSubscription__block_invoke_94;
    v14[3] = &unk_24E204DE8;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v15 = v11;
    v16 = v12;
    v17 = v13;
    objc_msgSend(v10, "setModifySubscriptionsCompletionBlock:", v14);
    objc_msgSend(*(id *)(a1 + 32), "addOperation:", v10);

  }
}

void __39___KSCloudKitManager_setupSubscription__block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];

  if (a4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(a4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error, failed to create subscription: %@, with error: %@"), v5, v6);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "subscriptionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBool:forKey:", 1, v6);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39___KSCloudKitManager_setupSubscription__block_invoke_2;
  block[3] = &unk_24E204790;
  block[4] = v8;
  dispatch_async(v9, block);
}

uint64_t __39___KSCloudKitManager_setupSubscription__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSubscriptionOperationInProgress:", 0);
}

uint64_t __83___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), 0);
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

    if (v9)
    {
      if (objc_msgSend(v7, "code") == 14)
      {
        objc_msgSend(v7, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x24BDB8F00];
        v24[0] = *MEMORY[0x24BDB8F10];
        v24[1] = v11;
        v24[2] = *MEMORY[0x24BDB8F08];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dictionaryWithValuesForKeys:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
      }
      else if (objc_msgSend(v7, "code") == 3
             || objc_msgSend(v7, "code") == 4
             || objc_msgSend(v7, "code") == 6
             || objc_msgSend(v7, "code") == 23
             || objc_msgSend(v7, "code") == 6)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      }
      else
      {
        KSCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "recordID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "recordName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localizedDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 136315650;
          v19 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]_block_invoke";
          v20 = 2112;
          v21 = v16;
          v22 = 2112;
          v23 = v17;
          _os_log_impl(&dword_21DFEB000, v14, OS_LOG_TYPE_INFO, "%s  >>> Could not save recordName=%@; error=%@",
            (uint8_t *)&v18,
            0x20u);

        }
      }
    }
  }

}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_102(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  int64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  dispatch_time_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD block[5];
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[5];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  KSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v85 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]_block_invoke";
    v86 = 2112;
    v87 = v9;
    v88 = 2112;
    v89 = v10;
    _os_log_impl(&dword_21DFEB000, v8, OS_LOG_TYPE_INFO, "%s  >>> modify operation completed with rrorCode: %@ description: %@", buf, 0x20u);

  }
  if (objc_msgSend(v7, "code") == 2)
  {
    KSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EE8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v85 = "-[_KSCloudKitManager updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:]_block_invoke";
      v86 = 2112;
      v87 = v13;
      _os_log_impl(&dword_21DFEB000, v11, OS_LOG_TYPE_INFO, "%s  >>> partial failure : %@", buf, 0x16u);

    }
  }
  if (objc_msgSend(v7, "code") == 28)
  {
    v14 = *(void **)(a1 + 32);
    v83[0] = MEMORY[0x24BDAC760];
    v83[1] = 3221225472;
    v83[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_103;
    v83[3] = &unk_24E204E88;
    v83[4] = v14;
    objc_msgSend(v14, "resetZoneWithDelete:withCompletionHandler:", 0, v83);
  }
  objc_msgSend(v7, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDB8EA8];
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDB8EA8]))
  {
    if (objc_msgSend(v7, "code") == 3 || objc_msgSend(v7, "code") == 6 || objc_msgSend(v7, "code") == 23)
    {

LABEL_14:
      KSCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_102_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

      objc_msgSend(v7, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x24BDB8EB8];
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EB8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v7, "userInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v31 = v30;

        v32 = (uint64_t)(v31 * 1000000000.0);
      }
      else
      {
        v32 = 60000000000;
      }
      v53 = dispatch_time(0, v32);
      v54 = *(_QWORD *)(a1 + 32);
      v55 = *(void **)(a1 + 40);
      v56 = *(NSObject **)(v54 + 8);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_104;
      block[3] = &unk_24E204EB0;
      block[4] = v54;
      v78 = v55;
      v57 = v6;
      v59 = *(void **)(a1 + 64);
      v58 = *(_QWORD *)(a1 + 72);
      v79 = v57;
      v81 = v58;
      v60 = v59;
      v61 = *(_QWORD *)(a1 + 80);
      v80 = v60;
      v82 = v61;
      dispatch_after(v53, v56, block);

      v49 = v78;
      goto LABEL_31;
    }
    v63 = objc_msgSend(v7, "code");

    if (v63 == 7)
      goto LABEL_14;
  }
  else
  {

  }
  objc_msgSend(v7, "domain");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "isEqualToString:", v16))
  {
    v34 = objc_msgSend(v7, "code");

    if (v34 == 26)
    {
      KSCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_102_cold_2(v35, v36, v37, v38, v39, v40, v41, v42);

      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_105;
      v68[3] = &unk_24E204ED8;
      v43 = *(void **)(a1 + 40);
      v69 = *(id *)(a1 + 32);
      v70 = v43;
      v44 = v6;
      v46 = *(void **)(a1 + 64);
      v45 = *(_QWORD *)(a1 + 72);
      v71 = v44;
      v75 = v45;
      v47 = v46;
      v48 = *(_QWORD *)(a1 + 80);
      v74 = v47;
      v76 = v48;
      v72 = *(id *)(a1 + 48);
      v73 = v7;
      objc_msgSend(v69, "setupRecordZoneWithCompletionHandler:ignoreDefaults:", v68, 1);

      v49 = v70;
      goto LABEL_31;
    }
  }
  else
  {

  }
  v50 = objc_msgSend(*(id *)(a1 + 56), "count");
  v51 = *(_QWORD **)(a1 + 32);
  if (!v50)
  {
    v62 = v51[1];
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_3;
    v64[3] = &unk_24E204A00;
    v67 = *(id *)(a1 + 64);
    v65 = *(id *)(a1 + 48);
    v66 = v7;
    dispatch_async(v62, v64);

    v49 = v67;
LABEL_31:

    goto LABEL_34;
  }
  objc_msgSend(v51, "resolveConflicts:", *(_QWORD *)(a1 + 56));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "count"))
    objc_msgSend(*(id *)(a1 + 32), "updateRecords:deleteRecordIDs:withPriority:completionHandler:", v52, 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_34:
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_103(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidDeleteRecordZone:", v4);

}

uint64_t __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1);
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB8EA8]),
        v5,
        (v6 & 1) != 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(v7 + 8);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_2;
    v15[3] = &unk_24E204EB0;
    v15[4] = v7;
    v16 = v8;
    v10 = *(id *)(a1 + 48);
    v12 = *(void **)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 80);
    v17 = v10;
    v19 = v11;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 88);
    v18 = v13;
    v20 = v14;
    dispatch_async(v9, v15);

  }
}

uint64_t __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRecords:deleteRecordIDs:withPriority:completionHandler:retryCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1);
}

uint64_t __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

uint64_t __88___KSCloudKitManager_fetchRecordsWithPriority_changeToken_completionHandler_retryCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitFetchRecordsOperation:withPriority:changeToken:completionHandler:retryCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "recordName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *);
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      KSCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        v32 = "-[_KSCloudKitManager _submitFetchRecordsOperation:withPriority:changeToken:completionHandler:retryCount:]_block_invoke_3";
        v33 = 2112;
        v34 = v15;
        _os_log_impl(&dword_21DFEB000, v14, OS_LOG_TYPE_INFO, "%s  server change token updated: %@", buf, 0x16u);
      }

      v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      v17 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_112;
      v26 = &unk_24E204F78;
      v19 = *(id *)(a1 + 56);
      v27 = v16;
      v28 = v17;
      v20 = *(_QWORD *)(a1 + 64);
      v29 = v19;
      v30 = v20;
      v21 = v17;
      v22 = v16;
      dispatch_async(v18, &v23);
      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects", v23, v24, v25, v26);
      objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");

    }
  }

}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_112(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), 0, 1, 1);
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5, void *a6)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  dispatch_time_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  dispatch_time_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  NSObject *v64;
  id v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  char v74;
  BOOL v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  char v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  char v87;
  _QWORD v88[4];
  id v89;
  id v90;
  uint64_t v91;
  id v92;
  int8x16_t v93;
  char v94;
  _QWORD v95[5];
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD block[5];
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[5];
  uint8_t buf[4];
  const char *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  objc_msgSend(a2, "zoneName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "zoneName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "isEqualToString:", v15);

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    if (v11)
    {
      objc_msgSend(v11, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)*MEMORY[0x24BDB8EA8])
      {
        v21 = *(_QWORD *)(a1 + 72);

        if (v21 <= 1)
        {
          if (objc_msgSend(v11, "code") == 28)
          {
            v22 = *(void **)(a1 + 32);
            v103[0] = MEMORY[0x24BDAC760];
            v103[1] = 3221225472;
            v103[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_115;
            v103[3] = &unk_24E204E88;
            v103[4] = v22;
            objc_msgSend(v22, "resetZoneWithDelete:withCompletionHandler:", 0, v103);
          }
          KSCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114_cold_3(v11, v23);

          if (objc_msgSend(v11, "code") == 9)
          {
            objc_msgSend(v11, "userInfo");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EB8]);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v27 = fmin(v26, 60.0);

            v28 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
            v29 = *(_QWORD *)(a1 + 32);
            v30 = *(NSObject **)(v29 + 8);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_116;
            block[3] = &unk_24E204FF0;
            v31 = *(_QWORD *)(a1 + 80);
            block[4] = v29;
            v101 = v31;
            v67 = *(_OWORD *)(a1 + 56);
            v32 = (id)v67;
            v100 = v67;
            v102 = *(_QWORD *)(a1 + 72);
            dispatch_after(v28, v30, block);
            v33 = (void *)v100;
          }
          else if (objc_msgSend(v11, "code") == 3
                 || objc_msgSend(v11, "code") == 6
                 || objc_msgSend(v11, "code") == 23
                 || objc_msgSend(v11, "code") == 7)
          {
            objc_msgSend(v11, "userInfo");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EB8]);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            v41 = v40;

            v42 = dispatch_time(0, (uint64_t)(v41 * 1000000000.0));
            v43 = *(_QWORD *)(a1 + 32);
            v44 = *(NSObject **)(v43 + 8);
            v95[0] = MEMORY[0x24BDAC760];
            v95[1] = 3221225472;
            v95[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_118;
            v95[3] = &unk_24E204FF0;
            v45 = *(_QWORD *)(a1 + 80);
            v95[4] = v43;
            v97 = v45;
            v68 = *(_OWORD *)(a1 + 56);
            v46 = (id)v68;
            v96 = v68;
            v98 = *(_QWORD *)(a1 + 72);
            dispatch_after(v42, v44, v95);
            v33 = (void *)v96;
          }
          else if (objc_msgSend(v11, "code") == 21)
          {
            KSCategory();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v105 = "-[_KSCloudKitManager _submitFetchRecordsOperation:withPriority:changeToken:completionHandler:retryC"
                     "ount:]_block_invoke_4";
              _os_log_impl(&dword_21DFEB000, v47, OS_LOG_TYPE_INFO, "%s  CloudKit said our change token has expired!", buf, 0xCu);
            }

            v48 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
            v88[0] = MEMORY[0x24BDAC760];
            v88[1] = 3221225472;
            v88[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_120;
            v88[3] = &unk_24E205018;
            v92 = *(id *)(a1 + 56);
            v89 = *(id *)(a1 + 40);
            v49 = *(id *)(a1 + 48);
            v94 = a5;
            v50 = *(_QWORD *)(a1 + 32);
            v90 = v49;
            v91 = v50;
            v93 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
            dispatch_async(v48, v88);

            v33 = v92;
          }
          else
          {
            v51 = objc_msgSend(v11, "code");
            KSCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
            if (v51 == 26)
            {
              if (v53)
                __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114_cold_1(v52, v54, v55, v56, v57, v58, v59, v60);

              v61 = *(void **)(a1 + 32);
              v82[0] = MEMORY[0x24BDAC760];
              v82[1] = 3221225472;
              v82[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_121;
              v82[3] = &unk_24E205040;
              v85 = *(id *)(a1 + 56);
              v83 = *(id *)(a1 + 40);
              v62 = *(id *)(a1 + 48);
              v63 = *(_QWORD *)(a1 + 64);
              v84 = v62;
              v86 = v63;
              v87 = a5;
              objc_msgSend(v61, "setupRecordZoneWithCompletionHandler:ignoreDefaults:", v82, 1);

              v33 = v85;
            }
            else
            {
              if (v53)
                __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114_cold_2(v11, v52);

              v64 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
              v76[0] = MEMORY[0x24BDAC760];
              v76[1] = 3221225472;
              v76[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_122;
              v76[3] = &unk_24E205068;
              v79 = *(id *)(a1 + 56);
              v77 = *(id *)(a1 + 40);
              v65 = *(id *)(a1 + 48);
              v66 = *(_QWORD *)(a1 + 64);
              v78 = v65;
              v80 = v66;
              v81 = a5;
              dispatch_async(v64, v76);

              v33 = v79;
            }
          }
          goto LABEL_13;
        }
      }
      else
      {

      }
    }
    v34 = *(void **)(a1 + 40);
    v35 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_123;
    v69[3] = &unk_24E205090;
    v70 = v34;
    v71 = *(id *)(a1 + 48);
    v36 = *(id *)(a1 + 56);
    v37 = *(_QWORD *)(a1 + 64);
    v72 = v36;
    v73 = v37;
    v74 = a5;
    v75 = v11 == 0;
    dispatch_async(v35, v69);

    v33 = v70;
LABEL_13:

  }
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_115(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidDeleteRecordZone:", v4);

}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_116(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_117;
  v6[3] = &unk_24E204FC8;
  v3 = *(_QWORD *)(a1 + 56);
  v6[4] = v2;
  v8 = v3;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  v9 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "queryAccountStatusWithCompletionHandler:", v6);

}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_117(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "fetchRecordsWithPriority:changeToken:completionHandler:retryCount:", *(_QWORD *)(result + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40), *(_QWORD *)(result + 40), *(_QWORD *)(result + 64) + 1);
  return result;
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_3_118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchRecordsWithPriority:changeToken:completionHandler:retryCount:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1);
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_120(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return objc_msgSend(*(id *)(a1 + 48), "fetchRecordsWithPriority:changeToken:completionHandler:retryCount:", *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1);
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 64), 0, 0);
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 64), 0, 0);
}

uint64_t __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_123(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315650;
    v7 = "-[_KSCloudKitManager _submitFetchRecordsOperation:withPriority:changeToken:completionHandler:retryCount:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  Completed fetching # records : %@, deleted records: %@", (uint8_t *)&v6, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7));

        v4 = (void *)v8;
        objc_msgSend(v2, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB90E8]), "initWithRecordIDs:", v2);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_126;
  v12[3] = &unk_24E2050E0;
  v11 = *(_QWORD *)(a1 + 40);
  v10 = (id *)(a1 + 40);
  v12[4] = v11;
  v13 = v10[1];
  objc_msgSend(v9, "setFetchRecordsCompletionBlock:", v12);
  objc_msgSend(*v10, "addOperation:", v9);

}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_2;
  block[3] = &unk_24E204A00;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

void __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x24BDB90E0]);
  v12[0] = a1[4];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithRecordZoneIDs:", v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke_2;
  v8[3] = &unk_24E205130;
  v10 = a1[6];
  v9 = a1[4];
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "setFetchRecordZonesCompletionBlock:", v8);
  objc_msgSend(a1[5], "_inconvenientOperation:", v6);

}

void __65___KSCloudKitManager__ckFetchRecordZoneWithID_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a1[5];
  if (v5)
  {
    v7 = a1[4];
    v8 = a3;
    objc_msgSend(a2, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB91A8], "itemErrorFromError:forID:", v8, a1[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v9, v10);
  }
  v11 = a1[6];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);

}

void __58___KSCloudKitManager__ckSaveRecordZone_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v7 = a4;
    objc_msgSend(a2, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDB91A8];
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemErrorFromError:forID:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v11, v10);
  }
}

void __66___KSCloudKitManager__ckDeleteRecordZoneWithID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v7 = a4;
    objc_msgSend(a3, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB91A8], "itemErrorFromError:forID:", v7, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v9, v8);
  }
}

void __78___KSCloudKitManager__checkAccountStatusWithCompletionHandler_withRetryCount___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21DFEB000, v0, v1, "%s  Error in getting account status: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void __74___KSCloudKitManager_setupRecordZoneWithCompletionHandler_ignoreDefaults___block_invoke_2_80_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "recordZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = "-[_KSCloudKitManager setupRecordZoneWithCompletionHandler:ignoreDefaults:]_block_invoke_2";
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_21DFEB000, a3, OS_LOG_TYPE_ERROR, "%s  !!!ERROR: Could not save Record Zone %@: %@", (uint8_t *)&v9, 0x20u);

}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_102_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  >>> ERROR reaching the network", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __94___KSCloudKitManager_updateRecords_deleteRecordIDs_withPriority_completionHandler_retryCount___block_invoke_102_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  >>> Record zone not found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21DFEB000, a1, a3, "%s  >>> Record zone not found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21DFEB000, a2, v4, "%s  Could not fetch record changes: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_8();
}

void __105___KSCloudKitManager__submitFetchRecordsOperation_withPriority_changeToken_completionHandler_retryCount___block_invoke_2_114_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21DFEB000, a2, v4, "%s  >>> ERROR for fetch records operation: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_8();
}

void __68___KSCloudKitManager_fetchPublicRecordsWithNames_completionHandler___block_invoke_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[_KSCloudKitManager fetchPublicRecordsWithNames:completionHandler:]_block_invoke";
  _os_log_error_impl(&dword_21DFEB000, log, OS_LOG_TYPE_ERROR, "%s  Couldn't create recordID", buf, 0xCu);
}

@end
