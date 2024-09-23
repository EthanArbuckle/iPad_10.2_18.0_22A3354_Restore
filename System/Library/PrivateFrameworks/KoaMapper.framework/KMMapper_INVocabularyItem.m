@implementation KMMapper_INVocabularyItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentSlotNameKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (KMMapper_INVocabularyItem)init
{
  KMMapper_INVocabularyItem *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  uint64_t v5;
  NSNumber *intentSlotNameKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KMMapper_INVocabularyItem;
  v2 = -[KMMapper_INVocabularyItem init](&v8, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    KVAdditionalFieldTypeToNumber();
    v5 = objc_claimAutoreleasedReturnValue();
    intentSlotNameKey = v2->_intentSlotNameKey;
    v2->_intentSlotNameKey = (NSNumber *)v5;

  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)fieldTypeForIntentSlotName:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_fieldTypeNumberForIntentSlotName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = KVFieldTypeFromNumber();
  return v5;
}

+ (id)_fieldTypeNumberForIntentSlotName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _fieldTypeNumberForIntentSlotName__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_fieldTypeNumberForIntentSlotName__once, &__block_literal_global_313);
  objc_msgSend((id)_fieldTypeNumberForIntentSlotName__intentSlotToFieldTypeMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)targetItemType
{
  return 1;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  KVItemBuilder *builder;
  void *v19;
  id v20;
  void *v21;
  KVItemBuilder *v22;
  void *v23;
  void *v24;
  id v25;
  KVItemBuilder *v26;
  void *v27;
  void *v28;
  KVItemBuilder *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(a4, "objectForKey:", self->_intentSlotNameKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "_fieldTypeNumberForIntentSlotName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unrecognized additional field with type: %i value: %@"), 4294967294, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 8, v16);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      KVSetError();
      v31 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v11 = KVFieldTypeFromNumber();
    objc_msgSend(v8, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vocabularyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = v10;
    v38 = a5;
    if (v13)
    {
      objc_msgSend(v8, "vocabularyIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    KVHash64String();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u#%llx"), (unsigned __int16)v11, objc_msgSend(v16, "longLongValue"));
    v17 = objc_claimAutoreleasedReturnValue();
    builder = self->_builder;
    v44 = 0;
    v39 = (void *)v17;
    -[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v44;
    v21 = v20;
    if (v19)
    {
      v22 = self->_builder;
      objc_msgSend(v8, "string");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v21;
      -[KVItemBuilder addFieldWithType:value:error:](v22, "addFieldWithType:value:error:", v11, v23, &v43);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v43;

      if (v24)
      {
        v26 = self->_builder;
        objc_msgSend(v8, "vocabularyIdentifier");
        v36 = v23;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v25;
        -[KVItemBuilder addFieldWithType:value:error:](v26, "addFieldWithType:value:error:", 20, v27, &v42);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v42;

        if (v28)
        {
          v29 = self->_builder;
          v41 = v37;
          -[KVItemBuilder buildItemWithError:](v29, "buildItemWithError:", &v41);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v41;

          if (v30)
          {
            v45 = v30;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            KMMapperSetBuilderError((uint64_t)v38, v25);
            v31 = 0;
          }

          goto LABEL_18;
        }
        v25 = v37;
      }
      else
      {

      }
    }
    else
    {
      v25 = v20;
    }
    KMMapperSetBuilderError((uint64_t)v38, v25);
    v31 = 0;
LABEL_18:
    v10 = v40;

    v34 = v39;
    goto LABEL_19;
  }
  v32 = (void *)MEMORY[0x24BDD1540];
  v48 = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected additional field with type: %i"), 4294967294);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  KVSetError();
  v31 = 0;
LABEL_20:

  return v31;
}

@end
