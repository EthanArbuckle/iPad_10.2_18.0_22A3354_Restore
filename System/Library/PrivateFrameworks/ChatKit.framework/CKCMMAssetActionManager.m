@implementation CKCMMAssetActionManager

+ (id)assetActionManagerWithCMMSession:(id)a3 chatItem:(id)a4 presentedFromInlineReply:(BOOL)a5 chatActionHelper:(id)a6 performerDelegate:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CKMediaObjectAssetActionManager *v20;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "selectionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSelectionManager:", v17);
  objc_msgSend(v18, "setSession:", v15);
  objc_msgSend(v18, "setPresentedFromInlineReply:", v8);
  objc_msgSend(MEMORY[0x1E0D7B730], "assetActionManagerWithCMMSession:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setPhotosAssetActionManager:", v19);
  v20 = -[CKMediaObjectAssetActionManager initWithChatItem:presentedFromInlineReply:chatActionHelper:selectionManager:]([CKMediaObjectAssetActionManager alloc], "initWithChatItem:presentedFromInlineReply:chatActionHelper:selectionManager:", v14, v8, v13, v17);

  objc_msgSend(v18, "setMessagesAssetActionManager:", v20);
  objc_msgSend(v18, "_propagatePerformerDelegate:", v12);

  return v18;
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKCMMAssetActionManager _destinationActionManagerForActionType:](self, "_destinationActionManagerForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "barButtonItemForActionType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKCMMAssetActionManager _destinationActionManagerForActionType:](self, "_destinationActionManagerForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionPerformerForActionType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CKCMMAssetActionManager _destinationActionManagerForActionType:](self, "_destinationActionManagerForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsActionType:", v4);

  return v6;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CKCMMAssetActionManager _destinationActionManagerForActionType:](self, "_destinationActionManagerForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canPerformActionType:", v4);

  return v6;
}

- (BOOL)shouldEnableActionType:(id)a3 onAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[CKCMMAssetActionManager _destinationActionManagerForActionType:](self, "_destinationActionManagerForActionType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldEnableActionType:onAsset:", v7, v6);

  return v9;
}

- (id)previewActionForActionType:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CKCMMAssetActionManager _destinationActionManagerForActionType:](self, "_destinationActionManagerForActionType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewActionForActionType:image:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CKCMMAssetActionManager _destinationActionManagerForActionType:](self, "_destinationActionManagerForActionType:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeActionForActionType:withCompletionHandler:", v7, v6);

}

- (unint64_t)presentationSource
{
  return 2;
}

- (void)setAdditionalPropertiesFromActionManager:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PXCMMSession *v7;
  PXCMMSession *session;
  void *v9;
  id photosAssetActionManager;
  CKMediaObjectAssetActionManager *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CKMediaObjectAssetActionManager *v16;
  CKMediaObjectAssetActionManager *messagesAssetActionManager;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKCMMAssetActionManager;
  -[PXAssetActionManager setAdditionalPropertiesFromActionManager:](&v20, sel_setAdditionalPropertiesFromActionManager_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "messagesAssetActionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "session");
    v7 = (PXCMMSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v7;

    objc_msgSend(MEMORY[0x1E0D7B730], "assetActionManagerWithCMMSession:", self->_session);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    photosAssetActionManager = self->_photosAssetActionManager;
    self->_photosAssetActionManager = v9;

    v11 = [CKMediaObjectAssetActionManager alloc];
    objc_msgSend(v6, "chatItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "presentedFromInlineReply");

    objc_msgSend(v6, "chatActionHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CKMediaObjectAssetActionManager initWithChatItem:presentedFromInlineReply:chatActionHelper:selectionManager:](v11, "initWithChatItem:presentedFromInlineReply:chatActionHelper:selectionManager:", v12, v13, v14, v15);
    messagesAssetActionManager = self->_messagesAssetActionManager;
    self->_messagesAssetActionManager = v16;

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCMMAssetActionManager _propagatePerformerDelegate:](self, "_propagatePerformerDelegate:", v18);

    -[PXAssetActionManager objectReference](self, "objectReference");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCMMAssetActionManager _propagateObjectReference:](self, "_propagateObjectReference:", v19);

  }
}

- (void)setPerformerDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKCMMAssetActionManager;
  v4 = a3;
  -[PXActionManager setPerformerDelegate:](&v5, sel_setPerformerDelegate_, v4);
  -[CKCMMAssetActionManager _propagatePerformerDelegate:](self, "_propagatePerformerDelegate:", v4, v5.receiver, v5.super_class);

}

- (void)setObjectReference:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKCMMAssetActionManager;
  v4 = a3;
  -[PXAssetActionManager setObjectReference:](&v5, sel_setObjectReference_, v4);
  -[CKCMMAssetActionManager _propagateObjectReference:](self, "_propagateObjectReference:", v4, v5.receiver, v5.super_class);

}

- (id)_destinationActionManagerForActionType:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D7BF98]))
    -[CKCMMAssetActionManager photosAssetActionManager](self, "photosAssetActionManager");
  else
    -[CKCMMAssetActionManager messagesAssetActionManager](self, "messagesAssetActionManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_propagatePerformerDelegate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CKCMMAssetActionManager photosAssetActionManager](self, "photosAssetActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKCMMAssetActionManager photosAssetActionManager](self, "photosAssetActionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPerformerDelegate:", v8);

  }
  -[CKCMMAssetActionManager messagesAssetActionManager](self, "messagesAssetActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPerformerDelegate:", v8);

}

- (void)_propagateObjectReference:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CKCMMAssetActionManager photosAssetActionManager](self, "photosAssetActionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKCMMAssetActionManager photosAssetActionManager](self, "photosAssetActionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObjectReference:", v8);

  }
  -[CKCMMAssetActionManager messagesAssetActionManager](self, "messagesAssetActionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObjectReference:", v8);

}

- (CKMediaObjectAssetActionManager)messagesAssetActionManager
{
  return self->_messagesAssetActionManager;
}

- (void)setMessagesAssetActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_messagesAssetActionManager, a3);
}

- (id)photosAssetActionManager
{
  return self->_photosAssetActionManager;
}

- (void)setPhotosAssetActionManager:(id)a3
{
  objc_storeStrong(&self->_photosAssetActionManager, a3);
}

- (BOOL)presentedFromInlineReply
{
  return self->_presentedFromInlineReply;
}

- (void)setPresentedFromInlineReply:(BOOL)a3
{
  self->_presentedFromInlineReply = a3;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_photosAssetActionManager, 0);
  objc_storeStrong((id *)&self->_messagesAssetActionManager, 0);
}

@end
