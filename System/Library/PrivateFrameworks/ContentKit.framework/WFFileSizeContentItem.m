@implementation WFFileSizeContentItem

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
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
  v3[0] = CFSTR("Documents");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("File size"), CFSTR("File size"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("File sizes"), CFSTR("File sizes"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d File sizes"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 6;
}

- (WFFileSize)fileSize
{
  return (WFFileSize *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFFileSizeContentItem fileSize](self, "fileSize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedString");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v9;
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[WFFileSizeContentItem fileSize](self, "fileSize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v8, "byteCount"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
  return v7;
}

@end
