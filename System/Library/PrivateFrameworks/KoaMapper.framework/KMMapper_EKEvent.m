@implementation KMMapper_EKEvent

- (KMMapper_EKEvent)init
{
  KMMapper_EKEvent *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KMMapper_EKEvent;
  v2 = -[KMMapper_EKEvent init](&v6, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

  }
  return v2;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v7;
  KVItemBuilder *builder;
  void *v9;
  void *v10;
  id v11;
  KVItemBuilder *v12;
  void *v13;
  void *v14;
  id v15;
  KVItemBuilder *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  KVItemBuilder *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  id *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  builder = self->_builder;
  objc_msgSend(v7, "eventIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 15, v9, &v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v32;
  if (!v10)
  {

LABEL_12:
    KMMapperSetBuilderError((uint64_t)a5, v11);
    v21 = 0;
    goto LABEL_17;
  }
  v12 = self->_builder;
  objc_msgSend(v7, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v11;
  -[KVItemBuilder addFieldWithType:value:error:](v12, "addFieldWithType:value:error:", 650, v13, &v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v31;

  if (v14)
  {
    v27 = v13;
    v28 = a5;
    v16 = self->_builder;
    objc_msgSend(v7, "structuredLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      objc_msgSend(v7, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = v15;
    -[KVItemBuilder addFieldWithType:value:error:](v16, "addFieldWithType:value:error:", 651, v18, &v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v30;

    v20 = v19 == 0;
    if (!v17)

    v15 = v25;
    v13 = v27;
    a5 = v28;
  }
  else
  {
    v20 = 1;
  }

  if (v20)
  {
    v11 = v15;
    goto LABEL_12;
  }
  v22 = self->_builder;
  v29 = v15;
  -[KVItemBuilder buildItemWithError:](v22, "buildItemWithError:", &v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;

  if (v23)
  {
    v33[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)a5, v11);
    v21 = 0;
  }

LABEL_17:
  return v21;
}

- (int64_t)targetItemType
{
  return 15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
