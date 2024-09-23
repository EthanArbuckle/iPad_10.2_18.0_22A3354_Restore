@implementation FPDaemonActionOperationXPCInterface

void __FPDaemonActionOperationXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F8280);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FPDaemonActionOperationXPCInterface_interface;
  FPDaemonActionOperationXPCInterface_interface = v0;

  v2 = (void *)FPDaemonActionOperationXPCInterface_interface;
  FPDaemonActionOperationClientXPCInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_registerFrameworkClient_operationCompletion_, 0, 0);

  v4 = (void *)FPDaemonActionOperationXPCInterface_interface;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_registerFrameworkClient_operationCompletion_, 0, 1);

  v9 = (void *)FPDaemonActionOperationXPCInterface_interface;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_registerFrameworkClient_operationCompletion_, 1, 1);

}

@end
