@implementation CKMediaObjectAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "_selectionSnapshotForPerformerClass:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(a1, "canPerformWithActionManager:selectionSnapshot:", v4, v5);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4
{
  return 0;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return 0;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return 0;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a1, "systemImageNameForActionManager:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithImage:style:target:action:", v10, 0, v8, a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)createPreviewActionWithActionManager:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "localizedTitleForUseCase:actionManager:", 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "systemImageNameForActionManager:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(a1, "systemImageNameForActionManager:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemImageNamed:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithTitle:image:identifier:handler:", v8, v12, 0, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (CKMediaObjectAssetActionHelper)chatActionHelper
{
  return (CKMediaObjectAssetActionHelper *)objc_loadWeakRetained((id *)&self->_chatActionHelper);
}

- (void)setChatActionHelper:(id)a3
{
  objc_storeWeak((id *)&self->_chatActionHelper, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chatActionHelper);
  objc_storeStrong((id *)&self->_chatItem, 0);
}

@end
