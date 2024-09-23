@implementation ICAttachmentModel(ItemProviderWriting)

- (id)itemProviderIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)itemProviderType
{
  return 3;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = *MEMORY[0x1E0D637F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)writableTypeIdentifiersForItemProvider
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemProviderUTI");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    v9 = *MEMORY[0x1E0D637F0];
    v10 = v1;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v9;
    v5 = 2;
  }
  else
  {
    v8 = *MEMORY[0x1E0D637F0];
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v8;
    v5 = 1;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting
{
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x1E0D637F0]))
    return 3;
  else
    return 0;
}

- (id)itemProviderUTI
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "typeUTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)itemProviderWritingURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasFile"))
  {
    objc_msgSend(a1, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)itemProviderWritingData
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isPasswordProtected"))
  {
    objc_msgSend(v2, "media");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decryptedData");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "itemProviderWritingURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 1, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasFile") & 1) != 0)
  {
    objc_msgSend(a1, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPasswordProtected");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(a1, "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "typeUTI");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke;
      v14[3] = &unk_1EA7DD350;
      v15 = v10;
      v13 = v10;
      objc_msgSend(v4, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v12, 0, 0, v14);

    }
  }
  else
  {

  }
}

- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v15[3] = &unk_1EA7DD378;
  v16 = v9;
  v17 = v6;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v9;
  objc_msgSend(v10, "performBackgroundTask:", v15);

  return 0;
}

@end
