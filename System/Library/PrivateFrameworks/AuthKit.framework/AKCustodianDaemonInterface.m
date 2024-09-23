@implementation AKCustodianDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_1);
  return (id)XPCInterface_interface;
}

void __42__AKCustodianDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE267C70);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_initiateCustodianSetupWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_finalizeCustodianSetupWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_revokeCustodianWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_startCustodianRecoveryRequestWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_fetchCustodianRecoveryCodeConfigurationWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_startCustodianRecoveryTransactionWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_fetchCustodianDataRecoveryKeyWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_performTrustedContactsDataSync_completion_, 0, 1);

}

@end
