@implementation DOCExtensionInterface

+ (id)hostProtocol
{
  if (hostProtocol_onceToken != -1)
    dispatch_once(&hostProtocol_onceToken, &__block_literal_global);
  return (id)hostProtocol___interface;
}

void __37__DOCExtensionInterface_hostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254594580);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hostProtocol___interface;
  hostProtocol___interface = v0;

}

+ (id)vendorProtocol
{
  if (vendorProtocol_onceToken != -1)
    dispatch_once(&vendorProtocol_onceToken, &__block_literal_global_40);
  return (id)vendorProtocol___interface;
}

void __39__DOCExtensionInterface_vendorProtocol__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545C5030);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545C5090);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545C50F0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545C5150);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v46, sel_getTransitionControllerForURL_completionBlock_, 0, 1);
  objc_msgSend(v0, "setInterface:forSelector:argumentIndex:ofReply:", v46, sel_getTransitionControllerForItem_completionBlock_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545A59A0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel__didTriggerCustomActionWithIdentifier_onItemBookmarks_, 1, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__setAdditionalLeadingNavigationBarButtonItems_, 0, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel__setAdditionalTrailingNavigationBarButtonItems_, 0, 0);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel__renameDocumentAtURL_newName_completion_, 1, 1);

  v20 = (void *)MEMORY[0x24BDBCF20];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel__didPickItemBookmarks_, 0, 0);

  v23 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel__updateRemoteBarButtonFrames_forUUID_, 0, 0);

  v26 = (void *)MEMORY[0x24BDBCF20];
  v27 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel__updateRemoteBarButtonFrames_forUUID_, 1, 0);

  v29 = (void *)MEMORY[0x24BDBCF20];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_, 0, 0);

  objc_msgSend(v47, "setInterface:forSelector:argumentIndex:ofReply:", v44, sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_, 1, 0);
  v32 = (void *)MEMORY[0x24BDBCF20];
  v33 = objc_opt_class();
  objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_, 3, 0);

  objc_msgSend(v47, "setInterface:forSelector:argumentIndex:ofReply:", v45, sel__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy_, 4, 0);
  v35 = (void *)MEMORY[0x24BDBCF20];
  v36 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_performAction_withURLs_completionHandler_, 1, 0);

  v38 = (void *)MEMORY[0x24BDBCF20];
  v39 = objc_opt_class();
  objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel__setCustomActions_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel__setSceneIdentifier_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545C51B0);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)vendorProtocol___interface;
  vendorProtocol___interface = v42;

  objc_msgSend((id)vendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", v0, sel_configureAsDocumentBrowserWithHostProxy_configuration_initialUIPBrowserState_completionBlock_, 0, 1);
  objc_msgSend((id)vendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", v47, sel_configureAsDocumentBrowserWithHostProxy_configuration_initialUIPBrowserState_completionBlock_, 0, 0);

}

@end
