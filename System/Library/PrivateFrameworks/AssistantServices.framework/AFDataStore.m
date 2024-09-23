@implementation AFDataStore

- (AFDataStore)initWithEntries:(id)a3
{
  id v4;
  AFDataStore *v5;
  uint64_t v6;
  NSMutableDictionary *entries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFDataStore;
  v5 = -[AFDataStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (AFDataStore)init
{
  void *v3;
  AFDataStore *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFDataStore initWithEntries:](self, "initWithEntries:", v3);

  return v4;
}

- (void)setImageData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _AFDataStoreEntry *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_AFDataStoreEntry initWithType:value:]([_AFDataStoreEntry alloc], "initWithType:value:", 1, v7);

  -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:", v8, v6);
}

- (id)imageDataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "type") != 1)
  {
    v8 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v10 = v8;
      objc_msgSend(v6, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[AFDataStore imageDataForKey:]";
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s returning nil because value for key \"%@\" is %@, which cannot be coerced to an image", (uint8_t *)&v12, 0x20u);

    }
    goto LABEL_6;
  }
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v7;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  NSMutableDictionary *entries;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E3AA63B8, CFSTR("Version"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entries, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  entries = self->_entries;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__AFDataStore_propertyListRepresentation__block_invoke;
  v8[3] = &unk_1E3A307A0;
  v9 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](entries, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("Entries"));

  return v3;
}

- (AFDataStore)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  AFDictionarySchema *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  AFDataStore *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AFDictionarySchema);
  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v6, CFSTR("Version"));

  +[AFCoercion coercionWithBlock:](AFCoercion, "coercionWithBlock:", &__block_literal_global_15424);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v7, CFSTR("Entries"));

  v20 = 0;
  -[AFDictionarySchema coerceObject:error:](v5, "coerceObject:error:", v4, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (!v8)
  {
    v14 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v13 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315650;
    v22 = "-[AFDataStore initWithPropertyListRepresentation:]";
    v23 = 2112;
    v24 = (uint64_t)v4;
    v25 = 2114;
    v26 = v9;
    v15 = "%s returning nil; passed invalid property list (%@): %{public}@";
    v16 = v14;
    v17 = 32;
LABEL_10:
    _os_log_error_impl(&dword_19AF50000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_7;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("Version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 != 1)
  {
    v18 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    v22 = "-[AFDataStore initWithPropertyListRepresentation:]";
    v23 = 2050;
    v24 = v11;
    v15 = "%s unable to deserialize property list with version %{public}ld; returning nil";
    v16 = v18;
    v17 = 22;
    goto LABEL_10;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("Entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[AFDataStore initWithEntries:](self, "initWithEntries:", v12);

  v13 = self;
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

id __50__AFDataStore_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a2;
  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__15429;
  v24 = __Block_byref_object_dispose__15430;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15429;
  v18 = __Block_byref_object_dispose__15430;
  v19 = 0;
  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;
  obj = v21[5];
  objc_msgSend(v5, "coerceObject:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v6 + 5, obj);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v15[5];
    v15[5] = v8;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__AFDataStore_initWithPropertyListRepresentation___block_invoke_28;
    v12[3] = &unk_1E3A30808;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v21[5]);
  v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __50__AFDataStore_initWithPropertyListRepresentation___block_invoke_28(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  _AFDataStoreEntry *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v14 = 0;
  v9 = -[_AFDataStoreEntry initWithPropertyListRepresentation:error:]([_AFDataStoreEntry alloc], "initWithPropertyListRepresentation:error:", v8, &v14);

  v10 = v14;
  v11 = v14;
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v9, v7);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

    *a4 = 1;
  }

}

void __41__AFDataStore_propertyListRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "propertyListRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

@end
