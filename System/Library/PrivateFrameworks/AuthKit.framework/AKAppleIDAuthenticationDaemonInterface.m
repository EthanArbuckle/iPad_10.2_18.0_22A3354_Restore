@implementation AKAppleIDAuthenticationDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_12 != -1)
    dispatch_once(&XPCInterface_onceToken_12, &__block_literal_global_50);
  return (id)XPCInterface_interface_11;
}

void __54__AKAppleIDAuthenticationDaemonInterface_XPCInterface__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v72 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270F98);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)XPCInterface_interface_11;
  XPCInterface_interface_11 = v7;

  objc_msgSend((id)XPCInterface_interface_11, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_fetchUserInformationForAltDSID_completion_, 0, 1);
  v9 = (void *)XPCInterface_interface_11;
  objc_msgSend(v72, "setByAddingObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getUserInformationForAltDSID_completion_, 0, 1);

  objc_msgSend((id)XPCInterface_interface_11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getUserInformationWithContext_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_11, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_setConfigurationInfo_forIdentifier_forAltDSID_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_11, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_configurationInfoWithIdentifiers_forAltDSID_completion_, 0, 1);
  v71 = (void *)XPCInterface_interface_11;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  if (KeychainCircleLibraryCore())
    getKCAESGCMDuplexSessionClass();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_authenticateWithContext_completion_, 0, 1);

  v22 = (void *)XPCInterface_interface_11;
  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, v30, v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_deviceListWithContext_completion_, 0, 1);

  v33 = (void *)XPCInterface_interface_11;
  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_fetchAppListWithAltDSID_completion_, 0, 1);

  v40 = (void *)XPCInterface_interface_11;
  v41 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  objc_msgSend(v41, "setWithObjects:", v42, v43, v44, v45, v46, v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_performPasswordResetWithContext_completion_, 0, 1);

  v49 = (void *)XPCInterface_interface_11;
  v50 = (void *)MEMORY[0x1E0C99E60];
  v51 = objc_opt_class();
  v52 = objc_opt_class();
  v53 = objc_opt_class();
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  v57 = objc_opt_class();
  v58 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v51, v52, v53, v54, v55, v56, v57, v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_deleteDeviceListCacheWithContext_completion_, 0, 1);

  v60 = (void *)XPCInterface_interface_11;
  v61 = (void *)MEMORY[0x1E0C99E60];
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  v64 = objc_opt_class();
  v65 = objc_opt_class();
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  v68 = objc_opt_class();
  v69 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v62, v63, v64, v65, v66, v67, v68, v69, objc_opt_class(), 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setClasses:forSelector:argumentIndex:ofReply:", v70, sel_deleteDeviceListCacheWithCompletion_, 0, 1);

  objc_msgSend((id)XPCInterface_interface_11, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_fetchTokensWithAltDSID_tokenIdentifiers_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_11, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion_, 0, 1);

}

@end
