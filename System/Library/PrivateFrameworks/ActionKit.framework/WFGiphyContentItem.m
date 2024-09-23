@implementation WFGiphyContentItem

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19468];
  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE19708];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Giphy item"), CFSTR("Giphy item"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Giphy items"), CFSTR("Giphy items"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Giphy items"));
}

- (id)object
{
  return (id)-[WFGiphyContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  WFGiphyContentItem *v21;
  id v22;

  v7 = a3;
  v8 = a5;
  -[WFGiphyContentItem object](self, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originalImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "conformsToUTType:", *MEMORY[0x24BDF8498]))
  {
    -[WFGiphyContentItem object](self, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "originalImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "videoURL");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  objc_msgSend(MEMORY[0x24BDB74B0], "wf_sharedSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65__WFGiphyContentItem_generateFileRepresentation_options_forType___block_invoke;
  v19[3] = &unk_24F8BAF30;
  v21 = self;
  v22 = v7;
  v20 = v8;
  v16 = v8;
  v17 = v7;
  objc_msgSend(v15, "downloadTaskWithURL:completionHandler:", v11, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume");

}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void (**v7)(id, uint64_t, void *, _QWORD);
  uint64_t v8;
  void *v9;
  id v10;

  v7 = (void (**)(id, uint64_t, void *, _QWORD))a3;
  if ((Class)objc_opt_class() == a5)
  {
    -[WFGiphyContentItem object](self, "object");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v8 = objc_claimAutoreleasedReturnValue();
    -[WFGiphyContentItem name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v9, 0);

    v7 = (void (**)(id, uint64_t, void *, _QWORD))v8;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, uint64_t, void *, _QWORD), _QWORD, _QWORD))v7[2])(v7, 0, 0);
  }

}

- (void)getPreferredFileSize:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[WFGiphyContentItem object](self, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originalImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, objc_msgSend(v6, "fileSize"));

}

- (WFFileType)preferredFileType
{
  return (WFFileType *)objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
}

void __65__WFGiphyContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (!v17 || a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(a3, "MIMEType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typeFromMIMEType:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "typeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = *(void **)(a1 + 32);
      if (v11)
      {
        v12 = v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8]);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;

      v9 = v13;
    }
    v14 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileWithURL:options:ofType:proposedFilename:", v17, 3, v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

@end
