@implementation IXClientProtocolInterface

- (IXClientProtocolInterface)init
{
  IXClientProtocolInterface *result;

  result = (IXClientProtocolInterface *)_os_crash();
  __break(1u);
  return result;
}

+ (id)new
{
  id result;

  result = (id)_os_crash();
  __break(1u);
  return result;
}

+ (id)interface
{
  id v2;
  void *WeakRetained;
  void *v4;
  void *v5;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&interface_weakInterface_0);
  if (!WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend(v2, "interfaceProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceWithProtocol:", v5);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "configureInterface:", WeakRetained);
    objc_storeWeak(&interface_weakInterface_0, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &unk_1EE795150;
}

+ (void)configureInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__remote_fetchSeedsForCoordinatorsWithIntent_completion_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel__remote_registerObserverMachServiceName_forClientIdentifiers_respondingToSelectors_, 1, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel__remote_registerTransientObserver_forClientIdentifiers_respondingToSelectors_, 1, 0);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel__remote_addObserversForCoordinatorsWithUUIDs_fireObserverMethods_, 0, 0);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel__remote_addObserversForDataPromisesWithUUIDs_, 0, 0);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel__remote_IXSCoordinatedAppInstall_setInitialODRAssetPromiseUUIDs_completion_, 1, 0);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel__remote_IXSCoordinatedAppInstall_setEssentialAssetPromiseUUIDs_completion_, 1, 0);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel__remote_IXSCoordinatedAppInstall_getInitialODRAssetPromises_, 0, 1);

  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel__remote_IXSCoordinatedAppInstall_getEssentialAssetPromises_, 0, 1);

  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel__remote_IXSPlaceholder_setAppExtensionPlaceholderPromiseUUIDs_completion_, 1, 0);

  v36 = (void *)MEMORY[0x1E0C99E60];
  v37 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel__remote_IXSPlaceholder_getAppExtensionPlaceholderPromises_, 0, 1);

  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel__remote_removabilityDataWithCompletion_, 0, 1);

}

@end
