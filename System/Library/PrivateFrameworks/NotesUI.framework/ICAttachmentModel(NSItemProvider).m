@implementation ICAttachmentModel(NSItemProvider)

- (id)itemProvider
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isURL");

  if (v3)
  {
    objc_msgSend(a1, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
    {
      v8 = (void *)MEMORY[0x1E0D639F0];
      objc_msgSend(a1, "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultTitleForAttachmentType:", objc_msgSend(v9, "attachmentType"));
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB36C8], "itemProviderWithURL:title:", v5, v7);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v5);
    }
    v14 = (void *)v11;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB36C8]);
    ICCheckedProtocolCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObject:", v13);

    objc_msgSend(a1, "registerFileLoadHandlersOnItemProvider:", v14);
    objc_msgSend(a1, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSuggestedName:", v7);
  }

  return v14;
}

@end
