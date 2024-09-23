@implementation CKModalTranscriptController

- (CKModalTranscriptController)initWithNavigationController:(id)a3
{
  CKModalTranscriptController *v3;
  CKChatEagerUploadController *v4;
  CKChatEagerUploadController *eagerUploadController;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKModalTranscriptController;
  v3 = -[CKComposeChatController initWithRecipientAddresses:composition:bizIntent:](&v11, sel_initWithRecipientAddresses_composition_bizIntent_, 0, 0, 0);
  if (v3)
  {
    v4 = objc_alloc_init(CKChatEagerUploadController);
    eagerUploadController = v3->_eagerUploadController;
    v3->_eagerUploadController = v4;

    if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        objc_msgSend(v8, "setDelegate:force:", v9, 1);

      }
    }
    IMIsSupportedUTIType();
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKModalTranscriptController;
  -[CKShareSheetChatController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CKModalTranscriptController setAppearCompleted:](self, "setAppearCompleted:", 1);
  -[CKChatController entryView](self, "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForceEnsureTextViewVisble:", 0);

}

- (void)setComposition:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKModalTranscriptController;
  -[CKChatController setComposition:](&v4, sel_setComposition_, a3);
  -[CKChatEagerUploadController cancelAll](self->_eagerUploadController, "cancelAll");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setEntryView:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKModalTranscriptController;
  -[CKChatController setEntryView:](&v6, sel_setEntryView_, a3);
  if (!-[CKModalTranscriptController appearCompleted](self, "appearCompleted"))
  {
    -[CKChatController entryView](self, "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setForceEnsureTextViewVisble:", 1);

  }
}

- (void)_insertMediaObjectAndReturnFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CKModalTranscriptController__insertMediaObjectAndReturnFrame___block_invoke;
    aBlock[3] = &unk_1E274A108;
    aBlock[4] = self;
    v13 = v4;
    v6 = _Block_copy(aBlock);
    v7 = v6;
    if (self->_alreadySetUp)
    {
      (*((void (**)(void *))v6 + 2))(v6);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "!_alreadySetUp, deferring insert block", v11, 2u);
        }

      }
      -[CKModalTranscriptController deferredInsertMediaObjectBlocks](self, "deferredInsertMediaObjectBlocks");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = _Block_copy(v7);
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

void __64__CKModalTranscriptController__insertMediaObjectAndReturnFrame___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint8_t v12[16];

  objc_msgSend(*(id *)(a1 + 32), "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "prepopulatedComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "prepopulatedComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setComposition:", v5);

    objc_msgSend(*(id *)(a1 + 32), "composition");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v6 = v2;
    objc_msgSend(v2, "compositionByAppendingMediaObject:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", *(_QWORD *)(a1 + 40), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "recipientCount"))
  {

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canSendComposition:error:", v7, 0);

  if (v10)
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "setComposition:", v7);
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Can't insert composition now, setting prepopulated composition", v12, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setPrepopulatedComposition:", v7);
LABEL_14:

}

- (BOOL)_insertMediaObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  if (v4 && !self->_alreadySetUp)
  {
    -[CKChatController composition](self, "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "compositionByAppendingMediaObject:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[CKComposition compositionWithMediaObject:subject:](CKComposition, "compositionWithMediaObject:subject:", v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CKCoreChatController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canSendComposition:error:", v7, 0);

    if (v9)
      -[CKModalTranscriptController setComposition:](self, "setComposition:", v7);

  }
  return v4 != 0;
}

- (NSMutableArray)deferredInsertMediaObjectBlocks
{
  NSMutableArray *deferredInsertMediaObjectBlocks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  deferredInsertMediaObjectBlocks = self->_deferredInsertMediaObjectBlocks;
  if (!deferredInsertMediaObjectBlocks)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_deferredInsertMediaObjectBlocks;
    self->_deferredInsertMediaObjectBlocks = v4;

    deferredInsertMediaObjectBlocks = self->_deferredInsertMediaObjectBlocks;
  }
  return deferredInsertMediaObjectBlocks;
}

- (void)insertRichLinkWithURL:(id)a3 data:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[CKModalTranscriptController insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:](self, "insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:", a3, 0, a4, 0, 0, 0, v4, 0);
}

- (void)insertRichLinkWithURL:(id)a3 sendAsCopyURL:(id)a4 data:(id)a5 collaborationType:(int64_t)a6 collaborationShareOptions:(id)a7 metadata:(id)a8 isCollaboration:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  void *v21;
  CKComposition *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  CKModalTranscriptController *v56;
  id v57;
  void (**v58)(_QWORD, _QWORD);
  _QWORD *v59;
  uint8_t *v60;
  _QWORD *v61;
  BOOL v62;
  _QWORD aBlock[4];
  id v64;
  id v65;
  id v66;
  CKModalTranscriptController *v67;
  id v68;
  uint8_t *v69;
  _QWORD *v70;
  _QWORD *v71;
  int64_t v72;
  BOOL v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;
  uint8_t buf[8];
  uint8_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v44 = a4;
  v45 = a5;
  v46 = a7;
  v17 = a8;
  v18 = a10;
  v19 = (void (**)(_QWORD, _QWORD))v18;
  if (self->_alreadySetUp)
  {
    if (v18)
      (*((void (**)(id, uint64_t))v18 + 2))(v18, 1);
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v20, "startTimingForKey:", CFSTR("insertRichLinkWithURL"));
    self->_alreadySetUp = 1;
    if ((v16 || a6 != 1) && (a6 != 3 || v17))
    {
      *(_QWORD *)buf = 0;
      v79 = buf;
      v80 = 0x3032000000;
      v81 = __Block_byref_object_copy__61;
      v82 = __Block_byref_object_dispose__61;
      v83 = 0;
      +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v16, v45);
      v83 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v79 + 5), "setPayloadCollaborationType:", a6);
      objc_msgSend(*((id *)v79 + 5), "setSendAsCopyURL:", v44);
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x3032000000;
      v76[3] = __Block_byref_object_copy__61;
      v76[4] = __Block_byref_object_dispose__61;
      v77 = 0;
      v74[0] = 0;
      v74[1] = v74;
      v74[2] = 0x3032000000;
      v74[3] = __Block_byref_object_copy__61;
      v74[4] = __Block_byref_object_dispose__61;
      v75 = 0;
      v29 = v16;
      v75 = v29;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke;
      aBlock[3] = &unk_1E2758770;
      v30 = v20;
      v64 = v30;
      v42 = v17;
      v65 = v42;
      v69 = buf;
      v31 = v46;
      v66 = v31;
      v67 = self;
      v70 = v76;
      v72 = a6;
      v73 = a9;
      v32 = v44;
      v68 = v32;
      v71 = v74;
      v43 = _Block_copy(aBlock);
      if (objc_msgSend(v29, "isFileURL"))
      {
        v33 = v30;
        v39 = objc_alloc_init(MEMORY[0x1E0CB3600]);
        objc_msgSend(v39, "retainAccess");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", v29, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_97;
        v47[3] = &unk_1E2758860;
        v59 = v74;
        v37 = v34;
        v48 = v37;
        v49 = v29;
        v60 = buf;
        v62 = a9;
        v50 = v32;
        v51 = v33;
        v61 = v76;
        v57 = v43;
        v35 = v39;
        v52 = v35;
        v36 = v38;
        v53 = v36;
        v54 = v31;
        v58 = v19;
        v55 = v42;
        v56 = self;
        objc_msgSend(v35, "coordinateAccessWithIntents:queue:byAccessor:", v41, v40, v47);

        v30 = v33;
      }
      else
      {
        (*((void (**)(void *, _QWORD, _QWORD, id))v43 + 2))(v43, 0, 0, v31);
        if (v19)
          v19[2](v19, 1);
      }

      _Block_object_dispose(v74, 8);
      _Block_object_dispose(v76, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      +[CKBrowserItemPayload browserItemPayloadForCollaborationWithURL:collaborationType:](CKBrowserItemPayload, "browserItemPayloadForCollaborationWithURL:collaborationType:", 0, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSendAsCopy:", !a9);
      v22 = -[CKComposition initWithText:subject:shelfPluginPayload:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:", 0, 0, v21);
      -[CKModalTranscriptController setComposition:](self, "setComposition:", v22);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Setting composition for the spinner for FP case.", buf, 2u);
        }

      }
      -[CKChatController entryView](self, "entryView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shelfPluginPayload");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "datasource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v27, "pluginPayload");

      if (v19)
        v19[2](v19, 1);

    }
  }

}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(void *, id);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(void *, id);
  _QWORD aBlock[4];
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "startTimingForKey:", CFSTR("setCompositionForPluginPayload"));
  v10 = *(id *)(a1 + 40);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E2758720;
  v37 = *(_QWORD *)(a1 + 72);
  v31 = *(id *)(a1 + 48);
  v12 = v9;
  v13 = *(_QWORD *)(a1 + 56);
  v32 = v12;
  v33 = v13;
  v38 = *(_QWORD *)(a1 + 80);
  v34 = *(id *)(a1 + 32);
  v14 = v7;
  v35 = v14;
  v15 = v8;
  v36 = v15;
  v16 = (void (**)(void *, id))_Block_copy(aBlock);
  v17 = *(_QWORD *)(a1 + 96);
  if (v17 == 3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSendAsCopy:", *(_BYTE *)(a1 + 104) == 0);
    if (!*(_BYTE *)(a1 + 104))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setUrl:", *(_QWORD *)(a1 + 64));
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 64);
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByRemovingPercentEncoding");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v21, v23, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

    }
    goto LABEL_6;
  }
  if (!v17)
  {
LABEL_6:
    v16[2](v16, v10);
    goto LABEL_7;
  }
  v18 = (void *)MEMORY[0x1E0D11690];
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_89;
  v27[3] = &unk_1E2758748;
  v28 = v10;
  v29 = v16;
  objc_msgSend(v18, "userNameAndEmail:containerSetupInfo:completionHandler:", v19, 0, v27);

LABEL_7:
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_3;
  block[3] = &unk_1E27586F8;
  v14 = *(_QWORD *)(a1 + 80);
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v15 = *(_QWORD *)(a1 + 88);
  v13 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 64), "releaseAccess:", *(_QWORD *)(a1 + 72));

}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  id v21;
  _BYTE location[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCollaborationMetadata:", *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "summary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      CKFrameworkBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCollaborationOptionsSummary:", v4);
    if (!v3)
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 56), "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shelfPluginPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "datasource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSkipConfigurePlugin:", 1);
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, *(id *)(a1 + 56));
    v9 = *(void **)(a1 + 56);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_4;
    v19 = &unk_1E27586D0;
    objc_copyWeak(&v21, (id *)location);
    v20 = *(_QWORD *)(a1 + 72);
    objc_msgSend(v9, "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:completionHandler:", v10, v11, v12, &v16);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)location = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Datasource for existing view is nil. Setup the composition without a spinner animation.", location, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 64), "stopTimingForKey:", CFSTR("setCompositionForPluginPayload"), v16, v17, v18, v19);
  objc_msgSend(*(id *)(a1 + 64), "stopTimingForKey:", CFSTR("insertRichLinkWithURL"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v15;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "insertRichLinkWithURL timing: %@", location, 0xCu);
    }

  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Start spinner animation.", v11, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shelfPluginPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "datasource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePayloadForShelfAnimation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "entryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setupShelfPluginPayload:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_89(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v10, "personNameComponentsFromString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Updating metadata with email:%@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setInitiatorHandle:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setInitiatorNameComponents:", v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v43 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Creating media object for File URL: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "setSendAsCopy:", *(_BYTE *)(a1 + 144) == 0);
  if (*(_BYTE *)(a1 + 144) || (v9 = *(void **)(a1 + 48)) == 0)
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "setSendAsCopyURL:", v10);
  objc_msgSend(*(id *)(a1 + 56), "startTimingForKey:", CFSTR("create_media_object"));
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByRemovingPercentEncoding");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v10, v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(a1 + 56), "stopTimingForKey:", CFSTR("create_media_object"));
  if (*(_BYTE *)(a1 + 144))
  {
    if (*(_QWORD *)(a1 + 88))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
      v17 = *(_QWORD *)(a1 + 112);
      if (v17)
        (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, 1);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v43 = v24;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Did not receive metadata for file URL %@, fetching metadata", buf, 0xCu);
        }

      }
      v25 = *(id *)(a1 + 80);
      v31 = *(id *)(a1 + 104);
      v26 = *(id *)(a1 + 64);
      v27 = *(id *)(a1 + 72);
      v32 = *(id *)(a1 + 112);
      v28 = *(id *)(a1 + 56);
      v29 = *(id *)(a1 + 40);
      v30 = *(id *)(a1 + 88);
      SWCollaborationMetadataForDocumentURL();

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Sending a copy with media object.", buf, 2u);
      }

    }
    v19 = (void *)MEMORY[0x1E0D11690];
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_100;
    v33[3] = &unk_1E27587C0;
    v39 = *(id *)(a1 + 104);
    v34 = *(id *)(a1 + 64);
    v35 = *(id *)(a1 + 72);
    v36 = *(id *)(a1 + 80);
    v40 = *(id *)(a1 + 112);
    v21 = *(id *)(a1 + 88);
    v22 = *(_QWORD *)(a1 + 96);
    v37 = v21;
    v38 = v22;
    v41 = *(_OWORD *)(a1 + 128);
    objc_msgSend(v19, "userNameAndEmail:containerSetupInfo:completionHandler:", v20, 0, v33);

  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_100(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_101;
  v14[3] = &unk_1E2758798;
  v15 = v9;
  v23 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v24 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 56);
  v20 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  v21 = v7;
  v22 = v10;
  v25 = *(_OWORD *)(a1 + 88);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_101(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v13 = 138412290;
        v14 = v4;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Error while trying to get the user name and email : %@.", (uint8_t *)&v13, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    v5 = *(_QWORD *)(a1 + 104);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "setInitiatorHandle:", *(_QWORD *)(a1 + 72));
    v6 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v6, "personNameComponentsFromString:", *(_QWORD *)(a1 + 80));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setInitiatorNameComponents:", v7);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 72);
        v13 = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Updating metadata with email: %@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setCollaborationMetadata:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 56), "summary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      CKFrameworkBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setCollaborationOptionsSummary:", v11);
    if (!v10)
    {

    }
    objc_msgSend(*(id *)(a1 + 88), "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(_QWORD *)(a1 + 56));
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    v12 = *(_QWORD *)(a1 + 104);
    if (v12)
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);

  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  _BYTE buf[12];
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Error loading metadata for documentURL: %@ error: %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setSendAsCopy:", 1);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    v11 = *(_QWORD *)(a1 + 40);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_104;
    v39[3] = &unk_1E27586D0;
    objc_copyWeak(&v40, (id *)buf);
    v39[4] = *(_QWORD *)(a1 + 112);
    objc_msgSend(v9, "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:completionHandler:", v10, 0, v11, v39);
    objc_msgSend(*(id *)(a1 + 32), "entryView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureForDisplayMode:", 1);

    objc_msgSend(*(id *)(a1 + 32), "entryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateEntryView");

    objc_msgSend(*(id *)(a1 + 32), "createCollaborationFailureAlertForFailedMetadataLoadWithFallback:URL:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    v14 = *(_QWORD *)(a1 + 96);
    if (v14)
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = *(id *)(a1 + 40);
    if (!v15)
    {
      objc_msgSend(v5, "userSelectedShareOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v5, "userSelectedShareOptions");
      else
        objc_msgSend(v5, "defaultShareOptions");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v18;
        v42 = 2112;
        v43 = v5;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Successfully loaded metadata for documentURL: %@ metadata: %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 64), "startTimingForKey:", CFSTR("setCompositionForPluginPayload"));
    v19 = (void *)MEMORY[0x1E0D11690];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_105;
    v26[3] = &unk_1E2758810;
    v20 = *(_QWORD *)(a1 + 72);
    v21 = *(id *)(a1 + 80);
    v22 = *(_QWORD *)(a1 + 112);
    v27 = v21;
    v37 = v22;
    v28 = v5;
    v23 = *(id *)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 32);
    v29 = v23;
    v30 = v24;
    v38 = *(_QWORD *)(a1 + 120);
    v31 = v15;
    v32 = *(id *)(a1 + 64);
    v35 = *(id *)(a1 + 88);
    v33 = *(id *)(a1 + 48);
    v34 = *(id *)(a1 + 56);
    v36 = *(id *)(a1 + 96);
    v25 = v15;
    objc_msgSend(v19, "userNameAndEmail:containerSetupInfo:completionHandler:", v20, 0, v26);

  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_104(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shelfPluginPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "datasource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePayloadForShelfAnimation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "entryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupShelfPluginPayload:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_106;
  v13[3] = &unk_1E27587E8;
  v14 = *(id *)(a1 + 32);
  v15 = v6;
  v7 = *(_QWORD *)(a1 + 112);
  v16 = v5;
  v26 = v7;
  v17 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(a1 + 64);
  v18 = v8;
  v19 = v9;
  v27 = *(_QWORD *)(a1 + 120);
  v20 = v10;
  v21 = *(id *)(a1 + 72);
  v24 = *(id *)(a1 + 96);
  v22 = *(id *)(a1 + 80);
  v23 = *(id *)(a1 + 88);
  v25 = *(id *)(a1 + 104);
  v11 = v5;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_106(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "setInitiatorHandle:", *(_QWORD *)(a1 + 40));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v4, "personNameComponentsFromString:", *(_QWORD *)(v3 + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v3, "setInitiatorNameComponents:", v5);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v13 = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Updating metadata with email: %@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "setCollaborationMetadata:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    CKFrameworkBundle();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "setCollaborationOptionsSummary:", v9);
  if (!v8)
  {

  }
  objc_msgSend(*(id *)(a1 + 72), "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 88), "stopTimingForKey:", CFSTR("setCompositionForPluginPayload"));
  objc_msgSend(*(id *)(a1 + 88), "stopTimingForKey:", CFSTR("insertRichLinkWithURL"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 88);
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "insertRichLinkWithURL timing: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
  v12 = *(_QWORD *)(a1 + 120);
  if (v12)
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);

}

- (void)insertRichLinkWithCloudKitShare:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  _QWORD block[4];
  id v41;
  id v42;
  CKModalTranscriptController *v43;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v6 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v39 = a4;
  v11 = a5;
  if (!self->_alreadySetUp)
  {
    v37 = v11;
    self->_alreadySetUp = 1;
    objc_msgSend(v10, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setPayloadCollaborationType:", 2);
    objc_msgSend(v13, "setCloudKitShare:", v10);
    objc_msgSend(v13, "setSendAsCopy:", !v6);
    objc_msgSend(v10, "URL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "absoluteString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "fragment");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    if (!objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC528])
      || !objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC4A0])
      || !objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC4B8])
      || (objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC5F8]) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", (uint8_t *)&buf, 0xCu);
        }

      }
      v14 = 0;
    }
    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%@"), v35);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", v16, &stru_1E276D870);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = &stru_1E276D870;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentUserParticipant");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "userIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lookupInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "phoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(v18, "emailAddress");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    objc_msgSend(v17, "nameComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__61;
    v48 = __Block_byref_object_dispose__61;
    v49 = 0;
    if (objc_msgSend(MEMORY[0x1E0CD7400], "instancesRespondToSelector:", sel_initWithCollaborationIdentifier_title_defaultShareOptions_creationDate_contentType_initiatorHandle_initiatorNameComponents_containerSetupInfo_sourceProcessData_))
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD7400]), "initWithCollaborationIdentifier:title:defaultShareOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", v31, v33, v37, v32, v14, v22, v23, v39, 0);
      v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v24;
    }
    else
    {
      v26 = objc_alloc(MEMORY[0x1E0CD7400]);
      objc_msgSend(v37, "optionsGroups");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "initWithCollaborationIdentifier:title:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:", v31, v33, v25, v32, v14, v22, v23);
      v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v27;

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke;
    block[3] = &unk_1E2750358;
    p_buf = &buf;
    v41 = v13;
    v42 = v37;
    v43 = self;
    v29 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(&buf, 8);
    v11 = v37;
  }

}

void __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0D11690];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_2;
  v5[3] = &unk_1E27588B0;
  v9 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "userNameAndEmail:containerSetupInfo:completionHandler:", 0, 0, v5);

}

void __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_3;
  v11[3] = &unk_1E2758888;
  v17 = *(_QWORD *)(a1 + 56);
  v12 = v6;
  v13 = v5;
  v14 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 72;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setInitiatorHandle:", *(_QWORD *)(a1 + 32));
  v3 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v3, "personNameComponentsFromString:", *(_QWORD *)(v2 - 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "setInitiatorNameComponents:", v4);
  objc_msgSend(*(id *)(a1 + 48), "setCollaborationMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Updating metadata for CloudKit with email:%@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 48), "payloadCollaborationType") == 2
      && (objc_msgSend(*(id *)(a1 + 48), "containerSetupInfo"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "containerOptions"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isServiceManatee"),
          v8,
          v7,
          v9))
    {
      objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "summary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", v10);
      }
      else
      {
        CKFrameworkBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", v12);

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 64), "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));

}

- (void)insertRichLinkWithCloudKitShare:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (**v14)(id, uint64_t);
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CKComposition *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  __CFString *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD block[4];
  id v60;
  id v61;
  CKModalTranscriptController *v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  _BYTE *v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v8 = a6;
  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v58 = a4;
  v13 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v14 = (void (**)(id, uint64_t))a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      v66 = v13;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Inserting Rich Links With CloudKitShare: %@, containerSetupInfo: %@, collaborationShareOptions: %@", buf, 0x20u);
    }

  }
  if (self->_alreadySetUp)
    goto LABEL_36;
  self->_alreadySetUp = 1;
  objc_msgSend(v12, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (!v17)
  {
    objc_msgSend(v12, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v18, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "setPayloadCollaborationType:", 2);
    objc_msgSend(v57, "setCloudKitShare:", v12);
    objc_msgSend(v57, "setSendAsCopy:", !v8);
    objc_msgSend(v12, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "absoluteString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fragment");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    v31 = v22;
    if (!objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC528])
      || !objc_msgSend(v31, "conformsToType:", *MEMORY[0x1E0CEC4A0])
      || !objc_msgSend(v31, "conformsToType:", *MEMORY[0x1E0CEC4B8])
      || (objc_msgSend(v31, "conformsToType:", *MEMORY[0x1E0CEC5F8]) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v31;
          _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", buf, 0xCu);
        }

      }
      v31 = 0;
    }
    v52 = v31;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%@"), v21);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", v33, &stru_1E276D870);
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v49 = &stru_1E276D870;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentUserParticipant");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "userIdentity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lookupInfo");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "phoneNumber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v50 = v35;
    }
    else
    {
      objc_msgSend(v56, "emailAddress");
      v50 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v34, "nameComponents");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v34;
    v38 = (void *)v21;
    v39 = v20;
    v40 = v19;
    v41 = v13;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v66 = __Block_byref_object_copy__61;
    v67 = __Block_byref_object_dispose__61;
    v68 = 0;
    if (objc_msgSend(MEMORY[0x1E0CD7400], "instancesRespondToSelector:", sel_initWithCollaborationIdentifier_title_defaultShareOptions_creationDate_contentType_initiatorHandle_initiatorNameComponents_containerSetupInfo_sourceProcessData_))
    {
      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD7400]), "initWithCollaborationIdentifier:title:defaultShareOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", v49, v53, v13, v51, v52, v50, v37, v58, 0);
      v43 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v42;
    }
    else
    {
      v44 = objc_alloc(MEMORY[0x1E0CD7400]);
      objc_msgSend(v41, "optionsGroups");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "initWithCollaborationIdentifier:title:defaultOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:", v49, v53, v43, v51, v52, v50, v37);
      v46 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v45;

    }
    v13 = v41;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke;
    block[3] = &unk_1E27588D8;
    v60 = v58;
    v61 = v57;
    v64 = buf;
    v62 = self;
    v63 = v41;
    v47 = v57;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(buf, 8);
LABEL_36:
    if (v14)
      v14[2](v14, 1);
    goto LABEL_38;
  }
  +[CKBrowserItemPayload browserItemPayloadForCollaborationWithURL:collaborationType:](CKBrowserItemPayload, "browserItemPayloadForCollaborationWithURL:collaborationType:", 0, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSendAsCopy:", !v8);
  v24 = -[CKComposition initWithText:subject:shelfPluginPayload:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:", 0, 0, v23);
  -[CKModalTranscriptController setComposition:](self, "setComposition:", v24);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Setting composition for the spinner for CloudKit case.", buf, 2u);
    }

  }
  -[CKChatController entryView](self, "entryView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "shelfPluginPayload");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "datasource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v29, "pluginPayload");

  if (v14)
    v14[2](v14, 1);

LABEL_38:
}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x1E0D11690];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_2;
  v7[3] = &unk_1E27588B0;
  v11 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v2, "userNameAndEmail:containerSetupInfo:completionHandler:", 0, v3, v7);

}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_3;
  v12[3] = &unk_1E2758888;
  v18 = *(_QWORD *)(a1 + 56);
  v13 = v6;
  v14 = v5;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _BYTE buf[12];
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 72;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setInitiatorHandle:", *(_QWORD *)(a1 + 32));
  v3 = objc_alloc_init(MEMORY[0x1E0CB3858]);
  objc_msgSend(v3, "personNameComponentsFromString:", *(_QWORD *)(v2 - 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40), "setInitiatorNameComponents:", v4);
  objc_msgSend(*(id *)(a1 + 48), "setCollaborationMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40));
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40);
  if (v5
    && (objc_msgSend(v5, "initiatorHandle"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        v31 = 2112;
        v32 = v4;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Updating metadata for CloudKit with email:%@, nameComponents: %@", buf, 0x16u);
      }

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "payloadCollaborationType") == 2
        && (objc_msgSend(*(id *)(a1 + 48), "containerSetupInfo"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v9, "containerOptions"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "isServiceManatee"),
            v10,
            v9,
            v11))
      {
        objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", 0);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 64), "summary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", v16);
        }
        else
        {
          CKFrameworkBundle();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setCollaborationOptionsSummary:", v18);

        }
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "entryView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shelfPluginPayload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "datasource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 48), "setSkipConfigurePlugin:", 1);
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, *(id *)(a1 + 56));
      v23 = *(void **)(a1 + 56);
      v24 = *(_QWORD *)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 64);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_117;
      v27[3] = &unk_1E2750700;
      objc_copyWeak(&v29, (id *)buf);
      v28 = *(id *)(a1 + 48);
      objc_msgSend(v23, "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:completionHandler:", v24, 0, v25, v27);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Datasource for existing view is nil. Setup the composition without a spinner annimation.", buf, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 56), "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    v13 = *(void **)(a1 + 56);
    v12 = (id *)(a1 + 56);
    objc_msgSend(v13, "setComposition:", 0);
    objc_msgSend(*v12, "entryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configureForDisplayMode:", 1);

    objc_msgSend(*v12, "entryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateEntryView");

    objc_msgSend(*v12, "createCollaborationFailureAlertForFailedMetadataLoadWithFallback:URL:", 0, 0);
  }

}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_117(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shelfPluginPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "datasource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePayloadForShelfAnimation:", *(_QWORD *)(a1 + 32));

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "entryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupShelfPluginPayload:", *(_QWORD *)(a1 + 32));

}

- (void)setCompositionForPluginPayload:(id)a3
{
  -[CKModalTranscriptController setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:](self, "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:", a3, 0, 0);
}

- (void)createCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = 0;
  v25 = (id *)&v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__61;
  v28 = __Block_byref_object_dispose__61;
  v29 = 0;
  -[CKChatController composition](self, "composition");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CKChatController composition](self, "composition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:", 0, 0, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatController composition](self, "composition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    if (!v16)
    {
      +[CKComposition compositionWithShelfMediaObject:](CKComposition, "compositionWithShelfMediaObject:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong(v25 + 5, v17);
    if (!v16)

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __126__CKModalTranscriptController_createCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke;
  v20[3] = &unk_1E2758900;
  v23 = &v24;
  v20[4] = self;
  v18 = v12;
  v21 = v18;
  v19 = v13;
  v22 = v19;
  +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v10, v20);

  _Block_object_dispose(&v24, 8);
}

void __126__CKModalTranscriptController_createCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  if (v7)
  {
    objc_msgSend(v7, "compositionByAppendingComposition:", v17);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    v11 = v17;
    v10 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v11;
  }

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canSendComposition:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);

  if (v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "compositionWithCollaborationShareOptions:", *(_QWORD *)(a1 + 40));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)setCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  CKModalTranscriptController *v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  const __CFString *v43;
  void *v44;
  uint8_t buf[4];
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v37 = 0;
  v38 = (id *)&v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__61;
  v41 = __Block_byref_object_dispose__61;
  v42 = 0;
  -[CKChatController composition](self, "composition");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CKChatController composition](self, "composition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:", 0, 0, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatController composition](self, "composition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    if (!v16)
    {
      +[CKComposition compositionWithShelfMediaObject:](CKComposition, "compositionWithShelfMediaObject:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong(v38 + 5, v17);
    if (!v16)

  }
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __123__CKModalTranscriptController_setCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke;
  v32 = &unk_1E2758900;
  v36 = &v37;
  v33 = self;
  v18 = v12;
  v34 = v18;
  v19 = v13;
  v35 = v19;
  v20 = _Block_copy(&v29);
  v21 = objc_msgSend(v10, "shouldStageAsEmbeddedTextAttachment", v29, v30, v31, v32, v33);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = CFSTR("NO");
      if (v21)
        v23 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v46 = v23;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Preparing composition for given pluginPayload. wantsEmbeddedRichLinkTreatment={%@}", buf, 0xCu);
    }

  }
  if (v21)
  {
    objc_msgSend(v10, "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:](CKEmbeddedRichLinkConfiguration, "richLinkConfigurationWithURL:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPluginPayload:", v10);
    v43 = CFSTR("EmbeddedRichLinkConfiguration");
    v44 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc(MEMORY[0x1E0CB3498]);
    v28 = (void *)objc_msgSend(v27, "initWithString:attributes:", *MEMORY[0x1E0D362F8], v26);
    +[CKComposition compositionWithText:subject:shelfPluginPayload:completionHandler:](CKComposition, "compositionWithText:subject:shelfPluginPayload:completionHandler:", v28, 0, 0, v20);

  }
  else
  {
    +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v10, v20);
  }

  _Block_object_dispose(&v37, 8);
}

void __123__CKModalTranscriptController_setCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  if (v7)
  {
    objc_msgSend(v7, "compositionByAppendingComposition:", v18);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    v11 = v18;
    v10 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v11;
  }

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canSendComposition:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);

  if (v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "compositionWithCollaborationShareOptions:", *(_QWORD *)(a1 + 40));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend(*(id *)(a1 + 32), "setComposition:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v17 = *(_QWORD *)(a1 + 48);
    if (v17)
      (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, 1);
  }

}

- (void)setCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5
{
  -[CKModalTranscriptController setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:completionHandler:](self, "setCompositionForPluginPayload:shelfMediaObject:collaborationShareOptions:completionHandler:", a3, a4, a5, 0);
}

- (void)insertMessage:(id)a3 bundleProxy:(id)a4
{
  -[CKModalTranscriptController insertMessage:bundleProxy:extensionBundleIdentifier:](self, "insertMessage:bundleProxy:extensionBundleIdentifier:", a3, a4, 0);
}

- (void)insertMessage:(id)a3 bundleProxy:(id)a4 extensionBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  objc_class *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  uint8_t *v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  id v39;
  CKModalTranscriptController *v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && !self->_alreadySetUp)
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke;
    aBlock[3] = &unk_1E274B060;
    v37 = v9;
    v38 = v10;
    v12 = v8;
    v39 = v12;
    v40 = self;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v12, "layout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("MSMessageLiveLayout"));

    if ((v17 & 1) != 0)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasLoadedExtensions");

      if (!v19)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Waiting for extensions to load before inserting message", buf, 2u);
          }

        }
        *(_QWORD *)buf = 0;
        v31 = buf;
        v32 = 0x3032000000;
        v33 = __Block_byref_object_copy__61;
        v34 = __Block_byref_object_dispose__61;
        v35 = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v11;
        v27[1] = 3221225472;
        v27[2] = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_140;
        v27[3] = &unk_1E2758928;
        v29 = buf;
        v28 = v13;
        objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", CFSTR("CKBrowserSelectionControllerDataSourceChangedNotification"), 0, v24, v27);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)*((_QWORD *)v31 + 5);
        *((_QWORD *)v31 + 5) = v25;

        _Block_object_dispose(buf, 8);
        goto LABEL_18;
      }
      v13[2](v13);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "Extensions were loaded, inserted message";
LABEL_11:
          _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else
    {
      v13[2](v13);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "Non-live layout, inserted message";
          goto LABEL_11;
        }
LABEL_12:

      }
    }
LABEL_18:

  }
}

void __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *j;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  objc_msgSend(v2, "entitlementValueForKey:ofClass:valuesOfClass:", CFSTR("com.apple.private.messages.associated-message-extension-bundle-identifiers"), v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "length")
    && objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("com.apple."))
    && objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v39 = v6;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Overriding pluginKitProxy identifier with %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", *(_QWORD *)(a1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = IMIsPlugInProxyAMessagesExtensionPoint();
    if ((_DWORD)v8)
    {
      __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
LABEL_40:

    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_37;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_26;
  }
  v11 = *(id *)(a1 + 32);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v11, "plugInKitPlugins");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v13 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v12);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v16 = IMIsPlugInProxyAMessagesExtensionPoint();
        if ((_DWORD)v16)
        {
          __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(v16, v15);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
      }
      v9 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_25:

  objc_msgSend(v11, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_26:
    if (objc_msgSend(v4, "count"))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = v4;
      v9 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v9)
      {
        v17 = *(_QWORD *)v29;
        while (2)
        {
          for (j = 0; j != v9; j = (char *)j + 1)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v7);
            objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = IMIsPlugInProxyAMessagesExtensionPoint();
              if ((_DWORD)v20)
              {
                __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(v20, v19);
                v9 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_40;
              }
            }

          }
          v9 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v9)
            continue;
          break;
        }
      }
      goto LABEL_40;
    }
LABEL_37:
    v9 = 0;
  }
LABEL_41:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "browserDisplayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10;
    objc_msgSend((id)objc_msgSend(v9, "dataSourceClass"), "pluginPayloadFromMessagePayload:appIconData:appName:adamID:allowDataPayloads:", *(_QWORD *)(a1 + 48), v21, v22, v23, objc_msgSend(v9, "canSendDataPayloads"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIsFromMe:", 1);
    objc_msgSend(v9, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPluginBundleID:", v25);

    if (objc_msgSend(v24, "shouldExpire")
      && (v26 = +[CKComposition newExpirableCompositionWithText:subject:shelfPluginPayload:](CKComposition, "newExpirableCompositionWithText:subject:shelfPluginPayload:", 0, 0, v24)) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "setComposition:", v26);

    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_135;
      v27[3] = &unk_1E274BA68;
      v27[4] = *(_QWORD *)(a1 + 56);
      +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v24, v27);
    }

  }
}

id __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v2 = a2;
  v3 = (void *)*MEMORY[0x1E0D375D0];
  objc_msgSend(v2, "teamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(":%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "balloonPluginForBundleID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v9, "isEqualToString:", v3);

  if ((_DWORD)v3)
  {
    v10 = objc_alloc(MEMORY[0x1E0D35750]);
    objc_msgSend(v8, "pluginBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithPluginBundle:pluginKitProxy:extension:", v11, v2, 0);

    v8 = (void *)v12;
  }

  return v8;
}

uint64_t __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_135(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setComposition:", a2);
}

void __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Notified of plugin manager plugin changes", buf, 2u);
    }

  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "allPlugins");

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasLoadedExtensions");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Extensions finally loaded, inserted message", v11, 2u);
      }

    }
  }

}

- (void)insertFileURL:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 fullyRealizedPreview:(id)a7 rawPreview:(id)a8 appendedVideoURL:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  _BOOL4 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v45 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (v15)
  {
    -[CKModalTranscriptController assetExplorerManager](self, "assetExplorerManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "generatePackageFromAssetURL:appendedVideoURL:previewImage:", v15, v20, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKModalTranscriptController assetExplorerManager](self, "assetExplorerManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      objc_msgSend(v23, "saveFileURL:filename:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:", v15, v16, v17, v18, v19, v20);

      -[CKModalTranscriptController assetExplorerManager](self, "assetExplorerManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stageAssetPackage:", v22);

    }
    else
    {
      v38 = v20;
      v39 = v19;
      v40 = v18;
      v41 = v17;
      v42 = v16;
      v43 = v15;
      objc_msgSend(v23, "clearAndDisableShelfAndReturnPreviouslyShelvedData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      obj = v26;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v47 != v29)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v31, "fileURL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "filename");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "transcoderUserInfo");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "fullyRealizedPreview");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "rawPreview");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "appendedVideoURL");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKModalTranscriptController insertFileURLAsMediaObject:filename:fileIsResolved:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:](self, "insertFileURLAsMediaObject:filename:fileIsResolved:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:", v32, v33, v45, v34, v35, v36, v37);

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        }
        while (v28);
      }

      v20 = v38;
      v19 = v39;
      v16 = v42;
      v15 = v43;
      v18 = v40;
      v17 = v41;
      -[CKModalTranscriptController insertFileURLAsMediaObject:filename:fileIsResolved:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:](self, "insertFileURLAsMediaObject:filename:fileIsResolved:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:", v43, v42, v45, v41, v40, v39, v38);

      v22 = 0;
    }

  }
}

- (void)insertFileURLAsMediaObject:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 fullyRealizedPreview:(id)a7 rawPreview:(id)a8 appendedVideoURL:(id)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  _BOOL4 v39;
  void *v40;
  _BOOL4 v41;
  CKChatEagerUploadController *eagerUploadController;
  void *v43;
  uint64_t v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v12 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v44) = 0;
  objc_msgSend(v21, "mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v15, v16, v12, v17, 0, 0, 0, v44);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend((id)objc_opt_class(), "canGeneratePreviewInMVSHostProcess");
  if (objc_msgSend(MEMORY[0x1E0D398A0], "isCroppingAvoidanceEnabled"))
  {
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "previewMaxWidth");
        v26 = v25;

        objc_msgSend(v22, "previewForWidth:orientation:", 0, v26);
        v27 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v27;
      }
    }
  }
  if (v18)
    v28 = v23;
  else
    v28 = 0;
  if (v28 == 1)
    objc_msgSend(v22, "cacheAndPersistPreview:orientation:", v18, 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v46 = v15;
      v47 = 2112;
      v48 = v16;
      v49 = 2112;
      v50 = v17;
      v51 = 2112;
      v52 = v20;
      v53 = 2112;
      v54 = v22;
      _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "fileURL %@, filename %@, transcoderUserInfo %@, appendedVideoURL %@, mediaObject %@", buf, 0x34u);
    }

  }
  objc_msgSend(v20, "path");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "length") == 0;

  if (!v31)
  {
    objc_msgSend(v22, "fileURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    CKGetTmpPathForAppendedVideoURL(v20, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "transferGUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    CKLinkAndCreateAppendedVideoTransfer(v33, v20, v34);

  }
  -[CKModalTranscriptController _insertMediaObjectAndReturnFrame:](self, "_insertMediaObjectAndReturnFrame:", v22);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v22, "duration"),
        v36 = v35,
        -[CKCoreChatController conversation](self, "conversation"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v37, "maxTrimDurationForMedia:", v22),
        v39 = v36 <= v38,
        v37,
        v39))
  {
    objc_msgSend(v22, "transfer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = CKFileSizeEligibleForEagerUpload(objc_msgSend(v40, "totalBytes"));

    if (v41)
    {
      eagerUploadController = self->_eagerUploadController;
      -[CKModalTranscriptController proposedParticipantHandles](self, "proposedParticipantHandles");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatEagerUploadController uploadFileURL:filename:transcoderUserInfo:videoComplementURL:attributionInfo:identifier:recipients:](eagerUploadController, "uploadFileURL:filename:transcoderUserInfo:videoComplementURL:attributionInfo:identifier:recipients:", v15, v16, v17, v20, 0, 0, v43);

    }
  }

}

- (id)proposedParticipantHandles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[CKComposeChatController proposedRecipients](self, "proposedRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_canonicalIDSAddressesFromEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCoreChatController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "senderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v4, "arrayByAddingObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }

  return v4;
}

- (void)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5
{
  const __CFString *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *PreferredIdentifierForTag;

  v8 = (const __CFString *)*MEMORY[0x1E0CA5A90];
  v9 = a5;
  v10 = a3;
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v8, (CFStringRef)a4, 0);
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaObjectWithData:UTIType:filename:transcoderUserInfo:", v10, PreferredIdentifierForTag, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKModalTranscriptController _insertMediaObject:](self, "_insertMediaObject:", v12);
}

- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4
{
  _BOOL4 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  objc_super v19;
  uint64_t v20;
  double v21;

  v20 = 0;
  v21 = 0.0;
  v19.receiver = self;
  v19.super_class = (Class)CKModalTranscriptController;
  v7 = -[CKChatController messageEntryViewWidth:andOffset:](&v19, sel_messageEntryViewWidth_andOffset_, &v21, &v20);
  if (v7 && !CKIsRunningInMessages())
  {
    v20 = 0;
    -[CKChatController entryView](self, "entryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "hostedWindowOffset");
      v11 = v10;
      v13 = v12;
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D538];
      v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    -[CKModalTranscriptController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    -[CKModalTranscriptController _offsetForScreenWidth:containerWidth:windowOffset:](self, "_offsetForScreenWidth:containerWidth:windowOffset:", v16, v21, v11, v13);
    v20 = v17;

  }
  if (a3)
    *a3 = v21;
  if (a4)
    *(_QWORD *)a4 = v20;
  return v7;
}

- (double)_offsetForScreenWidth:(double)a3 containerWidth:(double)a4 windowOffset:(CGPoint)a5
{
  double result;

  result = a3 * 0.5 - a4 * 0.5;
  if (a5.x != 0.0)
    return a5.x;
  return result;
}

- (CKComposeAssetExplorerManager)assetExplorerManager
{
  CKComposeAssetExplorerManager *assetExplorerManager;
  CKComposeAssetExplorerManager *v4;
  void *v5;
  CKComposeAssetExplorerManager *v6;
  CKComposeAssetExplorerManager *v7;

  assetExplorerManager = self->_assetExplorerManager;
  if (!assetExplorerManager)
  {
    v4 = [CKComposeAssetExplorerManager alloc];
    -[CKCoreChatController inputController](self, "inputController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKComposeAssetExplorerManager initWithInputController:](v4, "initWithInputController:", v5);
    v7 = self->_assetExplorerManager;
    self->_assetExplorerManager = v6;

    assetExplorerManager = self->_assetExplorerManager;
  }
  return assetExplorerManager;
}

- (void)loadChatInputController
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKModalTranscriptController;
  -[CKChatController loadChatInputController](&v5, sel_loadChatInputController);
  -[CKModalTranscriptController assetExplorerManager](self, "assetExplorerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController inputController](self, "inputController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputController:", v4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKModalTranscriptController;
  v7 = a4;
  -[CKChatController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__CKModalTranscriptController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E274B4D0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

void __82__CKModalTranscriptController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKModalTranscriptController;
  -[CKComposeChatController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  if (!self->_alreadySetUp)
  {
    -[CKModalTranscriptController _setEntryViewVisible:](self, "_setEntryViewVisible:", self->_entryViewInvisible == 0);
    self->_alreadySetUp = 1;
    -[CKModalTranscriptController deferredInsertMediaObjectBlocks](self, "deferredInsertMediaObjectBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Running deferred insert block", v10, 2u);
        }

      }
      -[CKModalTranscriptController deferredInsertMediaObjectBlocks](self, "deferredInsertMediaObjectBlocks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_159_2);

      -[CKModalTranscriptController deferredInsertMediaObjectBlocks](self, "deferredInsertMediaObjectBlocks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeAllObjects");

    }
  }
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resort");

}

uint64_t __46__CKModalTranscriptController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)sendComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKModalTranscriptController;
  v4 = a3;
  -[CKShareSheetChatController sendComposition:](&v10, sel_sendComposition_, v4);
  objc_msgSend(v4, "shelfPluginPayload", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPluginEnabled:", v6);

    if ((v8 & 1) == 0)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEnabled:forPlugin:", 1, v6);

    }
  }
  -[CKChatEagerUploadController didSendComposition](self->_eagerUploadController, "didSendComposition");

}

- (void)_setConversationDeferredSetup
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKModalTranscriptController;
  -[CKComposeChatController _setConversationDeferredSetup](&v5, sel__setConversationDeferredSetup);
  v3 = -[CKModalTranscriptController _deviceIsLocked](self, "_deviceIsLocked");
  -[CKChatController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)_deviceIsLocked
{
  int v2;

  v2 = CKIsRunningInMessagesViewService();
  if (v2)
    LOBYTE(v2) = CKIsScreenLocked();
  return v2;
}

- (void)setPendingAddresses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (CKIsValidAddress(v11))
        {
          +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "recipientWithAddress:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[CKComposeChatController setPrepopulatedRecipients:](self, "setPrepopulatedRecipients:", v5);
}

- (void)setCanEditRecipients:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKComposeChatController composeRecipientSelectionController](self, "composeRecipientSelectionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditable:", v3);

}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  uint64_t v8;

  self->_alreadySetUp = 0;
  LOBYTE(v8) = a7;
  -[CKModalTranscriptController insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:](self, "insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:", a3, a6, 0, 1, a4, a5, v8, a8);
}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7
{
  -[CKModalTranscriptController insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:](self, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:", a3, a4, a5, a6, a7, 0);
}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  self->_alreadySetUp = 0;
  objc_msgSend(a3, "fileURL");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v21)
  {
    LOBYTE(v20) = a7;
    -[CKModalTranscriptController insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:](self, "insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:", v17, v15, 0, 3, v21, v14, v20, v16);
  }
  else
  {
    objc_msgSend(v14, "defaultShareOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = a7;
    -[CKModalTranscriptController insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:](self, "insertRichLinkWithURL:sendAsCopyURL:data:collaborationType:collaborationShareOptions:metadata:isCollaboration:completionHandler:", v18, v15, 0, 3, v19, v14, v20, v16);

  }
}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  self->_alreadySetUp = 0;
  -[CKModalTranscriptController insertRichLinkWithCloudKitShare:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:](self, "insertRichLinkWithCloudKitShare:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:", a3, a4, a5, a6, a7);
}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
  -[CKModalTranscriptController insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:](self, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:", a3, a4, a5, a6, 0);
}

- (void)insertGroupActivity:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  BOOL v8;
  SEL v9;
  SEL v10;
  void *v11;
  SEL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  SEL v24;
  id v25;
  void *v26;
  NSObject *v27;
  CKBrowserItemPayload *v28;
  void *v29;
  void *v30;
  CKComposition *v31;
  void *v32;
  CKComposition *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "insertGroupActivity groupActivity is nil", buf, 2u);
    }

  }
  v38 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  v5 = NSClassFromString(CFSTR("LPSharePlayInviteMetadata"));
  if (v5)
    v6 = objc_alloc_init(v5);
  else
    v6 = 0;
  objc_msgSend(v3, "concatenatedMetadataDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") == 0;

  if (v8)
  {
    v36 = 0;
  }
  else
  {
    objc_msgSend(v3, "concatenatedMetadataDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = NSSelectorFromString(CFSTR("setTitle:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "performSelector:withObject:", v9, v36);
  v10 = NSSelectorFromString(CFSTR("setApplicationBundleIdentifier:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performSelector:withObject:", v10, v11);

  }
  v12 = NSSelectorFromString(CFSTR("setApplication:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "localizedApplicationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v6, "performSelector:withObject:", v12, v13);
    }
    else
    {
      objc_msgSend(v3, "fallbackApplicationName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performSelector:withObject:", v12, v14);

    }
  }
  objc_msgSend(v3, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
    goto LABEL_50;
  v18 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v3, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageWithData:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_50:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "insertGroupActivity image is nil", buf, 2u);
      }

    }
    v21 = 0;
    v22 = 0;
  }
  else
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v21);
  }
  v24 = NSSelectorFromString(CFSTR("setIcon:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "performSelector:withObject:", v24, v22);
  objc_msgSend(v38, "setSpecialization:", v6);
  v25 = objc_alloc_init(MEMORY[0x1E0CC11D8]);
  objc_msgSend(v25, "setMetadata:", v38);
  objc_msgSend(v25, "dataRepresentationWithOutOfLineAttachments:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "insertGroupActivity pluginPayloadData is nil", buf, 2u);
    }

  }
  v28 = objc_alloc_init(CKBrowserItemPayload);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserItemPayload setMessageGUID:](v28, "setMessageGUID:", v29);

  -[CKBrowserItemPayload setPluginBundleID:](v28, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);
  -[CKBrowserItemPayload setData:](v28, "setData:", v26);
  -[CKChatController composition](self, "composition");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[CKComposition initWithText:subject:shelfPluginPayload:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:", 0, 0, v28);
  -[CKComposition shelfPluginPayload](v31, "shelfPluginPayload");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setGroupActivity:", v3);

  if (v30)
  {
    objc_msgSend(v30, "compositionByAppendingComposition:", v31);
    v33 = (CKComposition *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "insertGroupActivity composition is nil, setting as appendComposition", buf, 2u);
      }

    }
    v33 = v31;
  }
  -[CKModalTranscriptController setComposition:](self, "setComposition:", v33);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v3;
      _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Did insert group activity %@", buf, 0xCu);
    }

  }
}

- (void)disableCameraAttachments
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "-[CKModalTranscriptController disableCameraAttachments]";
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", (uint8_t *)&v4, 0xCu);
    }

  }
  -[CKComposeChatController reloadEntryViewIfNeeded](self, "reloadEntryViewIfNeeded");
  self->_cameraSelectionDisabled = 1;
}

- (BOOL)_shouldAllowCameraAttachments
{
  return !self->_cameraSelectionDisabled && !CKIsScreenLocked();
}

- (void)setTextEntryContentsVisible:(BOOL)a3
{
  if (self->_alreadySetUp)
    -[CKModalTranscriptController _setEntryViewVisible:](self, "_setEntryViewVisible:", a3);
  else
    self->_entryViewInvisible = !a3;
}

- (BOOL)shouldDismissAfterSend
{
  return 1;
}

- (void)setForceMMS:(BOOL)a3
{
  id v4;

  self->_forceMMS = a3;
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceMMS:", self->_forceMMS);

}

- (void)_setEntryViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v3 = a3;
  -[CKChatController entryView](self, "entryView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0.0;
  if (v3)
    v6 = 1.0;
  objc_msgSend(v4, "setAlpha:", v6);

}

- (void)hideEntryViewContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[CKChatController entryView](self, "entryView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)messageEntryViewShouldBeginEditing:(id)a3
{
  return !-[CKChatController shouldDisableEntryView](self, "shouldDisableEntryView", a3);
}

- (void)registerForNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!CKIsRunningInMessagesOrSpringBoard())
  {
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationBecameActive_, *MEMORY[0x1E0CEB270], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__screenLocked_, *MEMORY[0x1E0CEB328], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__screenUnlocked_, *MEMORY[0x1E0CEB2D8], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__conversationListDidFinishLoading_, CFSTR("CKConversationListFinishedLoadingNotification"), 0);
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addListener:", self);

  }
}

- (void)_conversationListDidFinishLoading:(id)a3
{
  id v3;

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resort");

}

- (BOOL)_shouldUseDefaultFirstResponder
{
  return 1;
}

- (BOOL)_shouldUseExistingConversations
{
  if (CKIsRunningInMessages())
    return 1;
  else
    return IMIsRunningInMessagesComposeViewService();
}

- (BOOL)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(BOOL)a3
{
  self->_mimeType = a3;
}

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setAssetExplorerManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetExplorerManager, a3);
}

- (BOOL)alreadySetUp
{
  return self->_alreadySetUp;
}

- (void)setAlreadySetUp:(BOOL)a3
{
  self->_alreadySetUp = a3;
}

- (NSMutableArray)partsToInsert
{
  return self->_partsToInsert;
}

- (void)setPartsToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_partsToInsert, a3);
}

- (NSMutableArray)typesToInsert
{
  return self->_typesToInsert;
}

- (void)setTypesToInsert:(id)a3
{
  objc_storeStrong((id *)&self->_typesToInsert, a3);
}

- (int)entryViewInvisible
{
  return self->_entryViewInvisible;
}

- (void)setEntryViewInvisible:(int)a3
{
  self->_entryViewInvisible = a3;
}

- (BOOL)cameraSelectionDisabled
{
  return self->_cameraSelectionDisabled;
}

- (void)setCameraSelectionDisabled:(BOOL)a3
{
  self->_cameraSelectionDisabled = a3;
}

- (CKChatEagerUploadController)eagerUploadController
{
  return self->_eagerUploadController;
}

- (void)setEagerUploadController:(id)a3
{
  objc_storeStrong((id *)&self->_eagerUploadController, a3);
}

- (void)setDeferredInsertMediaObjectBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_deferredInsertMediaObjectBlocks, a3);
}

- (BOOL)appearCompleted
{
  return self->_appearCompleted;
}

- (void)setAppearCompleted:(BOOL)a3
{
  self->_appearCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredInsertMediaObjectBlocks, 0);
  objc_storeStrong((id *)&self->_eagerUploadController, 0);
  objc_storeStrong((id *)&self->_typesToInsert, 0);
  objc_storeStrong((id *)&self->_partsToInsert, 0);
  objc_storeStrong((id *)&self->_assetExplorerManager, 0);
}

@end
