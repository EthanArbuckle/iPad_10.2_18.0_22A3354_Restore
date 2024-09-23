@implementation AACustodianDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_2 != -1)
    dispatch_once(&XPCInterface_onceToken_2, &__block_literal_global_25);
  return (id)XPCInterface_interface_2;
}

void __42__AACustodianDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE54EF58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_2;
  XPCInterface_interface_2 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v111 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)XPCInterface_interface_2;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_setupCustodianshipWithContext_completion_, 0, 0);

  v15 = (void *)XPCInterface_interface_2;
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_setupCustodianshipWithContext_completion_, 0, 1);

  v20 = (void *)XPCInterface_interface_2;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_fetchCachedTrustedContactsWithCompletion_, 0, 1);

  v26 = (void *)XPCInterface_interface_2;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, v29, v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_fetchTrustedContactsWithCompletion_, 0, 1);

  v32 = (void *)XPCInterface_interface_2;
  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_fetchCustodianshipInfoWithUUID_completion_, 0, 0);

  v36 = (void *)XPCInterface_interface_2;
  v37 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_fetchCustodianshipInfoWithUUID_completion_, 0, 1);

  v41 = (void *)XPCInterface_interface_2;
  v42 = (void *)MEMORY[0x1E0C99E60];
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, v44, v45, objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_fetchCustodianshipInfoWithCompletion_, 0, 1);

  v47 = (void *)XPCInterface_interface_2;
  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, v50, v51, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_fetchSuggestedCustodiansWithCompletion_, 0, 1);

  v53 = (void *)XPCInterface_interface_2;
  v54 = (void *)MEMORY[0x1E0C99E60];
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  v57 = objc_opt_class();
  objc_msgSend(v54, "setWithObjects:", v55, v56, v57, objc_opt_class(), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setClasses:forSelector:argumentIndex:ofReply:", v58, sel_fetchCustodianHealthStatusWithCompletion_, 0, 1);

  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v110, sel_respondToInviteWithContext_completion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_respondToInviteWithContext_completion_, 0, 1);
  v59 = (void *)XPCInterface_interface_2;
  v60 = (void *)MEMORY[0x1E0C99E60];
  v61 = objc_opt_class();
  objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_fetchCustodianRecoveryConfigurationWithCompletion_, 0, 1);

  v63 = (void *)XPCInterface_interface_2;
  v64 = (void *)MEMORY[0x1E0C99E60];
  v65 = objc_opt_class();
  v66 = objc_opt_class();
  v67 = objc_opt_class();
  objc_msgSend(v64, "setWithObjects:", v65, v66, v67, objc_opt_class(), 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_generateCustodianRecoveryCodeWithContext_completion_, 0, 0);

  v69 = (void *)XPCInterface_interface_2;
  v70 = (void *)MEMORY[0x1E0C99E60];
  v71 = objc_opt_class();
  objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_generateCustodianRecoveryCodeWithContext_completion_, 0, 1);

  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_startHealthCheckWithCompletion_, 0, 0);
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_startHealthCheckWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_startManateeMigrationWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_pullTrustedContactsFromCloudKitWithCompletion_, 0, 1);
  v73 = (void *)XPCInterface_interface_2;
  v74 = (void *)MEMORY[0x1E0C99E60];
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  v77 = objc_opt_class();
  v78 = objc_opt_class();
  v79 = objc_opt_class();
  objc_msgSend(v74, "setWithObjects:", v75, v76, v77, v78, v79, objc_opt_class(), 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setClasses:forSelector:argumentIndex:ofReply:", v80, sel_displayTrustedContactFlowWithModel_completion_, 0, 0);

  v81 = (void *)XPCInterface_interface_2;
  v82 = (void *)MEMORY[0x1E0C99E60];
  v83 = objc_opt_class();
  v84 = objc_opt_class();
  objc_msgSend(v82, "setWithObjects:", v83, v84, objc_opt_class(), 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setClasses:forSelector:argumentIndex:ofReply:", v85, sel_displayTrustedContactFlowWithModel_completion_, 0, 1);

  v86 = (void *)XPCInterface_interface_2;
  v87 = (void *)MEMORY[0x1E0C99E60];
  v88 = objc_opt_class();
  v89 = objc_opt_class();
  objc_msgSend(v87, "setWithObjects:", v88, v89, objc_opt_class(), 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setClasses:forSelector:argumentIndex:ofReply:", v90, sel_displayCustodianInviteWithUUID_completion_, 0, 0);

  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_displayCustodianInviteWithUUID_completion_, 0, 1);
  v91 = (void *)XPCInterface_interface_2;
  v92 = (void *)MEMORY[0x1E0C99E60];
  v93 = objc_opt_class();
  objc_msgSend(v92, "setWithObjects:", v93, objc_opt_class(), 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v94, sel_reSendCustodianInvitationWithCustodianID_completion_, 0, 0);

  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_reSendCustodianInvitationWithCustodianID_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_performTrustedContactsDataSyncWithCompletion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_availableRecoveryFactorsWithCompletion_, 0, 1);
  v95 = (void *)XPCInterface_interface_2;
  v96 = (void *)MEMORY[0x1E0C99E60];
  v97 = objc_opt_class();
  v98 = objc_opt_class();
  objc_msgSend(v96, "setWithObjects:", v97, v98, objc_opt_class(), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_repairCustodians_remove_completion_, 0, 0);

  v100 = (void *)XPCInterface_interface_2;
  v101 = (void *)MEMORY[0x1E0C99E60];
  v102 = objc_opt_class();
  v103 = objc_opt_class();
  objc_msgSend(v101, "setWithObjects:", v102, v103, objc_opt_class(), 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setClasses:forSelector:argumentIndex:ofReply:", v104, sel_repairCustodians_remove_completion_, 1, 0);

  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_repairCustodians_remove_completion_, 0, 1);
  v105 = (void *)XPCInterface_interface_2;
  v106 = (void *)MEMORY[0x1E0C99E60];
  v107 = objc_opt_class();
  v108 = objc_opt_class();
  objc_msgSend(v106, "setWithObjects:", v107, v108, objc_opt_class(), 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setClasses:forSelector:argumentIndex:ofReply:", v109, sel_repairCustodians_completion_, 0, 0);

  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_repairCustodians_completion_, 0, 1);
  objc_msgSend((id)XPCInterface_interface_2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_preflightCustodianRecoveryWithCompletion_, 0, 1);

}

@end
