@implementation WFFTPDirectoryListingContentItem

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromMIMEType:", CFSTR("application/x-ftp-directory"));
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
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Web");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("FTP directory"), CFSTR("FTP directory"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("FTP directories"), CFSTR("FTP directories"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d FTP directories"));
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  if ((Class)objc_opt_class() == a3)
  {
    -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v9, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithData:encoding:", v11, 4);

    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("\r\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __88__WFFTPDirectoryListingContentItem_generateObjectRepresentationsForClass_options_error___block_invoke;
    v19[3] = &unk_24C4E0340;
    v20 = v9;
    v14 = v9;
    objc_msgSend(v13, "if_compactMap:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
      return 0;
    +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v17, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "if_map:", &__block_literal_global_13516);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (WFFileType)preferredFileType
{
  return (WFFileType *)objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
}

id __88__WFFTPDirectoryListingContentItem_generateObjectRepresentationsForClass_options_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", &stru_24C4E3948);
  if ((unint64_t)objc_msgSend(v4, "count") >= 8)
  {
    objc_msgSend(v4, "subarrayWithRange:", 8, objc_msgSend(v4, "count") - 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "originalURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v9, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __88__WFFTPDirectoryListingContentItem_generateObjectRepresentationsForClass_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
