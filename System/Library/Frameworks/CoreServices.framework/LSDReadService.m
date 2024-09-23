@implementation LSDReadService

void __31___LSDReadService_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
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
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCE24A8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)+[_LSDReadService XPCInterface]::result;
  +[_LSDReadService XPCInterface]::result = v2;

  v4 = (void *)+[_LSDReadService XPCInterface]::result;
  if (+[_LSDReadService XPCInterface]::result
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v99 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v99, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("LSDReadService.mm"), 126, CFSTR("Failed to create XPC interface object.")), v99, (v4 = (void *)+[_LSDReadService XPCInterface]::result) != 0))
  {
    objc_msgSend(v4, "setClass:forSelector:argumentIndex:ofReply:", _CSStoreGetXPCClass(), sel_getServerStoreNonBlockingWithCompletionHandler_, 0, 1);
    v5 = (void *)+[_LSDReadService XPCInterface]::result;
    _FSNodeGetClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getServerStoreNonBlockingWithCompletionHandler_, 1, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getServerStoreNonBlockingWithCompletionHandler_, 2, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getServerStoreNonBlockingWithCompletionHandler_, 4, 1);
    v7 = (void *)+[_LSDReadService XPCInterface]::result;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getKernelPackageExtensionsWithCompletionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getKernelPackageExtensionsWithCompletionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDiskUsage_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDiskUsage_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getDiskUsage_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getKnowledgeUUIDAndSequenceNumberWithCompletionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getKnowledgeUUIDAndSequenceNumberWithCompletionHandler_, 1, 1);
    v11 = (void *)+[_LSDReadService XPCInterface]::result;
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_resolveQueries_legacySPI_completionHandler_, 0, 0);

    v15 = (void *)+[_LSDReadService XPCInterface]::result;
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_resolveQueries_legacySPI_completionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_resolveQueries_legacySPI_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getBundleRecordForCurrentProcessWithCompletionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getBundleRecordForCurrentProcessWithCompletionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getBundleProxyForCurrentProcessWithCompletionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getBundleProxyForCurrentProcessWithCompletionHandler_, 1, 1);
    v22 = (void *)+[_LSDReadService XPCInterface]::result;
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_getBundleRecordForCoreTypesWithCompletionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getExtensionPointRecordWithIdentifier_platform_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getExtensionPointRecordWithIdentifier_platform_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getExtensionPointRecordWithIdentifier_platform_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getExtensionPointRecordForCurrentProcessWithCompletionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordWithIdentifier_allowUndeclared_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordWithIdentifier_allowUndeclared_completionHandler_, 0, 1);
    v26 = (void *)+[_LSDReadService XPCInterface]::result;
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_getTypeRecordsWithIdentifiers_completionHandler_, 0, 0);

    v30 = (void *)+[_LSDReadService XPCInterface]::result;
    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_getTypeRecordsWithIdentifiers_completionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_, 2, 0);
    v35 = (void *)+[_LSDReadService XPCInterface]::result;
    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_, 1, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_, 0, 0);
    v39 = (void *)+[_LSDReadService XPCInterface]::result;
    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_, 0, 1);

    v43 = (void *)+[_LSDReadService XPCInterface]::result;
    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_, 1, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getWhetherTypeIdentifier_conformsToTypeIdentifier_completionHandler_, 0, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getWhetherTypeIdentifier_conformsToTypeIdentifier_completionHandler_, 1, 0);
    if (IconServicesLibrary(void)::frameworkLibrary
      || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getBoundIconInfoForDocumentProxy_completionHandler_, 0, 0);
      objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getBoundIconInfoForDocumentProxy_completionHandler_, 0, 1);
      objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getBoundIconInfoForDocumentProxy_completionHandler_, 1, 1);
    }
    v47 = (void *)+[_LSDReadService XPCInterface]::result;
    v48 = (void *)MEMORY[0x1E0C99E60];
    v49 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_getAllUserActivityTypesAndDomainNamesWithCompletionHandler_, 0, 1);

    v51 = (void *)+[_LSDReadService XPCInterface]::result;
    v52 = (void *)MEMORY[0x1E0C99E60];
    v53 = objc_opt_class();
    objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_getAllUserActivityTypesAndDomainNamesWithCompletionHandler_, 1, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getAllUserActivityTypesAndDomainNamesWithCompletionHandler_, 2, 1);
    v55 = (void *)+[_LSDReadService XPCInterface]::result;
    v56 = (void *)MEMORY[0x1E0C99E60];
    v57 = objc_opt_class();
    objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setClasses:forSelector:argumentIndex:ofReply:", v58, sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_, 0, 0);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_, 1, 0);
    v59 = (void *)+[_LSDReadService XPCInterface]::result;
    _LSGetURLPropertyClasses();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_, 0, 1);

    v61 = (void *)+[_LSDReadService XPCInterface]::result;
    v62 = (void *)MEMORY[0x1E0C99E60];
    v63 = objc_opt_class();
    objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_, 1, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_, 2, 1);
    v65 = (void *)+[_LSDReadService XPCInterface]::result;
    v66 = (void *)MEMORY[0x1E0C99E60];
    v67 = objc_opt_class();
    objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setClasses:forSelector:argumentIndex:ofReply:", v68, sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_, 0, 0);

    v69 = (void *)+[_LSDReadService XPCInterface]::result;
    v70 = (void *)MEMORY[0x1E0C99E60];
    v71 = objc_opt_class();
    objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_, 1, 0);

    v73 = (void *)+[_LSDReadService XPCInterface]::result;
    v74 = (void *)MEMORY[0x1E0C99E60];
    v75 = objc_opt_class();
    objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setClasses:forSelector:argumentIndex:ofReply:", v76, sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_, 0, 1);

    v77 = (void *)+[_LSDReadService XPCInterface]::result;
    v78 = (void *)MEMORY[0x1E0C99E60];
    v79 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setClasses:forSelector:argumentIndex:ofReply:", v80, sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_, 1, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_mapBundleIdentifiers_orMachOUUIDs_completionHandler_, 2, 1);
    v81 = (void *)+[_LSDReadService XPCInterface]::result;
    v82 = (void *)MEMORY[0x1E0C99E60];
    v83 = objc_opt_class();
    objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_, 0, 0);

    v85 = (void *)+[_LSDReadService XPCInterface]::result;
    v86 = (void *)MEMORY[0x1E0C99E60];
    v87 = objc_opt_class();
    objc_msgSend(v86, "setWithObjects:", v87, objc_opt_class(), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setClasses:forSelector:argumentIndex:ofReply:", v88, sel_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_, 1, 1);
    v89 = (void *)+[_LSDReadService XPCInterface]::result;
    XNSGetPropertyListClasses();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setClasses:forSelector:argumentIndex:ofReply:", v90, sel_getPreferencesWithCompletionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getPreferencesWithCompletionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getSettingsStoreConfigurationWithCompletionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getSettingsStoreConfigurationWithCompletionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", _CSStoreGetXPCClass(), sel_getSystemContentStoreWithCompletionHandler_, 0, 1);
    v91 = (void *)+[_LSDReadService XPCInterface]::result;
    _FSNodeGetClasses();
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setClasses:forSelector:argumentIndex:ofReply:", v92, sel_getSystemContentStoreWithCompletionHandler_, 1, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getSystemContentStoreWithCompletionHandler_, 2, 1);
    v93 = (void *)+[_LSDReadService XPCInterface]::result;
    v94 = (void *)MEMORY[0x1E0C99E60];
    v95 = objc_opt_class();
    objc_msgSend(v94, "setWithObjects:", v95, objc_opt_class(), 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setClasses:forSelector:argumentIndex:ofReply:", v96, sel_getApplicationCategoryIdentifiersSetWithCompletionHandler_, 0, 1);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getApplicationCategoryIdentifiersSetWithCompletionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_, 0, 0);
    v97 = (void *)+[_LSDReadService XPCInterface]::result;
    _FSNodeGetClasses();
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setClasses:forSelector:argumentIndex:ofReply:", v98, sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_, 1, 0);

    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_, 2, 0);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_, 1, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getEligibilityAnswerForDomain_withCompletionHandler_, 0, 1);
    objc_msgSend((id)+[_LSDReadService XPCInterface]::result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getEligibilityAnswerForDomain_withCompletionHandler_, 1, 1);
  }
}

@end
