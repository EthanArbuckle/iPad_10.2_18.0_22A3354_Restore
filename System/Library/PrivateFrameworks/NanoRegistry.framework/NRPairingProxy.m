@implementation NRPairingProxy

+ (id)machServiceName
{
  return CFSTR("com.apple.nano.nanoregistry.paireddeviceregistry");
}

+ (id)clientRemoteObjectInterface
{
  if (qword_1ECE238B8 != -1)
    dispatch_once(&qword_1ECE238B8, &__block_literal_global_166);
  return (id)qword_1ECE238B0;
}

+ (id)clientExportedInterface
{
  if (qword_1ECE238A8 != -1)
    dispatch_once(&qword_1ECE238A8, &__block_literal_global_165);
  return (id)qword_1ECE238A0;
}

void __41__NRPairingProxy_clientExportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D43E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE238A0;
  qword_1ECE238A0 = v0;

}

void __45__NRPairingProxy_clientRemoteObjectInterface__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D2428);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE238B0;
  qword_1ECE238B0 = v0;

  v2 = (void *)qword_1ECE238B0;
  +[NRMutableDeviceProperty enclosedClassTypes](NRMutableDeviceProperty, "enclosedClassTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_xpcRetrieveSecureProperties_block_, 0, 1);

  v4 = (void *)qword_1ECE238B0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_xpcClientInfo_, 0, 1);

  v8 = (void *)qword_1ECE238B0;
  +[NRSecureDevicePropertyStore enclosedClassTypes](NRSecureDevicePropertyStore, "enclosedClassTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_xpcGetDiffSinceTokenValue_getSecureProperties_withBlock_, 1, 1);

}

void __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_2;
  v4[3] = &unk_1E4495668;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcRetriggerUnpairInfoDialogWithBlock:", v4);

}

- (void)xpcRetriggerUnpairInfoDialogWithBlock:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[5];
  id v14;

  v5 = a3;
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, 0);
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v14 = v5;
    v7 = v5;
    dispatch_async(v6, block);

    v8 = v14;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_4;
    v11[3] = &unk_1E4494F90;
    v12 = v5;
    v10 = v5;
    objc_msgSend(v9, "runCompletionBlock:", v11);

    v8 = v12;
  }

}

- (id)pairingQueue
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "target");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "pairingQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)pairingServicesDelegate
{
  if (a1)
  {
    objc_msgSend(a1, "target");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)serverExportedInterface
{
  if (qword_1ECE23888 != -1)
    dispatch_once(&qword_1ECE23888, &__block_literal_global_1);
  return (id)_MergedGlobals_7;
}

void __41__NRPairingProxy_serverExportedInterface__block_invoke()
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D2428);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = v0;

  v2 = (void *)_MergedGlobals_7;
  +[NRSecureDevicePropertyStore enclosedClassTypes](NRSecureDevicePropertyStore, "enclosedClassTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_xpcRetrieveSecureProperties_block_, 0, 0);

  v4 = (void *)_MergedGlobals_7;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_xpcUnpairWithDeviceID_withOptions_operationHasBegun_, 1, 0);

  v8 = (void *)_MergedGlobals_7;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun_, 2, 0);

  v12 = (void *)_MergedGlobals_7;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14, v16, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun_, 1, 0);

}

+ (id)serverRemoteObjectInterface
{
  if (qword_1ECE23898 != -1)
    dispatch_once(&qword_1ECE23898, &__block_literal_global_158);
  return (id)qword_1ECE23890;
}

void __45__NRPairingProxy_serverRemoteObjectInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D43E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE23890;
  qword_1ECE23890 = v0;

}

- (void)xpcCompanionOOBDiscoverAndPairWithName:(id)a3 withOutOfBandPairingKey:(id)a4 withOptions:(id)a5 operationHasBegun:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke;
    block[3] = &unk_1E44955A0;
    block[4] = self;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v22;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4;
    v19[3] = &unk_1E4494F90;
    v20 = v13;
    v18 = v13;
    objc_msgSend(v17, "runCompletionBlock:", v19);

    v16 = v20;
  }

}

void __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillBeginPairing:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2;
  v7[3] = &unk_1E4494E30;
  v6 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v3, "xpcCompanionOOBDiscoverAndPairWithName:withOutOfBandPairingKey:withOptions:operationHasBegun:", v6, v4, v5, v7);

}

void __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __111__NRPairingProxy_xpcCompanionOOBDiscoverAndPairWithName_withOutOfBandPairingKey_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcCompanionPasscodePairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke;
    block[3] = &unk_1E44955C8;
    block[4] = self;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    v12 = v10;
    dispatch_async(v11, block);

    v13 = v19;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_4;
    v16[3] = &unk_1E4494F90;
    v17 = v10;
    v15 = v10;
    objc_msgSend(v14, "runCompletionBlock:", v16);

    v13 = v17;
  }

}

void __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillBeginPairing:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_2;
  v6[3] = &unk_1E4494E30;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "xpcCompanionPasscodePairWithDeviceID:withOptions:operationHasBegun:", v4, v5, v6);

}

void __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__NRPairingProxy_xpcCompanionPasscodePairWithDeviceID_withOptions_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcGizmoOOBAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillBeginPairing:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
  v5[3] = &unk_1E4494E30;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "xpcGizmoOOBAdvertiseAndPairWithName:operationHasBegun:", v4, v5);

}

void __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__NRPairingProxy_xpcGizmoOOBAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcGizmoPasscodeAdvertiseAndPairWithName:(id)a3 operationHasBegun:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillBeginPairing:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2;
  v5[3] = &unk_1E4494E30;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "xpcGizmoPasscodeAdvertiseAndPairWithName:operationHasBegun:", v4, v5);

}

void __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__NRPairingProxy_xpcGizmoPasscodeAdvertiseAndPairWithName_operationHasBegun___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcPairingClientSetAltAccountName:(id)a3 altDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke;
    block[3] = &unk_1E44955A0;
    block[4] = self;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v22;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_4;
    v19[3] = &unk_1E4494F90;
    v20 = v13;
    v18 = v13;
    objc_msgSend(v17, "runCompletionBlock:", v19);

    v16 = v20;
  }

}

void __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_2;
  v6[3] = &unk_1E4494E30;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "xpcPairingClientSetAltAccountName:altDSID:forPairingID:completion:", v5, v3, v4, v6);

}

void __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __84__NRPairingProxy_xpcPairingClientSetAltAccountName_altDSID_forPairingID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcPairingClientSetPairingParentName:(id)a3 pairingParentAltDSID:(id)a4 forPairingID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke;
    block[3] = &unk_1E44955A0;
    block[4] = self;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = v13;
    v15 = v13;
    dispatch_async(v14, block);

    v16 = v22;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_4;
    v19[3] = &unk_1E4494F90;
    v20 = v13;
    v18 = v13;
    objc_msgSend(v17, "runCompletionBlock:", v19);

    v16 = v20;
  }

}

void __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_2;
  v6[3] = &unk_1E4494E30;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "xpcPairingClientSetPairingParentName:pairingParentAltDSID:forPairingID:completion:", v5, v3, v4, v6);

}

void __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __100__NRPairingProxy_xpcPairingClientSetPairingParentName_pairingParentAltDSID_forPairingID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcWatchNeedsGraduation:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke;
    v6[3] = &unk_1E4495668;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_2;
  v4[3] = &unk_1E4495640;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcWatchNeedsGraduation:", v4);

}

void __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_3;
  v5[3] = &unk_1E4495618;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "runCompletionBlock:", v5);

}

uint64_t __42__NRPairingProxy_xpcWatchNeedsGraduation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)xpcClearWatchNeedsGraduation:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke;
    v6[3] = &unk_1E4495668;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcClearWatchNeedsGraduation:", v4);

}

void __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __47__NRPairingProxy_xpcClearWatchNeedsGraduation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)xpcSetWatchNeedsGraduation:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  nr_daemon_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    nr_daemon_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "xpcSetWatchNeedsGraduation - framework", buf, 2u);
    }

  }
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke;
    v9[3] = &unk_1E4495668;
    v9[4] = self;
    v10 = v4;
    dispatch_async(v8, v9);

  }
}

void __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  nr_daemon_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    nr_daemon_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0BDB000, v4, OS_LOG_TYPE_ERROR, "dispatch xpcSetWatchNeedsGraduation - framework", buf, 2u);
    }

  }
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_175;
  v7[3] = &unk_1E4494E30;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v5, "xpcSetWatchNeedsGraduation:", v7);

}

void __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_175(uint64_t a1, void *a2)
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
  v7[2] = __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_2;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __45__NRPairingProxy_xpcSetWatchNeedsGraduation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)xpcWatchBuddyCompletedSetupSteps:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  uint8_t buf[16];

  v4 = a3;
  nr_daemon_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    nr_daemon_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_ERROR, "xpcWatchBuddyCompletedSetupSteps - framework", buf, 2u);
    }

  }
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v16 = v4;
    v9 = v4;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_3;
    v13[3] = &unk_1E4494F90;
    v14 = v4;
    v12 = v4;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  nr_daemon_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    nr_daemon_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0BDB000, v4, OS_LOG_TYPE_ERROR, "dispatch xpcWatchBuddyCompletedSetupSteps - framework", buf, 2u);
    }

  }
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_176;
  v7[3] = &unk_1E4494E30;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v5, "xpcWatchBuddyCompletedSetupSteps:", v7);

}

void __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_176(uint64_t a1, void *a2)
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
  v7[2] = __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_2;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __51__NRPairingProxy_xpcWatchBuddyCompletedSetupSteps___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    nrGetPairingError(0x14uLL);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)xpcBeginMigrationWithDeviceID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcBeginMigrationWithDeviceID:completion:", v3, v4);

}

void __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__NRPairingProxy_xpcBeginMigrationWithDeviceID_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcBeginMigrationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcBeginMigrationWithCompletion:", v4);

}

void __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __50__NRPairingProxy_xpcBeginMigrationWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcAbortPairingReason:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[4];
  _QWORD v18[2];
  id v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reason=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, v9);

  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke;
    block[3] = &unk_1E44955F0;
    v11 = (id *)v18;
    v18[0] = v7;
    v18[1] = self;
    v19 = v8;
    v12 = v8;
    dispatch_async(v10, block);

  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_2;
    v15[3] = &unk_1E4494F90;
    v11 = &v16;
    v16 = v8;
    v14 = v8;
    objc_msgSend(v13, "runCompletionBlock:", v15);

  }
}

void __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke(id *a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!CFPreferencesGetAppBooleanValue(CFSTR("ignoreSharingdRequestsToAbortPairing"), CFSTR("com.apple.NanoRegistry"), 0)|| !objc_msgSend(a1[4], "hasPrefix:", CFSTR("com.apple.sharingd.")))
  {
    -[NRPairingProxy pairingServicesDelegate](a1[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "proxyWillAbortPairing:", a1[5]);

    -[NRPairingProxy pairingServicesDelegate](a1[5]);
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject xpcAbortPairingReason:withBlock:](v4, "xpcAbortPairingReason:withBlock:", a1[4], a1[6]);
LABEL_7:

    goto LABEL_8;
  }
  nr_daemon_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    nr_daemon_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "appPath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1[4];
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1A0BDB000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ called abort pairing with reason %{public}@; Ignoring since flag is set to ignore sharingd failures",
        buf,
        0x16u);

    }
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(a1[5], "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_185;
  v9[3] = &unk_1E4494F90;
  v10 = a1[6];
  objc_msgSend(v8, "runCompletionBlock:", v9);

}

uint64_t __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_185(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__NRPairingProxy_xpcAbortPairingReason_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcUnpairWithDeviceID:(id)a3 withOptions:(id)a4 operationHasBegun:(id)a5
{
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  unsigned int v50;
  NRPairingProxy *v51;
  __CFString *v52;
  _QWORD v53[4];
  __CFString *v54;
  _QWORD v55[5];
  __CFString *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("deviceID=%@ options=%@"), v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, v14);

  if (!-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRXPCProxy connection](self, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_3;
    v53[3] = &unk_1E4494F90;
    v54 = v11;
    v17 = v11;
    objc_msgSend(v16, "runCompletionBlock:", v53);

    v18 = v54;
    goto LABEL_42;
  }
  v52 = v11;
  v51 = self;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("obliterate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v50 = objc_msgSend(v15, "BOOLValue");
    else
      v50 = 1;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("brick"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v23, "BOOLValue"))
    {
      if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.unpairwithbrick")))
      {
        v49 = 1;
        goto LABEL_17;
      }
      nr_daemon_log();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        nr_daemon_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          -[NRXPCProxy appPath](self, "appPath");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = v47;
          v59 = 2112;
          v60 = CFSTR("com.apple.nano.nanoregistry.unpairwithbrick");
          v61 = 2112;
          v62 = CFSTR("brick");
          _os_log_error_impl(&dword_1A0BDB000, v26, OS_LOG_TYPE_ERROR, "%{public}@ needs entitlement %@ to enable %@", buf, 0x20u);

        }
      }
    }
    v49 = 0;
LABEL_17:
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("store"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    nr_daemon_log();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);

    if (v29)
    {
      nr_daemon_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        -[NRXPCProxy appPath](self, "appPath");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v46;
        v59 = 2112;
        v60 = v27;
        _os_log_error_impl(&dword_1A0BDB000, v30, OS_LOG_TYPE_ERROR, "%{public}@ valueID=%@", buf, 0x16u);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = -[__CFString BOOLValue](v27, "BOOLValue");
    else
      v20 = 0;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v31, "BOOLValue"))
    {
      if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nanoregistry.BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2")))
      {
        v19 = 1;
LABEL_33:
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("unpairAbortErrorReason"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v34;
        else
          v17 = 0;
        v21 = v49;

        v22 = v50;
        goto LABEL_37;
      }
      nr_daemon_log();
      v32 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);

      if (!v19)
        goto LABEL_33;
      nr_daemon_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        -[NRXPCProxy appPath](self, "appPath");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v48;
        v59 = 2112;
        v60 = CFSTR("com.apple.nanoregistry.BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2");
        v61 = 2112;
        v62 = CFSTR("BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2");
        _os_log_error_impl(&dword_1A0BDB000, v33, OS_LOG_TYPE_ERROR, "%{public}@ needs entitlement %@ to enable %@", buf, 0x20u);

      }
    }
    v19 = 0;
    goto LABEL_33;
  }
  v17 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 1;
LABEL_37:
  v35 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (__CFString *)objc_msgSend(v35, "initWithObjectsAndKeys:", v36, CFSTR("brick"), v37, CFSTR("obliterate"), v38, CFSTR("store"), v39, CFSTR("BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2"), 0);

  -[__CFString setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, CFSTR("unpairAbortErrorReason"));
  nr_daemon_log();
  v40 = objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

  if ((_DWORD)v38)
  {
    nr_daemon_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      -[NRXPCProxy appPath](v51, "appPath");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v45;
      v59 = 2112;
      v60 = v18;
      _os_log_error_impl(&dword_1A0BDB000, v41, OS_LOG_TYPE_ERROR, "%{public}@ options again=%@", buf, 0x16u);

    }
  }
  -[NRPairingProxy pairingServicesDelegate](v51);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "proxyWillBeginUnpairing:", v51);

  -[NRPairingProxy pairingServicesDelegate](v51);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke;
  v55[3] = &unk_1E4494E30;
  v55[4] = v51;
  v56 = v52;
  v44 = v52;
  objc_msgSend(v43, "xpcUnpairWithDeviceID:withOptions:operationHasBegun:", v9, v18, v55);

LABEL_42:
}

void __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_2;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70__NRPairingProxy_xpcUnpairWithDeviceID_withOptions_operationHasBegun___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcNotifyActivationCompleted:(id)a3 withSuccess:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  BOOL v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("deviceID=%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, v10);

  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NRPairingProxy_xpcNotifyActivationCompleted_withSuccess___block_invoke;
    block[3] = &unk_1E4495690;
    block[4] = self;
    v13 = v7;
    v14 = a4;
    dispatch_async(v11, block);

  }
}

void __59__NRPairingProxy_xpcNotifyActivationCompleted_withSuccess___block_invoke(uint64_t a1)
{
  id v2;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcNotifyActivationCompleted:withSuccess:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)xpcNotifyPasscode:(id)a3 withDeviceID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("deviceID=%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, v11);

  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__NRPairingProxy_xpcNotifyPasscode_withDeviceID___block_invoke;
    block[3] = &unk_1E4495008;
    block[4] = self;
    v14 = v7;
    v15 = v8;
    dispatch_async(v12, block);

  }
}

void __49__NRPairingProxy_xpcNotifyPasscode_withDeviceID___block_invoke(uint64_t a1)
{
  id v2;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcNotifyPasscode:withDeviceID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)xpcPairingShouldContinue
{
  NSObject *v3;
  _QWORD block[5];

  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__NRPairingProxy_xpcPairingShouldContinue__block_invoke;
    block[3] = &unk_1E4494FB8;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __42__NRPairingProxy_xpcPairingShouldContinue__block_invoke(uint64_t a1)
{
  id v1;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "xpcPairingShouldContinue");

}

- (void)xpcEnterCompatibilityState:(unsigned __int16)a3 withDeviceID:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  unsigned __int16 v10;

  v6 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__NRPairingProxy_xpcEnterCompatibilityState_withDeviceID___block_invoke;
    block[3] = &unk_1E44956B8;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

void __58__NRPairingProxy_xpcEnterCompatibilityState_withDeviceID___block_invoke(uint64_t a1)
{
  id v2;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcEnterCompatibilityState:withDeviceID:", *(unsigned __int16 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 isMagicSwitch:(BOOL)a4 operationHasCompleted:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  BOOL v24;

  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("deviceID=%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, v13);

  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke;
    block[3] = &unk_1E44956E0;
    block[4] = self;
    v24 = a4;
    v22 = v9;
    v23 = v10;
    v15 = v10;
    dispatch_async(v14, block);

    v16 = v22;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_4;
    v19[3] = &unk_1E4494F90;
    v20 = v10;
    v18 = v10;
    objc_msgSend(v17, "runCompletionBlock:", v19);

    v16 = v20;
  }

}

void __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillTakeSwitchAssertion:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_2;
  v6[3] = &unk_1E4494E30;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "xpcSwitchActiveDeviceWithDeviceID:isMagicSwitch:operationHasCompleted:", v5, v4, v6);

}

void __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __88__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_isMagicSwitch_operationHasCompleted___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcSwitchActiveDeviceWithDeviceID:(id)a3 withAssertionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[5];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("deviceID=%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, v11);

  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v20 = v7;
    v21 = v8;
    v13 = v8;
    dispatch_async(v12, block);

    v14 = v20;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_4;
    v17[3] = &unk_1E4494F90;
    v18 = v8;
    v16 = v8;
    objc_msgSend(v15, "runCompletionBlock:", v17);

    v14 = v18;
  }

}

void __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillTakeSwitchAssertion:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_2;
  v5[3] = &unk_1E4495730;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "xpcSwitchActiveDeviceWithDeviceID:withAssertionHandler:", v4, v5);

}

void __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  v11[2] = __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_3;
  v11[3] = &unk_1E4495708;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "runCompletionBlock:", v11);

}

uint64_t __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __73__NRPairingProxy_xpcSwitchActiveDeviceWithDeviceID_withAssertionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)xpcInvalidateSwitchAssertionWithIdentifier:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[5];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assertionID=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, v9);

  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v18 = v7;
    v19 = v8;
    v11 = v8;
    dispatch_async(v10, block);

    v12 = v18;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_4;
    v15[3] = &unk_1E4494F90;
    v16 = v8;
    v14 = v8;
    objc_msgSend(v13, "runCompletionBlock:", v15);

    v12 = v16;
  }

}

void __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillInvalidateSwitchAssertion:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_2;
  v5[3] = &unk_1E4494E30;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "xpcInvalidateSwitchAssertionWithIdentifier:block:", v4, v5);

}

void __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__NRPairingProxy_xpcInvalidateSwitchAssertionWithIdentifier_block___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(0x14uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcBeginDiscoveryWithBlock:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[5];
  id v14;

  v5 = a3;
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, 0);
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v14 = v5;
    v7 = v5;
    dispatch_async(v6, block);

    v8 = v14;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_4;
    v11[3] = &unk_1E4494F90;
    v12 = v5;
    v10 = v5;
    objc_msgSend(v9, "runCompletionBlock:", v11);

    v8 = v12;
  }

}

void __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillBeginDiscovering:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "xpcBeginDiscoveryWithBlock:", v5);

}

void __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__NRPairingProxy_xpcBeginDiscoveryWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcEndDiscoveryWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillEndDiscovering:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "xpcEndDiscoveryWithBlock:", v5);

}

void __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__NRPairingProxy_xpcEndDiscoveryWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcTriggerVersion4Workaround
{
  NSObject *v3;
  _QWORD block[5];

  -[NRPairingProxy pairingQueue](self);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NRPairingProxy_xpcTriggerVersion4Workaround__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__NRPairingProxy_xpcTriggerVersion4Workaround__block_invoke(uint64_t a1)
{
  id v1;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "xpcTriggerVersion4Workaround");

}

- (void)xpcSubmitAlbertPairingReport:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.internal")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_2;
  v4[3] = &unk_1E4495668;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcSubmitAlbertPairingReport:", v4);

}

void __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__NRPairingProxy_xpcSubmitAlbertPairingReport___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcSubmitRTCPairingMetricForMetricID:(id)a3 withSuccess:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.submitrtcpairingmetric")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_2;
  v4[3] = &unk_1E4494E58;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcSubmitRTCPairingMetricForMetricID:withSuccess:", v3, v4);

}

void __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_3;
  v9[3] = &unk_1E4495758;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "runCompletionBlock:", v9);

}

uint64_t __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __67__NRPairingProxy_xpcSubmitRTCPairingMetricForMetricID_withSuccess___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcPairingClientDidEnterPhase:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_2;
  v4[3] = &unk_1E4495668;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcPairingClientDidEnterPhase:withBlock:", v3, v4);

}

void __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__NRPairingProxy_xpcPairingClientDidEnterPhase_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcSuspendPairingClientCrashMonitoring:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[5];
  id v17;

  v5 = a3;
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, 0);
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingServicesDelegate](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "setPairingClientCrashMonitoringCache:proxy:", 1, self);

    if ((v7 & 1) != 0)
    {
      -[NRXPCProxy connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_4;
      v14[3] = &unk_1E4494F90;
      v15 = v5;
      objc_msgSend(v8, "runCompletionBlock:", v14);

      v9 = v15;
    }
    else
    {
      -[NRPairingProxy pairingQueue](self);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke;
      block[3] = &unk_1E4495668;
      block[4] = self;
      v17 = v5;
      dispatch_async(v11, block);

      v9 = v17;
    }
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_5;
    v12[3] = &unk_1E4494F90;
    v13 = v5;
    objc_msgSend(v10, "runCompletionBlock:", v12);

    v9 = v13;
  }

}

void __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyRequestsSuspensionOfCrashMonitoring:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "xpcSuspendPairingClientCrashMonitoring:", v5);

}

void __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__NRPairingProxy_xpcSuspendPairingClientCrashMonitoring___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcResumePairingClientCrashMonitoring:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[5];
  id v17;

  v5 = a3;
  -[NRRegistryProxy logCaller:args:](self, "logCaller:args:", a2, 0);
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingServicesDelegate](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "setPairingClientCrashMonitoringCache:proxy:", 0, self);

    if ((v7 & 1) != 0)
    {
      -[NRXPCProxy connection](self, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_4;
      v14[3] = &unk_1E4494F90;
      v15 = v5;
      objc_msgSend(v8, "runCompletionBlock:", v14);

      v9 = v15;
    }
    else
    {
      -[NRPairingProxy pairingQueue](self);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke;
      block[3] = &unk_1E4495668;
      block[4] = self;
      v17 = v5;
      dispatch_async(v11, block);

      v9 = v17;
    }
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_5;
    v12[3] = &unk_1E4494F90;
    v13 = v5;
    objc_msgSend(v10, "runCompletionBlock:", v12);

    v9 = v13;
  }

}

void __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyRequestsResumptionOfCrashMonitoring:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "xpcResumePairingClientCrashMonitoring:", v5);

}

void __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__NRPairingProxy_xpcResumePairingClientCrashMonitoring___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__NRPairingProxy_xpcRetriggerUnpairInfoDialogWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcActiveDeviceAssertions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_2;
  v4[3] = &unk_1E4495780;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcActiveDeviceAssertions:", v4);

}

void __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __44__NRPairingProxy_xpcActiveDeviceAssertions___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcPairWithSimulator:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcPairWithSimulator:withCompletion:", v3, v4);

}

void __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__NRPairingProxy_xpcPairWithSimulator_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(5uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcUnpairWithSimulator:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcUnpairWithSimulator:withCompletion:", v3, v4);

}

void __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__NRPairingProxy_xpcUnpairWithSimulator_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(5uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcSwitchToSimulator:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcSwitchToSimulator:withCompletion:", v3, v4);

}

void __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __54__NRPairingProxy_xpcSwitchToSimulator_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  nrGetPairingError(5uLL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)xpcPutMigrationChallengeCharacteristicWriteData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.ids.plugin")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_4;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_2;
  v4[3] = &unk_1E4495640;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcPutMigrationChallengeCharacteristicWriteData:completion:", v3, v4);

}

void __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_3;
  v5[3] = &unk_1E4495618;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v4, "runCompletionBlock:", v5);

}

uint64_t __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __77__NRPairingProxy_xpcPutMigrationChallengeCharacteristicWriteData_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcGetMigrationPairingCharacteristicReadDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.ids.plugin")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_2;
  v4[3] = &unk_1E44957A8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcGetMigrationPairingCharacteristicReadDataWithCompletion:", v4);

}

void __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __77__NRPairingProxy_xpcGetMigrationPairingCharacteristicReadDataWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcBeginMigrationWithDeviceID:(id)a3 passcode:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke;
    block[3] = &unk_1E44955C8;
    block[4] = self;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    v12 = v10;
    dispatch_async(v11, block);

    v13 = v19;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_4;
    v16[3] = &unk_1E4494F90;
    v17 = v10;
    v15 = v10;
    objc_msgSend(v14, "runCompletionBlock:", v16);

    v13 = v17;
  }

}

void __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "xpcBeginMigrationWithDeviceID:passcode:withBlock:", v3, v4, v5);

}

void __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_3;
  v3[3] = &unk_1E4494F90;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "runCompletionBlock:", v3);

}

uint64_t __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__NRPairingProxy_xpcBeginMigrationWithDeviceID_passcode_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcGetLastMigrationRequestPhoneNameWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_2;
  v4[3] = &unk_1E44957D0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcGetLastMigrationRequestPhoneNameWithCompletion:", v4);

}

void __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__NRPairingProxy_xpcGetLastMigrationRequestPhoneNameWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcKeepPhoneUnlockedInternalTestSPI:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NRPairingProxy pairingQueue](self);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke;
  v7[3] = &unk_1E4495668;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (_NRIsInternalInstall___onceToken != -1)
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  if (_NRIsInternalInstall___internalInstall
    && objc_msgSend(*(id *)(a1 + 32), "loudHasEntitlement:", CFSTR("com.apple.nanoregistry.unlock.assertion.test.5FB2508F-9F17-42C2-90A4-03E7817791D9")))
  {
    -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke_2;
    v5[3] = &unk_1E4495668;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v2, "xpcKeepPhoneUnlockedInternalTestSPI:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "runCompletionBlock:", *(_QWORD *)(a1 + 40));

  }
}

void __54__NRPairingProxy_xpcKeepPhoneUnlockedInternalTestSPI___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runCompletionBlock:", *(_QWORD *)(a1 + 40));

}

- (void)xpcPingActiveGizmoWithPriority:(int)a3 withMessageSize:(int64_t)a4 withBlock:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[5];
  id v17;
  int64_t v18;
  int v19;

  v8 = a5;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke;
    block[3] = &unk_1E4495848;
    v19 = a3;
    v17 = v8;
    v18 = a4;
    block[4] = self;
    v10 = v8;
    dispatch_async(v9, block);

    v11 = v17;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4;
    v14[3] = &unk_1E4494F90;
    v15 = v8;
    v13 = v8;
    objc_msgSend(v12, "runCompletionBlock:", v14);

    v11 = v15;
  }

}

void __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned int *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2;
  v6[3] = &unk_1E4495820;
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  objc_msgSend(v2, "xpcPingActiveGizmoWithPriority:withMessageSize:withBlock:", v3, v5, v6);

}

void __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_2(uint64_t a1, char a2, double a3, double a4)
{
  void *v8;
  _QWORD v9[4];
  id v10;
  double v11;
  double v12;
  char v13;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3;
  v9[3] = &unk_1E44957F8;
  v10 = *(id *)(a1 + 40);
  v13 = a2;
  v11 = a3;
  v12 = a4;
  objc_msgSend(v8, "runCompletionBlock:", v9);

}

uint64_t __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __75__NRPairingProxy_xpcPingActiveGizmoWithPriority_withMessageSize_withBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
}

- (void)xpcScanForMigratableWatchesWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke;
    v7[3] = &unk_1E4495668;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runCompletionBlock:", v4);

  }
}

void __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillBeginPushing:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "xpcScanForMigratableWatchesWithBlock:", v5);

}

void __55__NRPairingProxy_xpcScanForMigratableWatchesWithBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runCompletionBlock:", *(_QWORD *)(a1 + 40));

}

- (void)xpcStartWatchSetupPushWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke;
    v7[3] = &unk_1E4495668;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runCompletionBlock:", v4);

  }
}

void __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillBeginPushing:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "xpcStartWatchSetupPushWithBlock:", v5);

}

void __50__NRPairingProxy_xpcStartWatchSetupPushWithBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runCompletionBlock:", *(_QWORD *)(a1 + 40));

}

- (void)xpcStopWatchSetupPushWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke;
    v7[3] = &unk_1E4495668;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runCompletionBlock:", v4);

  }
}

void __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proxyWillEndPushing:", *(_QWORD *)(a1 + 32));

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke_2;
  v5[3] = &unk_1E4495668;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "xpcStopWatchSetupPushWithBlock:", v5);

}

void __49__NRPairingProxy_xpcStopWatchSetupPushWithBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runCompletionBlock:", *(_QWORD *)(a1 + 40));

}

- (void)xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2;
    v13[3] = &unk_1E4494F90;
    v14 = v7;
    v12 = v7;
    objc_msgSend(v11, "runCompletionBlock:", v13);

    v10 = v14;
  }

}

void __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke(uint64_t a1)
{
  id v2;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcWaitForWatchPairingExtendedMetadataForAdvertisedName:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __85__NRPairingProxy_xpcWaitForWatchPairingExtendedMetadataForAdvertisedName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcSubmitServerRequestReportWithRequestType:(id)a3 duration:(double)a4 errorCode:(unsigned int)a5 block:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  double v17;
  unsigned int v18;

  v10 = a3;
  v11 = a6;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke;
    block[3] = &unk_1E4495870;
    block[4] = self;
    v15 = v10;
    v17 = a4;
    v18 = a5;
    v16 = v11;
    dispatch_async(v12, block);

  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "runCompletionBlock:", v11);

  }
}

void __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 56);
  v4 = *(unsigned int *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke_2;
  v6[3] = &unk_1E4495668;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcSubmitServerRequestReportWithRequestType:duration:errorCode:block:", v5, v4, v6, v3);

}

void __87__NRPairingProxy_xpcSubmitServerRequestReportWithRequestType_duration_errorCode_block___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runCompletionBlock:", *(_QWORD *)(a1 + 40));

}

- (void)xpcCheckIfFlaggedForRecoveryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.internal")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E58;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcCheckIfFlaggedForRecoveryWithCompletion:", v4);

}

void __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_3;
  v9[3] = &unk_1E4495758;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "runCompletionBlock:", v9);

}

uint64_t __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __61__NRPairingProxy_xpcCheckIfFlaggedForRecoveryWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcClearRecoveryFlagWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.internal")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcClearRecoveryFlagWithCompletion:", v4);

}

void __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __53__NRPairingProxy_xpcClearRecoveryFlagWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcFakePairedSyncIsCompleteWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke;
    block[3] = &unk_1E4495668;
    block[4] = self;
    v13 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    v7 = v13;
  }
  else
  {
    -[NRXPCProxy connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_4;
    v10[3] = &unk_1E4494F90;
    v11 = v4;
    v9 = v4;
    objc_msgSend(v8, "runCompletionBlock:", v10);

    v7 = v11;
  }

}

void __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E30;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "xpcFakePairedSyncIsCompleteWithCompletion:", v4);

}

void __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v7[2] = __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_3;
  v7[3] = &unk_1E4494DE0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "runCompletionBlock:", v7);

}

uint64_t __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __60__NRPairingProxy_xpcFakePairedSyncIsCompleteWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)xpcTriggerTailspinFrom:(unint64_t)a3 forApp:(id)a4
{
  NSObject *v6;
  _QWORD v7[6];

  -[NRPairingProxy pairingQueue](self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NRPairingProxy_xpcTriggerTailspinFrom_forApp___block_invoke;
  v7[3] = &unk_1E4495898;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);

}

void __48__NRPairingProxy_xpcTriggerTailspinFrom_forApp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "appPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "xpcTriggerTailspinFrom:forApp:", v2, v4);

}

- (void)xpcGetLastSwitchIndex:(id)a3
{
  const __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t, _QWORD);

  v7 = (void (**)(id, uint64_t, _QWORD))a3;
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = (void *)CFPreferencesCopyValue(CFSTR("lastSwitchIndex"), CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), v3);
  v5 = v4;
  if (v4)
    v6 = (int)objc_msgSend(v4, "intValue");
  else
    v6 = 0;
  v7[2](v7, v6, 0);

}

- (void)xpcGetMigrationCountForPairingID:(id)a3 completion:(id)a4
{
  const __CFString *v5;
  void (**v6)(id, uint64_t, _QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = a3;
  CFPreferencesSynchronize(CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), v5);
  v10 = (id)CFPreferencesCopyValue(CFSTR("pairingIDMigrationCountDictionary"), CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), v5);
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, objc_msgSend(v9, "integerValue"), 0);
}

- (void)xpcGetInitialSyncCompletedForPairingID:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _BOOL8, _QWORD);
  const __CFString *v7;
  char *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _BOOL8, _QWORD))a4;
  v7 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v8 = (char *)CFPreferencesCopyValue(CFSTR("pairingIDInitialSyncSet"), CFSTR("com.apple.pairedsyncd"), CFSTR("mobile"), v7);
  nr_daemon_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    nr_daemon_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[NRPairingProxy xpcGetInitialSyncCompletedForPairingID:completion:]";
      v24 = 2114;
      v25 = (uint64_t)v12;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = CFSTR("com.apple.pairedsyncd");
      v30 = 2114;
      v31 = CFSTR("pairingIDInitialSyncSet");
      _os_log_impl(&dword_1A0BDB000, v11, OS_LOG_TYPE_DEFAULT, "%s[%{public}@]: retrieved %{public}@ from %{public}@/%{public}@", (uint8_t *)&v22, 0x34u);

    }
  }
  if (v8)
  {
    objc_msgSend(v5, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

  }
  else
  {
    v15 = 0;
  }
  nr_daemon_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    nr_daemon_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "UUIDString");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = "NO";
      v23 = "-[NRPairingProxy xpcGetInitialSyncCompletedForPairingID:completion:]";
      v22 = 136315650;
      if (v15)
        v21 = "YES";
      v24 = 2114;
      v25 = v19;
      v26 = 2080;
      v27 = v21;
      _os_log_impl(&dword_1A0BDB000, v18, OS_LOG_TYPE_DEFAULT, "%s[%{public}@]: returning hasCompleted=%s", (uint8_t *)&v22, 0x20u);

    }
  }
  v6[2](v6, v15, 0);

}

- (void)xpcIsPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

void __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_2;
  v4[3] = &unk_1E44958E8;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcIsPhoneReadyToMigrateDevice:withCompletion:", v3, v4);

}

void __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_3;
  v8[3] = &unk_1E44958C0;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "runCompletionBlock:", v8);

}

uint64_t __64__NRPairingProxy_xpcIsPhoneReadyToMigrateDevice_withCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)xpcIsAssertionActive:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke;
    block[3] = &unk_1E44955F0;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

void __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_2;
  v4[3] = &unk_1E4494E58;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "xpcIsAssertionActive:withCompletion:", v3, v4);

}

void __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_3;
  v9[3] = &unk_1E4495758;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "runCompletionBlock:", v9);

}

uint64_t __54__NRPairingProxy_xpcIsAssertionActive_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)xpcUpdateWatchBuddyStage:(unsigned int)a3 forPairingID:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  unsigned int v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[NRRegistryProxy loudHasEntitlement:](self, "loudHasEntitlement:", CFSTR("com.apple.nano.nanoregistry.pairunpairobliterate")))
  {
    -[NRPairingProxy pairingQueue](self);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NRPairingProxy_xpcUpdateWatchBuddyStage_forPairingID___block_invoke;
    block[3] = &unk_1E4495910;
    v13 = a3;
    block[4] = self;
    v12 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    nr_daemon_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      nr_daemon_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[NRPairingProxy xpcUpdateWatchBuddyStage:forPairingID:]";
        _os_log_error_impl(&dword_1A0BDB000, v10, OS_LOG_TYPE_ERROR, "%s client missing entitlement", buf, 0xCu);
      }

    }
  }

}

void __56__NRPairingProxy_xpcUpdateWatchBuddyStage_forPairingID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  nr_daemon_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    nr_daemon_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_DWORD *)(a1 + 48);
      v7 = 136315394;
      v8 = "-[NRPairingProxy xpcUpdateWatchBuddyStage:forPairingID:]_block_invoke";
      v9 = 1026;
      v10 = v5;
      _os_log_impl(&dword_1A0BDB000, v4, OS_LOG_TYPE_DEFAULT, "%s updating stage: %{public}d", (uint8_t *)&v7, 0x12u);
    }

  }
  -[NRPairingProxy pairingServicesDelegate](*(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "xpcUpdateWatchBuddyStage:forPairingID:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

@end
