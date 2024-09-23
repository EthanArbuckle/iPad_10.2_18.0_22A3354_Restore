@implementation CKMediaObjectCopyAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CKMediaObjectAssetActionPerformer chatItem](self, "chatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMediaObjectAssetActionPerformer chatItem](self, "chatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pasteboardItemProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setItemProviders:", v10);

    }
  }
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  void *v5;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("COPY"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("doc.on.doc");
}

@end
