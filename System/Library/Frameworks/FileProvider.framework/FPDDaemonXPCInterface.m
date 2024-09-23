@implementation FPDDaemonXPCInterface

void __FPDDaemonXPCInterface_block_invoke()
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
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
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  _QWORD v109[11];

  v109[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F8100);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FPDDaemonXPCInterface_interface;
  FPDDaemonXPCInterface_interface = v0;

  FPDDomainServicingXPCInterface();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5EA478);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DB010);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)FPDDaemonXPCInterface_interface;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_providerDomainsCompletionHandler_, 1, 1);

  v9 = (void *)FPDDaemonXPCInterface_interface;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v109[0] = objc_opt_class();
  v109[1] = objc_opt_class();
  v109[2] = objc_opt_class();
  v109[3] = objc_opt_class();
  v109[4] = objc_opt_class();
  v109[5] = objc_opt_class();
  v109[6] = objc_opt_class();
  v109[7] = objc_opt_class();
  v109[8] = objc_opt_class();
  v109[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_valuesForAttributes_forItemAtURL_completionHandler_, 0, 1);

  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_fetchDomainServicerForProviderDomainID_handler_, 0, 1);
  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_startAccessingServiceForItemID_completionHandler_, 1, 1);
  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_startAccessingServiceWithName_itemURL_completionHandler_, 1, 1);
  v13 = (void *)FPDDaemonXPCInterface_interface;
  FPXOperationServiceXPCInterface();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_startAccessingOperationServiceForProviderDomainID_handler_, 0, 1);

  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_startAccessingExtensionForProviderDomainID_handler_, 1, 1);
  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_startAccessingOperationServiceForProviderDomainID_handler_, 2, 1);
  v15 = (void *)FPDDaemonXPCInterface_interface;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F8220);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_wakeUpForURL_completionHandler_, 1, 1);

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_observePresentedFilesDidChange_, 0, 0);

  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v108, sel__t_setFilePresenterObserver_, 0, 0);
  v20 = (void *)FPDDaemonXPCInterface_interface;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getDomainsForProviderIdentifier_completionHandler_, 1, 1);

  v24 = (void *)FPDDaemonXPCInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler_, 0, 1);

  v26 = (void *)FPDDaemonXPCInterface_interface;
  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler_, 1, 1);

  v30 = (void *)FPDDaemonXPCInterface_interface;
  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler_, 0, 1);

  v35 = (void *)FPDDaemonXPCInterface_interface;
  v36 = (void *)MEMORY[0x1E0C99E60];
  v37 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_forceIngestionForItemIDs_completionHandler_, 0, 0);

  v39 = (void *)FPDDaemonXPCInterface_interface;
  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_forceIngestionForItemIDs_completionHandler_, 0, 1);

  v44 = (void *)FPDDaemonXPCInterface_interface;
  FPDaemonActionOperationXPCInterface();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setInterface:forSelector:argumentIndex:ofReply:", v45, sel_scheduleActionOperationWithInfo_completionHandler_, 0, 1);

  v46 = (void *)FPDDaemonXPCInterface_interface;
  v47 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_fetchDaemonOperationIDsWithCompletionHandler_, 0, 1);

  v50 = (void *)FPDDaemonXPCInterface_interface;
  FPDaemonActionOperationXPCInterface();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setInterface:forSelector:argumentIndex:ofReply:", v51, sel_fetchDaemonOperationWithID_completionHandler_, 0, 1);

  v52 = (void *)FPDDaemonXPCInterface_interface;
  v53 = (void *)MEMORY[0x1E0C99E60];
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, v55, v56, objc_opt_class(), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_fetchListOfMonitoredApps_, 0, 1);

  v58 = (void *)FPDDaemonXPCInterface_interface;
  v59 = (void *)MEMORY[0x1E0C99E60];
  v60 = objc_opt_class();
  objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_makeTopologicallySortedItemsOnDisk_completionHandler_, 0, 0);

  v62 = (void *)FPDDaemonXPCInterface_interface;
  v63 = (void *)MEMORY[0x1E0C99E60];
  v64 = objc_opt_class();
  v65 = objc_opt_class();
  objc_msgSend(v63, "setWithObjects:", v64, v65, objc_opt_class(), 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_makeTopologicallySortedItemsOnDisk_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D91B8);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  FPSetOperationClientOnXPCInterface(v67);
  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v67, sel_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler_, 0, 0);
  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F81C0), sel_fetchAccessServicer_, 0, 1);
  v68 = (void *)FPDDaemonXPCInterface_interface;
  v69 = (void *)MEMORY[0x1E0C99E60];
  v70 = objc_opt_class();
  objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_copyDatabaseForFPCKStartingAtPath_completionHandler_, 0, 1);

  v72 = (void *)FPDDaemonXPCInterface_interface;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F8160);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setInterface:forSelector:argumentIndex:ofReply:", v73, sel_forceIndexingInForeground_completionHandler_, 0, 1);

  v74 = (void *)FPDDaemonXPCInterface_interface;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5E5758);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setInterface:forSelector:argumentIndex:ofReply:", v75, sel_fetchAndStartEnumeratingWithSettings_observer_completionHandler_, 1, 0);

  v76 = (void *)FPDDaemonXPCInterface_interface;
  FPXEnumeratorXPCInterface();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setInterface:forSelector:argumentIndex:ofReply:", v77, sel_fetchAndStartEnumeratingWithSettings_observer_completionHandler_, 0, 1);

  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_fetchAndStartEnumeratingWithSettings_observer_completionHandler_, 1, 1);
  v78 = (void *)FPDDaemonXPCInterface_interface;
  v79 = (void *)MEMORY[0x1E0C99E60];
  v80 = objc_opt_class();
  objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler_, 5, 0);

  v82 = (void *)FPDDaemonXPCInterface_interface;
  v83 = (void *)MEMORY[0x1E0C99E60];
  v84 = objc_opt_class();
  objc_msgSend(v83, "setWithObjects:", v84, objc_opt_class(), 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setClasses:forSelector:argumentIndex:ofReply:", v85, sel_detachKnownFolders_completionHandler_, 0, 0);

  v86 = (void *)FPDDaemonXPCInterface_interface;
  v87 = (void *)MEMORY[0x1E0C99E60];
  v88 = objc_opt_class();
  objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setClasses:forSelector:argumentIndex:ofReply:", v89, sel_attachKnownFolders_options_completionHandler_, 0, 0);

  v90 = (void *)FPDDaemonXPCInterface_interface;
  v91 = (void *)MEMORY[0x1E0C99E60];
  v92 = objc_opt_class();
  objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setClasses:forSelector:argumentIndex:ofReply:", v93, sel_fetchPathComponentsForURL_completionHandler_, 0, 1);

  v94 = (void *)FPDDaemonXPCInterface_interface;
  v95 = (void *)MEMORY[0x1E0C99E60];
  v96 = objc_opt_class();
  objc_msgSend(v95, "setWithObjects:", v96, objc_opt_class(), 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setClasses:forSelector:argumentIndex:ofReply:", v97, sel_listPausedURLsWithBundleID_completionHandler_, 0, 1);

  v98 = (void *)FPDDaemonXPCInterface_interface;
  v99 = (void *)MEMORY[0x1E0C99E60];
  v100 = objc_opt_class();
  objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_fetchLatestVersionForItemAtURL_bundleID_completionHandler_, 1, 1);

  v102 = (void *)FPDDaemonXPCInterface_interface;
  v103 = (void *)MEMORY[0x1E0C99E60];
  v104 = objc_opt_class();
  v105 = objc_opt_class();
  v106 = objc_opt_class();
  objc_msgSend(v103, "setWithObjects:", v104, v105, v106, objc_opt_class(), 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setClasses:forSelector:argumentIndex:ofReply:", v107, sel__test_getDBQueryStatistics_queryPlan_completionHandler_, 0, 1);

}

@end
