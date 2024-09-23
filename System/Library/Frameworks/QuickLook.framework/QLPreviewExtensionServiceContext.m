@implementation QLPreviewExtensionServiceContext

void __73__QLPreviewExtensionServiceContext_iOS__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
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
  id v51;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549FF218);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface_0;
  _extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface_0 = v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549FF140);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface;
  _extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface = v2;

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___remotePopoverTrackerInterface_0, sel_presentShareSheetWithPopoverTracker_customSharedURL_dismissCompletion_, 0, 0);
  v4 = (void *)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_forwardMessageToHostOfCustomViewController_completionHandler_, 0, 0);

  v6 = (void *)_extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_forwardMessageToHostOfCustomViewController_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549FED28);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  _extensionAuxiliaryVendorProtocol___interface_0 = v8;

  v10 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_loadPreviewControllerWithContents_context_completionHandler_, 0, 0);

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface_0, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___hostItemViewControllerInterface, sel_setHostViewControllerProxy_, 0, 0);
  v14 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_loadPreviewControllerWithContents_context_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E0228);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)_extensionAuxiliaryVendorProtocol___printerInterface_0;
  _extensionAuxiliaryVendorProtocol___printerInterface_0 = v19;

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface_0, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___printerInterface_0, sel_getPrinterProxyWithCompletionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A11E88);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  _extensionAuxiliaryVendorProtocol___arqlInlineInterface = v21;

  v23 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface, "setClasses:forSelector:argumentIndex:ofReply:", v51);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface, "setClasses:forSelector:argumentIndex:ofReply:", v51);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface, "setClasses:forSelector:argumentIndex:ofReply:", v51);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_touchesCancelled_forUUID_, 0, 0);
  v26 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_observeReturnedToInlineForUUID_completion_, 2, 1);

  v28 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_sendARQLEvent_forUUID_completion_, 0, 0);

  v30 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_sendARQLEvent_forUUID_completion_, 0, 1);

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface_0, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___arqlInlineInterface, sel_getARQLInlineProxyWithCompletionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A1ACE0);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2;
  _extensionAuxiliaryVendorProtocol___arqlInlineInterface2 = v32;

  v34 = MEMORY[0x24BDACFA0];
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x24BDACFA0], sel_updateBounds_forUUID_fenceHandleCompletion_, 1, 1);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2, "setXPCType:forSelector:argumentIndex:ofReply:", v34, sel_prepareFullscreenPreview_initialFrame_previewOptions_fenceHandleCompletion_, 1, 1);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface2, "setXPCType:forSelector:argumentIndex:ofReply:", v34, sel_observeReturnedToInlineForUUID_fenceHandleCompletion_, 1, 1);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface_0, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___arqlInlineInterface2, sel_getARQLInlineProxy2WithCompletionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A1B058);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  _extensionAuxiliaryVendorProtocol___arqlInlineInterface3 = v35;

  v37 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_prepareInlinePreviewWithScopedURLWrapperAttributes_forUUID_completion_, 1, 1);

  v39 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_prepareInlinePreviewWithData_forUUID_completion_, 1, 1);

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_touchesBegan_forUUID_, 0, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_touchesMoved_forUUID_, 0, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_touchesEnded_forUUID_, 0, 0);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_touchesCancelled_forUUID_, 0, 0);
  v41 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_sendARQLEvent_forUUID_completion_, 0, 0);

  v43 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_sendARQLEvent_forUUID_completion_, 0, 1);

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3, "setXPCType:forSelector:argumentIndex:ofReply:", v34, sel_updateBounds_forUUID_fenceHandleCompletion_, 1, 1);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3, "setXPCType:forSelector:argumentIndex:ofReply:", v34, sel_prepareFullscreenPreview_initialFrame_previewOptions_fenceHandleCompletion_, 1, 1);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3, "setXPCType:forSelector:argumentIndex:ofReply:", v34, sel_observeReturnedToInlineForUUID_fenceHandleCompletion_, 1, 1);
  v45 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_observeReturnedToInlineForUUID_fenceHandleCompletion_, 2, 1);

  v47 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_inlinePreview_setRuntimeStateObserver_, 1, 1);

  v49 = (void *)_extensionAuxiliaryVendorProtocol___arqlInlineInterface3;
  objc_msgSend(MEMORY[0x24BE7BF88], "customExtensionCommunicationEncodedClasses");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_inlinePreview_setCameraYaw_pitch_scale_options_, 4, 0);

  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface_0, "setInterface:forSelector:argumentIndex:ofReply:", _extensionAuxiliaryVendorProtocol___arqlInlineInterface3, sel_getARQLInlineProxy3WithCompletionHandler_, 0, 1);
}

void __71__QLPreviewExtensionServiceContext_iOS__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549FED88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_0;
  _extensionAuxiliaryHostProtocol___interface_0 = v0;

}

void __52__QLPreviewExtensionServiceContext_iOS_protocolHost__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Error while calling service: %@ #Remote", (uint8_t *)&v7, 0xCu);

  }
}

void __58__QLPreviewExtensionServiceContext_iOS_previewWillAppear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewWillAppear:", *(unsigned __int8 *)(a1 + 40));

}

void __57__QLPreviewExtensionServiceContext_iOS_previewDidAppear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewDidAppear:", *(unsigned __int8 *)(a1 + 40));

}

void __61__QLPreviewExtensionServiceContext_iOS_previewWillDisappear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewWillDisappear:", *(unsigned __int8 *)(a1 + 40));

}

void __60__QLPreviewExtensionServiceContext_iOS_previewDidDisappear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewDidDisappear:", *(unsigned __int8 *)(a1 + 40));

}

void __63__QLPreviewExtensionServiceContext_iOS_setAppearance_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAppearance:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void __67__QLPreviewExtensionServiceContext_iOS_setHostViewControllerProxy___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHostViewControllerProxy:", *(_QWORD *)(a1 + 40));

}

void __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v16;
  uint64_t v17;
  id v18;

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2;
  aBlock[3] = &unk_24C726D38;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v16 = v2;
  v17 = v3;
  v18 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_respondsToSelector();

    objc_msgSend(*(id *)(a1 + 40), "previewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "searchableItemUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preparePreviewOfSearchableItemWithIdentifier:queryString:completionHandler:", v8, v9, v5);

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = *(_QWORD **)(a1 + 40);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "previewViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_respondsToSelector();

      objc_msgSend(*(id *)(a1 + 40), "previewViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preparePreviewOfFileAtURL:completionHandler:", v13, v5);

    }
    else
    {
      v14 = (void *)v11[4];
      v11[4] = 0;

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLRemoteItemViewController"), 4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7);
    }
  }

}

void __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v4 = v3;
  QLRunInMainThread();

}

void __100__QLPreviewExtensionServiceContext_iOS_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject **v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_ERROR, "Error while attempting to load preview from preview item '%@': %@ #Remote", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "previewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "previewViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("title"));

    }
    v11 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(*(id *)(a1 + 48), "previewViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSize");
    objc_msgSend(v11, "valueWithCGSize:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("preferredContentSize"));

    objc_msgSend(*(id *)(a1 + 48), "_startObservingPreviewControllerAttributeChanges");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject **v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  switch(objc_msgSend(v5, "replyType"))
  {
    case 0:
      objc_msgSend(v5, "contentSize");
      v8 = v7;
      v10 = v9;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BEE0]), "initWithPreview:", *(_QWORD *)(a1 + 32));
      v12 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_2;
      v31[3] = &unk_24C726D60;
      v32 = v5;
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_3;
      v28[3] = &unk_24C726D88;
      v29 = v32;
      v30 = *(id *)(a1 + 48);
      objc_msgSend(v11, "drawInContextOfSize:drawingBlock:completionHandler:", v31, v28, v8, v10);

      v13 = v32;
      goto LABEL_4;
    case 1:
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BEE0]), "initWithPreview:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v5, "contentSize");
      v15 = v14;
      v17 = v16;
      v18 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_4;
      v26[3] = &unk_24C726D60;
      v27 = v5;
      v23[0] = v18;
      v23[1] = 3221225472;
      v23[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_5;
      v23[3] = &unk_24C726DB0;
      v24 = v27;
      v25 = *(id *)(a1 + 48);
      objc_msgSend(v11, "drawInPDFContextOfSize:drawingBlock:completionHandler:", v26, v23, v15, v17);

      v13 = v27;
LABEL_4:

      goto LABEL_6;
    case 2:
      objc_msgSend(v5, "updateFromDocumentCreationBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_6:

      goto LABEL_9;
    case 4:
      v19 = (id)objc_msgSend(v5, "updateFromDataCreationBlock");
      goto LABEL_8;
    default:
LABEL_8:
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:
      v20 = *(id *)(a1 + 40);
      v21 = (NSObject **)MEMORY[0x24BE7BF48];
      v22 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v22 = *v21;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v20;
        _os_log_impl(&dword_20D4F5000, v22, OS_LOG_TYPE_DEBUG, "Finished calling generation extension for: %@ #Remote", buf, 0xCu);
      }

      return;
  }
}

uint64_t __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithContext:", a2);
}

void __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "updateWithImageData:bitmapFormat:", a2, a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithContext:", a2);
}

void __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "updateWithPDFData:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79__QLPreviewExtensionServiceContext_iOS_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
