@implementation ICAttachmentInlineDrawingModel(ItemProviderWriting)

- (id)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v4);

  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackImageUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v5);

  objc_msgSend(MEMORY[0x1E0D639F0], "fallbackPDFUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v6);

  v7 = (void *)objc_msgSend(v2, "copy");
  return v7;
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
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D637F0]))
  {
    v18.receiver = a1;
    v18.super_class = (Class)&off_1F04841F8;
    objc_msgSendSuper2(&v18, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
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
    v14[2] = __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v14[3] = &unk_1EA7DD378;
    v15 = v10;
    v16 = v6;
    v17 = v7;
    v12 = v10;
    objc_msgSend(v11, "performBackgroundTask:", v14);

    v8 = 0;
  }

  return v8;
}

@end
