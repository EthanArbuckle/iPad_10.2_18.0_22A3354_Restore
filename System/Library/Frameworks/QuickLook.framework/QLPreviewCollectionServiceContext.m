@implementation QLPreviewCollectionServiceContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_151);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

uint64_t __70__QLPreviewCollectionServiceContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
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
  uint64_t v46;
  uint64_t v47;
  void *v48;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549F05B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___notificationCenterInterface;
  _extensionAuxiliaryVendorProtocol___notificationCenterInterface = v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A1AB18);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_extensionAuxiliaryVendorProtocol___networkStateProtocol;
  _extensionAuxiliaryVendorProtocol___networkStateProtocol = v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A1ABD0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_extensionAuxiliaryVendorProtocol___downloadTrackerInterface;
  _extensionAuxiliaryVendorProtocol___downloadTrackerInterface = v4;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549FF218);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface;
  _extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface = v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A1AC80);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_extensionAuxiliaryVendorProtocol___urlProviderInterface;
  _extensionAuxiliaryVendorProtocol___urlProviderInterface = v8;

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___urlProviderInterface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___downloadTrackerInterface, sel_getURLWithDownloadTracker_completionHandler_, 0, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D26F0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_extensionAuxiliaryVendorProtocol___itemStoreInterface;
  _extensionAuxiliaryVendorProtocol___itemStoreInterface = v10;

  v12 = (void *)_extensionAuxiliaryVendorProtocol___itemStoreInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "encodedClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_previewItemAtIndex_withCompletionHandler_, 0, 1);

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___itemStoreInterface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___urlProviderInterface, sel_previewItemAtIndex_withCompletionHandler_, 1, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E0228);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)_extensionAuxiliaryVendorProtocol___printerInterface;
  _extensionAuxiliaryVendorProtocol___printerInterface = v14;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CA2E0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)_extensionAuxiliaryVendorProtocol___stateManagerInterface;
  _extensionAuxiliaryVendorProtocol___stateManagerInterface = v16;

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___stateManagerInterface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___printerInterface, sel_setPrinter_, 0, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___stateManagerInterface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface, sel_showShareSheetWithPopoverTracker_customSharedURL_dismissCompletion_, 0, 0);
  v18 = (void *)_extensionAuxiliaryVendorProtocol___stateManagerInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_, 0, 0);

  v20 = (void *)_extensionAuxiliaryVendorProtocol___stateManagerInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D96E8);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)_extensionAuxiliaryVendorProtocol___transitionControllerInterface;
  _extensionAuxiliaryVendorProtocol___transitionControllerInterface = v22;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E4000);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v24;

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___itemStoreInterface, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, 2, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___stateManagerInterface, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, 3, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___itemStoreInterface, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, 2, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___stateManagerInterface, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, 3, 0);
  v26 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v27 = (void *)MEMORY[0x24BDBCF20];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, 0, 1);

  v31 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v32 = (void *)MEMORY[0x24BDBCF20];
  v33 = objc_opt_class();
  objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, 1, 1);

  v35 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v36 = (void *)MEMORY[0x24BDBCF20];
  v37 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_keyCommandsWithCompletionHandler_, 0, 1);

  v39 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v40 = (void *)MEMORY[0x24BDBCF20];
  v41 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_keyCommandWasPerformed_, 0, 0);

  v43 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v44 = (void *)MEMORY[0x24BDBCF20];
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, v46, v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_setPreviewItemDisplayState_onItemAtIndex_, 0, 0);

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___transitionControllerInterface, sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_, 1, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___notificationCenterInterface, sel_setNotificationCenter_, 0, 0);
  return objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___networkStateProtocol, sel_getNetworkObserverWithCompletionBlock_, 0, 1);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_262);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __68__QLPreviewCollectionServiceContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E4060);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

- (id)_protocolHost
{
  void *v2;
  void *v3;

  -[QLPreviewCollectionServiceContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_263);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __50__QLPreviewCollectionServiceContext__protocolHost__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Error while calling service - %@ #Remote", (uint8_t *)&v7, 0xCu);

  }
}

- (id)_previewCollection
{
  void *v2;
  void *v3;

  -[QLPreviewCollectionServiceContext _principalObject](self, "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _principalObject](self, "_principalObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureAsAccessoryViewContainerForPreviewCollection:", v4);

}

- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[QLPreviewCollectionServiceContext _principalObject](self, "_principalObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _principalObject](self, "_principalObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preparePreviewCollectionForInvalidationWithCompletionHandler:", v4);

}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  QLPreviewCollectionServiceContext *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_DEBUG, "invalidateServiceWithCompletionHandler %@ %@ #Remote", buf, 0x16u);

  }
  v9 = v4;
  QLRunInMainThread();

}

void __76__QLPreviewCollectionServiceContext_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateService");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "inputItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__QLPreviewCollectionServiceContext_invalidateServiceWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_24C725600;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "completeRequestReturningItems:completionHandler:", v4, v5);

}

uint64_t __76__QLPreviewCollectionServiceContext_invalidateServiceWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invalidateService
{
  -[QLPreviewCollectionServiceContext invalidateServiceWithCompletionHandler:](self, "invalidateServiceWithCompletionHandler:", &__block_literal_global_265);
}

- (void)getNetworkObserverWithCompletionBlock:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE7BFB0];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)setNotificationCenter:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[QLNotificationCenter sharedInstance](QLNotificationCenter, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteNotificationCenter:", v3);

}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHostApplicationBundleIdentifier:", v7);

  }
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  id v11;
  id v12;
  id v13;

  objc_storeStrong((id *)&self->_itemProvider, a5);
  v11 = a5;
  v12 = a6;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:", a3, a4, v11, v12);

}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;

  v7 = a7;
  objc_storeStrong((id *)&self->_itemProvider, a5);
  v13 = a5;
  v14 = a6;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:", a3, a4, v13, v14, v7);

}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentPreviewItemIndex:animated:", a3, v4);

}

- (void)hostSceneWillDeactivate
{
  void *v3;
  char v4;
  id v5;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostSceneWillDeactivate");

  }
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostApplicationDidEnterBackground:", v3);

}

- (void)hostApplicationDidBecomeActive
{
  id v2;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostApplicationDidBecomeActive");

}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolbarButtonsForTraitCollection:withCompletionHandler:", v7, v6);

}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (NSObject **)MEMORY[0x24BE7BF48];
  v10 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Service received %@ (%@) #Remote", (uint8_t *)&v14, 0x16u);

  }
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toolbarButtonPressedWithIdentifier:completionHandler:", v7, v8);

}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveCurrentPreviewEditsSynchronously:withCompletionHandler:", v4, v6);

}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForActionSheetPresentationWithCompletionHandler:", v4);

}

- (void)actionSheetDidDismiss
{
  id v2;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSheetDidDismiss");

}

- (void)documentMenuActionWillBegin
{
  void *v3;
  char v4;
  id v5;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentMenuActionWillBegin");

  }
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shouldDisplayLockActivityWithCompletionHandler:", v4);

}

- (void)requestLockForCurrentItem
{
  id v2;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestLockForCurrentItem");

}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveIntoPhotoLibraryMediaWithURLWrapper:previewItemType:completionHandler:", v9, a4, v8);

}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyCommandsWithCompletionHandler:", v4);

}

- (void)keyCommandWasPerformed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyCommandWasPerformed:", v4);

}

- (void)updateTransitionWithProgress:(double)a3
{
  id v4;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateTransitionWithProgress:", a3);

}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeTransition:withDuration:", v5, a4);

}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startTransitionWithSourceViewProvider:transitionController:presenting:useInteractiveTransition:completionHandler:", v14, v13, v8, v7, v12);

}

- (void)tearDownTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tearDownTransition:", v3);

}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAppearance:animated:", v6, v4);

}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  id v4;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyFirstTimeAppearanceWithActions:", a3);

}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyStateRestorationUserInfo:", v4);

}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowInteractiveTransitions:", v3);

}

- (void)setLoadingString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoadingString:", v4);

}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideParentApplicationDisplayIdentifierWithIdentifier:", v4);

}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostViewControllerBackgroundColorChanged:", v4);

}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostViewControlerTransitionToState:animated:", a3, v4);

}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContentManaged:", v3);

}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreviewItemDisplayState:onItemAtIndex:", v6, a4);

}

- (void)setScreenEdgePanWidth:(double)a3
{
  void *v5;
  char v6;
  id v7;

  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScreenEdgePanWidth:", a3);

  }
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[QLPreviewCollectionServiceContext _previewCollection](self, "_previewCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewItemDisplayState:wasAppliedToItemAtIndex:", v9, a4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
