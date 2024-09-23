@implementation KMMapper_PortraitEntity

- (KMMapper_PortraitEntity)init
{
  KMMapper_PortraitEntity *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  uint64_t v5;
  NSNumber *alternativeItemIdKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KMMapper_PortraitEntity;
  v2 = -[KMMapper_PortraitEntity init](&v8, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    KVAdditionalFieldTypeToNumber();
    v5 = objc_claimAutoreleasedReturnValue();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v5;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 13;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  NSNumber *alternativeItemIdKey;
  id v9;
  void *v10;
  KVItemBuilder *builder;
  id v12;
  id v13;
  void *v14;
  void *v15;
  KVItemBuilder *v16;
  void *v17;
  id v18;
  KVItemBuilder *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  alternativeItemIdKey = self->_alternativeItemIdKey;
  v9 = a3;
  objc_msgSend(a4, "objectForKey:", alternativeItemIdKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  builder = self->_builder;
  v25 = 0;
  v12 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 13, v10, &v25);
  v13 = v25;
  objc_msgSend(v9, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
  {
    v16 = self->_builder;
    v24 = v13;
    -[KVItemBuilder addFieldWithType:value:error:](v16, "addFieldWithType:value:error:", 553, v15, &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v24;

    if (!v17)
    {
      KMMapperSetBuilderError((uint64_t)a5, v18);
      v21 = 0;
      goto LABEL_9;
    }
    v13 = v18;
  }
  v19 = self->_builder;
  v23 = v13;
  -[KVItemBuilder buildItemWithError:](v19, "buildItemWithError:", &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;

  if (v20)
  {
    v26[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)a5, v18);
    v21 = 0;
  }

LABEL_9:
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
