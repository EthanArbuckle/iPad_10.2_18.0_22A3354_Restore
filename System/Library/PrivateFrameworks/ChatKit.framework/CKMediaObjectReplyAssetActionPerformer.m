@implementation CKMediaObjectReplyAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4
{
  return objc_msgSend(a3, "shouldHideInteractions") ^ 1;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    -[CKMediaObjectAssetActionPerformer chatItem](self, "chatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKMediaObjectAssetActionPerformer chatItem](self, "chatItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CKChatItemForMomentShareAsset(v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[CKMediaObjectAssetActionPerformer chatActionHelper](self, "chatActionHelper");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "inlineReplyControllerForChatItem:", v10);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

      if (v14)
        goto LABEL_10;
    }
  }
  else
  {

  }
  -[CKMediaObjectAssetActionPerformer chatActionHelper](self, "chatActionHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectAssetActionPerformer chatItem](self, "chatItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inlineReplyControllerForChatItem:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    return;
  }
LABEL_10:
  -[PXActionPerformer presentViewController:](self, "presentViewController:", v14);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  void *v5;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("arrowshape.turn.up.left");
}

@end
