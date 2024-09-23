@implementation IKJSStorage

- (IKJSStorage)initWithAppContext:(id)a3 appStorage:(id)a4
{
  id v6;
  id v7;
  IKJSStorage *v8;
  IKJSStorage *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *storageQueue;
  uint64_t v17;
  NSMutableDictionary *storageDict;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IKJSStorage;
  v8 = -[IKJSObject initWithAppContext:](&v20, sel_initWithAppContext_, v6);
  v9 = v8;
  if (v8)
  {
    v10 = objc_storeWeak((id *)&v8->_appStorage, v7);
    v9->_flags.usesExternalDataStore = v7 != 0;

    v9->_flags.externalStorageHasDictionaryRepresentation = objc_opt_respondsToSelector() & 1;
    if (!v9->_flags.usesExternalDataStore)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "app");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_Storage_Queue"), v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
      storageQueue = v9->_storageQueue;
      v9->_storageQueue = (OS_dispatch_queue *)v15;

      v17 = objc_opt_new();
      storageDict = v9->_storageDict;
      v9->_storageDict = (NSMutableDictionary *)v17;

    }
  }

  return v9;
}

- (unint64_t)length
{
  void *v3;
  unint64_t v4;
  NSObject *v6;
  unint64_t v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (self->_flags.usesExternalDataStore)
  {
    -[IKJSStorage _verifyExternalDataStoreForKey:](self, "_verifyExternalDataStoreForKey:", 0);
    -[IKJSStorage appStorage](self, "appStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    return v4;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[IKJSStorage storageQueue](self, "storageQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __21__IKJSStorage_length__block_invoke;
    v8[3] = &unk_1E9F4C0D0;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v6, v8);

    v7 = v10[3];
    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

void __21__IKJSStorage_length__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)key:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v8;
  id v9;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (self->_flags.usesExternalDataStore)
  {
    -[IKJSStorage _verifyExternalDataStoreForKey:](self, "_verifyExternalDataStoreForKey:", 0);
    -[IKJSStorage appStorage](self, "appStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__11;
    v15 = __Block_byref_object_dispose__11;
    v16 = 0;
    -[IKJSStorage storageQueue](self, "storageQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __19__IKJSStorage_key___block_invoke;
    block[3] = &unk_1E9F4C0F8;
    block[5] = &v11;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(v8, block);

    v9 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

    return v9;
  }
}

void __19__IKJSStorage_key___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 < v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "storageDict");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)getItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  if (self->_flags.usesExternalDataStore)
  {
    -[IKJSStorage _verifyExternalDataStoreForKey:](self, "_verifyExternalDataStoreForKey:", v4);
    -[IKJSStorage appStorage](self, "appStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getDataForKey:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__11;
    v17 = __Block_byref_object_dispose__11;
    v18 = 0;
    if (objc_msgSend(v4, "length"))
    {
      -[IKJSStorage storageQueue](self, "storageQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __23__IKJSStorage_getItem___block_invoke;
      block[3] = &unk_1E9F4C120;
      v12 = &v13;
      block[4] = self;
      v11 = v5;
      dispatch_sync(v8, block);

    }
    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  return v7;
}

void __23__IKJSStorage_getItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setItem:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_flags.usesExternalDataStore)
  {
    -[IKJSStorage _verifyExternalDataStoreForKey:](self, "_verifyExternalDataStoreForKey:", v6);
    -[IKJSStorage appStorage](self, "appStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getDataForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSStorage appStorage](self, "appStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "setData:forKey:", v7, v6);

    if (v11 == 102)
    {
      -[IKJSObject appContext](self, "appContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setException:withErrorMessage:", 0, CFSTR("QuotaExceededError"));

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99E08];
      v22[0] = CFSTR("IKJSStorageKeyKey");
      v22[1] = CFSTR("IKJSStorageValueKey");
      v23[0] = v6;
      v23[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dictionaryWithDictionary:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v16, "setObject:forKey:", v9, CFSTR("IKJSStorageOldValueKey"));
        v17 = CFSTR("IKJSStorageItemUpdatedNotification");
      }
      else
      {
        v17 = CFSTR("IKJSStorageItemAddedNotification");
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", v17, self, v16);

    }
  }
  else if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    -[IKJSStorage storageQueue](self, "storageQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __24__IKJSStorage_setItem::__block_invoke;
    v19[3] = &unk_1E9F4C148;
    v19[4] = self;
    v20 = v6;
    v21 = v7;
    dispatch_async(v13, v19);

  }
}

void __24__IKJSStorage_setItem::__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  v5 = (void *)MEMORY[0x1E0C99E08];
  v11[0] = CFSTR("IKJSStorageKeyKey");
  v11[1] = CFSTR("IKJSStorageValueKey");
  v6 = *(_QWORD *)(a1 + 48);
  v12[0] = *(_QWORD *)(a1 + 40);
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v8, "setObject:forKey:", v3, CFSTR("IKJSStorageOldValueKey"));
    v9 = CFSTR("IKJSStorageItemUpdatedNotification");
  }
  else
  {
    v9 = CFSTR("IKJSStorageItemAddedNotification");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", v9, *(_QWORD *)(a1 + 32), v8);

}

- (void)removeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_flags.usesExternalDataStore)
  {
    -[IKJSStorage _verifyExternalDataStoreForKey:](self, "_verifyExternalDataStoreForKey:", v4);
    -[IKJSStorage appStorage](self, "appStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeDataForKey:", v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("IKJSStorageKeyKey");
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("IKJSStorageItemRemovedNotification"), self, v8);

  }
  else if (objc_msgSend(v4, "length"))
  {
    -[IKJSStorage storageQueue](self, "storageQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__IKJSStorage_removeItem___block_invoke;
    block[3] = &unk_1E9F4C170;
    block[4] = self;
    v11 = v5;
    dispatch_async(v9, block);

  }
}

void __26__IKJSStorage_removeItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "storageDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v9 = CFSTR("IKJSStorageKeyKey");
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("IKJSStorageItemRemovedNotification"), v7, v8);

  }
}

- (void)clear
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];

  if (self->_flags.usesExternalDataStore)
  {
    -[IKJSStorage _verifyExternalDataStoreForKey:](self, "_verifyExternalDataStoreForKey:", 0);
    -[IKJSStorage appStorage](self, "appStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clear");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("IKJSStorageItemsClearedNotification"), self);

  }
  else
  {
    -[IKJSStorage storageQueue](self, "storageQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__IKJSStorage_clear__block_invoke;
    block[3] = &unk_1E9F4BD18;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __20__IKJSStorage_clear__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("IKJSStorageItemsClearedNotification"), *(_QWORD *)(a1 + 32));

}

- (id)keysAndValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  if (self->_flags.usesExternalDataStore)
  {
    if (self->_flags.externalStorageHasDictionaryRepresentation)
    {
      -[IKJSStorage appStorage](self, "appStorage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dictionaryRepresentation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)v12[5];
      v12[5] = v5;

    }
  }
  else
  {
    -[IKJSStorage storageQueue](self, "storageQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__IKJSStorage_keysAndValues__block_invoke;
    v10[3] = &unk_1E9F4C0D0;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(v7, v10);

  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __28__IKJSStorage_keysAndValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_verifyExternalDataStoreForKey:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;

  v4 = a3;
  -[IKJSStorage appStorage](self, "appStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("; lost data for %@"), v4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E9F50578;
    }
    ITMLKitGetLogObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[IKJSStorage _verifyExternalDataStoreForKey:].cold.1((uint64_t)v6, v7);

  }
}

- (IKAppDataStoring)appStorage
{
  return (IKAppDataStoring *)objc_loadWeakRetained((id *)&self->_appStorage);
}

- (NSMutableDictionary)storageDict
{
  return self->_storageDict;
}

- (void)setStorageDict:(id)a3
{
  objc_storeStrong((id *)&self->_storageDict, a3);
}

- (OS_dispatch_queue)storageQueue
{
  return self->_storageQueue;
}

- (void)setStorageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_storageQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_storageDict, 0);
  objc_destroyWeak((id *)&self->_appStorage);
}

- (void)_verifyExternalDataStoreForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Missing app data store%@", (uint8_t *)&v2, 0xCu);
}

@end
