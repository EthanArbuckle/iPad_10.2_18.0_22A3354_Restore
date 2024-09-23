@implementation ICAttachmentImageModel(ItemProviderWriting)

- (id)writableTypeIdentifiersForItemProvider
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChildOfDocumentGallery");

  if (v3)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1F0483C10;
    objc_msgSendSuper2(&v7, sel_writableTypeIdentifiersForItemProvider);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  void *v17;
  id v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D637F0]))
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_1F0483C10;
    objc_msgSendSuper2(&v19, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v14[3] = &unk_1EA7DD3C8;
    v15 = v10;
    v18 = v7;
    v16 = v6;
    v17 = a1;
    v12 = v10;
    objc_msgSend(v11, "performBackgroundTask:", v14);

    v8 = 0;
  }

  return v8;
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isChildOfDocumentGallery");

  if ((v6 & 1) == 0)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1F0483C10;
    objc_msgSendSuper2(&v7, sel_registerFileLoadHandlersOnItemProvider_, v4);
  }

}

@end
