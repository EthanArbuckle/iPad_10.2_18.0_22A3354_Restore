@implementation MIBUClient

- (MIBUClient)init
{
  MIBUClient *v2;
  MIBUClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUClient;
  v2 = -[MIBUClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MIBUClient _setupConnection](v2, "_setupConnection");
  return v3;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[MIBUClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_15);
    v4 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("com.apple.inboxupdaterd");
      _os_log_impl(&dword_222C3F000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection to %@", (uint8_t *)&v6, 0xCu);
    }
    -[MIBUClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[MIBUClient setConnection:](self, "setConnection:", 0);
  }
}

void __24__MIBUClient_invalidate__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[MIBUClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MIBUClient;
  -[MIBUClient dealloc](&v3, sel_dealloc);
}

- (BOOL)isInBoxUpdateMode:(id *)a3
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[5];
  uint8_t buf[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  +[MIBUDefaultPreferences objectForKey:](MIBUDefaultPreferences, "objectForKey:", CFSTR("CurrentOperation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIBUClient _isActivated:](self, "_isActivated:", 0))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_27_2);
    v14 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v14, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", buf, 2u);
    }
  }
  else
  {
    v6 = -[MIBUClient _isOnLockScreen](self, "_isOnLockScreen");
    v7 = MEMORY[0x24BDAC760];
    if (v6)
      goto LABEL_4;
    -[MIBUClient connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_28;
    v19[3] = &unk_24EB55FC0;
    v19[4] = &v21;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_31;
    v18[3] = &unk_24EB56008;
    v18[4] = &v21;
    v18[5] = &v27;
    objc_msgSend(v9, "isInDiagnosticModeWithReply:", v18);

    if (*((_BYTE *)v28 + 24))
    {
LABEL_4:
      -[MIBUClient connection](self, "connection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_37;
      v17[3] = &unk_24EB55FC0;
      v17[4] = &v21;
      objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __32__MIBUClient_isInBoxUpdateMode___block_invoke_40;
      v16[3] = &unk_24EB56008;
      v16[4] = &v21;
      v16[5] = &v27;
      objc_msgSend(v11, "isInBoxUpdateModeWithReply:", v16);

    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_36_1);
      v15 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222C3F000, v15, OS_LOG_TYPE_DEFAULT, "Device is not in lock screen and not in Diagnostic mode", buf, 2u);
      }
    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v22[5]);
  }
  v12 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v12;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_29_1);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_28_cold_1();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_31(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_33_2);
  v6 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[MIBUClient isInBoxUpdateMode:]_block_invoke";
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_222C3F000, v6, OS_LOG_TYPE_DEFAULT, "%s: isInDiagnosticMode = %d; error = %{public}@",
      (uint8_t *)&v10,
      0x1Cu);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2_32()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_35()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_39_4);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_28_cold_1();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2_38()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_40(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_42);
  v6 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[MIBUClient isInBoxUpdateMode:]_block_invoke";
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_222C3F000, v6, OS_LOG_TYPE_DEFAULT, "%s: isInBoxUpdateMode = %d; error = %{public}@",
      (uint8_t *)&v10,
      0x1Cu);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_2_41()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)eapConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  uint64_t v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD, id);
  uint64_t *v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  id obj;
  uint8_t buf[16];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = (void (**)(id, _QWORD, id))a3;
  v30 = 0;
  v31 = (id *)&v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  if (-[MIBUClient _isActivated:](self, "_isActivated:", 0))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_43_2);
    v9 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", buf, 2u);
    }
    v14 = v31;
    obj = v31[5];
    safeAssignError(&obj, 33554433, 0, CFSTR("Device already activated"), v10, v11, v12, v13, v15);
    objc_storeStrong(v14 + 5, obj);
    v4[2](v4, v25[5], v31[5]);
  }
  else
  {
    -[MIBUClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_46;
    v20[3] = &unk_24EB560D0;
    v7 = v4;
    v21 = v7;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_48;
    v16[3] = &unk_24EB56118;
    v18 = &v30;
    v19 = &v24;
    v17 = v7;
    objc_msgSend(v8, "eapConfigurationWithReply:", v16);

  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_47_0);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_28_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_48(_QWORD *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  MIBUEAPConfiguartion *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  __SecKey *v21;
  id v22;
  id obj;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_50);
  v12 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[MIBUClient eapConfigurationWithCompletion:]_block_invoke";
    v26 = 2114;
    v27 = v9;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_222C3F000, v12, OS_LOG_TYPE_DEFAULT, "%s: tlsCertData = %{public}@; tlsKeyData = %{public}@",
      buf,
      0x20u);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a5);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v17 = 0;
  }
  else
  {
    v13 = objc_alloc_init(MIBUEAPConfiguartion);
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v16 + 40);
    +[MIBUCertHelper certificatesFromData:error:](MIBUCertHelper, "certificatesFromData:error:", v9, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v16 + 40), obj);
    v18 = *(_QWORD *)(a1[5] + 8);
    v20 = *(_QWORD *)(v18 + 40);
    v19 = (id *)(v18 + 40);
    if (!v20)
    {
      v22 = 0;
      v21 = +[MIBUCertHelper suCertKeyFromData:isSEPKey:error:](MIBUCertHelper, "suCertKeyFromData:isSEPKey:error:", v10, a4, &v22);
      objc_storeStrong(v19, v22);
      if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setTlsCertificateChain:", v17);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setTLSKey:", v21);
      }
    }
  }
  (*(void (**)(void))(a1[4] + 16))();

}

void __45__MIBUClient_eapConfigurationWithCompletion___block_invoke_2_49()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)terminateInBoxUpdateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD);
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  if (-[MIBUClient _isActivated:](self, "_isActivated:", 0))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_54);
    v9 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "Device is already activated and InBoxUpdate operatons should be terminated", buf, 2u);
    }
    v4[2](v4, 0);
  }
  else
  {
    -[MIBUClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_55;
    v12[3] = &unk_24EB560D0;
    v7 = v4;
    v13 = v7;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_57;
    v10[3] = &unk_24EB560D0;
    v11 = v7;
    objc_msgSend(v8, "terminateInBoxUpdateWithReply:", v10);

  }
}

void __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_56);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_28_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

uint64_t __49__MIBUClient_terminateInBoxUpdateWithCompletion___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)connectToWiFi:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t v12[16];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (os_variant_has_internal_content())
  {
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    if (-[MIBUClient _isActivated:](self, "_isActivated:", 0))
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_59);
      v9 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", v12, 2u);
      }
    }
    else
    {
      -[MIBUClient connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = MEMORY[0x24BDAC760];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __28__MIBUClient_connectToWiFi___block_invoke_60;
      v11[3] = &unk_24EB55FC0;
      v11[4] = buf;
      objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __28__MIBUClient_connectToWiFi___block_invoke_62;
      v10[3] = &unk_24EB55FC0;
      v10[4] = buf;
      objc_msgSend(v7, "connectToWiFiWithReply:", v10);

      if (a3)
        *a3 = objc_retainAutorelease(*((id *)v14 + 5));
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_66_0);
    v8 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v8, OS_LOG_TYPE_DEFAULT, "connectToWiFi: is only supported on internal builds", buf, 2u);
    }
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_61_0);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_28_cold_1();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __28__MIBUClient_connectToWiFi___block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_64);
  v4 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[MIBUClient connectToWiFi:]_block_invoke";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_222C3F000, v4, OS_LOG_TYPE_DEFAULT, "%s:error = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __28__MIBUClient_connectToWiFi___block_invoke_2_63()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __28__MIBUClient_connectToWiFi___block_invoke_65()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)stopWiFiMonitor:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t v12[16];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (os_variant_has_internal_content())
  {
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    v18 = 0;
    if (-[MIBUClient _isActivated:](self, "_isActivated:", 0))
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_67_0);
      v9 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "Device is already activated and not in InBoxUpdate mode", v12, 2u);
      }
    }
    else
    {
      -[MIBUClient connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = MEMORY[0x24BDAC760];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __30__MIBUClient_stopWiFiMonitor___block_invoke_68;
      v11[3] = &unk_24EB55FC0;
      v11[4] = buf;
      objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __30__MIBUClient_stopWiFiMonitor___block_invoke_70;
      v10[3] = &unk_24EB55FC0;
      v10[4] = buf;
      objc_msgSend(v7, "stopWiFiMonitorWithReply:", v10);

      if (a3)
        *a3 = objc_retainAutorelease(*((id *)v14 + 5));
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_74);
    v8 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v8, OS_LOG_TYPE_DEFAULT, "stopWiFiMonitor: is only supported on internal builds", buf, 2u);
    }
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_69);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    __32__MIBUClient_isInBoxUpdateMode___block_invoke_28_cold_1();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_72_0);
  v4 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[MIBUClient stopWiFiMonitor:]_block_invoke";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_222C3F000, v4, OS_LOG_TYPE_DEFAULT, "%s:error = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_2_71()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUClient_stopWiFiMonitor___block_invoke_73()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.inboxupdaterd"), 0);
  -[MIBUClient setConnection:](self, "setConnection:", v3);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255776068);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  -[MIBUClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

}

- (BOOL)_isActivated:(id *)a3
{
  void *v4;
  id v5;
  char v6;

  v4 = (void *)MAEGetActivationStateWithError();
  v5 = 0;
  if (v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_130);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUClient _isActivated:].cold.1();
  }
  if (a3)
    *a3 = objc_retainAutorelease(v5);
  v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE66A50]);

  return v6;
}

void __27__MIBUClient__isActivated___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_isOnLockScreen
{
  uint64_t v2;
  __int16 v4;

  v4 = 0;
  v2 = SBSSpringBoardBlockableServerPort();
  MEMORY[0x22767B440](v2, (char *)&v4 + 1, &v4);
  return HIBYTE(v4) != 0;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __32__MIBUClient_isInBoxUpdateMode___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_222C3F000, v0, v1, "XPC Connection Error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_isActivated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_222C3F000, v0, v1, "Failed to retrieve device activation state with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
