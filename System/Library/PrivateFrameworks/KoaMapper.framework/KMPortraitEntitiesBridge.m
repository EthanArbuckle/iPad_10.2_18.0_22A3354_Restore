@implementation KMPortraitEntitiesBridge

- (KMPortraitEntitiesBridge)init
{
  KMPortraitEntitiesBridge *v2;
  uint64_t v3;
  id v4;
  KVItemMapper *itemMapper;
  uint64_t v6;
  NSNumber *alternativeItemIdKey;
  KMPortraitEntitiesBridge *v8;
  NSObject *v9;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)KMPortraitEntitiesBridge;
  v2 = -[KMPortraitEntitiesBridge init](&v12, sel_init);
  if (!v2)
    goto LABEL_4;
  v11 = 0;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v11);
  v4 = v11;
  itemMapper = v2->_itemMapper;
  v2->_itemMapper = (KVItemMapper *)v3;

  if (v2->_itemMapper)
  {
    KVAdditionalFieldTypeToNumber();
    v6 = objc_claimAutoreleasedReturnValue();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v6;

LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }
  v9 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[KMPortraitEntitiesBridge init]";
    v15 = 2112;
    v16 = v4;
    _os_log_error_impl(&dword_218838000, v9, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (unsigned)cascadeItemType
{
  return *MEMORY[0x24BE15620];
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E8A8];
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  int v10;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  id obj;
  _QWORD v19[3];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  id v32;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BE71B08]);
  objc_msgSend(v6, "setLimit:", 500);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__445;
  v31[4] = __Block_byref_object_dispose__446;
  v32 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__445;
  v25 = __Block_byref_object_dispose__446;
  v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v7 = (void *)objc_opt_new();
  v8 = (id *)(v22 + 5);
  obj = (id)v22[5];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__KMPortraitEntitiesBridge_enumerateItemsWithError_usingBlock___block_invoke;
  v12[3] = &unk_24D961358;
  v14 = v31;
  v15 = v19;
  v12[4] = self;
  v16 = &v21;
  v17 = &v27;
  v9 = v5;
  v13 = v9;
  objc_msgSend(v7, "iterRankedNamedEntitiesWithQuery:error:block:", v6, &obj, v12);
  objc_storeStrong(v8, obj);

  v10 = *((unsigned __int8 *)v28 + 24);
  if (*((_BYTE *)v28 + 24))
    KVSetError();

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);

  return v10 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

void __63__KMPortraitEntitiesBridge_enumerateItemsWithError_usingBlock___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id obj;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)MEMORY[0x219A1AD04]();
  v29 = *(_QWORD *)(a1[4] + 16);
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(unsigned int *)(v8 + 24);
  *(_DWORD *)(v8 + 24) = v9 + 1;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%ld"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(void **)(a1[4] + 8);
  v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v16 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v16 + 40);
  objc_msgSend(v14, "mapObject:additionalFields:error:", v5, v15, &obj);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v16 + 40), obj);
  if (objc_msgSend(v17, "count") == 1)
  {
    v18 = a1[5];
    objc_msgSend(v17, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = (*(uint64_t (**)(uint64_t, void *))(v18 + 16))(v18, v19);

    if ((v18 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v20 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      *(_DWORD *)buf = 136315650;
      v24 = "-[KMPortraitEntitiesBridge enumerateItemsWithError:usingBlock:]_block_invoke";
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v21;
      _os_log_error_impl(&dword_218838000, v20, OS_LOG_TYPE_ERROR, "%s Unexepected items: %@ error: %@", buf, 0x20u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  *a3 = 1;
LABEL_7:

  objc_autoreleasePoolPop(v6);
}

@end
