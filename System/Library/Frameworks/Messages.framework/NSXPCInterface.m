@implementation NSXPCInterface

void __76__NSXPCInterface_MessageComposeExtension____mf_messageComposerHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  _QWORD v20[8];
  _QWORD v21[9];
  _QWORD v22[8];
  _QWORD v23[10];
  _QWORD v24[8];
  _QWORD v25[12];

  v25[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F02DD6A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__mf_messageComposerHostInterface_interface;
  __mf_messageComposerHostInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v25[4] = objc_opt_class();
  v25[5] = objc_opt_class();
  v25[6] = objc_opt_class();
  v25[7] = objc_opt_class();
  v25[8] = objc_opt_class();
  v25[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__stageAppItem_skipShelf_completionHandler_, 0, 0);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  v24[4] = objc_opt_class();
  v24[5] = objc_opt_class();
  v24[6] = objc_opt_class();
  v24[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel__stageAppItem_skipShelf_completionHandler_, 0, 1);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  v23[5] = objc_opt_class();
  v23[6] = objc_opt_class();
  v23[7] = objc_opt_class();
  v23[8] = objc_opt_class();
  v23[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel__stageMediaItem_skipShelf_forceStage_completionHandler_, 0, 0);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  v22[4] = objc_opt_class();
  v22[5] = objc_opt_class();
  v22[6] = objc_opt_class();
  v22[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel__stageMediaItem_skipShelf_forceStage_completionHandler_, 0, 1);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v21[4] = objc_opt_class();
  v21[5] = objc_opt_class();
  v21[6] = objc_opt_class();
  v21[7] = objc_opt_class();
  v21[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel__stageRichLink_skipShelf_completionHandler_, 0, 0);
  v17 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  v20[5] = objc_opt_class();
  v20[6] = objc_opt_class();
  v20[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel__stageRichLink_skipShelf_completionHandler_, 0, 1);
  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__stickerDruidDragEndedWithPayload_, 0, 0);
  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__stickerDruidDragEndedWithPayload_pluginIdentifier_, 0, 0);
  objc_msgSend((id)__mf_messageComposerHostInterface_interface, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__stickerDruidDragEndedWithPayload_pluginIdentifier_, 1, 0);

}

void __81__NSXPCInterface_MessageComposeExtension____mf_messageComposerExtensionInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[16];

  v51[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F02DDC40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__mf_messageComposerExtensionInterface_interface;
  __mf_messageComposerExtensionInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  v51[2] = objc_opt_class();
  v51[3] = objc_opt_class();
  v51[4] = objc_opt_class();
  v51[5] = objc_opt_class();
  v51[6] = objc_opt_class();
  v51[7] = objc_opt_class();
  v51[8] = objc_opt_class();
  v51[9] = objc_opt_class();
  v51[10] = objc_opt_class();
  v51[11] = objc_opt_class();
  v51[12] = objc_opt_class();
  v51[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__becomeActiveWithConversationState_presentationState_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__didReceiveMessage_conversationState_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__didReceiveMessage_conversationState_, 1, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__didStartSendingMessage_conversationState_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__didStartSendingMessage_conversationState_, 1, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__didCancelSendingMessage_conversationState_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__didCancelSendingMessage_conversationState_, 1, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__canSendMessage_conversationState_associatedText_completion_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__canSendMessage_conversationState_associatedText_completion_, 1, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__requestContentSizeThatFits_presentationStyle_completionHandler_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__requestContentSizeThatFits_presentationStyle_completionHandler_, 1, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__handleTextInputPayload_withPayloadID_completion_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__handleTextInputPayload_withPayloadID_completion_, 1, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__animatedStickerCreationProgressChanged_progress_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__animatedStickerCreationProgressChanged_progress_, 1, 0);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v50 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel__presentationWillChangeToPresentationState_, 0, 0);
  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel__presentationDidChangeToPresentationState_, 0, 0);
  v8 = (void *)__mf_messageComposerExtensionInterface_interface;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11);

  v12 = (void *)__mf_messageComposerExtensionInterface_interface;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel__addStickerToStoreWithRepresentations_completionWithStickerIDs_, 0, 0);

  v16 = (void *)__mf_messageComposerExtensionInterface_interface;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel__addStickerToStoreWithRepresentations_completionWithStickerIDs_, 1, 1);

  v20 = (void *)__mf_messageComposerExtensionInterface_interface;
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel__addStickerToStoreWithRepresentations_sourceRect_completion_, 0, 0);

  v24 = (void *)__mf_messageComposerExtensionInterface_interface;
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel__addStickerToStoreWithRepresentations_sourceRect_completion_, 0, 1);

  v28 = (void *)__mf_messageComposerExtensionInterface_interface;
  v29 = (void *)MEMORY[0x1E0C99E60];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel__addStickerToStoreWithRepresentations_sourceRect_effect_completion_, 0, 0);

  v32 = (void *)__mf_messageComposerExtensionInterface_interface;
  v33 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel__addStickerToStoreWithRepresentations_sourceRect_effect_completion_, 0, 1);

  v36 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)__mf_messageComposerExtensionInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel__setPluginIdentifierToShow_completion_, 0, 0);
  v39 = (void *)__mf_messageComposerExtensionInterface_interface;
  v40 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel__addStickerToStoreWithRepresentations_completionHandler_, 0, 0);

  v43 = (void *)__mf_messageComposerExtensionInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel__setHostBundleID_, 0, 0);

  v45 = (void *)__mf_messageComposerExtensionInterface_interface;
  v46 = (void *)MEMORY[0x1E0C99E60];
  v47 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel__addStickerToStoreWithUISticker_sourceRect_completion_, 0, 1);

}

@end
