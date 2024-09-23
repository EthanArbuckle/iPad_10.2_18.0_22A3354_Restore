@implementation CKKSSetupControlProtocol

void __CKKSSetupControlProtocol_block_invoke()
{
  void (*v0)(void);
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (initCloudKit_onceToken != -1)
    dispatch_once(&initCloudKit_onceToken, &__block_literal_global_35);
  v0 = (void (*)(void))dlsym((void *)cloudKit, "CKAcceptableValueClasses");
  if (!v0)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "symbol %s is missing", "CKAcceptableValueClasses");
    abort();
  }
  v1 = (void *)MEMORY[0x1E0C99E20];
  v0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithSet:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)CKKSSetupControlProtocol_errClasses;
  CKKSSetupControlProtocol_errClasses = v3;

  v5 = (void *)CKKSSetupControlProtocol_errClasses;
  +[SecXPCHelper safeErrorClasses](SecXPCHelper, "safeErrorClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)CKKSSetupControlProtocol_tlkArrayClasses;
  CKKSSetupControlProtocol_tlkArrayClasses = v9;

  v11 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)CKKSSetupControlProtocol_tlkShareArrayClasses;
  CKKSSetupControlProtocol_tlkShareArrayClasses = v13;

}

@end
