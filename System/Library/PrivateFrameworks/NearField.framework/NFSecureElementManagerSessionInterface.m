@implementation NFSecureElementManagerSessionInterface

+ (id)interface
{
  id v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  id v36;
  void *v37;

  objc_opt_self();
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v37 = (void *)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v36 = objc_alloc(MEMORY[0x1E0C99E60]);
  v35 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = (void *)objc_msgSend(v36, "initWithObjects:", v35, v7, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = (void *)objc_msgSend(v17, "initWithObjects:", v18, v19, objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40DF98);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_deleteApplets_completion_, 0, 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_getAppletsWithCompletion_, 0, 1);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_deleteApplets_completion_, 0, 1);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_deleteAllAppletsWithCompletion_, 0, 1);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_signChallenge_useOSVersion_completion_, 1, 1);

  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_getFelicaAppletState_completion_, 0, 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getFelicaAppletState_completion_, 0, 1);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_getTransitAppletState_completion_, 0, 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getTransitAppletState_completion_, 0, 1);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_getServiceProviderDataForApplet_publicKey_scheme_completion_, 0, 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getServiceProviderDataForApplet_publicKey_scheme_completion_, 0, 1);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_disableAuthorizationForApplets_andKey_authorization_completion_, 0, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_disableAuthorizationForApplets_andKey_authorization_completion_, 1, 0);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_disableAuthorizationForApplets_andKey_authorization_completion_, 2, 0);

  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_restoreAuthorizationForAllAppletsExcept_completion_, 0, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_performPeerPaymentEnrollment_completion_, 0, 0);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_performPeerPaymentEnrollment_completion_, 0, 1);

  objc_msgSend(v16, "setByAddingObject:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_dumpDomain_forSEID_completion_, 0, 1);

  v28 = objc_alloc(MEMORY[0x1E0C99E60]);
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = (void *)objc_msgSend(v28, "initWithObjects:", v29, v30, v31, v32, objc_opt_class(), 0);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_execRemoteAdminScript_params_completion_, 1, 0);

  return v21;
}

@end
