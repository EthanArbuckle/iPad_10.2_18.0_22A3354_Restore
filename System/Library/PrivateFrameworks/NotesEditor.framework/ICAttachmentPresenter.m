@implementation ICAttachmentPresenter

- (ICAttachmentPresenter)initWithViewControllerManager:(id)a3 attachments:(id)a4 startingAtIndex:(unint64_t)a5 delegate:(id)a6 displayShowInNote:(BOOL)a7 editable:(BOOL)a8 presentingViewController:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  ICAttachmentPresenter *v19;
  ICAttachmentPresenter *v20;
  void *v21;

  v9 = a8;
  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = -[ICAttachmentPresenter init](self, "init");
  v20 = v19;
  if (v19)
  {
    -[ICAttachmentPresenter setIc_viewControllerManager:](v19, "setIc_viewControllerManager:", v15);
    -[ICAttachmentPresenter setAttachments:](v20, "setAttachments:", v16);
    -[ICAttachmentPresenter setStartingIndex:](v20, "setStartingIndex:", a5);
    -[ICAttachmentPresenter setDelegate:](v20, "setDelegate:", v17);
    -[ICAttachmentPresenter setDisplayShowInNote:](v20, "setDisplayShowInNote:", v10);
    -[ICAttachmentPresenter setAttachmentEditable:](v20, "setAttachmentEditable:", v9);
    -[ICAttachmentPresenter setPresentingViewController:](v20, "setPresentingViewController:", v18);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v20, sel_hardLinksDidDelete_, *MEMORY[0x1E0D63638], 0);

  }
  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[ICQLPreviewController ic_removeObserver:forKeyPath:context:](self->_qlPreviewController, "ic_removeObserver:forKeyPath:context:", self, CFSTR("currentPreviewItemIndex"), &compoundliteral_7);
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPresenter;
  -[ICAttachmentPresenter dealloc](&v4, sel_dealloc);
}

- (UIBarButtonItem)showInNoteButton
{
  UIBarButtonItem *showInNoteButton;
  void *v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  showInNoteButton = self->_showInNoteButton;
  if (!showInNoteButton)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show in Note"), &stru_1EA7E9860, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v5, 0, self, sel_showInNote_);
    v7 = self->_showInNoteButton;
    self->_showInNoteButton = v6;

    showInNoteButton = self->_showInNoteButton;
  }
  return showInNoteButton;
}

- (id)attachment
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[ICAttachmentPresenter startingIndex](self, "startingIndex");
  -[ICAttachmentPresenter attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 > v5)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = -[ICAttachmentPresenter startingIndex](self, "startingIndex");
      -[ICAttachmentPresenter attachments](self, "attachments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218240;
      v13 = v7;
      v14 = 2048;
      v15 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1DD7B0000, v6, OS_LOG_TYPE_INFO, "Trying to access attachment %ld out of %ld. Falling back to first attachment", (uint8_t *)&v12, 0x16u);

    }
    v3 = 0;
  }
  -[ICAttachmentPresenter attachments](self, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isAttachmentBrowser
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[ICAttachmentPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[ICAttachmentPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAttachmentBrowser");

  return v6;
}

- (NSArray)quickLookFilteredAttachments
{
  NSArray *quickLookFilteredAttachments;

  quickLookFilteredAttachments = self->_quickLookFilteredAttachments;
  if (!quickLookFilteredAttachments)
  {
    -[ICAttachmentPresenter updateQuickLookFilteredAttachments](self, "updateQuickLookFilteredAttachments");
    quickLookFilteredAttachments = self->_quickLookFilteredAttachments;
  }
  return quickLookFilteredAttachments;
}

- (unint64_t)quickLookFilteredStartingIndex
{
  if (!self->_quickLookFilteredAttachments)
    -[ICAttachmentPresenter updateQuickLookFilteredAttachments](self, "updateQuickLookFilteredAttachments");
  return self->_quickLookFilteredStartingIndex;
}

- (void)updateQuickLookFilteredAttachments
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;
  ICAttachmentPresenter *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v18 = -[ICAttachmentPresenter startingIndex](self, "startingIndex");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPresenter attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__ICAttachmentPresenter_updateQuickLookFilteredAttachments__block_invoke;
  v11[3] = &unk_1EA7E1258;
  v5 = v3;
  v12 = v5;
  v13 = self;
  v14 = &v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

  v6 = v16[3];
  if (v6 <= objc_msgSend(v5, "count"))
  {
    v8 = v16[3];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_INFO, "Something went wrong calculating the QuickLook filtered starting index. Falling back to first attachment", v10, 2u);
    }

    v8 = 0;
    v16[3] = 0;
  }
  -[ICAttachmentPresenter setQuickLookFilteredStartingIndex:](self, "setQuickLookFilteredStartingIndex:", v8);
  v9 = (void *)objc_msgSend(v5, "copy");
  -[ICAttachmentPresenter setQuickLookFilteredAttachments:](self, "setQuickLookFilteredAttachments:", v9);

  _Block_object_dispose(&v15, 8);
}

void __59__ICAttachmentPresenter_updateQuickLookFilteredAttachments__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "supportsQuickLook"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "startingIndex") > a3)
  {
    --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

- (BOOL)isAttachmentPresentedInProcess
{
  void *v3;
  void *v4;
  void *v6;
  unsigned int v7;

  -[ICAttachmentPresenter attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synapseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  -[ICAttachmentPresenter attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "attachmentType");

  if (v7 <= 0xD)
    return (0x980u >> v7) & 1;
  else
    return 1;
}

- (void)presentAttachmentWithSelectedSubAttachment:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  -[ICAttachmentPresenter delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICAttachmentPresenter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentPresenterWillPresent:", self);

  }
  -[ICAttachmentPresenter attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synapseData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "attachmentType");
  if (v8)
    v10 = 0;
  else
    v10 = v9 == 0;
  if (!v10)
  {
    v11 = v9;
    if ((v9 & 0xFFFFFFFB) != 9)
    {
      if ((unsigned __int16)(v9 - 9) <= 0xFFFDu)
        objc_msgSend((id)*MEMORY[0x1E0DC4730], "sendAction:to:from:forEvent:", sel_resignFirstResponder, 0, 0, 0);
      if (v8)
      {
        -[ICAttachmentPresenter presentSynapseLink](self, "presentSynapseLink");
      }
      else
      {
        switch(v11)
        {
          case 0:
          case 1:
          case 2:
          case 3:
          case 6:
          case 9:
          case 10:
          case 12:
          case 13:
          case 14:
          case 15:
            -[ICAttachmentPresenter presentPreview](self, "presentPreview");
            break;
          case 4:
            if (!ICInternalSettingsIsAudioTranscriptionEnabled())
              goto LABEL_19;
            -[ICAttachmentPresenter presentAudioRecording](self, "presentAudioRecording");
            break;
          case 5:
LABEL_19:
            -[ICAttachmentPresenter presentMovie](self, "presentMovie");
            break;
          case 7:
          case 8:
            -[ICAttachmentPresenter presentURL](self, "presentURL");
            break;
          case 11:
            -[ICAttachmentPresenter presentGalleryAttachmentWithSelectedSubAttachment:](self, "presentGalleryAttachmentWithSelectedSubAttachment:", v15);
            break;
          default:
            break;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0D636D8];
      -[ICAttachmentPresenter attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_attachmentWillBeDeletedNotification_, v13, v14);

    }
  }

}

- (void)presentMovie
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D64B10], "sharedAudioController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[ICAttachmentPresenter presentPreview](self, "presentPreview");
}

- (void)presentAudioRecording
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICAttachmentPresenter attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttachmentPresenter attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDeletedOrInTrash");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0D64B20];
      -[ICAttachmentPresenter attachment](self, "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "audioModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getHostingViewForAttachmentModel:delegate:", v10, self);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[ICAttachmentPresenter presentAttachmentViewController:](self, "presentAttachmentViewController:", v11);
    }
  }
}

- (void)presentURL
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v3, v4, "Presenting URL from attachment %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

void __35__ICAttachmentPresenter_presentURL__block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.notes", "UI");
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __35__ICAttachmentPresenter_presentURL__block_invoke_cold_1(a1);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortLoggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1DD7B0000, v5, OS_LOG_TYPE_DEFAULT, "Failed to present URL from attachment %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)presentSynapseLink
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, v0, v1, "Presenting Synapse Link from attachment %@", v2);
  OUTLINED_FUNCTION_6();
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  NSObject *v13;

  v5 = a3;
  v6 = os_log_create("com.apple.notes", "UI");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (!a2)
  {
    if (v7)
      __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_2();
    goto LABEL_8;
  }
  if (v7)
    __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_1(a1, v6, v8);

  if (*(_BYTE *)(a1 + 56))
  {
    v9 = (void *)MEMORY[0x1E0DB0750];
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_146;
    v12[3] = &unk_1EA7E0228;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v9, "activateWithDomainIdentifier:noteIdentifier:completion:", v11, v10, v12);
    v6 = v13;
LABEL_8:

  }
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_146(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_146_cold_1();

  }
}

- (void)presentQuickLook
{
  void *v3;
  ICQLPreviewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(ICQLPreviewController);
    -[ICAttachmentPresenter setQlPreviewController:](self, "setQlPreviewController:", v4);

    -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addObserver:forKeyPath:context:", self, CFSTR("currentPreviewItemIndex"), &compoundliteral_7);

  }
  if (-[ICAttachmentPresenter displayShowInNote](self, "displayShowInNote"))
  {
    -[ICAttachmentPresenter showInNoteButton](self, "showInNoteButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItems:", v7);

  }
  -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDataSource:", self);

  -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  v12 = -[ICAttachmentPresenter quickLookFilteredStartingIndex](self, "quickLookFilteredStartingIndex");
  -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentPreviewItemIndex:", v12);

  -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPresenter presentAttachmentViewController:](self, "presentAttachmentViewController:", v14);

}

- (void)presentGalleryAttachmentWithSelectedSubAttachment:(id)a3
{
  ICGalleryAttachmentEditorController *v4;
  void *v5;
  ICGalleryAttachmentEditorController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;

  v19 = a3;
  v4 = [ICGalleryAttachmentEditorController alloc];
  -[ICAttachmentPresenter attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICGalleryAttachmentEditorController initWithGalleryAttachment:browserMode:delegate:](v4, "initWithGalleryAttachment:browserMode:delegate:", v5, -[ICAttachmentPresenter isAttachmentBrowser](self, "isAttachmentBrowser"), self);
  -[ICAttachmentPresenter setGalleryAttachmentEditorController:](self, "setGalleryAttachmentEditorController:", v6);

  if (v19)
  {
    objc_opt_class();
    -[ICAttachmentPresenter attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "indexOfSubAttachmentWithIdentifier:", v10);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 1;
    else
      v12 = v11;

  }
  else
  {
    v12 = 0;
  }
  -[ICAttachmentPresenter delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPresenter attachment](self, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attachmentPresenter:transitionViewForAttachment:", self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPresenter presentingViewController](self, "presentingViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "openEditorOnViewController:pageIndex:sourceView:", v17, v12, v15);

  if ((v18 & 1) == 0)
    -[ICAttachmentPresenter setGalleryAttachmentEditorController:](self, "setGalleryAttachmentEditorController:", 0);

}

- (id)transitionViewForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICAttachmentPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentPresenter:transitionViewForAttachment:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transitionViewForAttachment:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[ICAttachmentPresenter delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  -[ICAttachmentPresenter delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
    objc_msgSend(v10, "attachmentPresenter:transitionViewForIndexPath:", self, v7);
  else
    objc_msgSend(v10, "attachmentPresenter:transitionViewForAttachment:", self, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)scrollCollectionViewToIndexPath:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICAttachmentPresenter delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICAttachmentPresenter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollCollectionViewToIndexPath:", v7);

  }
}

- (void)presentAttachmentViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a3;
  -[ICAttachmentPresenter setPresentedViewController:](self, "setPresentedViewController:", v4);
  -[ICAttachmentPresenter presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ICAttachmentPresenter_presentAttachmentViewController___block_invoke;
  v7[3] = &unk_1EA7DD2D8;
  v7[4] = self;
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, v6, v7);

}

void __57__ICAttachmentPresenter_presentAttachmentViewController___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "qlPreviewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentPreviewItemIndex");

  objc_msgSend(*(id *)(a1 + 32), "quickLookFilteredAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(*(id *)(a1 + 32), "quickLookFilteredAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 >= v5)
    objc_msgSend(v6, "firstObject");
  else
    objc_msgSend(v6, "objectAtIndexedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "presentReadOnlyAlertIfNecessaryForAttachment:", v8);
}

+ (id)previewViewControllerWithViewControllerManager:(id)a3 attachments:(id)a4 startingAtIndex:(unint64_t)a5 delegate:(id)a6 editable:(BOOL)a7 isFromAttachmentBrowser:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  ICMapViewController *v26;
  ICAttachmentPresenter *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  __objc2_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  _BOOL4 v63;
  void *v64;
  _QWORD v65[2];

  v8 = a8;
  v9 = a7;
  v65[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(v14, "objectAtIndexedSubscript:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "attachmentType");
  if (v17 == 12)
    goto LABEL_19;
  v18 = v17;
  if (!(_WORD)v17 && !objc_msgSend(v16, "hasFallbackPDF"))
    goto LABEL_19;
  v63 = v8;
  v64 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  objc_msgSend(v13, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "windowScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "screen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "ic_isSecure");

  if (v18 > 0xF)
  {
    v26 = 0;
    v13 = v21;
    v14 = v20;
    v15 = v19;
    v16 = v64;
    goto LABEL_20;
  }
  v13 = v21;
  if (((1 << v18) & 0xFC77) == 0)
  {
    v14 = v20;
    v16 = v64;
    if (((1 << v18) & 0x180) != 0)
    {
      v15 = v19;
      if ((v25 & 1) != 0)
        goto LABEL_19;
      if (v18 != 7)
      {
LABEL_37:
        objc_msgSend(v16, "URL");
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v55, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D470F0]) == 2)
        {

        }
        else
        {
          v56 = -[objc_class canOpenURL:](getNSSNewsViewControllerClass(), "canOpenURL:", v33);

          if (v56)
          {
            v57 = ICNewsViewController;
LABEL_51:
            v26 = (ICMapViewController *)objc_msgSend([v57 alloc], "initWithURL:", v33);
            v16 = v64;
            -[ICMapViewController setAttachment:](v26, "setAttachment:", v64);
            goto LABEL_52;
          }
        }
        objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v58, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47128]) != 2)
        {
          objc_msgSend(v33, "scheme");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v59, "length"))
          {
            objc_msgSend(v33, "scheme");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v60, "caseInsensitiveCompare:", CFSTR("http")))
            {

LABEL_50:
              v57 = ICSafariViewController;
              goto LABEL_51;
            }
            objc_msgSend(v33, "scheme");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "caseInsensitiveCompare:", CFSTR("https"));

            if (!v62)
              goto LABEL_50;
            goto LABEL_48;
          }

        }
LABEL_48:
        v26 = 0;
        v16 = v64;
        goto LABEL_52;
      }
      v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D64AE8]), "initWithAttachment:", v64);
      v34 = objc_alloc((Class)get_MKURLParserClass());
      objc_msgSend(v64, "URL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithURL:", v35);

      if (objc_msgSend(v36, "parseIncludingCustomParameters:", 1))
      {
        objc_msgSend(v36, "collectionStorage");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {

          v16 = v64;
LABEL_36:

          goto LABEL_37;
        }
      }
      v16 = v64;
      if (!v33)
        goto LABEL_36;
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64AE8]), "initWithAttachment:", v64);
      v26 = -[ICMapViewController initWithAnnotation:]([ICMapViewController alloc], "initWithAnnotation:", v45);
    }
    else
    {
      v15 = v19;
      if ((objc_msgSend(v64, "needsInitialFetchFromCloud") & 1) != 0)
        goto LABEL_19;
      v26 = -[ICImagePreviewController initWithAttachment:]([ICImagePreviewController alloc], "initWithAttachment:", v64);
      v33 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      objc_msgSend(v33, "setContentMode:", 1);
      -[ICMapViewController view](v26, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addSubview:", v33);

      objc_msgSend(v33, "ic_addAnchorsToFillSuperviewWithPadding:", -1.0);
      objc_msgSend(v64, "image");
      v40 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v40;
      if (v18 == 11 && !v40)
      {
        objc_opt_class();
        objc_msgSend(v64, "attachmentModel");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42 && objc_msgSend(v42, "subAttachmentCount"))
        {
          v43 = (void *)MEMORY[0x1E0D64BF0];
          objc_msgSend(v42, "firstSubAttachment");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "imageForSubAttachment:", v44);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v36 = 0;
        }
        v16 = v64;

      }
      if (v36)
      {
        objc_msgSend(v33, "setImage:", v36);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "bounds");
        v48 = v47;
        v50 = v49;
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "scale");
        objc_msgSend(v64, "attachmentPreviewImageWithMinSize:scale:", v48, v50, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v64;
        objc_msgSend(v53, "orientedImage");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setImage:", v54);

      }
      -[ICMapViewController view](v26, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
      -[ICMapViewController setPreferredContentSize:](v26, "setPreferredContentSize:");
    }

LABEL_52:
    goto LABEL_20;
  }
  v14 = v20;
  v16 = v64;
  if ((v25 & 1) != 0)
  {
    v26 = 0;
    v15 = v19;
    goto LABEL_20;
  }
  v15 = v19;
  if ((objc_msgSend(v64, "needsInitialFetchFromCloud") & 1) != 0)
  {
LABEL_19:
    v26 = 0;
    goto LABEL_20;
  }
  v26 = objc_alloc_init(ICQLPreviewController);
  v27 = -[ICAttachmentPresenter initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:]([ICAttachmentPresenter alloc], "initWithViewControllerManager:attachments:startingAtIndex:delegate:displayShowInNote:editable:presentingViewController:", v13, v14, a5, v19, 0, v9, 0);
  -[ICAttachmentPresenter setQlPreviewController:](v27, "setQlPreviewController:", v26);
  -[ICMapViewController setDelegate:](v26, "setDelegate:", v27);
  -[ICMapViewController setDataSource:](v26, "setDataSource:", v27);
  -[ICMapViewController setCurrentPreviewItemIndex:](v26, "setCurrentPreviewItemIndex:", -[ICAttachmentPresenter quickLookFilteredStartingIndex](v27, "quickLookFilteredStartingIndex"));
  if (v63)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Show in Note"), &stru_1EA7E9860, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v29, 0, v27, sel_showInNote_);
    v65[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMapViewController navigationItem](v26, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setRightBarButtonItems:", v31);

    v16 = v64;
  }
  objc_setAssociatedObject(v26, (const void *)ICAttachmentPreviewViewControllerKey, v27, (void *)0x301);

LABEL_20:
  return v26;
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "prefersStatusBarHidden");
  return (char)v2;
}

+ (BOOL)shouldCommitPreviewViewController:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "currentPreviewItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v4, "currentPreviewItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      v8 = objc_opt_isKindOfClass();

      if ((v8 & 1) == 0)
        goto LABEL_8;
      objc_msgSend(v4, "currentPreviewItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v7)
    {
      objc_msgSend(v7, "parentAttachment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

LABEL_9:
      goto LABEL_10;
    }
LABEL_8:
    v11 = 1;
    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (void)dismiss:(id)a3
{
  -[ICAttachmentPresenter dismissAnimated:completion:](self, "dismissAnimated:completion:", objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled", a3), 0);
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[ICAttachmentPresenter presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!-[ICAttachmentPresenter isDismissing](self, "isDismissing"))
    {
      -[ICAttachmentPresenter setIsDismissing:](self, "setIsDismissing:", 1);
      -[ICAttachmentPresenter presentedViewController](self, "presentedViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __52__ICAttachmentPresenter_dismissAnimated_completion___block_invoke;
      v11[3] = &unk_1EA7DFD40;
      v11[4] = self;
      v12 = v6;
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", v4, v11);

      goto LABEL_8;
    }
  }
  else
  {
    -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ICAttachmentPresenter setGalleryAttachmentEditorController:](self, "setGalleryAttachmentEditorController:", 0);
      -[ICAttachmentPresenter notifyDelegateDidDismiss](self, "notifyDelegateDidDismiss");
    }
  }
  if (v6)
    v6[2](v6);
LABEL_8:

}

uint64_t __52__ICAttachmentPresenter_dismissAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateDidDismiss");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setIsDismissing:", 0);
}

- (void)notifyDelegateDidDismiss
{
  void *v3;
  ICAttachmentPresenter *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[ICAttachmentPresenter ic_viewControllerManager](self, "ic_viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAttachmentPresenter");
  v4 = (ICAttachmentPresenter *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[ICAttachmentPresenter ic_viewControllerManager](self, "ic_viewControllerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCurrentAttachmentPresenter:", 0);

  }
  -[ICAttachmentPresenter delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ICAttachmentPresenter delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentPresenterDidDismiss:", self);

  }
}

- (void)showInNote:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttachmentPresenter quickLookFilteredAttachments](self, "quickLookFilteredAttachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "currentPreviewItemIndex"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttachmentPresenter attachment](self, "attachment");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[ICAttachmentPresenter ic_viewControllerManager](self, "ic_viewControllerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectAttachmentWithObjectID:animated:", v8, 1);

  -[ICAttachmentPresenter eventReporter](self, "eventReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitAttachmentBrowserActionEventForType:", 3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICAttachmentPresenter ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/AttachmentPresentation/ICAttachmentPresenter.m") & 1) != 0)
  {
    v13 = -[ICAttachmentPresenter ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &compoundliteral_7 && (v13 & 1) == 0)
      -[ICAttachmentPresenter previewControllerDidChangeCurrentItem](self, "previewControllerDidChangeCurrentItem");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICAttachmentPresenter;
    -[ICAttachmentPresenter observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

- (void)presentReadOnlyAlertIfNecessaryForAttachment:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "attachmentType") == 1 && objc_msgSend(v5, "hasFallbackPDF"))
  {
    -[ICAttachmentPresenter qlPreviewController](self, "qlPreviewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showViewOnlyWarning");

  }
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ICQLItem *v11;
  void *v12;
  char v13;
  void *v14;

  -[ICAttachmentPresenter quickLookFilteredAttachments](self, "quickLookFilteredAttachments", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[ICAttachmentPresenter quickLookFilteredAttachments](self, "quickLookFilteredAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 <= a4)
    objc_msgSend(v8, "firstObject");
  else
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICQLItem initWithAttachment:]([ICQLItem alloc], "initWithAttachment:", v10);
  if (objc_msgSend(v10, "attachmentType") == 6 || objc_msgSend(v10, "hasFallbackPDF"))
  {
    -[ICAttachmentPresenter delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[ICAttachmentPresenter delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLItem setUseFullPDFTransition:](v11, "setUseFullPDFTransition:", objc_msgSend(v14, "attachmentPresenter:useFullPDFTransitionForAttachment:", self, v10));

    }
  }

  return v11;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;

  -[ICAttachmentPresenter quickLookFilteredAttachments](self, "quickLookFilteredAttachments", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[ICAttachmentPresenter quickLookFilteredAttachments](self, "quickLookFilteredAttachments");
  else
    -[ICAttachmentPresenter attachments](self, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (void)previewControllerDidDismiss:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke;
  block[3] = &unk_1EA7DD2D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateDidDismiss");
  v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke_cold_1(v2);

  objc_msgSend(*(id *)(a1 + 32), "ic_viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteEditorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPreviewingAttachmentFromNote:", 0);

}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    objc_msgSend(v5, "attachment");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (v6)
  {
    -[ICAttachmentPresenter delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentPresenter:transitionViewForAttachment:", self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
LABEL_7:
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_INFO, "Could not find attachment for transitioning preview item: %@", (uint8_t *)&v11, 0xCu);
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  uint64_t v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D96E28];
  v5[0] = *MEMORY[0x1E0D63EF0];
  v5[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v5;

  objc_msgSend(a3, "presentingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)attachmentWillBeDeletedNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPresenter attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[ICAttachmentPresenter dismiss:](self, "dismiss:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D636D8];
    -[ICAttachmentPresenter attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);

  }
}

- (void)hardLinksDidDelete:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachmentPresenter hardLinksDidDelete:]", 1, 0, CFSTR("Hard links deleted while attachment was presented, this should not happen.  Reloading the preview controller"));
  dispatchMainAfterDelay();
}

void __44__ICAttachmentPresenter_hardLinksDidDelete___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "qlPreviewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;

  v5 = a4;
  if (!-[ICAttachmentPresenter isAttachmentEditable](self, "isAttachmentEditable"))
    goto LABEL_8;
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_opt_class(),
        ICDynamicCast(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "attachment"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    objc_msgSend(v6, "attachmentModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canMarkup");

    if (v9)
      v10 = 2;
    else
      v10 = 0;

  }
  else
  {
LABEL_8:
    v10 = 0;
  }

  return v10;
}

- (void)updateEditedPreviewItemAtURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICAttachmentPresenter attachment](self, "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPresenter updateEditedPreviewItem:atURL:shouldAttemptToWriteDataFromURL:previewController:](self, "updateEditedPreviewItem:atURL:shouldAttemptToWriteDataFromURL:previewController:", v5, v4, 1, 0);

}

- (void)updateEditedPreviewItem:(id)a3 atURL:(id)a4 shouldAttemptToWriteDataFromURL:(BOOL)a5 previewController:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v15 = a3;
  v9 = a4;
  v10 = a6;
  objc_opt_class();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (objc_opt_class(),
        ICDynamicCast(),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "attachment"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11))
  {
    objc_msgSend(v9, "startAccessingSecurityScopedResource");
    objc_msgSend(v11, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke;
    v16[3] = &unk_1EA7E12A8;
    v17 = v10;
    v18 = v11;
    v19 = v9;
    v20 = a5;
    v14 = v11;
    objc_msgSend(v13, "performBlockAndWait:", v16);

  }
}

void __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke(uint64_t a1)
{
  id v2;
  id *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  os_log_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;

  v2 = *(id *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  if (!objc_msgSend(*(id *)(a1 + 40), "shouldEmbedMarkupDataInMedia"))
  {
    objc_msgSend(MEMORY[0x1E0D63BA0], "markupModelDataFromDataAtURL:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setMarkupModelData:", v10);

    v7 = 0;
LABEL_16:
    v14 = v7;
    objc_msgSend(*v3, "attachmentDidChange");
    objc_msgSend(*v3, "setPreviewUpdateDate:", 0);
    objc_msgSend(*v3, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    objc_msgSend(v15, "save:", &v17);
    v7 = v17;

    if (v7)
    {
      v16 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_1(a1 + 40, (uint64_t)v7, v16);

    }
    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v9 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject generatePreviewIfNeededForAttachment:](v9, "generatePreviewIfNeededForAttachment:", *v3);
    goto LABEL_21;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "ic_isReachable") & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "media");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 48);
      v18 = 0;
      v6 = objc_msgSend(v4, "writeDataFromFileURL:error:", v5, &v18);
      v7 = v18;

      if ((v6 & 1) == 0)
      {
        v8 = (void *)MEMORY[0x1E0D641A0];
        objc_msgSend(*v3, "shortLoggingDescription");
        v9 = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachmentPresenter updateEditedPreviewItem:atURL:shouldAttemptToWriteDataFromURL:previewController:]_block_invoke", 1, 1, CFSTR("Unable to update data for attachment: %@, %@"), v9, v7);
        goto LABEL_21;
      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setHasMarkupData:", objc_msgSend(MEMORY[0x1E0D63BA0], "hasPrivateImageMetadata:", v11));
    objc_msgSend(MEMORY[0x1E0D63BA0], "cleanImageMetadataFromData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(*v3, "setCachedImage:", v13);

    }
    goto LABEL_16;
  }
  v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_2(a1 + 40, v9);

  v7 = 0;
LABEL_21:

  objc_msgSend(*(id *)(a1 + 48), "stopAccessingSecurityScopedResource");
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  -[ICAttachmentPresenter updateEditedPreviewItem:atURL:shouldAttemptToWriteDataFromURL:previewController:](self, "updateEditedPreviewItem:atURL:shouldAttemptToWriteDataFromURL:previewController:", a4, a5, 1, a3);
}

- (BOOL)previewController:(id)a3 canShareItem:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D64DE8], "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSecureScreenShowing") ^ 1;

  return v5;
}

- (void)galleryAttachmentEditorControllerDidDismiss
{
  -[ICAttachmentPresenter setGalleryAttachmentEditorController:](self, "setGalleryAttachmentEditorController:", 0);
  -[ICAttachmentPresenter notifyDelegateDidDismiss](self, "notifyDelegateDidDismiss");
}

- (void)galleryAttachmentEditorControllerDeleteAttachment
{
  void *v3;
  char v4;
  id v5;

  -[ICAttachmentPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[ICAttachmentPresenter delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleDeleteAttachmentFromPresenter:", self);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachmentPresenter galleryAttachmentEditorControllerDeleteAttachment]", 1, 0, CFSTR("Delete attachment called on presenter, but not handled by delegate."));
  }
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  ICNAEventReporter *v8;
  ICNAEventReporter *eventReporter;
  void *v10;

  if (!self->_eventReporter && objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D62A30]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPresenter ic_viewControllerManager](self, "ic_viewControllerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:window:", v5, v7);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D62A18];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (UITextView)textView
{
  return 0;
}

- (void)presentSharingViewForAttachment:(id)a3 fromSourceView:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentPresenter presentSharingViewForAttachment:fromSourceView:].cold.1(v6);

  -[ICAttachmentPresenter presentingViewController](self, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_topViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D64BE0];
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke;
  v17[3] = &unk_1EA7DE880;
  v18 = v6;
  v19 = v7;
  v20 = v10;
  v14 = v10;
  v15 = v7;
  v16 = v6;
  objc_msgSend(v11, "generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:", v12, v13, v14, v17);

}

void __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v1 = a1 + 32;
  +[ICAttachmentActivityViewController makeWithAttachment:quickLookItemDelegate:completion:](ICAttachmentActivityViewController, "makeWithAttachment:quickLookItemDelegate:completion:", *(_QWORD *)(a1 + 32), 0, &__block_literal_global_27);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(v1 + 8);
  objc_msgSend(v2, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceView:", v3);

  objc_msgSend(*(id *)(v1 + 16), "presentViewController:animated:completion:", v2, 1, &__block_literal_global_198);
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke_cold_1(v1);

}

- (void)presentExportViewForAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ICAttachmentPresenter *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentPresenter presentExportViewForAttachment:].cold.1(v4);

  -[ICAttachmentPresenter presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D64BE0];
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke;
  v13[3] = &unk_1EA7DE880;
  v14 = v4;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v4;
  objc_msgSend(v8, "generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:", v9, v10, v11, v13);

}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke(id *a1)
{
  id *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  v3 = objc_msgSend(a1[4], "isPasswordProtected");
  v4 = *v2;
  if (v3)
  {
    objc_msgSend(v4, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decryptedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v14 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_1((uint64_t)v2);
      goto LABEL_25;
    }
    objc_msgSend(*v2, "userTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(*v2, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
      }
      else
      {
        objc_msgSend(*v2, "defaultTitle");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v17;

    }
    v18 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(a1[4], "typeUTI");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "importedTypeWithIdentifier:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = (void *)*MEMORY[0x1E0CEC450];
    if (v20)
      v22 = (void *)v20;
    v23 = v22;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "URLByAppendingPathComponent:isDirectory:", CFSTR("AudioExport"), 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAppendingPathComponent:isDirectory:", v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "ic_sanitizedFilenameString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "URLByAppendingPathComponent:conformingToType:", v30, v23);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "preferredFilenameExtension");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = (const __CFString *)v32;
    else
      v34 = &stru_1EA7E9860;
    objc_msgSend(v31, "URLByAppendingPathComponent:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    objc_msgSend(v6, "writeToURL:options:error:", v35, 1, &v38);
    v36 = v38;
    objc_msgSend(a1[5], "setTemporaryExportURLToRemove:", v35);
    if (v36)
    {
      v37 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_3((uint64_t)v2, (uint64_t)v36, v37);

    }
LABEL_23:
    v14 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_2((uint64_t)v2);
LABEL_25:
    v11 = v14;
    goto LABEL_26;
  }
  objc_msgSend(v4, "previewItemURL");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_23;
  v11 = (void *)v10;
  v12 = objc_alloc(MEMORY[0x1E0DC3730]);
  v39[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "initForExportingURLs:asCopy:", v13, 1);

  -[NSObject setDelegate:](v14, "setDelegate:", a1[5]);
  objc_msgSend(a1[6], "presentViewController:animated:completion:", v14, 1, &__block_literal_global_206);
LABEL_26:

}

- (void)removeTempooraryExportURL
{
  void *v3;
  void *v4;
  id v5;

  -[ICAttachmentPresenter temporaryExportURLToRemove](self, "temporaryExportURLToRemove");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPresenter temporaryExportURLToRemove](self, "temporaryExportURLToRemove");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

  }
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentedViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (ICViewControllerManager)ic_viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_ic_viewControllerManager);
}

- (void)setIc_viewControllerManager:(id)a3
{
  objc_storeWeak((id *)&self->_ic_viewControllerManager, a3);
}

- (unint64_t)startingIndex
{
  return self->_startingIndex;
}

- (void)setStartingIndex:(unint64_t)a3
{
  self->_startingIndex = a3;
}

- (void)setQuickLookFilteredAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookFilteredAttachments, a3);
}

- (void)setQuickLookFilteredStartingIndex:(unint64_t)a3
{
  self->_quickLookFilteredStartingIndex = a3;
}

- (ICAttachmentPresenterDelegate)delegate
{
  return (ICAttachmentPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)displayShowInNote
{
  return self->_displayShowInNote;
}

- (void)setDisplayShowInNote:(BOOL)a3
{
  self->_displayShowInNote = a3;
}

- (BOOL)isAttachmentEditable
{
  return self->_attachmentEditable;
}

- (void)setAttachmentEditable:(BOOL)a3
{
  self->_attachmentEditable = a3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICQLPreviewController)qlPreviewController
{
  return (ICQLPreviewController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQlPreviewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setShowInNoteButton:(id)a3
{
  objc_storeStrong((id *)&self->_showInNoteButton, a3);
}

- (ICGalleryAttachmentEditorController)galleryAttachmentEditorController
{
  return self->_galleryAttachmentEditorController;
}

- (void)setGalleryAttachmentEditorController:(id)a3
{
  objc_storeStrong((id *)&self->_galleryAttachmentEditorController, a3);
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (NSURL)temporaryExportURLToRemove
{
  return self->_temporaryExportURLToRemove;
}

- (void)setTemporaryExportURLToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryExportURLToRemove, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_galleryAttachmentEditorController, 0);
  objc_storeStrong((id *)&self->_showInNoteButton, 0);
  objc_storeStrong((id *)&self->_qlPreviewController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quickLookFilteredAttachments, 0);
  objc_destroyWeak((id *)&self->_ic_viewControllerManager);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

- (ICAttachment)displayedAttachment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICAttachmentPresenter presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    objc_msgSend(v4, "currentPreviewItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "galleryAttachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachmentPresenter(AttachmentState) displayedAttachment]", 1, 0, CFSTR("Unknown type of attachment controller: %@"), v3);
      v7 = 0;
    }
  }

  return (ICAttachment *)v7;
}

- (ICAttachment)selectedSubAttachment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extractedDocumentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedScanDataDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (ICAttachment *)v6;
}

- (NSDictionary)presentedAttachmentUIState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentUIState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICAttachmentPresenter presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentUIState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDictionary *)v5;
}

- (void)applyPresentedAttachmentUIStateIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICAttachmentPresenter galleryAttachmentEditorController](self, "galleryAttachmentEditorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICAttachmentPresenter presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICProtocolCast();
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v8;
  }
  v9 = v6;
  objc_msgSend(v6, "applyAttachmentUIStateIfNecessary:", v4);

}

void __35__ICAttachmentPresenter_presentURL__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v3, v4, "Presented URL from attachment %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_0();
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, a3, "Finished navigation to Synapse Link from attachment %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_1(&dword_1DD7B0000, v0, (uint64_t)v0, "Error navigating to Synapse Link from attachment %@. Error: %@", v1);
  OUTLINED_FUNCTION_6();
}

void __43__ICAttachmentPresenter_presentSynapseLink__block_invoke_146_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_1(&dword_1DD7B0000, v0, (uint64_t)v0, "Error launching QuickNote with Synapse Link from attachment %@. Error: %@", v1);
  OUTLINED_FUNCTION_6();
}

void __53__ICAttachmentPresenter_previewControllerDidDismiss___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "isPreviewingAttachmentFromNote = NO, preview did dismiss", v1, 2u);
}

void __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_5_1(a1), "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Unable to save after updating data for attachment: %@, %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

void __105__ICAttachmentPresenter_updateEditedPreviewItem_atURL_shouldAttemptToWriteDataFromURL_previewController___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_5_1(a1), "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1DD7B0000, a2, v4, "Updated content URL is not reachable attachment: %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)presentSharingViewForAttachment:(void *)a1 fromSourceView:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Presenting activity view controller… {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __72__ICAttachmentPresenter_presentSharingViewForAttachment_fromSourceView___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_1(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Presented activity view controller… {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)presentExportViewForAttachment:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Presenting save panel for attachment… {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_1(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Cannot present document view controller because decrypted data is unavailable {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5_1(a1), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "Cannot present document view controller because attachment doesn't have preview URL {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __56__ICAttachmentPresenter_presentExportViewForAttachment___block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_5_1(a1), "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_1(&dword_1DD7B0000, a3, v5, "Cannot present document view controller {attachment: %@, error: %@}", v6);

  OUTLINED_FUNCTION_0_0();
}

@end
