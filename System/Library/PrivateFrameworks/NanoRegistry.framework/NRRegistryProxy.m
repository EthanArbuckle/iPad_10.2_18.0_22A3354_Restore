@implementation NRRegistryProxy

- (BOOL)loudHasEntitlement:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRXPCProxy hasEntitlement:](self, "hasEntitlement:", v4);
  if (!v5)
  {
    nr_daemon_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      nr_daemon_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[NRXPCProxy appPath](self, "appPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v10;
        v13 = 2112;
        v14 = v4;
        _os_log_error_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_ERROR, "client %{public}@ is missing the %@ entitlement", (uint8_t *)&v11, 0x16u);

      }
    }
  }

  return v5;
}

- (void)logCaller:(SEL)a3 args:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  nr_daemon_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    nr_daemon_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NRXPCProxy appPath](self, "appPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1A0BDB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ called %{public}@ %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }

}

+ (id)machServiceName
{
  return CFSTR("com.apple.nano.nanoregistry.paireddeviceregistry");
}

+ (id)serverExportedInterface
{
  if (qword_1ECE238D8 != -1)
    dispatch_once(&qword_1ECE238D8, &__block_literal_global_6);
  return (id)_MergedGlobals_9;
}

void __42__NRRegistryProxy_serverExportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D1918);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = v0;

  v2 = (void *)_MergedGlobals_9;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_xpcRetrieveSecureProperties_block_, 0, 0);

}

+ (id)clientRemoteObjectInterface
{
  if (qword_1ECE238E8 != -1)
    dispatch_once(&qword_1ECE238E8, &__block_literal_global_37);
  return (id)qword_1ECE238E0;
}

void __46__NRRegistryProxy_clientRemoteObjectInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D1918);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE238E0;
  qword_1ECE238E0 = v0;

  v2 = (void *)qword_1ECE238E0;
  +[NRSecureDevicePropertyStore enclosedClassTypes](NRSecureDevicePropertyStore, "enclosedClassTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_xpcRetrieveSecureProperties_block_, 0, 1);

  v4 = (void *)qword_1ECE238E0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_xpcClientInfo_, 0, 1);

  v8 = (void *)qword_1ECE238E0;
  +[NRSecureDevicePropertyStore enclosedClassTypes](NRSecureDevicePropertyStore, "enclosedClassTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock_, 1, 1);

}

+ (id)entitlements
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("com.apple.bluetoothregistry");
  v6[1] = CFSTR("com.apple.nano.nanoregistry");
  v6[2] = CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate");
  v6[3] = CFSTR("com.apple.nano.nanoregistry.ids.plugin");
  v6[4] = CFSTR("com.apple.nano.nanoregistry.applydiff");
  v6[5] = CFSTR("com.apple.nano.nanoregistry.internal");
  v6[6] = CFSTR("com.apple.nano.nanoregistry.ids.plugin");
  v6[7] = CFSTR("com.apple.nano.nanoregistry.unpairwithbrick");
  v6[8] = CFSTR("com.apple.nanoregistry.BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2");
  v6[9] = CFSTR("com.apple.nano.nanoregistry.submitrtcpairingmetric");
  v6[10] = CFSTR("com.apple.nano.nanoregistry.generalaccess");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)requireAnEntitlement
{
  return 0;
}

- (BOOL)_hasInternalEntitlement
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];

  if (_NRIsInternalInstall___onceToken != -1)
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  if (_NRIsInternalInstall___internalInstall)
    return -[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.internal"));
  nr_daemon_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    nr_daemon_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1A0BDB000, v6, OS_LOG_TYPE_ERROR, "Internal functionality not available in customer builds", v7, 2u);
    }

  }
  return 0;
}

- (void)xpcGetDeviceCollectionWithBlock:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v4 = a3;
  v5 = -[NRXPCProxy hasEntitlements](self, "hasEntitlements");
  -[NRRegistryProxy registryDelegate](self, "registryDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke;
  v8[3] = &unk_1E4496B80;
  v10 = v5;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "xpcGetDeviceCollectionWithBlock:", v8);

}

void __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke_2;
  v13[3] = &unk_1E4496B58;
  v18 = *(_BYTE *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v16 = v10;
  v17 = a4;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v9, "runCompletionBlock:", v13);

}

uint64_t __51__NRRegistryProxy_xpcGetDeviceCollectionWithBlock___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 48);
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0, *(_QWORD *)(a1 + 56), 0);
}

- (void)xpcGetDiffSinceTokenValue:(unint64_t)a3 getSecureProperties:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v5;
  id v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = -[NRXPCProxy hasEntitlements](self, "hasEntitlements");
  -[NRRegistryProxy registryDelegate](self, "registryDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke;
  v12[3] = &unk_1E4495C00;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "xpcGetDiffSinceTokenValue:getSecureProperties:withBlock:", a3, v9 & v5, v12);

}

void __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, char a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;

  v9 = a2;
  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke_2;
  v15[3] = &unk_1E4496B58;
  v12 = *(id *)(a1 + 40);
  v16 = v9;
  v17 = v10;
  v20 = a4;
  v18 = v12;
  v19 = a5;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v11, "runCompletionBlock:", v15);

}

uint64_t __75__NRRegistryProxy_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)xpcRetrieveSecureProperties:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (-[NRXPCProxy hasEntitlements](self, "hasEntitlements"))
  {
    -[NRRegistryProxy registryDelegate](self, "registryDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke;
    v9[3] = &unk_1E4495780;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "xpcRetrieveSecureProperties:block:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke_2;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __53__NRRegistryProxy_xpcRetrieveSecureProperties_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)xpcSwitchIndex:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NRRegistryProxy registryDelegate](self, "registryDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__NRRegistryProxy_xpcSwitchIndex___block_invoke;
  v7[3] = &unk_1E4496BD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "xpcSwitchIndex:", v7);

}

void __34__NRRegistryProxy_xpcSwitchIndex___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  int v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__NRRegistryProxy_xpcSwitchIndex___block_invoke_2;
  v5[3] = &unk_1E4496BA8;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "runCompletionBlock:", v5);

}

uint64_t __34__NRRegistryProxy_xpcSwitchIndex___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)xpcLongForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[NRRegistryProxy registryDelegate](self, "registryDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke;
  v10[3] = &unk_1E4496C20;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "xpcLongForInternalPreference:withBlock:", v7, v10);

}

void __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  char v11;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke_2;
  v8[3] = &unk_1E4496BF8;
  v7 = *(id *)(a1 + 40);
  v11 = a2;
  v9 = v7;
  v10 = a3;
  objc_msgSend(v6, "runCompletionBlock:", v8);

}

uint64_t __58__NRRegistryProxy_xpcLongForInternalPreference_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)xpcBooleanForInternalPreference:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[NRRegistryProxy registryDelegate](self, "registryDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke;
  v10[3] = &unk_1E4496C70;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "xpcBooleanForInternalPreference:withBlock:", v7, v10);

}

void __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke(uint64_t a1, char a2, char a3)
{
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke_2;
  v7[3] = &unk_1E4496C48;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  v10 = a3;
  objc_msgSend(v6, "runCompletionBlock:", v7);

}

uint64_t __61__NRRegistryProxy_xpcBooleanForInternalPreference_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)xpcDeviceIDAtSwitchIndex:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[NRRegistryProxy registryDelegate](self, "registryDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke;
  v9[3] = &unk_1E4496C98;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "xpcDeviceIDAtSwitchIndex:withBlock:", v4, v9);

}

void __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke_2;
  v11[3] = &unk_1E4495708;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "runCompletionBlock:", v11);

}

uint64_t __54__NRRegistryProxy_xpcDeviceIDAtSwitchIndex_withBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)xpcClientInfo:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[NRRegistryProxy _hasInternalEntitlement](self, "_hasInternalEntitlement"))
  {
    -[NRRegistryProxy registryDelegate](self, "registryDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__NRRegistryProxy_xpcClientInfo___block_invoke;
    v6[3] = &unk_1E4496CC0;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "xpcClientInfo:", v6);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __33__NRRegistryProxy_xpcClientInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__NRRegistryProxy_xpcClientInfo___block_invoke_2;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __33__NRRegistryProxy_xpcClientInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)xpcGetChangeHistoryWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy _hasInternalEntitlement](self, "_hasInternalEntitlement"))
  {
    -[NRRegistryProxy registryDelegate](self, "registryDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke;
    v12[3] = &unk_1E4496CE8;
    v12[4] = self;
    v13 = v4;
    v6 = v4;
    objc_msgSend(v5, "xpcGetChangeHistoryWithBlock:", v12);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_3;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_2;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __48__NRRegistryProxy_xpcGetChangeHistoryWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcApplyDiff:(id)a3 withSecureProperties:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.applydiff")))
  {
    -[NRRegistryProxy registryDelegate](self, "registryDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke;
    v18[3] = &unk_1E4494E30;
    v18[4] = self;
    v19 = v10;
    v12 = v10;
    objc_msgSend(v11, "xpcApplyDiff:withSecureProperties:block:", v8, v9, v18);

    v13 = v19;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_3;
    v16[3] = &unk_1E4494F90;
    v17 = v10;
    v15 = v10;
    objc_msgSend(v14, "runCompletionBlock:", v16);

    v13 = v17;
  }

}

void __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_2;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__NRRegistryProxy_xpcApplyDiff_withSecureProperties_block___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("entitlement required");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanoregistry.registry"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

- (void)xpcSetMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRRegistryProxy registryDelegate](self, "registryDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke;
    v17[3] = &unk_1E4495668;
    v17[4] = self;
    v18 = v9;
    v11 = v9;
    objc_msgSend(v10, "xpcSetMigrationConsented:forDeviceID:withBlock:", v6, v8, v17);

    v12 = v18;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_3;
    v15[3] = &unk_1E4494F90;
    v16 = v9;
    v14 = v9;
    objc_msgSend(v13, "runCompletionBlock:", v15);

    v12 = v16;
  }

}

void __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_2;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__NRRegistryProxy_xpcSetMigrationConsented_forDeviceID_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
