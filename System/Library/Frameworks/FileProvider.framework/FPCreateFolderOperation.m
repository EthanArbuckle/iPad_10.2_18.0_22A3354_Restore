@implementation FPCreateFolderOperation

- (FPCreateFolderOperation)initWithParentItem:(id)a3 folderName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  FPCreateFolderOperation *v10;
  uint64_t v11;
  NSString *folderFilename;
  uint64_t v13;
  FPItem *v14;
  void *v15;
  void *v16;
  FPItem *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "providerDomainID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)FPCreateFolderOperation;
  v10 = -[FPActionOperation initWithProvider:action:](&v21, sel_initWithProvider_action_, v9, CFSTR("Create"));

  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentItem, a3);
    objc_msgSend(v8, "fp_filenameFromDisplayNameWithExtension:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    folderFilename = v10->_folderFilename;
    v10->_folderFilename = (NSString *)v11;

    -[FPActionOperation setDestinationItemToPreflight:](v10, "setDestinationItemToPreflight:", v7);
    v13 = *MEMORY[0x1E0CEC4A0];
    v14 = [FPItem alloc];
    objc_msgSend(v7, "providerDomainID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:](v14, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:contentType:", v15, CFSTR("fakeIdentifier"), v16, v10->_folderFilename, v13);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E448F560);
    -[FPActionOperation setSourceItemKeysAllowList:](v10, "setSourceItemKeysAllowList:", v18);

    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPActionOperation setSourceItemsToPreflight:](v10, "setSourceItemsToPreflight:", v19);

    -[FPActionOperation setSetupRemoteOperationService:](v10, "setSetupRemoteOperationService:", 1);
  }

  return v10;
}

- (void)actionMain
{
  FPItem *v3;
  void *v4;
  void *v5;
  FPItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 shouldBounceOnCollision;
  _QWORD v13[5];

  v3 = [FPItem alloc];
  -[FPItem providerDomainID](self->_parentItem, "providerDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem itemIdentifier](self->_parentItem, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FPItem initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:isDirectory:](v3, "initWithProviderDomainID:itemIdentifier:parentItemIdentifier:filename:isDirectory:", v4, CFSTR("__"), v5, self->_folderFilename, 1);

  -[FPActionOperation stitcher](self, "stitcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemWithPlaceholderID:", self->_placeholderID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentModificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[FPItem setContentModificationDate:](v6, "setContentModificationDate:", v9);
  objc_msgSend(v8, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[FPItem setCreationDate:](v6, "setCreationDate:", v10);
  +[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  shouldBounceOnCollision = self->_shouldBounceOnCollision;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__FPCreateFolderOperation_actionMain__block_invoke;
  v13[3] = &unk_1E444BD00;
  v13[4] = self;
  objc_msgSend(v11, "createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:", v6, 6, 0, 0x10000, shouldBounceOnCollision, v13);

}

void __37__FPCreateFolderOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __37__FPCreateFolderOperation_actionMain__block_invoke_cold_1(v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "stitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "associateItem:withPlaceholderID:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));

  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v5, v6);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[FPActionOperation stitcher](self, "stitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithItem:error:", v6, v7);

  -[FPCreateFolderOperation createFolderCompletionBlock](self, "createFolderCompletionBlock");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);
    -[FPCreateFolderOperation setCreateFolderCompletionBlock:](self, "setCreateFolderCompletionBlock:", 0);
  }

  v11.receiver = self;
  v11.super_class = (Class)FPCreateFolderOperation;
  -[FPActionOperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v6, v7);

}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  NSString *folderFilename;
  void *v6;
  void *v7;
  FPItemID *v8;
  FPItemID *placeholderID;
  id v10;

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  folderFilename = self->_folderFilename;
  -[FPItem itemIdentifier](self->_parentItem, "itemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItem providerDomainID](self->_parentItem, "providerDomainID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createPlaceholderWithName:isFolder:contentAccessDate:underParent:inProviderDomainID:", folderFilename, 1, 0, v6, v7);
  v8 = (FPItemID *)objc_claimAutoreleasedReturnValue();
  placeholderID = self->_placeholderID;
  self->_placeholderID = v8;

  -[FPActionOperation stitcher](self, "stitcher");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flush");

}

- (BOOL)shouldBounceOnCollision
{
  return self->_shouldBounceOnCollision;
}

- (void)setShouldBounceOnCollision:(BOOL)a3
{
  self->_shouldBounceOnCollision = a3;
}

- (id)createFolderCompletionBlock
{
  return self->_createFolderCompletionBlock;
}

- (void)setCreateFolderCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createFolderCompletionBlock, 0);
  objc_storeStrong((id *)&self->_placeholderID, 0);
  objc_storeStrong((id *)&self->_folderFilename, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
}

void __37__FPCreateFolderOperation_actionMain__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] 🆕❌ FPCreateFolderOperation failed with error: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

@end
