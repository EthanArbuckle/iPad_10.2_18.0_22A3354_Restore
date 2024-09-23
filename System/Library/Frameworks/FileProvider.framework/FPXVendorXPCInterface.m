@implementation FPXVendorXPCInterface

void __FPXVendorXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D02F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FPXVendorXPCInterface_interface;
  FPXVendorXPCInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0CB3B50];
  v3 = (id)FPXVendorXPCInterface_interface;
  objc_msgSend(v2, "interfaceWithProtocol:", &unk_1EE5E5758);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v4, sel_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler_, 1, 0);

  FPXEnumeratorXPCInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5E5758);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_listRemoteVersionsWithSettings_observer_request_completionHandler_, 1, 0);

  FPXEnumeratorXPCInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v7, sel_listRemoteVersionsWithSettings_observer_request_completionHandler_, 0, 1);

  FPXSetOperationServiceOnXPCInterface((void *)FPXVendorXPCInterface_interface);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)FPXVendorXPCInterface_interface;
  objc_msgSend(v16, "setByAddingObjectsFromArray:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_valuesForAttributes_forItemID_completionHandler_, 0, 1);

  v20 = (void *)FPXVendorXPCInterface_interface;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_bulkEvictItemsWithItemIDs_completionHandler_, 0, 0);

  v24 = (void *)FPXVendorXPCInterface_interface;
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_beginRequestWithDomain_alternateContentsDictionary_domainServicer_providerDomain_domainVersion_completionHandler_, 1, 0);

  v30 = (void *)FPXVendorXPCInterface_interface;
  FPDDomainServicingXPCInterface();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setInterface:forSelector:argumentIndex:ofReply:", v31, sel_beginRequestWithDomain_alternateContentsDictionary_domainServicer_providerDomain_domainVersion_completionHandler_, 2, 0);

  v32 = (void *)FPXVendorXPCInterface_interface;
  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_fetchServicesForItemID_allowRestrictedSources_completionHandler_, 1, 1);

}

@end
