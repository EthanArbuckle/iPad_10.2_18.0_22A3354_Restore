@implementation NFHardwareManagerInterface

void __39__NFHardwareManagerInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E178);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_20;
  _MergedGlobals_20 = v0;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v82 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  objc_msgSend((id)_MergedGlobals_20, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_checkExpressPassCompatibilityDeprecated_callback_, 0, 0);
  objc_msgSend((id)_MergedGlobals_20, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_checkExpressPassCompatibility_callback_, 0, 0);
  v11 = (void *)_MergedGlobals_20;
  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_secureElementsWithCompletion_, 0, 1);

  objc_opt_self();
  if (qword_1ECFF6260 != -1)
    dispatch_once(&qword_1ECFF6260, &__block_literal_global_307);
  v81 = (id)qword_1ECFF6258;
  objc_msgSend((id)_MergedGlobals_20, "setInterface:forSelector:argumentIndex:ofReply:", v81, sel_registerForCallbacks_, 0, 0);
  objc_msgSend((id)_MergedGlobals_20, "setInterface:forSelector:argumentIndex:ofReply:", v81, sel_unregisterForCallbacks_, 0, 0);
  v15 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3FE7D8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_queueSecureElementManagerSession_sessionAttribute_completion_, 0, 0);

  +[NFContactlessPaymentSessionCallbacks interface]();
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_20, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_queueContactlessPaymentSession_sessionAttribute_completion_, 0, 0);
  v79 = (void *)v17;
  objc_msgSend((id)_MergedGlobals_20, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_queueLoyaltyAndPaymentSession_sessionAttribute_completion_, 0, 0);
  +[NFContactlessSessionCallbacks interface](NFContactlessSessionCallbacks, "interface");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_20, "setInterface:forSelector:argumentIndex:ofReply:", v80);
  v18 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE400D48);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInterface:forSelector:argumentIndex:ofReply:", v19);

  v20 = (void *)_MergedGlobals_20;
  +[NFFieldDetectSessionInterfaceCallbacks interface](NFFieldDetectSessionInterfaceCallbacks, "interface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInterface:forSelector:argumentIndex:ofReply:", v21);

  v22 = (void *)_MergedGlobals_20;
  +[NFReaderSessionCallbacks interface](NFReaderSessionCallbacks, "interface");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInterface:forSelector:argumentIndex:ofReply:", v23, sel_queueReaderSessionInternal_sessionAttribute_completion_, 0, 0);

  v24 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE405320);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInterface:forSelector:argumentIndex:ofReply:", v25, sel_queueSeshatSession_sessionAttribute_completion_, 0, 0);

  v26 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E1D8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setInterface:forSelector:argumentIndex:ofReply:", v27);

  v28 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E238);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInterface:forSelector:argumentIndex:ofReply:", v29);

  v30 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE405CA0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setInterface:forSelector:argumentIndex:ofReply:", v31, sel_queueNdefTagSession_sessionAttribute_data_completion_, 0, 0);

  v32 = (void *)_MergedGlobals_20;
  +[NFHostEmulationSessionCallbacks interface](NFHostEmulationSessionCallbacks, "interface");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setInterface:forSelector:argumentIndex:ofReply:", v33, sel_queueHostEmulationSession_sessionAttribute_completion_, 0, 0);

  v34 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E298);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setInterface:forSelector:argumentIndex:ofReply:", v35, sel_queueSecureElementAndHostEmulationSession_sessionAttribute_completion_, 0, 0);

  v36 = (void *)_MergedGlobals_20;
  +[NFSecureElementReaderSessionCallbacks interface](NFSecureElementReaderSessionCallbacks, "interface");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setInterface:forSelector:argumentIndex:ofReply:", v37, sel_queueSecureElementReaderSession_sessionAttribute_completion_, 0, 0);

  v38 = (void *)_MergedGlobals_20;
  +[NFSecureTransactionServicesHandoverSessionCallbacksInterface interface](NFSecureTransactionServicesHandoverSessionCallbacksInterface, "interface");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setInterface:forSelector:argumentIndex:ofReply:", v39, sel_queueSecureTransactionServicesSession_sessionAttribute_completion_, 0, 0);

  v40 = (void *)_MergedGlobals_20;
  +[NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface interface](NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface, "interface");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setInterface:forSelector:argumentIndex:ofReply:", v41, sel_queueSecureTransactionServicesHybridSession_sessionAttribute_completion_, 0, 0);

  objc_msgSend((id)_MergedGlobals_20, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_queueUnifiedAccessSession_sessionAttribute_completion_, 0, 0);
  v42 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4088D8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInterface:forSelector:argumentIndex:ofReply:", v43, sel_queueSecureElementLoggingSession_sessionAttribute_completion_, 0, 0);

  v44 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E2F8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setInterface:forSelector:argumentIndex:ofReply:", v45, sel_queueLPEMConfigSession_sessionAttribute_completion_, 0, 0);

  v46 = (void *)_MergedGlobals_20;
  +[NFECommercePaymentSessionInterface interface](NFECommercePaymentSessionInterface, "interface");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setInterface:forSelector:argumentIndex:ofReply:", v47, sel_queueECommercePaymentSession_sessionAttribute_completion_, 0, 1);

  v48 = (void *)_MergedGlobals_20;
  +[NFContactlessSessionInterface interface](NFContactlessSessionInterface, "interface");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setInterface:forSelector:argumentIndex:ofReply:", v49, sel_queueContactlessSession_sessionAttribute_completion_, 0, 1);

  v50 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E358);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setInterface:forSelector:argumentIndex:ofReply:", v51, sel_queueFieldDetectSession_sessionAttribute_completion_, 0, 1);

  v52 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E3B8);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setInterface:forSelector:argumentIndex:ofReply:", v53, sel_queuePeerPaymentSession_sessionAttribute_completion_, 0, 1);

  v54 = (void *)_MergedGlobals_20;
  +[NFTrustSessionInterface interface](NFTrustSessionInterface, "interface");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setInterface:forSelector:argumentIndex:ofReply:", v55, sel_queueTrustSession_sessionAttribute_completion_, 0, 1);

  v56 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E418);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setInterface:forSelector:argumentIndex:ofReply:", v57, sel_queueNdefTagSession_sessionAttribute_data_completion_, 0, 1);

  v58 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40B7D8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setInterface:forSelector:argumentIndex:ofReply:", v59, sel_queueHostEmulationSession_sessionAttribute_completion_, 0, 1);

  v60 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E478);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setInterface:forSelector:argumentIndex:ofReply:", v61, sel_queueSecureElementAndHostEmulationSession_sessionAttribute_completion_, 0, 1);

  v62 = (void *)_MergedGlobals_20;
  +[NFSecureElementReaderSessionInterface interface](NFSecureElementReaderSessionInterface, "interface");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_queueSecureElementReaderSession_sessionAttribute_completion_, 0, 1);

  v64 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E0B8);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setInterface:forSelector:argumentIndex:ofReply:", v65, sel_queueSecureElementLoggingSession_sessionAttribute_completion_, 0, 1);

  v66 = (void *)_MergedGlobals_20;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E4D8);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setInterface:forSelector:argumentIndex:ofReply:", v67, sel_queueLPEMConfigSession_sessionAttribute_completion_, 0, 1);

  v68 = (void *)_MergedGlobals_20;
  v69 = objc_alloc(MEMORY[0x1E0C99E60]);
  v70 = objc_opt_class();
  v71 = objc_opt_class();
  v72 = objc_opt_class();
  v73 = objc_opt_class();
  v74 = objc_opt_class();
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  v77 = objc_opt_class();
  v78 = (void *)objc_msgSend(v69, "initWithObjects:", v70, v71, v72, v73, v74, v75, v76, v77, objc_opt_class(), 0);
  objc_msgSend(v68, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_stateInfoWithCompletion_, 0, 1);

}

+ (id)interface
{
  objc_opt_self();
  if (qword_1ECFF6250 != -1)
    dispatch_once(&qword_1ECFF6250, &__block_literal_global_8);
  return (id)_MergedGlobals_20;
}

+ (void)updateSEMInterface:(uint64_t)a1
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_self();
  +[NFSecureElementManagerSessionInterface interface]();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_queueSecureElementManagerSession_sessionAttribute_completion_, 0, 1);

}

+ (void)updateSeshatInterface:(uint64_t)a1
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_self();
  +[NFSeshatSessionInterface interface]();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_queueSeshatSession_sessionAttribute_completion_, 0, 1);

}

+ (void)updateReaderInterface:(uint64_t)a1
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_self();
  +[NFReaderSessionInternalInterface interface]();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_queueReaderSessionInternal_sessionAttribute_completion_, 0, 1);

}

+ (void)updateContactlessInterface:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_self();
  +[NFContactlessPaymentSessionInterface interface]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_queueContactlessPaymentSession_sessionAttribute_completion_, 0, 1);

  +[NFContactlessPaymentSessionInterface interface]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_queueLoyaltyAndPaymentSession_sessionAttribute_completion_, 0, 1);

  +[NFContactlessPaymentSessionInterface interface]();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_queueUnifiedAccessSession_sessionAttribute_completion_, 0, 1);

}

+ (void)updateHandoverInterface:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_self();
  +[NFSecureTransactionServicesHandoverSessionInterface interface](NFSecureTransactionServicesHandoverSessionInterface, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_queueSecureTransactionServicesSession_sessionAttribute_completion_, 0, 1);

  +[NFSecureTransactionServicesHandoverHybridSessionInterface interface](NFSecureTransactionServicesHandoverHybridSessionInterface, "interface");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_queueSecureTransactionServicesHybridSession_sessionAttribute_completion_, 0, 1);

}

@end
