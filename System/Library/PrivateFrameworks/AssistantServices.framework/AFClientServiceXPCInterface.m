@implementation AFClientServiceXPCInterface

void __AFClientServiceXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4326D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFClientServiceXPCInterface_interface;
  AFClientServiceXPCInterface_interface = v0;

  v2 = (void *)AFClientServiceXPCInterface_interface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_setOverriddenApplicationContext_withContext_, 1, 0);

  v10 = (void *)AFClientServiceXPCInterface_interface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_setApplicationContextForApplicationInfos_withRefId_, 0, 0);

  v14 = (void *)AFClientServiceXPCInterface_interface;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_fetchAppicationContextForApplicationInfo_supplementalContext_refID_, 0, 0);

  v18 = (void *)AFClientServiceXPCInterface_interface;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_fetchAppicationContextForApplicationInfo_supplementalContext_refID_, 1, 0);

  v22 = (void *)AFClientServiceXPCInterface_interface;
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getDeferredObjectsWithIdentifiers_completion_, 0, 0);

  v26 = (void *)AFClientServiceXPCInterface_interface;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_getDeferredObjectsWithIdentifiers_completion_, 0, 1);

  v30 = (void *)AFClientServiceXPCInterface_interface;
  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, v33, v34, objc_opt_class(), 0);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_recordUIMetrics_, 0, 0);

}

@end
