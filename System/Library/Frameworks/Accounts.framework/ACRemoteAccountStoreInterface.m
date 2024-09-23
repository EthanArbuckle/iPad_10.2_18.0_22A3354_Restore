@implementation ACRemoteAccountStoreInterface

+ (NSXPCInterface)XPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ACRemoteAccountStoreInterface_XPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, block);
  return (NSXPCInterface *)(id)XPCInterface_XPCInterface;
}

+ (id)_buildXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B9CB0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_accountsWithHandler_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_accountTypesWithHandler_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_accountsWithAccountType_handler_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_accountsWithAccountType_options_completion_, 0, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_childAccountsForAccountWithIdentifier_handler_, 0, 1);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_childAccountsWithAccountTypeIdentifier_parentAccountIdentifier_handler_, 0, 1);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_enabledDataclassesForAccountWithIdentifier_handler_, 0, 1);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_provisionedDataclassesForAccountWithIdentifier_handler_, 0, 1);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_supportedDataclassesForAccountType_handler_, 0, 1);

  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_syncableDataclassesForAccountType_handler_, 0, 1);

  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_accessKeysForAccountType_handler_, 0, 1);

  v36 = (void *)MEMORY[0x1E0C99E60];
  v37 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_grantedPermissionsForAccountType_withHandler_, 0, 1);

  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, v41, v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_dataclassActionsForAccountSave_completion_, 0, 1);

  v44 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, v46, v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_dataclassActionsForAccountDeletion_completion_, 0, 1);

  v49 = (void *)MEMORY[0x1E0C99E60];
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_saveAccount_verify_dataclassActions_completion_, 2, 0);

  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, v55, objc_opt_class(), 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_removeAccount_withDataclassActions_completion_, 1, 0);

  v57 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_kerberosAccountsForDomainFromURL_completion_, 0, 1);

  v60 = (void *)MEMORY[0x1E0C99E60];
  v61 = objc_opt_class();
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  v64 = objc_opt_class();
  v65 = objc_opt_class();
  objc_msgSend(v60, "setWithObjects:", v61, v62, v63, v64, v65, objc_opt_class(), 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_renewCredentialsForAccount_options_completion_, 1, 0);

  v67 = (void *)MEMORY[0x1E0C99E60];
  v68 = objc_opt_class();
  objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_clientTokenForAccountIdentifier_completion_, 0, 1);

  v70 = (void *)MEMORY[0x1E0C99E60];
  v71 = objc_opt_class();
  objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion_, 0, 1);

  v73 = (void *)MEMORY[0x1E0C99E60];
  v74 = objc_opt_class();
  objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v75, sel_accountsWithAccountTypeIdentifiers_preloadedProperties_completion_, 0, 1);

  v76 = (void *)MEMORY[0x1E0C99E60];
  v77 = objc_opt_class();
  v78 = objc_opt_class();
  v79 = objc_opt_class();
  v80 = objc_opt_class();
  objc_msgSend(v76, "setWithObjects:", v77, v78, v79, v80, objc_opt_class(), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_accountsOnPairedDeviceWithAccountTypes_withOptions_handler_, 1, 0);

  v82 = (void *)MEMORY[0x1E0C99E60];
  v83 = objc_opt_class();
  objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_accountsOnPairedDeviceWithAccountTypes_withOptions_handler_, 0, 1);

  v85 = (void *)MEMORY[0x1E0C99E60];
  v86 = objc_opt_class();
  v87 = objc_opt_class();
  v88 = objc_opt_class();
  v89 = objc_opt_class();
  objc_msgSend(v85, "setWithObjects:", v86, v87, v88, v89, objc_opt_class(), 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v90, sel_verifyCredentialsForAccount_options_completion_, 1, 0);

  v91 = (void *)MEMORY[0x1E0C99E60];
  v92 = objc_opt_class();
  v93 = objc_opt_class();
  v94 = objc_opt_class();
  v95 = objc_opt_class();
  objc_msgSend(v91, "setWithObjects:", v92, v93, v94, v95, objc_opt_class(), 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v96, sel_discoverPropertiesForAccount_options_completion_, 1, 0);

  v97 = (void *)MEMORY[0x1E0C99E60];
  v98 = objc_opt_class();
  v99 = objc_opt_class();
  v100 = objc_opt_class();
  objc_msgSend(v97, "setWithObjects:", v98, v99, v100, objc_opt_class(), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_saveAccount_toPairedDeviceWithOptions_completion_, 1, 0);

  v102 = (void *)MEMORY[0x1E0C99E60];
  v103 = objc_opt_class();
  objc_msgSend(v102, "setWithObjects:", v103, objc_opt_class(), 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v104, sel_credentialItemsWithCompletion_, 0, 1);

  v105 = (void *)MEMORY[0x1E0C99E60];
  v106 = objc_opt_class();
  v107 = objc_opt_class();
  objc_msgSend(v105, "setWithObjects:", v106, v107, objc_opt_class(), 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v108, sel_registerMonitorForAccountsOfTypes_propertiesToPrefetch_completion_, 0, 1);

  v109 = (void *)MEMORY[0x1E0C99E60];
  v110 = objc_opt_class();
  objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v111, sel_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion_, 0, 1);

  return v2;
}

void __45__ACRemoteAccountStoreInterface_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_buildXPCInterface");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)XPCInterface_XPCInterface;
  XPCInterface_XPCInterface = v1;

}

@end
