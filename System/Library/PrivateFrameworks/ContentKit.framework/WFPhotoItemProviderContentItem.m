@implementation WFPhotoItemProviderContentItem

+ (id)itemWithItemProviderItem:(id)a3 photoMediaFileRepresentation:(id)a4 assetIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[WFPhotoMediaContentItem itemWithAssetIdentifier:assetFile:](WFPhotoMediaContentItem, "itemWithAssetIdentifier:assetFile:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "itemProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "itemWithObject:named:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentName:", v14);

    objc_msgSend(v11, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v18 = (void *)getPHAssetClass_softClass_15686;
    v25 = getPHAssetClass_softClass_15686;
    if (!getPHAssetClass_softClass_15686)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPHAssetClass_block_invoke_15687;
      v29 = &unk_24C4E3118;
      v30 = &v22;
      __getPHAssetClass_block_invoke_15687((uint64_t)buf);
      v18 = (void *)v23[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v13, "setObjectRepresentations:forClass:", v17, v19, v22);

    v26 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSubItems:forClass:", v20, objc_opt_class());
  }
  else
  {
    getWFContentGraphLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFPhotoItemProviderContentItem itemWithItemProviderItem:photoMediaFileRepresentation:assetIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_20BBAD000, v20, OS_LOG_TYPE_FAULT, "%s Failed to create photo asset with share sheet asset identifier %@", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("PHAsset"), CFSTR("Photos"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Photos app media (singular)"), CFSTR("Photos app media"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Photos app media (plural)"), CFSTR("Photos app media"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Photos"));
}

- (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "outputTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEC1728]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:", v7, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
