@implementation PrivacyProxyClient

void __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

+ (void)setTrafficState:(unint64_t)a3 proxyTraffic:(unint64_t)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v9 = a5;
  v10 = a6;
  +[PrivacyProxyClient getServerConnection]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E41379B0;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "setPrivacyProxyTrafficState:proxyTraffic:completionHandler:", a3, a4, v14);

}

void __41__PrivacyProxyClient_getServerConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NSPServerClient initWithCallbackQueue:]([NSPServerClient alloc], 0);
  v1 = (void *)qword_1ED062A48;
  qword_1ED062A48 = (uint64_t)v0;

}

+ (void)getPrivacyProxyAccountType:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivacyProxyAccountType:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivacyProxyAccountType:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke;
  v11[3] = &unk_1E4137B40;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyAccountTypeWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v6 = a4;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke_2;
      block[3] = &unk_1E4137AA0;
      v11 = v8;
      v12 = a2;
      v10 = v6;
      dispatch_async(v7, block);

    }
  }

}

void __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke_2;
  block[3] = &unk_1E4137AA0;
  v6 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke_2;
  block[3] = &unk_1E4137AA0;
  v7 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

+ (void)getServiceStatus:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getServiceStatus:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getServiceStatus:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke;
  v11[3] = &unk_1E4137A50;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyServiceStatusWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

+ (void)getUserTier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getUserTier:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getUserTier:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke;
  v11[3] = &unk_1E4137AC8;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyUserTierWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

+ (void)getTrafficState:(id)a3 completionandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getTrafficState:completionandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getTrafficState:completionandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke;
  v11[3] = &unk_1E4137B18;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyTrafficStateWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

+ (id)getServerConnection
{
  objc_opt_self();
  if (qword_1ED062A50 != -1)
    dispatch_once(&qword_1ED062A50, &__block_literal_global_5);
  return (id)qword_1ED062A48;
}

void __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke_2;
  block[3] = &unk_1E4137A28;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __59__PrivacyProxyClient_currentProcessShouldUseOpaqueProxying__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();

  v1 = (void *)v4;
  if (v4)
  {
    objc_msgSend(&unk_1E41516D8, "objectForKeyedSubscript:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      qword_1ED062A58 = objc_msgSend(v2, "unsignedLongLongValue");

    v1 = (void *)v4;
  }

}

+ (BOOL)currentProcessShouldUseOpaqueProxying
{
  uint32_t v2;
  uint32_t v3;
  NSObject *v4;
  uint32_t state;
  uint32_t v6;
  NSObject *v7;
  NSObject *v9;
  uint64_t state64;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint32_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1ED062A60 != -1)
    dispatch_once(&qword_1ED062A60, &__block_literal_global_12);
  if (!qword_1ED062A58)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_33);
  if (currentProcessShouldUseOpaqueProxying_reverseProxyToken == -1)
  {
    v2 = notify_register_check("networkserviceproxy-reverse-proxy", &currentProcessShouldUseOpaqueProxying_reverseProxyToken);
    if (v2)
    {
      v3 = v2;
      currentProcessShouldUseOpaqueProxying_reverseProxyToken = -1;
      nplog_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "networkserviceproxy-reverse-proxy";
        v13 = 1024;
        v14 = v3;
        _os_log_error_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", buf, 0x12u);
      }

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_33);
  if (currentProcessShouldUseOpaqueProxying_reverseProxyToken < 0)
    return 0;
  state64 = 0;
  state = notify_get_state(currentProcessShouldUseOpaqueProxying_reverseProxyToken, &state64);
  if (state)
  {
    v6 = state;
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "networkserviceproxy-reverse-proxy";
      v13 = 1024;
      v14 = currentProcessShouldUseOpaqueProxying_reverseProxyToken;
      v15 = 1024;
      v16 = v6;
      _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, "Failed to get the state of notification %s, token %d: %u", buf, 0x18u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_33);
    notify_cancel(currentProcessShouldUseOpaqueProxying_reverseProxyToken);
    currentProcessShouldUseOpaqueProxying_reverseProxyToken = -1;
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_33);
    return 0;
  }
  if ((qword_1ED062A58 & state64) == 0)
    return 0;
  nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_INFO, "Should use opaque proxying (from notify status)", buf, 2u);
  }

  return 1;
}

uint64_t __67__PrivacyProxyClient_getPrivacyProxyAccountType_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __57__PrivacyProxyClient_getServiceStatus_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __55__PrivacyProxyClient_getTrafficState_completionandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __52__PrivacyProxyClient_getUserTier_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

+ (void)setEnabled:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  +[PrivacyProxyClient getServerConnection]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke;
  v12[3] = &unk_1E41379B0;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "setPrivacyProxyStatus:completionHandler:", v6, v12);

}

void __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

uint64_t __57__PrivacyProxyClient_setEnabled_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getStatus:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getStatus:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getStatus:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke;
  v11[3] = &unk_1E4137A00;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyStatusWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke_2;
  block[3] = &unk_1E41379D8;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __50__PrivacyProxyClient_getStatus_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (void)getServiceStatusTimeline:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getServiceStatusTimeline:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getServiceStatusTimeline:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke;
  v11[3] = &unk_1E4137A78;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyServiceStatusTimelineWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke_2;
  block[3] = &unk_1E4137A28;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __65__PrivacyProxyClient_getServiceStatusTimeline_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)reportWiFiNetworkStatus:(BOOL)a3 networkName:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  PrivacyProxyNetworkStatus *v13;
  void *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v8 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    nplog_obj();
    v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportWiFiNetworkStatus:networkName:queue:completionHandler:]";
    v15 = "%s called with null networkName";
LABEL_12:
    _os_log_fault_impl(&dword_19E8FE000, &v13->super, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    nplog_obj();
    v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportWiFiNetworkStatus:networkName:queue:completionHandler:]";
    v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    nplog_obj();
    v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportWiFiNetworkStatus:networkName:queue:completionHandler:]";
    v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  v13 = -[PrivacyProxyNetworkStatus initWithStatus:type:name:]([PrivacyProxyNetworkStatus alloc], "initWithStatus:type:name:", v8, 1, v9);
  +[PrivacyProxyClient getServerConnection]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E41379B0;
  v17 = v10;
  v18 = v12;
  objc_msgSend(v14, "reportPrivacyProxyNetworkStatus:completionHandler:", v13, v16);

LABEL_5:
}

void __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __82__PrivacyProxyClient_reportWiFiNetworkStatus_networkName_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)reportCellularNetworkStatus:(BOOL)a3 networkName:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  PrivacyProxyNetworkStatus *v13;
  void *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v8 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    nplog_obj();
    v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportCellularNetworkStatus:networkName:queue:completionHandler:]";
    v15 = "%s called with null networkName";
LABEL_12:
    _os_log_fault_impl(&dword_19E8FE000, &v13->super, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    nplog_obj();
    v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportCellularNetworkStatus:networkName:queue:completionHandler:]";
    v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    nplog_obj();
    v13 = (PrivacyProxyNetworkStatus *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient reportCellularNetworkStatus:networkName:queue:completionHandler:]";
    v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  v13 = -[PrivacyProxyNetworkStatus initWithStatus:type:name:]([PrivacyProxyNetworkStatus alloc], "initWithStatus:type:name:", v8, 2, v9);
  +[PrivacyProxyClient getServerConnection]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E41379B0;
  v17 = v10;
  v18 = v12;
  objc_msgSend(v14, "reportPrivacyProxyNetworkStatus:completionHandler:", v13, v16);

LABEL_5:
}

void __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __86__PrivacyProxyClient_reportCellularNetworkStatus_networkName_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)setUserTier:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  +[PrivacyProxyClient getServerConnection]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke;
  v12[3] = &unk_1E41379B0;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "setPrivacyProxyUserTier:completionHandler:", a3, v12);

}

void __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

uint64_t __58__PrivacyProxyClient_setUserTier_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)setFreeUserTierUntilTomorrow:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[PrivacyProxyClient getServerConnection]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke;
  v10[3] = &unk_1E41379B0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "setFreeUserTierUntilTomorrowWithCompletionHandler:", v10);

}

void __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

uint64_t __69__PrivacyProxyClient_setFreeUserTierUntilTomorrow_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getUserTierExtended:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getUserTierExtended:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getUserTierExtended:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke;
  v11[3] = &unk_1E4137AC8;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyUserTierWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke_2;
  v10[3] = &unk_1E4137AF0;
  v8 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = a2;
  v14 = a3;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, v10);

}

uint64_t __60__PrivacyProxyClient_getUserTierExtended_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
}

uint64_t __75__PrivacyProxyClient_setTrafficState_proxyTraffic_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)setGeohashSharingPreference:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  +[PrivacyProxyClient getServerConnection]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke;
  v12[3] = &unk_1E41379B0;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "setGeohashSharingPreference:completionHandler:", v6, v12);

}

void __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

uint64_t __74__PrivacyProxyClient_setGeohashSharingPreference_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getGeohashSharingPreference:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getGeohashSharingPreference:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getGeohashSharingPreference:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke;
  v11[3] = &unk_1E4137A00;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getGeohashSharingPreferenceWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke_2;
      block[3] = &unk_1E41379D8;
      v10 = v7;
      v11 = a2;
      v9 = v5;
      dispatch_async(v6, block);

    }
  }

}

uint64_t __68__PrivacyProxyClient_getGeohashSharingPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (void)getPrivacyProxyAccountTypeExtended:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivacyProxyAccountTypeExtended:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivacyProxyAccountTypeExtended:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke;
  v11[3] = &unk_1E4137B40;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyAccountTypeWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a4;
  v8 = *(NSObject **)(a1 + 32);
  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    if (v9)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke_2;
      v10[3] = &unk_1E4137B68;
      v12 = v9;
      v13 = a2;
      v14 = a3;
      v11 = v7;
      dispatch_async(v8, v10);

    }
  }

}

uint64_t __75__PrivacyProxyClient_getPrivacyProxyAccountTypeExtended_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

+ (void)getEffectiveUserTier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getEffectiveUserTier:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getEffectiveUserTier:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke;
  v11[3] = &unk_1E4137B18;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyEffectiveUserTierWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke_2;
  block[3] = &unk_1E4137AA0;
  v6 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __61__PrivacyProxyClient_getEffectiveUserTier_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

+ (void)setPrivateAccessTokensEnabled:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v7)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v17 = "+[PrivacyProxyClient setPrivateAccessTokensEnabled:queue:completionHandler:]";
    v12 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_FAULT, v12, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v8)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v17 = "+[PrivacyProxyClient setPrivateAccessTokensEnabled:queue:completionHandler:]";
    v12 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke;
  v13[3] = &unk_1E41379B0;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v10, "setPrivateAccessTokensEnabled:completionHandler:", v6, v13);

  v11 = v14;
LABEL_4:

}

void __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke_2;
      v6[3] = &unk_1E4137988;
      v8 = v5;
      v7 = v3;
      dispatch_async(v4, v6);

    }
  }

}

uint64_t __76__PrivacyProxyClient_setPrivateAccessTokensEnabled_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getPrivateAccessTokensEnabled:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivateAccessTokensEnabled:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPrivateAccessTokensEnabled:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke;
  v11[3] = &unk_1E4137A00;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivateAccessTokensEnabledWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke_2;
      block[3] = &unk_1E41379D8;
      v10 = v7;
      v11 = a2;
      v9 = v5;
      dispatch_async(v6, block);

    }
  }

}

uint64_t __70__PrivacyProxyClient_getPrivateAccessTokensEnabled_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (void)setAppStatus:(unint64_t)a3 bundleIdentifier:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:bundleIdentifier:queue:completionHandler:]";
    v15 = "%s called with null bundleIdentifier";
LABEL_12:
    _os_log_fault_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:bundleIdentifier:queue:completionHandler:]";
    v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:bundleIdentifier:queue:completionHandler:]";
    v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  +[PrivacyProxyClient getServerConnection]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E41379B0;
  v17 = v10;
  v18 = v12;
  objc_msgSend(v13, "setPrivacyProxyAppStatus:bundleIdentifier:path:completionHandler:", a3, v9, 0, v16);

  v14 = v17;
LABEL_5:

}

void __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __76__PrivacyProxyClient_setAppStatus_bundleIdentifier_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)setAppStatus:(unint64_t)a3 path:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:path:queue:completionHandler:]";
    v15 = "%s called with null path";
LABEL_12:
    _os_log_fault_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_5;
  }
  if (!v10)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:path:queue:completionHandler:]";
    v15 = "%s called with null queue";
    goto LABEL_12;
  }
  if (!v11)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 136315138;
    v20 = "+[PrivacyProxyClient setAppStatus:path:queue:completionHandler:]";
    v15 = "%s called with null completionHandler";
    goto LABEL_12;
  }
  +[PrivacyProxyClient getServerConnection]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke;
  v16[3] = &unk_1E41379B0;
  v17 = v10;
  v18 = v12;
  objc_msgSend(v13, "setPrivacyProxyAppStatus:bundleIdentifier:path:completionHandler:", a3, 0, v9, v16);

  v14 = v17;
LABEL_5:

}

void __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __64__PrivacyProxyClient_setAppStatus_path_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getAppStatuses:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getAppStatuses:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getAppStatuses:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke;
  v11[3] = &unk_1E4137BB8;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPrivacyProxyAppStatusesWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke_2;
  v15[3] = &unk_1E4137B90;
  v10 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v10, v15);

}

uint64_t __55__PrivacyProxyClient_getAppStatuses_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

+ (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  if (!v14)
  {
    nplog_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v24 = "+[PrivacyProxyClient overrideIngressProxy:fallbackProxy:key:queue:completionHandler:]";
    v19 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_FAULT, v19, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v15)
  {
    nplog_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v24 = "+[PrivacyProxyClient overrideIngressProxy:fallbackProxy:key:queue:completionHandler:]";
    v19 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke;
  v20[3] = &unk_1E41379B0;
  v21 = v14;
  v22 = v16;
  objc_msgSend(v17, "overrideIngressProxy:fallbackProxy:key:completionHandler:", v11, v12, v13, v20);

  v18 = v21;
LABEL_4:

}

void __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __85__PrivacyProxyClient_overrideIngressProxy_fallbackProxy_key_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getOverriddeIngressProxy:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getOverriddeIngressProxy:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getOverriddeIngressProxy:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke;
  v11[3] = &unk_1E4137C28;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getOverrideIngressProxyWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke_2;
  block[3] = &unk_1E4137C00;
  v13 = *(NSObject **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v23 = v12;
  v24 = v14;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  dispatch_async(v13, block);

}

uint64_t __65__PrivacyProxyClient_getOverriddeIngressProxy_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

+ (void)overridePreferredProxy:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v18 = "+[PrivacyProxyClient overridePreferredProxy:queue:completionHandler:]";
    v13 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_FAULT, v13, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v9)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v18 = "+[PrivacyProxyClient overridePreferredProxy:queue:completionHandler:]";
    v13 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E41379B0;
  v15 = v8;
  v16 = v10;
  objc_msgSend(v11, "overridePreferredProxy:completionHandler:", v7, v14);

  v12 = v15;
LABEL_4:

}

void __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __69__PrivacyProxyClient_overridePreferredProxy_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getPreferredProxy:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPreferredProxy:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPreferredProxy:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke;
  v11[3] = &unk_1E4137C50;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPreferredProxyWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke_2;
  block[3] = &unk_1E4137A28;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __58__PrivacyProxyClient_getPreferredProxy_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)overridePreferredResolver:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v18 = "+[PrivacyProxyClient overridePreferredResolver:queue:completionHandler:]";
    v13 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_FAULT, v13, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v9)
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v18 = "+[PrivacyProxyClient overridePreferredResolver:queue:completionHandler:]";
    v13 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E41379B0;
  v15 = v8;
  v16 = v10;
  objc_msgSend(v11, "overridePreferredResolver:completionHandler:", v7, v14);

  v12 = v15;
LABEL_4:

}

void __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __72__PrivacyProxyClient_overridePreferredResolver_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getPreferredResolver:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPreferredResolver:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getPreferredResolver:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke;
  v11[3] = &unk_1E4137C50;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getPreferredResolverWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke_2;
  block[3] = &unk_1E4137A28;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__PrivacyProxyClient_getPreferredResolver_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)setForceFallback:(BOOL)a3 queue:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v7)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v17 = "+[PrivacyProxyClient setForceFallback:queue:completionHandler:]";
    v12 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_FAULT, v12, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v8)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v17 = "+[PrivacyProxyClient setForceFallback:queue:completionHandler:]";
    v12 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke;
  v13[3] = &unk_1E41379B0;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v10, "setForceFallback:completionHandler:", v6, v13);

  v11 = v14;
LABEL_4:

}

void __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke_2;
  v7[3] = &unk_1E4137988;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __63__PrivacyProxyClient_setForceFallback_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)getForceFallback:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getForceFallback:completionHandler:]";
    v10 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v15 = "+[PrivacyProxyClient getForceFallback:completionHandler:]";
    v10 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  +[PrivacyProxyClient getServerConnection]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke;
  v11[3] = &unk_1E4137A00;
  v12 = v5;
  v13 = v7;
  objc_msgSend(v8, "getForceFallbackWithCompletionHandler:", v11);

  v9 = v12;
LABEL_4:

}

void __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke_2;
  block[3] = &unk_1E41379D8;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __57__PrivacyProxyClient_getForceFallback_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
