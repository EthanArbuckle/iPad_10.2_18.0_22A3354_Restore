@implementation KMMapper_LSApplicationRecord

- (KMMapper_LSApplicationRecord)init
{
  KMMapper_LSApplicationRecord *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  uint64_t v5;
  NSNumber *languageCodeKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KMMapper_LSApplicationRecord;
  v2 = -[KMMapper_LSApplicationRecord init](&v8, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    KVAdditionalFieldTypeToNumber();
    v5 = objc_claimAutoreleasedReturnValue();
    languageCodeKey = v2->_languageCodeKey;
    v2->_languageCodeKey = (NSNumber *)v5;

  }
  return v2;
}

- (int64_t)targetItemType
{
  return 3;
}

- (BOOL)addAlternativeNamesFor:(id)a3 forLanguage:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  KMMapper_LSApplicationRecord *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  id v29;

  v8 = a3;
  v9 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__1855;
  v28[4] = __Block_byref_object_dispose__1856;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1855;
  v26 = __Block_byref_object_dispose__1856;
  v27 = 0;
  objc_msgSend(v8, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:ofClass:", CFSTR("INAlternativeAppNames"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__KMMapper_LSApplicationRecord_addAlternativeNamesFor_forLanguage_error___block_invoke;
  v16[3] = &unk_24D961468;
  v20 = v28;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v19 = self;
  v21 = &v22;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);
  v14 = (void *)v23[5];
  if (a5 && v14)
    *a5 = objc_retainAutorelease(v14);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v28, 8);

  return v14 == 0;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  KVItemBuilder *builder;
  void *v14;
  void *v15;
  id v16;
  KVItemBuilder *v17;
  void *v18;
  id v19;
  KVItemBuilder *v20;
  void *v21;
  id v22;
  KVItemBuilder *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v30;
  id v31;
  KVItemBuilder *v32;
  void *v33;
  id v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", self->_languageCodeKey);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    v26 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected additional field with type: %i"), 4294967291);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 7, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

LABEL_14:
    v28 = 0;
    goto LABEL_15;
  }
  v46 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedNameWithPreferredLocalizations:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  builder = self->_builder;
  objc_msgSend(v8, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 3, v14, &v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v44;
  if (!v15)
  {

LABEL_13:
    KMMapperSetBuilderError((uint64_t)a5, v16);
    goto LABEL_14;
  }
  v36 = a5;
  v17 = self->_builder;
  objc_msgSend(v8, "bundleIdentifier");
  v43 = v16;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[KVItemBuilder addFieldWithType:value:error:](v17, "addFieldWithType:value:error:", 100);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v43;

  v38 = v12;
  if (v18)
  {
    v20 = self->_builder;
    objc_msgSend(v8, "bundleVersion");
    v42 = v19;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[KVItemBuilder addFieldWithType:value:error:](v20, "addFieldWithType:value:error:", 103);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v42;

    if (v21)
    {
      v23 = self->_builder;
      v41 = v22;
      -[KVItemBuilder addFieldWithType:value:error:](v23, "addFieldWithType:value:error:", 102, v12, &v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v41;

      v25 = v24 == 0;
      v22 = v34;
    }
    else
    {
      v25 = 1;
    }

    v19 = v22;
  }
  else
  {
    v25 = 1;
  }

  if (v25)
  {
    v16 = v19;
    v12 = v38;
    a5 = v36;
    goto LABEL_13;
  }
  v40 = v19;
  v30 = -[KMMapper_LSApplicationRecord addAlternativeNamesFor:forLanguage:error:](self, "addAlternativeNamesFor:forLanguage:error:", v8, v10, &v40);
  v31 = v40;

  if (v30)
  {
    v32 = self->_builder;
    v39 = v31;
    -[KVItemBuilder buildItemWithError:](v32, "buildItemWithError:", &v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v39;

    v12 = v38;
    if (v33)
    {
      v45 = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      KMMapperSetBuilderError((uint64_t)v36, v16);
      v28 = 0;
    }

  }
  else
  {
    KMMapperSetBuilderError((uint64_t)v36, v31);
    v28 = 0;
    v16 = v31;
    v12 = v38;
  }
LABEL_15:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCodeKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
