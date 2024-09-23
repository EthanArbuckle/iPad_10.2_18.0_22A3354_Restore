@implementation SFQuickLookDocumentController

- (SFQuickLookDocumentController)init
{
  SFQuickLookDocumentController *v2;
  SFQuickLookDocumentView *v3;
  SFQuickLookDocumentView *documentView;
  SFQuickLookDocumentController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFQuickLookDocumentController;
  v2 = -[SFQuickLookDocumentController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFQuickLookDocumentView);
    documentView = v2->_documentView;
    v2->_documentView = v3;

    -[SFQuickLookDocumentView setQuickLookDocumentViewDelegate:](v2->_documentView, "setQuickLookDocumentViewDelegate:", v2);
    v5 = v2;
  }

  return v2;
}

- (void)updateWithQuickLookDocument:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UIDocumentInteractionController *v9;
  UIDocumentInteractionController *documentInteractionController;
  SFQuickLookDocumentView *documentView;
  void *v12;
  void *v13;
  SFQuickLookDocumentView *v14;
  void *v15;
  SFQuickLookDocumentView *v16;
  void *v17;
  unint64_t v18;
  SFQuickLookDocumentView *v19;
  id v20;
  void *v21;
  NSObject *v22;

  v5 = a3;
  objc_storeStrong((id *)&self->_quickLookDocument, a3);
  -[SFQuickLookDocumentController _updateActionButtons](self, "_updateActionButtons");
  -[SFQuickLookDocument savedURLWithProperExtension](self->_quickLookDocument, "savedURLWithProperExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CEA538];
    objc_msgSend(v5, "sourceURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sf_interactionControllerWithDocumentURL:sourceURL:", v6, v8);
    v9 = (UIDocumentInteractionController *)objc_claimAutoreleasedReturnValue();
    documentInteractionController = self->_documentInteractionController;
    self->_documentInteractionController = v9;

    -[UIDocumentInteractionController setShouldUnzipDocument:](self->_documentInteractionController, "setShouldUnzipDocument:", objc_msgSend(v5, "shouldUnzipByUIDocumentInteractionController"));
    documentView = self->_documentView;
    -[UIDocumentInteractionController icons](self->_documentInteractionController, "icons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentView updateDocumentIcon:](documentView, "updateDocumentIcon:", v13);

    v14 = self->_documentView;
    -[SFQuickLookDocument fileName](self->_quickLookDocument, "fileName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentView updateDocumentFileName:](v14, "updateDocumentFileName:", v15);

    v16 = self->_documentView;
    -[SFQuickLookDocument localizedType](self->_quickLookDocument, "localizedType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFQuickLookDocumentView updateDocumentFileType:](v16, "updateDocumentFileType:", v17);

    v18 = -[SFQuickLookDocument fileSize](self->_quickLookDocument, "fileSize");
    v19 = self->_documentView;
    v20 = objc_alloc_init(MEMORY[0x1E0CB34E8]);
    objc_msgSend(v20, "setCountStyle:", 3);
    objc_msgSend(v20, "stringFromByteCount:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFQuickLookDocumentView updateDocumentFileSize:](v19, "updateDocumentFileSize:", v21);
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SFQuickLookDocumentController updateWithQuickLookDocument:].cold.1(v22);
  }

}

- (void)presentDocumentInteractionControllerFromSource:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke;
  v4[3] = &unk_1E21E5C68;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke_2;
  v3[3] = &unk_1E21E5C90;
  _SFPopoverSourceInfoUnwrap(a3, CFSTR("quick look document controller"), v4, v3, &__block_literal_global_44);
}

uint64_t __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentOptionsMenuFromRect:inView:animated:", a2, 1);
}

uint64_t __80__SFQuickLookDocumentController_presentDocumentInteractionControllerFromSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentOptionsMenuFromBarButtonItem:animated:", a2, 1);
}

- (void)_updateActionButtons
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *buttonActions;
  NSUInteger v7;
  SFQuickLookDocumentView *documentView;
  NSArray *v9;
  void *v10;
  id v11;
  _QWORD v12[6];

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SFQuickLookDocumentController _supportedApplications](self, "_supportedApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v11, "addObject:", &unk_1E2245758);
  if (!-[UIDocumentInteractionController sourceIsManaged](self->_documentInteractionController, "sourceIsManaged")|| objc_msgSend(v3, "count"))
  {
    objc_msgSend(v11, "addObject:", &unk_1E2245770);
  }
  v5 = (NSArray *)objc_msgSend(v11, "copy");
  buttonActions = self->_buttonActions;
  self->_buttonActions = v5;

  v7 = -[NSArray count](self->_buttonActions, "count");
  documentView = self->_documentView;
  v9 = self->_buttonActions;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SFQuickLookDocumentController__updateActionButtons__block_invoke;
  v12[3] = &unk_1E21E5CF8;
  v12[4] = self;
  v12[5] = v7;
  -[NSArray safari_mapObjectsUsingBlock:](v9, "safari_mapObjectsUsingBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocumentView updateActionTitles:](documentView, "updateActionTitles:", v10);

}

uint64_t __53__SFQuickLookDocumentController__updateActionButtons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionTitleForType:withActionCount:", objc_msgSend(a2, "integerValue"), *(_QWORD *)(a1 + 40));
}

- (id)_supportedApplications
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocument documentProxy](self->_quickLookDocument, "documentProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationsAvailableForOpeningDocument:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_actionTitleForType:(int64_t)a3 withActionCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SFQuickLookDocumentController _supportedApplications](self, "_supportedApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    _WBSLocalizedString();
    a4 = objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    a4 = objc_claimAutoreleasedReturnValue();

  }
  return (id)a4;
}

- (void)quickLookDocumentView:(id)a3 didSelectActionAtIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  UIDocumentInteractionController *documentInteractionController;

  -[NSArray objectAtIndexedSubscript:](self->_buttonActions, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7)
  {
    if (v7 == 1)
    {
      documentInteractionController = self->_documentInteractionController;
      -[SFQuickLookDocumentView frameForButtonAtIndex:](self->_documentView, "frameForButtonAtIndex:", a4);
      -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](documentInteractionController, "presentOptionsMenuFromRect:inView:animated:", self->_documentView, 1);
    }
  }
  else
  {
    -[UIDocumentInteractionController openDocumentWithDefaultApplication](self->_documentInteractionController, "openDocumentWithDefaultApplication");
  }
}

- (id)itemProviderForQuickLookDocumentView:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v4, "safari_registerFileRepresentationForQuickLookDocument:", self->_quickLookDocument);
  return v4;
}

- (int64_t)dataOwnerForQuickLookDocumentView:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFQuickLookDocument sourceURL](self->_quickLookDocument, "sourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isURLManaged:", v5))
    v6 = 2;
  else
    v6 = 3;

  return v6;
}

- (UIView)documentView
{
  return &self->_documentView->super.super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_storeStrong((id *)&self->_documentView, 0);
  objc_storeStrong((id *)&self->_documentInteractionController, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
}

- (void)updateWithQuickLookDocument:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Could not get file URL for QuickLook document", v1, 2u);
}

@end
