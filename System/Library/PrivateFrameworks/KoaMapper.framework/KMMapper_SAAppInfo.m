@implementation KMMapper_SAAppInfo

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

- (KMMapper_SAAppInfo)init
{
  KMMapper_SAAppInfo *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KMMapper_SAAppInfo;
  v2 = -[KMMapper_SAAppInfo init](&v6, sel_init);
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
  return 3;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  KVItemBuilder *builder;
  void *v14;
  id v15;
  void *v16;
  KVItemBuilder *v17;
  void *v18;
  id v19;
  KVItemBuilder *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  KVItemBuilder *v31;
  void *v32;
  void *v33;
  KVItemBuilder *v34;
  void *v35;
  void *v36;
  id *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_msgSend(v10, "appIdentifyingInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  builder = self->_builder;
  v50 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 3, v12, &v50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v50;
  v16 = v15;
  if (!v14)
  {
    v19 = v15;
LABEL_20:
    KMMapperSetBuilderError((uint64_t)a5, v19);
    v36 = 0;
    goto LABEL_21;
  }
  v17 = self->_builder;
  v49 = v16;
  -[KVItemBuilder addFieldWithType:value:error:](v17, "addFieldWithType:value:error:", 100, v12, &v49);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v49;

  if (!v18)
  {

    goto LABEL_20;
  }
  v41 = v12;
  v20 = self->_builder;
  objc_msgSend(v10, "displayAppName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v19;
  -[KVItemBuilder addFieldWithType:value:error:](v20, "addFieldWithType:value:error:", 102, v21, &v48);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v48;

  if (!v22)
  {
    v19 = v23;
    v12 = v41;
    goto LABEL_20;
  }
  v38 = a5;
  v39 = v10;
  v40 = v9;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v10, "appNameSynonyms");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v29, "phrase");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "length"))
        {
          v31 = self->_builder;
          objc_msgSend(v29, "phrase");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v23;
          -[KVItemBuilder addFieldWithType:value:error:](v31, "addFieldWithType:value:error:", 104, v32, &v43);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v43;

          if (!v33)
          {
            KMMapperSetBuilderError((uint64_t)v38, v19);

            v36 = 0;
            v10 = v39;
            v9 = v40;
            v12 = v41;
            goto LABEL_21;
          }
          v23 = v19;
        }
        else
        {

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v26)
        continue;
      break;
    }
  }

  v34 = self->_builder;
  v42 = v23;
  -[KVItemBuilder buildItemWithError:](v34, "buildItemWithError:", &v42);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v42;

  if (v35)
  {
    v51 = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)v38, v19);
    v36 = 0;
  }
  v10 = v39;
  v9 = v40;
  v12 = v41;

LABEL_21:
  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
