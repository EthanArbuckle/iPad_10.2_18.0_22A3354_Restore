@implementation FPRenameOperation

- (FPRenameOperation)initWithItem:(id)a3 newFileName:(id)a4
{
  id v6;
  void *v7;
  FPRenameOperation *v8;

  v6 = a3;
  objc_msgSend(a4, "fp_filenameFromDisplayNameWithExtension:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPRenameOperation initWithItem:newNameInternal:](self, "initWithItem:newNameInternal:", v6, v7);

  return v8;
}

- (FPRenameOperation)initWithItem:(id)a3 newDisplayName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  FPRenameOperation *v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isFolder") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "fp_filenameFromDisplayNameWithExtension:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FPRenameOperation initWithItem:newNameInternal:](self, "initWithItem:newNameInternal:", v6, v10);

  return v11;
}

- (FPRenameOperation)initWithItem:(id)a3 newNameInternal:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FPRenameOperation *v10;
  void *v11;
  uint64_t v12;
  FPItem *v13;
  void *v14;
  void *v15;
  FPItem *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "providerDomainID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)FPRenameOperation;
  v10 = -[FPActionOperation initWithProvider:action:](&v19, sel_initWithProvider_action_, v9, CFSTR("Rename"));

  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a3);
    objc_storeStrong((id *)&v10->_newName, a4);
    v20[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPActionOperation setSourceItemsToPreflight:](v10, "setSourceItemsToPreflight:", v11);

    -[FPActionOperation setSetupRemoteOperationService:](v10, "setSetupRemoteOperationService:", 1);
    v12 = *MEMORY[0x1E0CEC4A0];
    v13 = [FPItem alloc];
    objc_msgSend(v7, "providerDomainID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentItemIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:](v13, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:", v14, CFSTR("fakeIdentifier"), v15, v8, v12);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E448F548);
    -[FPActionOperation setDestinationItemKeysAllowList:](v10, "setDestinationItemKeysAllowList:", v17);

    -[FPActionOperation setDestinationItemToPreflight:](v10, "setDestinationItemToPreflight:", v16);
  }

  return v10;
}

- (void)actionMain
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[FPItem strippedCopy](self->_item, "strippedCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilename:", self->_newName);
  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__FPRenameOperation_actionMain__block_invoke;
  v5[3] = &unk_1E444BD00;
  v5[4] = self;
  objc_msgSend(v4, "singleItemChange:changedFields:bounce:completionHandler:", v3, 2, 0, v5);

}

void __31__FPRenameOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __31__FPRenameOperation_actionMain__block_invoke_cold_2(a1, v6, v7);

    v8 = v5;
    v5 = 0;
LABEL_8:

    goto LABEL_9;
  }
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject itemID](v5, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stitcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "cleanStitchedForItemID:ignoreSession:", v10, v11);

  if (v12)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __31__FPRenameOperation_actionMain__block_invoke_cold_1(v5, v8);
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v5, v6);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[FPActionOperation stitcher](self, "stitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithItem:error:", v7, v6);

  objc_msgSend(v6, "fp_annotatedErrorWithItem:variant:", self->_item, CFSTR("Rename"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)FPRenameOperation;
  -[FPActionOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v9);

}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = self->_item;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__FPRenameOperation_presendNotifications__block_invoke;
  v7[3] = &unk_1E444D648;
  v7[4] = self;
  objc_msgSend(v4, "transformItems:handler:", v5, v7);

  -[FPActionOperation stitcher](self, "stitcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flush");

}

void __41__FPRenameOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 456);
  v4 = *(void **)(v2 + 448);
  v5 = a2;
  objc_msgSend(v3, "fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:", ((unint64_t)objc_msgSend(v4, "fileSystemFlags") >> 4) & 1, objc_msgSend(v5, "isFolder"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v6);

}

- (id)fp_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FPItem itemIdentifier](self->_item, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("rename %@ to %@"), v4, self->_newName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newName, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

void __31__FPRenameOperation_actionMain__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] Deleted item with same ID (%@) has been unstitched to allow renaming", v5);

  OUTLINED_FUNCTION_6_1();
}

void __31__FPRenameOperation_actionMain__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 448);
  v6 = *(_QWORD *)(v4 + 456);
  objc_msgSend(a2, "fp_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  OUTLINED_FUNCTION_14_3(&dword_1A0A34000, a3, v8, "[ERROR] couldn't rename item %@ to \"%@\": %@", (uint8_t *)&v9);

}

@end
