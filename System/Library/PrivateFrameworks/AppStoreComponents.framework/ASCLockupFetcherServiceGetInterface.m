@implementation ASCLockupFetcherServiceGetInterface

void __ASCLockupFetcherServiceGetInterface_block_invoke()
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4CF5D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  ASCLockupFetcherServiceGetInterface_interface = v0;

  v2 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getLockupWithRequest_withReplyHandler_, 0, 0);

  v4 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  ASCLockupFeatureGetClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getLockupWithRequest_withReplyHandler_, 0, 1);

  v7 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getLockupWithRequest_withReplyHandler_, 1, 1);

  v9 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getLockupsWithRequest_withReplyHandler_, 0, 0);

  v11 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  ASCLockupFeatureGetClasses();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getLockupsWithRequest_withReplyHandler_, 0, 1);

  v15 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getLockupsWithRequest_withReplyHandler_, 1, 1);

  v17 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getLockupCollectionWithRequest_withReplyHandler_, 0, 0);

  v19 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0, v34, v35);
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_getLockupCollectionWithRequest_withReplyHandler_, 0, 1);

  v23 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_getLockupCollectionWithRequest_withReplyHandler_, 1, 1);

  v25 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_, 0, 0);

  v27 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_, 1, 0);

  v29 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  ASCLockupFeatureGetClasses();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setByAddingObject:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_, 0, 1);

  v32 = (void *)ASCLockupFetcherServiceGetInterface_interface;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_getLockupForBundleID_withContext_enableAppDistribution_withReplyHandler_, 1, 1);

}

@end
