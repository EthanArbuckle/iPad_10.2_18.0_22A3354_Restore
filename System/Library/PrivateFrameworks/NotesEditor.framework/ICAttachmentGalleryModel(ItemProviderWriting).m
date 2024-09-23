@implementation ICAttachmentGalleryModel(ItemProviderWriting)

- (uint64_t)itemProviderUTI
{
  return objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
}

- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(a1, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v20[3] = &unk_1EA7DD378;
    v21 = v11;
    v14 = v12;
    v22 = v14;
    v23 = v7;
    v15 = v11;
    objc_msgSend(v13, "performBackgroundTask:", v20);

    v16 = v23;
    v17 = v14;

  }
  else
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_1F04840D0;
    objc_msgSendSuper2(&v19, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "itemProviderUTI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke;
  v9[3] = &unk_1EA7DD350;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v4, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v7, 0, 0, v9);

}

@end
