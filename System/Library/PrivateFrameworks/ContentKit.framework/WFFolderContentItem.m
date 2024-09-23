@implementation WFFolderContentItem

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEC16B8]);
  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:", v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)propertyBuilders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() != a1)
    return 0;
  WFLocalizedContentPropertyNameMarker(CFSTR("Contents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_9969, v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multipleValues:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  WFLocalizedContentPropertyNameMarker(CFSTR("Number of Items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_111, v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multipleValues:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Documents");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Folder"), CFSTR("Folder"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Folders"), CFSTR("Folders"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Folders"));
}

void __39__WFFolderContentItem_propertyBuilders__block_invoke_110(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__WFFolderContentItem_propertyBuilders__block_invoke_2_112;
  v7[3] = &unk_24C4E2ED8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v7, 0);

}

void __39__WFFolderContentItem_propertyBuilders__block_invoke_2_112(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a2;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__WFFolderContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__WFFolderContentItem_propertyBuilders__block_invoke_2;
  v7[3] = &unk_24C4E2ED8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v7, 0);

}

void __39__WFFolderContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  WFiCloudFileDownloadOperation *v4;
  void *v5;
  WFiCloudFileDownloadOperation *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = [WFiCloudFileDownloadOperation alloc];
  objc_msgSend(v3, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFiCloudFileDownloadOperation initWithFileURL:retrieveFolderContents:progress:](v4, "initWithFileURL:retrieveFolderContents:progress:", v5, 1, 0);

  -[WFiCloudFileDownloadOperation start](v6, "start");
  -[WFiCloudFileDownloadOperation waitUntilFinished](v6, "waitUntilFinished");
  -[WFiCloudFileDownloadOperation downloadError](v6, "downloadError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    getWFFilesLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFiCloudFileDownloadOperation downloadError](v6, "downloadError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "+[WFFolderContentItem propertyBuilders]_block_invoke_2";
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_ERROR, "%s Could not download contents of directory: %@ with error: %@", (uint8_t *)&v13, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    -[WFiCloudFileDownloadOperation downloadedFiles](v6, "downloadedFiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

@end
