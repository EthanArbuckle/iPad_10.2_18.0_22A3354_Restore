@implementation KMMapper_RTLocationOfInterest

- (KMMapper_RTLocationOfInterest)init
{
  KMMapper_RTLocationOfInterest *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KMMapper_RTLocationOfInterest;
  v2 = -[KMMapper_RTLocationOfInterest init](&v6, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 12;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  KVItemBuilder *builder;
  id v11;
  id v12;
  void *v13;
  KVItemBuilder *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  KVItemBuilder *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  KVItemBuilder *v30;
  void *v31;
  void *v32;
  KVItemBuilder *v33;
  void *v34;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  builder = self->_builder;
  v49 = 0;
  v11 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 12, v9, &v49);
  v12 = v49;
  objc_msgSend(v7, "preferredName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_4:
    objc_msgSend(v7, "mapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = self->_builder;
      v47 = v12;
      -[KVItemBuilder addFieldWithType:value:error:](v19, "addFieldWithType:value:error:", 551, v18, &v47);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v47;

      if (!v20)
      {
        KMMapperSetBuilderError((uint64_t)a5, v16);
        v34 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v12 = v16;
    }
    v40 = v18;
    objc_msgSend(v17, "address");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v37 = v17;
      v38 = a5;
      v39 = v9;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v36 = v21;
      objc_msgSend(v21, "siriVocabularySpatialNames");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v44;
        while (2)
        {
          v27 = 0;
          v28 = v12;
          do
          {
            if (*(_QWORD *)v44 != v26)
              objc_enumerationMutation(v23);
            v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v27);
            v30 = self->_builder;
            v42 = v28;
            -[KVItemBuilder addFieldWithType:value:error:](v30, "addFieldWithType:value:error:", 552, v29, &v42);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v42;

            if (!v31)
            {
              KMMapperSetBuilderError((uint64_t)v38, v12);
              v34 = 0;
              v9 = v39;
              v22 = v36;
              v17 = v37;
              goto LABEL_23;
            }
            ++v27;
            v28 = v12;
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v25)
            continue;
          break;
        }
      }

      a5 = v38;
      v9 = v39;
      v22 = v36;
      v17 = v37;
    }
    v32 = v12;
    v33 = self->_builder;
    v41 = v12;
    -[KVItemBuilder buildItemWithError:](v33, "buildItemWithError:", &v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v41;

    if (v23)
    {
      v50 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      KMMapperSetBuilderError((uint64_t)a5, v12);
      v34 = 0;
    }
LABEL_23:

    v16 = v12;
    v18 = v40;
    goto LABEL_24;
  }
  v14 = self->_builder;
  v48 = v12;
  -[KVItemBuilder addFieldWithType:value:error:](v14, "addFieldWithType:value:error:", 551, v13, &v48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v48;

  if (v15)
  {
    v12 = v16;
    goto LABEL_4;
  }
  KMMapperSetBuilderError((uint64_t)a5, v16);
  v34 = 0;
LABEL_25:

  return v34;
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
