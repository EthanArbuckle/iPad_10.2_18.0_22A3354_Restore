@implementation WFRemoteContentItem

- (WFRemoteContentItem)initWithSerializedItem:(id)a3 named:(id)a4 attributionSet:(id)a5 cachingIdentifier:(id)a6
{
  id v7;
  WFRemoteContentItem *v8;
  uint64_t v9;
  NSDictionary *serializedItem;
  WFRemoteContentItem *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFRemoteContentItem;
  v8 = -[WFRemoteContentItem init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    serializedItem = v8->_serializedItem;
    v8->_serializedItem = (NSDictionary *)v9;

    v11 = v8;
  }

  return v8;
}

- (id)name
{
  void *v2;
  void *v3;

  -[WFRemoteContentItem serializedItem](self, "serializedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("link.contentkit.name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferredFileType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[WFRemoteContentItem serializedItem](self, "serializedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("link.contentkit.remoteitem.preferredfiletype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFRemoteContentItem;
    -[WFContentItem preferredFileType](&v8, sel_preferredFileType);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (NSDictionary)serializedItem
{
  return self->_serializedItem;
}

- (void)setSerializedItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedItem, 0);
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSerializedItem:named:attributionSet:cachingIdentifier:", v14, v13, v12, v11);

  return v15;
}

@end
