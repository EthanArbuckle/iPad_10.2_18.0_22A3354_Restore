@implementation NDOManager

- (NDOManager)init
{
  NDOManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workingQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NDOManager;
  v2 = -[NDOManager init](&v7, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.newdeviceoutreach.ndoagent.devicelist", v3);
  workingQueue = v2->workingQueue;
  v2->workingQueue = (OS_dispatch_queue *)v4;

  return v2;
}

- (void)appleAccountAddedWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__NDOManager_appleAccountAddedWithReply___block_invoke;
  v15[3] = &unk_24F81D588;
  v7 = v5;
  v16 = v7;
  v8 = v4;
  v17 = v8;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __41__NDOManager_appleAccountAddedWithReply___block_invoke_2;
  v12[3] = &unk_24F81D5B0;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "appleAccountAddedWithReply:", v12);

}

void __41__NDOManager_appleAccountAddedWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __41__NDOManager_appleAccountAddedWithReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __41__NDOManager_appleAccountAddedWithReply___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)scheduleOutreachAfter:(double)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  -[NDOManager agentConnection](self, "agentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke;
  v17[3] = &unk_24F81D588;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_4;
  v14[3] = &unk_24F81D5B0;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "scheduleOutreachAfter:withReply:", v14, a3);

}

void __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_4(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "Result %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getWarrantyUsingPolicy:(unint64_t)a3 withReply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__NDOManager_getWarrantyUsingPolicy_withReply___block_invoke;
  v8[3] = &unk_24F81D5D8;
  v9 = v6;
  v7 = v6;
  -[NDOManager getDefaultDeviceInfoUsingPolicy:withReply:](self, "getDefaultDeviceInfoUsingPolicy:withReply:", a3, v8);

}

void __47__NDOManager_getWarrantyUsingPolicy_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "warranty");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (BOOL)checkIsAvailableInStore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__NDOManager_checkIsAvailableInStore___block_invoke;
  v11[3] = &unk_24F81D600;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __38__NDOManager_checkIsAvailableInStore___block_invoke_6;
  v10[3] = &unk_24F81D628;
  v10[4] = &v13;
  objc_msgSend(v8, "checkIsAvailableInStore:withReply:", v4, v10);

  LOBYTE(v8) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)v8;
}

void __38__NDOManager_checkIsAvailableInStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __38__NDOManager_checkIsAvailableInStore___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppAvailabilityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 == 0;

  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_22D064000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)appSupportDictionaryWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v19 = CFSTR("AppAvailabilityType");
  v20[0] = &unk_24F824740;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__NDOManager_appSupportDictionaryWithReply___block_invoke;
  v13[3] = &unk_24F81D650;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  v16 = v17;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __44__NDOManager_appSupportDictionaryWithReply___block_invoke_10;
  v11[3] = &unk_24F81D678;
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "appSupportAvailability:withReply:", CFSTR("com.apple.supportapp"), v11);

  _Block_object_dispose(v17, 8);
}

void __44__NDOManager_appSupportDictionaryWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __44__NDOManager_appSupportDictionaryWithReply___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)webURLOverride:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __29__NDOManager_webURLOverride___block_invoke;
  v12[3] = &unk_24F81D600;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __29__NDOManager_webURLOverride___block_invoke_11;
  v10[3] = &unk_24F81D6A0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "readWebURLOverride:", v10);

}

void __29__NDOManager_webURLOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __29__NDOManager_webURLOverride___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "webURLOverride : %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)ulWebURLOverride:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __31__NDOManager_ulWebURLOverride___block_invoke;
  v12[3] = &unk_24F81D600;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __31__NDOManager_ulWebURLOverride___block_invoke_13;
  v10[3] = &unk_24F81D6A0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "readULWebURLOverride:", v10);

}

void __31__NDOManager_ulWebURLOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __31__NDOManager_ulWebURLOverride___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "ulWebURLOverride : %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)apsSupportedOverride:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __35__NDOManager_apsSupportedOverride___block_invoke;
  v12[3] = &unk_24F81D600;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __35__NDOManager_apsSupportedOverride___block_invoke_14;
  v10[3] = &unk_24F81D6A0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "readAPSSupportedOverride:", v10);

}

void __35__NDOManager_apsSupportedOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __35__NDOManager_apsSupportedOverride___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "apsSupportedOverride : %@", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)isAPSSupportedOverrideWithServerValue:(BOOL)a3
{
  CFPropertyListRef v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy_;
  v16[3] = __Block_byref_object_dispose_;
  v17 = 0;
  if (+[NDOUtilities isInternal](NDOUtilities, "isInternal"))
  {
    v5 = CFPreferencesCopyAppValue(CFSTR("isAPSSupported"), CFSTR("com.apple.NewDeviceOutreach"));
    v6 = *(void **)(v16[0] + 40);
    *(_QWORD *)(v16[0] + 40) = v5;

    if (!*(_QWORD *)(v16[0] + 40))
    {
      v7 = dispatch_semaphore_create(0);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __52__NDOManager_isAPSSupportedOverrideWithServerValue___block_invoke;
      v12[3] = &unk_24F81D6C8;
      v14 = &v15;
      v8 = v7;
      v13 = v8;
      -[NDOManager apsSupportedOverride:](self, "apsSupportedOverride:", v12);
      v9 = dispatch_time(0, 2000000000);
      dispatch_semaphore_wait(v8, v9);

    }
  }
  if (*(_QWORD *)(v16[0] + 40))
  {
    _NDOLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[NDOManager isAPSSupportedOverrideWithServerValue:].cold.1((uint64_t)v16, v10);

    a3 = objc_msgSend(*(id *)(v16[0] + 40), "isEqualToString:", CFSTR("1"));
  }
  _Block_object_dispose(&v15, 8);

  return a3;
}

void __52__NDOManager_isAPSSupportedOverrideWithServerValue___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)getDecodedParamsForPath:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[NDOManager agentConnection](self, "agentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke;
  v20[3] = &unk_24F81D588;
  v10 = v8;
  v21 = v10;
  v11 = v7;
  v22 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke_24;
  v16[3] = &unk_24F81D6F0;
  v17 = v6;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v6;
  objc_msgSend(v12, "getDecodedParamsForPath:withReply:", v15, v16);

}

void __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __48__NDOManager_getDecodedParamsForPath_withReply___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136446722;
    v7 = "-[NDOManager getDecodedParamsForPath:withReply:]_block_invoke";
    v8 = 2114;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:  %{public}@ : %{public}@", (uint8_t *)&v6, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)clientConfiguration
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NDOClientConfiguration *v6;
  NDOClientConfiguration *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[NDOManager agentConnection](self, "agentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__NDOManager_clientConfiguration__block_invoke;
  v10[3] = &unk_24F81D600;
  v4 = v2;
  v11 = v4;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __33__NDOManager_clientConfiguration__block_invoke_25;
  v9[3] = &unk_24F81D628;
  v9[4] = &v12;
  objc_msgSend(v5, "getClientConfigurationWithReply:", v9);

  v6 = [NDOClientConfiguration alloc];
  v7 = -[NDOClientConfiguration initWithConfigDictionary:](v6, "initWithConfigDictionary:", v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __33__NDOManager_clientConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __33__NDOManager_clientConfiguration__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __33__NDOManager_clientConfiguration__block_invoke_25(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)defaultDevice
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[NDOManager agentConnection](self, "agentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __27__NDOManager_defaultDevice__block_invoke;
  v11[3] = &unk_24F81D600;
  v4 = v2;
  v12 = v4;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __27__NDOManager_defaultDevice__block_invoke_27;
  v10[3] = &unk_24F81D718;
  v10[4] = &v13;
  objc_msgSend(v5, "defaultDevice:", v10);

  _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138477827;
    v20 = v7;
    _os_log_impl(&dword_22D064000, v6, OS_LOG_TYPE_DEFAULT, "default device: %{private}@", buf, 0xCu);
  }

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __27__NDOManager_defaultDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __27__NDOManager_defaultDevice__block_invoke_27(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)pairedWatches
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[NDOManager agentConnection](self, "agentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __27__NDOManager_pairedWatches__block_invoke;
  v11[3] = &unk_24F81D600;
  v4 = v2;
  v12 = v4;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __27__NDOManager_pairedWatches__block_invoke_29;
  v10[3] = &unk_24F81D740;
  v10[4] = &v13;
  objc_msgSend(v5, "pairedWatches:", v10);

  _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138477827;
    v20 = v7;
    _os_log_impl(&dword_22D064000, v6, OS_LOG_TYPE_DEFAULT, "paired watches : %{private}@", buf, 0xCu);
  }

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __27__NDOManager_pairedWatches__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __27__NDOManager_pairedWatches__block_invoke_29(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)pairedBTDevices
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[NDOManager agentConnection](self, "agentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __29__NDOManager_pairedBTDevices__block_invoke;
  v11[3] = &unk_24F81D600;
  v4 = v2;
  v12 = v4;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __29__NDOManager_pairedBTDevices__block_invoke_31;
  v10[3] = &unk_24F81D740;
  v10[4] = &v13;
  objc_msgSend(v5, "pairedBTDevices:", v10);

  _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v14[5];
    *(_DWORD *)buf = 138477827;
    v20 = v7;
    _os_log_impl(&dword_22D064000, v6, OS_LOG_TYPE_DEFAULT, "paired BTDevices : %{private}@", buf, 0xCu);
  }

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __29__NDOManager_pairedBTDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __29__NDOManager_pairedBTDevices__block_invoke_31(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getDefaultDeviceInfoUsingForceCachedPolicy
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[NDOManager agentConnection](self, "agentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke;
  v9[3] = &unk_24F81D600;
  v4 = v2;
  v10 = v4;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke_32;
  v8[3] = &unk_24F81D768;
  v8[4] = &v11;
  objc_msgSend(v5, "getDefaultDeviceInfoUsingPolicy:withReply:", 1, v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __56__NDOManager_getDefaultDeviceInfoUsingForceCachedPolicy__block_invoke_32(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getDefaultDeviceInfoUsingPolicy:(unint64_t)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  -[NDOManager agentConnection](self, "agentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke;
  v15[3] = &unk_24F81D588;
  v16 = v7;
  v9 = v6;
  v17 = v9;
  v10 = v7;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke_33;
  v13[3] = &unk_24F81D5D8;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "getDefaultDeviceInfoUsingPolicy:withReply:", a3, v13);

}

void __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __56__NDOManager_getDefaultDeviceInfoUsingPolicy_withReply___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getDeviceInfoUsingForceCachedPolicyForSerialNumber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke;
  v12[3] = &unk_24F81D600;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke_34;
  v11[3] = &unk_24F81D768;
  v11[4] = &v14;
  objc_msgSend(v8, "getDeviceInfoForSerialNumber:usingPolicy:withReply:", v4, 1, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __65__NDOManager_getDeviceInfoUsingForceCachedPolicyForSerialNumber___block_invoke_34(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 withReply:(id)a5
{
  -[NDOManager getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:](self, "getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:", a3, a4, 0, 0, 0, a5);
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke;
  v26[3] = &unk_24F81D588;
  v27 = v18;
  v20 = v14;
  v28 = v20;
  v21 = v18;
  objc_msgSend(v21, "remoteObjectProxyWithErrorHandler:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke_35;
  v24[3] = &unk_24F81D5D8;
  v25 = v20;
  v23 = v20;
  objc_msgSend(v22, "getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:", v17, a4, v16, v15, v8, v24);

}

void __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __103__NDOManager_getDeviceInfoForSerialNumber_usingPolicy_sessionID_params_andForcePostFollowup_withReply___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 completionBlock:(id)a5
{
  -[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoReply:completionBlock:](self, "getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoReply:completionBlock:", a3, a4, 0, 0, 0, 0, 0, a5);
}

- (id)payloadFrom:(id)a3 atIndex:(int64_t)a4 device:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[11];
  _QWORD v49[11];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "serialNumber");
  v10 = objc_claimAutoreleasedReturnValue();
  -[NDOManager defaultDevice](self, "defaultDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v10;
  v13 = objc_msgSend(v12, "isEqualToString:", v10);

  objc_msgSend(v8, "acOfferEligibleUntil");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v8, "acOfferEligibleUntil");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[NDOUtilities daysFromDate:](NDOUtilities, "daysFromDate:", v15);

  }
  else
  {
    v16 = 1;
  }
  _NDOLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[NDOManager defaultDevice](self, "defaultDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "serialNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acOfferEligibleUntil");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v51 = "-[NDOManager payloadFrom:atIndex:device:]";
    v52 = 2112;
    v53 = v19;
    v54 = 2112;
    v55 = v10;
    v56 = 2112;
    v57 = v20;
    _os_log_impl(&dword_22D064000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: sn: %@ sn2: %@ %@", buf, 0x2Au);

  }
  v49[0] = v10;
  v48[0] = CFSTR("serialNum");
  v48[1] = CFSTR("currentDevice");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v46;
  v48[2] = CFSTR("deviceSeq");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v45;
  v48[3] = CFSTR("deviceName");
  objc_msgSend(v9, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v21;
  v48[4] = CFSTR("deviceImageUrl");
  objc_msgSend(v9, "deviceImageUrl");
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v23 = v22;
  if (!v22)
  {
    objc_msgSend(v8, "deviceImageUrl");
    v24 = objc_claimAutoreleasedReturnValue();
    v43 = v24;
    if (v24)
      v23 = (const __CFString *)v24;
    else
      v23 = &stru_24F81DDD8;
  }
  v49[4] = v23;
  v48[5] = CFSTR("deviceDesc");
  objc_msgSend(v8, "deviceDesc", v43);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = &stru_24F81DDD8;
  v49[5] = v27;
  v48[6] = CFSTR("eligibilityRemainingInDays");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v28;
  v48[7] = CFSTR("sgId");
  objc_msgSend(v8, "sgId");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (const __CFString *)v29;
  else
    v31 = &stru_24F81DDD8;
  v49[7] = v31;
  v48[8] = CFSTR("pfcId");
  objc_msgSend(v8, "pfcId");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = (const __CFString *)v32;
  else
    v34 = &stru_24F81DDD8;
  v49[8] = v34;
  v48[9] = CFSTR("pgfId");
  objc_msgSend(v8, "pgfId");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = (const __CFString *)v35;
  else
    v37 = &stru_24F81DDD8;
  v49[9] = v37;
  v48[10] = CFSTR("parentId");
  objc_msgSend(v8, "parentId");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (v38)
    v40 = (const __CFString *)v38;
  else
    v40 = &stru_24F81DDD8;
  v49[10] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  return v41;
}

- (id)payloadDictionaryForDeviceInfo:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;

  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_14;
  objc_msgSend(v6, "warranty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acOfferDisplayDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "warranty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "acOfferEligible");
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(v7, "warranty");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "acOfferDisplayDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      if (v14 > 0.0)
      {

        v15 = 0;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v7, "warranty");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "acOfferEligibleUntil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceNow");
      v17 = v20;

      goto LABEL_10;
    }
  }
  else if (v11)
  {
    objc_msgSend(v7, "warranty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "acOfferEligibleUntil");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceNow");
    v17 = v16;
LABEL_10:

    if (v17 > 0.0)
    {
      objc_msgSend(v7, "warranty");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOManager payloadFrom:atIndex:device:](self, "payloadFrom:atIndex:device:", v10, a4, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v15 = 0;
LABEL_13:

LABEL_15:
  return v15;
}

- (void)getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 policy:(unint64_t)a5 params:(id)a6 salesReplyOnly:(BOOL)a7 salesInfoReply:(id)a8 deviceInfoReply:(id)a9 completionBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  BOOL v36;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke;
  v28[3] = &unk_24F81D8A8;
  v28[4] = self;
  v29 = v16;
  v36 = a7;
  v32 = v21;
  v33 = v19;
  v30 = v17;
  v31 = v18;
  v34 = v20;
  v35 = a5;
  v22 = v20;
  v23 = v18;
  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v16;
  -[NDOManager _getDeviceListForLocalDevices:sessionID:params:completionBlock:](self, "_getDeviceListForLocalDevices:sessionID:params:completionBlock:", v27, v24, v23, v28);

}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NDODeviceSection *v9;
  void *v10;
  void *v11;
  NDODeviceSection *v12;
  NDODeviceSection *v13;
  void *v14;
  void *v15;
  NDODeviceSection *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  NDODeviceSection *v24;
  void *v25;
  BOOL v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  _BOOL4 v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  dispatch_group_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD block[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  _BYTE *v70;
  char v71;
  _QWORD v72[4];
  NSObject *v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t *v84;
  _BYTE *v85;
  _QWORD v86[4];
  id v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  char v108;
  uint8_t v109[4];
  const char *v110;
  __int16 v111;
  int v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  id v116;
  __int16 v117;
  id v118;
  uint8_t v119[128];
  _BYTE buf[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v55 = a3;
  v58 = v4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  if (v4 && objc_msgSend(v4, "count"))
  {
    *((_BYTE *)v98 + 24) = 1;
    objc_msgSend(v57, "addObjectsFromArray:", v4);
    *((_BYTE *)v106 + 24) = 1;
    v5 = *(_QWORD *)(a1 + 64);
    if (v5 && !*(_BYTE *)(a1 + 96))
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v57);
    _NDOLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoRep"
                           "ly:deviceInfoReply:completionBlock:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 423;
      _os_log_impl(&dword_22D064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d completionBlock", buf, 0x12u);
    }
  }
  else
  {
    _NDOLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_cold_1(v7);

    objc_msgSend(*(id *)(a1 + 32), "defaultDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serialNumber");
    v6 = objc_claimAutoreleasedReturnValue();

    v9 = [NDODeviceSection alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("THIS_DEVICE"), &stru_24F81DDD8, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NDODeviceSection initWithLabel:identifier:](v9, "initWithLabel:identifier:", v11, CFSTR("THIS_DEVICE"));

    v13 = [NDODeviceSection alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MORE_DEVICES"), &stru_24F81DDD8, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NDODeviceSection initWithLabel:identifier:](v13, "initWithLabel:identifier:", v15, CFSTR("MORE_DEVICES"));

    objc_msgSend(v57, "addObject:", v12);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v17 = *(id *)(a1 + 40);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, v124, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v94 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
          objc_msgSend(v21, "serialNumber");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v6);

          if (v23)
            v24 = v12;
          else
            v24 = v16;
          -[NDODeviceSection addDevice:](v24, "addDevice:", v21);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, v124, 16);
      }
      while (v18);
    }

    -[NDODeviceSection deviceList](v16, "deviceList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count") == 0;

    if (!v26)
      objc_msgSend(v57, "addObject:", v16);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v121 = __Block_byref_object_copy_;
  v122 = __Block_byref_object_dispose_;
  v27 = v55;
  v123 = v27;
  v53 = dispatch_group_create();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v29 = v57;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v90 != v31)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "deviceList");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObjectsFromArray:", v33);

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
    }
    while (v30);
  }

  v34 = MEMORY[0x24BDAC760];
  v35 = a1;
  if (!*((_BYTE *)v98 + 24) || !*(_QWORD *)(a1 + 72))
    goto LABEL_38;
  v86[0] = MEMORY[0x24BDAC760];
  v86[1] = 3221225472;
  v86[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_70;
  v86[3] = &unk_24F81D790;
  v36 = v56;
  v37 = *(_QWORD *)(a1 + 32);
  v87 = v36;
  v88 = v37;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v86);
  *((_BYTE *)v102 + 24) = 1;
  v38 = *(_QWORD *)(a1 + 72);
  v39 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  v40 = objc_msgSend(v36, "count") ? v36 : 0;
  (*(void (**)(uint64_t, uint64_t, id, id))(v38 + 16))(v38, v39, v40, v27);
  _NDOLogSystem();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    v52 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v109 = 136316162;
    v110 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke_2";
    v111 = 1024;
    v112 = 445;
    v113 = 2112;
    v114 = v52;
    v115 = 2112;
    v116 = v27;
    v117 = 2112;
    v118 = v36;
    _os_log_debug_impl(&dword_22D064000, v41, OS_LOG_TYPE_DEBUG, "%s:%d salesInfoReply salesURL:%@ agsULUrl:%@ %@", v109, 0x30u);
  }

  v42 = *(_BYTE *)(a1 + 96) == 0;
  v35 = a1;
  if (v42)
  {
LABEL_38:
    v79[0] = v34;
    v79[1] = 3221225472;
    v79[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_73;
    v79[3] = &unk_24F81D7B8;
    v43 = v54;
    v80 = v43;
    v84 = &v97;
    v44 = *(id *)(v35 + 72);
    v85 = buf;
    v45 = *(_QWORD *)(v35 + 32);
    v83 = v44;
    v81 = v45;
    v46 = v56;
    v82 = v46;
    v47 = (void *)MEMORY[0x22E30C314](v79);
    v72[0] = v34;
    v72[1] = 3221225472;
    v72[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2;
    v72[3] = &unk_24F81D858;
    v48 = v53;
    v49 = *(_QWORD *)(v35 + 32);
    v73 = v48;
    v74 = v49;
    v78 = *(_QWORD *)(a1 + 88);
    v75 = *(id *)(a1 + 48);
    v76 = *(id *)(a1 + 56);
    v50 = v47;
    v77 = v50;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v72);
    v51 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = v34;
    block[1] = 3221225472;
    block[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_76;
    block[3] = &unk_24F81D880;
    v65 = *(id *)(a1 + 64);
    v68 = &v105;
    v71 = *(_BYTE *)(a1 + 96);
    v61 = v29;
    v66 = *(id *)(a1 + 72);
    v69 = &v101;
    v70 = buf;
    v62 = v46;
    v63 = v27;
    v67 = *(id *)(a1 + 80);
    v64 = v43;
    dispatch_group_notify(v48, v51, block);

  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);

}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_70(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "acOfferEligible"))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "payloadFrom:atIndex:device:", v7, a3, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_73(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a2;
  objc_msgSend(v18, "warranty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithWarranty:", v8);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
  v9 = v18;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) || !*(_QWORD *)(a1 + 56))
    goto LABEL_10;
  objc_msgSend(v18, "warranty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "agsULURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_6;
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);

  v13 = v18;
  if (!v12)
  {
    objc_msgSend(v18, "warranty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "agsULURL");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

LABEL_6:
    v13 = v18;
  }
  objc_msgSend(*(id *)(a1 + 40), "payloadDictionaryForDeviceInfo:atIndex:", v13, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);

  v9 = v18;
LABEL_10:

}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  if (objc_msgSend(v5, "deviceType") == 2)
  {
    _NDOLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2_cold_1(v5, v6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v5, "serialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_3;
    v14[3] = &unk_24F81D830;
    v14[4] = *(_QWORD *)(a1 + 40);
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 72);
    v15 = v12;
    v20 = v13;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v21 = a3;
    objc_msgSend(v7, "getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:", v8, v9, v11, v10, 0, v14);

  }
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_4;
  block[3] = &unk_24F81D808;
  v14 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 80);
  v15 = v6;
  v21 = v7;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 88);
  v20 = v10;
  v22 = v11;
  v12 = v3;
  dispatch_async(v5, block);

}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "warranty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "acOfferEligible");
    if (v4 == objc_msgSend(*(id *)(a1 + 40), "acOfferEligible") || *(_QWORD *)(a1 + 88) == 2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v5 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "serialNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 64);
      v8 = *(_QWORD *)(a1 + 72);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_5;
      v11[3] = &unk_24F81D7E0;
      v14 = *(id *)(a1 + 80);
      v9 = *(id *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 96);
      v12 = v9;
      v15 = v10;
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v5, "getDeviceInfoForSerialNumber:usingPolicy:sessionID:params:andForcePostFollowup:withReply:", v6, 2, v7, v8, 0, v11);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_76(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v1 = result;
  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 64)
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 88) + 8) + 24)
    && !*(_BYTE *)(result + 112))
  {
    _NDOLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446466;
      v9 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke";
      v10 = 1024;
      v11 = 502;
      _os_log_impl(&dword_22D064000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d completionBlock", (uint8_t *)&v8, 0x12u);
    }

    result = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 64) + 16))();
  }
  if (*(_QWORD *)(v1 + 72) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 24))
  {
    _NDOLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446466;
      v9 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke";
      v10 = 1024;
      v11 = 507;
      _os_log_impl(&dword_22D064000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%d salesInfoReply", (uint8_t *)&v8, 0x12u);
    }

    v4 = *(_QWORD *)(v1 + 72);
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 40);
    if (objc_msgSend(*(id *)(v1 + 40), "count"))
      v6 = *(_QWORD *)(v1 + 40);
    else
      v6 = 0;
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v5, v6, *(_QWORD *)(v1 + 48));
  }
  if (*(_QWORD *)(v1 + 80) && !*(_BYTE *)(v1 + 112))
  {
    _NDOLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446466;
      v9 = "-[NDOManager getDeviceListForLocalDevices:sessionID:policy:params:salesReplyOnly:salesInfoReply:deviceInfoRep"
           "ly:completionBlock:]_block_invoke";
      v10 = 1024;
      v11 = 512;
      _os_log_impl(&dword_22D064000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%d deviceInfoReply", (uint8_t *)&v8, 0x12u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 80) + 16))();
  }
  return result;
}

- (void)_getDeviceListForLocalDevices:(id)a3 sessionID:(id)a4 params:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke;
  v21[3] = &unk_24F81D588;
  v21[4] = self;
  v16 = v10;
  v22 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_78;
  v19[3] = &unk_24F81D8D0;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "getDeviceListForLocalDevices:sessionID:params:withReply:", v13, v12, v11, v19);

}

void __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPrimaryFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a4;
  v8 = a5;
  -[NDOManager agentConnection](self, "agentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v17[3] = &unk_24F81D588;
  v18 = v9;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_79;
  v15[3] = &unk_24F81D8F8;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "getPrimaryFUPEligibleDeviceInfosUsingPolicy:updateFollowUps:withReply:", a3, v5, v15);

}

void __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __84__NDOManager_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAllFUPEligibleDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a4;
  v8 = a5;
  -[NDOManager agentConnection](self, "agentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v17[3] = &unk_24F81D588;
  v18 = v9;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_80;
  v15[3] = &unk_24F81D8F8;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "getAllFUPEligibleDeviceInfosUsingPolicy:updateFollowUps:withReply:", a3, v5, v15);

}

void __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __80__NDOManager_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getBTDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a4;
  v8 = a5;
  -[NDOManager agentConnection](self, "agentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v17[3] = &unk_24F81D588;
  v18 = v9;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_81;
  v15[3] = &unk_24F81D8F8;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "getBTDeviceInfosUsingPolicy:updateFollowUps:withReply:", a3, v5, v15);

}

void __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __68__NDOManager_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getBTPioneerDeviceInfosUsingPolicy:(unint64_t)a3 updateFollowUps:(BOOL)a4 withReply:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a4;
  v8 = a5;
  -[NDOManager agentConnection](self, "agentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke;
  v17[3] = &unk_24F81D588;
  v18 = v9;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_82;
  v15[3] = &unk_24F81D8F8;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "getBTPioneerDeviceInfosUsingPolicy:updateFollowUps:withReply:", a3, v5, v15);

}

void __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __75__NDOManager_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissFollowUpForSerialNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke;
  v16[3] = &unk_24F81D588;
  v17 = v8;
  v10 = v6;
  v18 = v10;
  v11 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke_83;
  v14[3] = &unk_24F81D920;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "dismissFollowUpForSerialNumber:completion:", v7, v14);

}

void __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __56__NDOManager_dismissFollowUpForSerialNumber_completion___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissNotificationForSerialNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke;
  v16[3] = &unk_24F81D588;
  v17 = v8;
  v10 = v6;
  v18 = v10;
  v11 = v8;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke_84;
  v14[3] = &unk_24F81D920;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "dismissNotificationForSerialNumber:completion:", v7, v14);

}

void __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __60__NDOManager_dismissNotificationForSerialNumber_completion___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)agentConnection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ndoagent"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255C62050);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_getDeviceListForLocalDevices_sessionID_params_withReply_, 0, 0);

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getDeviceListForLocalDevices_sessionID_params_withReply_, 0, 1);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getPrimaryFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply_, 0, 1);

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getAllFUPEligibleDeviceInfosUsingPolicy_updateFollowUps_withReply_, 0, 1);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getBTDeviceInfosUsingPolicy_updateFollowUps_withReply_, 0, 1);

  v21 = (void *)MEMORY[0x24BDBCF20];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getBTPioneerDeviceInfosUsingPolicy_updateFollowUps_withReply_, 0, 1);

  v24 = (void *)MEMORY[0x24BDBCF20];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_defaultDevice_, 0, 1);

  v27 = (void *)MEMORY[0x24BDBCF20];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_pairedWatches_, 0, 1);

  v30 = (void *)MEMORY[0x24BDBCF20];
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_pairedBTDevices_, 0, 1);

  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");

  return v2;
}

+ (void)postCAEventFor:(id)a3 eventDict:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  AnalyticsSendEventLazy();

}

id __39__NDOManager_postCAEventFor_eventDict___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_22D064000, v2, OS_LOG_TYPE_DEFAULT, "Posting for event: %@ with value: %@", (uint8_t *)&v6, 0x16u);
  }

  return *(id *)(a1 + 40);
}

- (void)clearUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __75__NDOManager_clearUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke;
  v15 = &unk_24F81D588;
  v16 = v8;
  v17 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearUserInitiatedFollowUpDismissalForSerialNumber:completion:", v7, v9, v12, v13, v14, v15);

}

void __75__NDOManager_clearUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)clearAllUserInitiatedFollowUpDismissalsWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  -[NDOManager agentConnection](self, "agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __63__NDOManager_clearAllUserInitiatedFollowUpDismissalsWithReply___block_invoke;
  v12 = &unk_24F81D588;
  v13 = v5;
  v14 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearAllUserInitiatedFollowUpDismissalsWithCompletion:", v6, v9, v10, v11, v12);

}

void __63__NDOManager_clearAllUserInitiatedFollowUpDismissalsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)storeUserInitiatedFollowUpDismissalForSerialNumber:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380675;
    v20 = "-[NDOManager storeUserInitiatedFollowUpDismissalForSerialNumber:withReply:]";
    _os_log_impl(&dword_22D064000, v8, OS_LOG_TYPE_DEFAULT, "%{private}s", buf, 0xCu);
  }

  -[NDOManager agentConnection](self, "agentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __75__NDOManager_storeUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke;
  v16 = &unk_24F81D588;
  v17 = v9;
  v18 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storeUserInitiatedFollowUpDismissalForSerialNumber:completion:", v7, v10, v13, v14, v15, v16);

}

void __75__NDOManager_storeUserInitiatedFollowUpDismissalForSerialNumber_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->workingQueue, 0);
}

void __41__NDOManager_appleAccountAddedWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_22D064000, v0, v1, "%{public}s: error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__NDOManager_scheduleOutreachAfter_withReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22D064000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isAPSSupportedOverrideWithServerValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_22D064000, a2, OS_LOG_TYPE_DEBUG, "Using overriden value %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __33__NDOManager_clientConfiguration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_22D064000, v0, v1, "%{public}s error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D064000, log, OS_LOG_TYPE_ERROR, "Device list came back empty, falling to summarily call", v1, 2u);
}

void __129__NDOManager_getDeviceListForLocalDevices_sessionID_policy_params_salesReplyOnly_salesInfoReply_deviceInfoReply_completionBlock___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_22D064000, a2, OS_LOG_TYPE_DEBUG, "%s Skipping APPLEID Device %@", (uint8_t *)v4, 0x16u);

}

void __77__NDOManager__getDeviceListForLocalDevices_sessionID_params_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22D064000, v0, v1, "Device list failed with %@, falling to summarily call ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
