@implementation WFListContentItem

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
  return (id)objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return 0;
}

+ (id)pluralTypeDescription
{
  return 0;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (WFListItem)listItem
{
  return (WFListItem *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)richListTitle
{
  void *v2;
  void *v3;

  -[WFListContentItem listItem](self, "listItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[WFListContentItem listItem](self, "listItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFListContentItem listItem](self, "listItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

  }
  return v6 != 0;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *, void *))a3;
  -[WFListContentItem listItem](self, "listItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = *MEMORY[0x24BEC1820];
    v8 = (void *)MEMORY[0x24BDD16E0];
    if (objc_msgSend(v7, "displayStyle") == 1)
      v9 = 3;
    else
      v9 = 1;
    objc_msgSend(v8, "numberWithUnsignedInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, v7, v11);
  }

  return v7 != 0;
}

@end
