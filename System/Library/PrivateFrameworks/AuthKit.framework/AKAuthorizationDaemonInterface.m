@implementation AKAuthorizationDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_4 != -1)
    dispatch_once(&XPCInterface_onceToken_4, &__block_literal_global_18);
  return (id)XPCInterface_interface_4;
}

void __46__AKAuthorizationDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270C98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_4;
  XPCInterface_interface_4 = v0;

  v61 = (void *)MEMORY[0x1E0C99E60];
  v59 = objc_opt_class();
  v58 = objc_opt_class();
  v57 = objc_opt_class();
  v56 = objc_opt_class();
  v55 = objc_opt_class();
  v54 = objc_opt_class();
  v53 = objc_opt_class();
  v52 = objc_opt_class();
  v51 = objc_opt_class();
  v50 = objc_opt_class();
  v49 = objc_opt_class();
  v48 = objc_opt_class();
  v47 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v2, v3, v4, v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    objc_opt_class(),
    0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_performAuthorization_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_performAuthorization_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_performAuthorizationWithContext_withUserProvidedInformation_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_performAuthorizationWithContext_withUserProvidedInformation_completion_, 1, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_performAuthorizationWithContext_withUserProvidedInformation_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_beginAuthorizationWithContext_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_beginAuthorizationWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_continueAuthorizationWithContext_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_continueAuthorizationWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_cancelAuthorizationWithContext_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_cancelAuthorizationWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_continueFetchingIconForRequestContext_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_establishConnectionWithNotificationHandlerEndpoint_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_storeAuthorization_forProxiedRequest_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_storeAuthorization_forProxiedRequest_completion_, 1, 0);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_getCredentialStateForRequest_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_getCredentialStateForRequest_completion_, 0, 1);
  v15 = (void *)XPCInterface_interface_4;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getCredentialStateForClientID_completion_, 0, 0);

  v19 = (void *)XPCInterface_interface_4;
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getCredentialStateForClientID_completion_, 0, 1);

  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_startDiscoveryWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_4, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_revokeUpgradeWithContext_completion_, 0, 0);
  v24 = (void *)XPCInterface_interface_4;
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_fetchAppleIDAuthorizationURLSetWithCompletion_, 0, 1);

  v30 = (void *)XPCInterface_interface_4;
  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, v33, v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_fetchNativeTakeoverURLSetWithCompletion_, 0, 1);

  v36 = (void *)XPCInterface_interface_4;
  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_fetchAppleOwnedDomainSetWithCompletion_, 0, 1);

  v42 = (void *)XPCInterface_interface_4;
  v43 = (void *)MEMORY[0x1E0C99E60];
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  objc_msgSend(v43, "setWithObjects:", v44, v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion_, 0, 1);

}

@end
