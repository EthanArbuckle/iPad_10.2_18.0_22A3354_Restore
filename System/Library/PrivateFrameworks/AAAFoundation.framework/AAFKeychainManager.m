@implementation AAFKeychainManager

- (AAFKeychainManager)init
{
  AAFKeychainManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *keychainQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAFKeychainManager;
  v2 = -[AAFKeychainManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.aaaf.keychain", v3);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)keychainItemForDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *keychainQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  keychainQueue = self->_keychainQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__AAFKeychainManager_keychainItemForDescriptor_error___block_invoke;
  v11[3] = &unk_1E9946440;
  v13 = &v21;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v15;
  dispatch_sync(keychainQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __54__AAFKeychainManager_keychainItemForDescriptor_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_unsafe_fetchKeychainItemWithDescriptor:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_unsafe_fetchKeychainItemWithDescriptor:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OSStatus v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeID v17;
  void *v18;
  AAFKeychainItem *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CFTypeRef result;

  v5 = a3;
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
  objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0CD7018]);
  objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0CD6F40], *MEMORY[0x1E0CD6F30]);
  result = 0;
  v9 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
  if (a4 && v9)
  {
    *a4 = (id)SecCopyLastError();
    _AAFLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AAFKeychainManager _unsafe_fetchKeychainItemWithDescriptor:error:].cold.1((uint64_t)a4, v10, v11, v12, v13, v14, v15, v16);

  }
  if (result && (v17 = CFGetTypeID(result), v17 == CFDictionaryGetTypeID()))
  {
    v18 = (void *)result;
    v19 = -[AAFKeychainItem initWithAttributes:]([AAFKeychainItem alloc], "initWithAttributes:", result);
    -[AAFKeychainItem descriptor](v19, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "itemClass");

    if (!v21)
    {
      -[AAFKeychainItem descriptor](v19, "descriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setItemClass:", objc_msgSend(v5, "itemClass"));

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainQueue, 0);
}

- (void)addKeychainItem:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *keychainQueue;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AAFKeychainManager_addKeychainItem_error___block_invoke;
  block[3] = &unk_1E9946418;
  block[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __44__AAFKeychainManager_addKeychainItem_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_unsafe_addKeychainItem:shouldAttemptUpdate:error:", v1, 0, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (void)addOrUpdateKeychainItem:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *keychainQueue;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AAFKeychainManager_addOrUpdateKeychainItem_error___block_invoke;
  block[3] = &unk_1E9946418;
  block[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __52__AAFKeychainManager_addOrUpdateKeychainItem_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_unsafe_addKeychainItem:shouldAttemptUpdate:error:", v1, 1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (void)updateKeychainItem:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *keychainQueue;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AAFKeychainManager_updateKeychainItem_error___block_invoke;
  block[3] = &unk_1E9946418;
  block[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __47__AAFKeychainManager_updateKeychainItem_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_unsafe_updateKeychainItemWithDescriptor:newItem:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);

}

- (id)keychainItemsForDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *keychainQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  keychainQueue = self->_keychainQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__AAFKeychainManager_keychainItemsForDescriptor_error___block_invoke;
  v11[3] = &unk_1E9946440;
  v13 = &v21;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v15;
  dispatch_sync(keychainQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __55__AAFKeychainManager_keychainItemsForDescriptor_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_unsafe_fetchKeychainItemsWithDescriptor:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)deleteKeychainItemsForDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *keychainQueue;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AAFKeychainManager_deleteKeychainItemsForDescriptor_error___block_invoke;
  block[3] = &unk_1E9946418;
  block[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  dispatch_sync(keychainQueue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);

  _Block_object_dispose(&v12, 8);
}

void __61__AAFKeychainManager_deleteKeychainItemsForDescriptor_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_unsafe_deleteKeychainItemWithDescriptor:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (void)_unsafe_addKeychainItem:(id)a3 shouldAttemptUpdate:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  const __CFDictionary *v8;
  OSStatus v9;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  objc_msgSend(v12, "itemAttributes");
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v9 = SecItemAdd(v8, 0);
  if (v9 != -25299 || !v6)
  {
    if (a5 && v9)
      *a5 = (id)SecCopyLastError();
  }
  else
  {
    objc_msgSend(v12, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFKeychainManager _unsafe_updateKeychainItemWithDescriptor:newItem:error:](self, "_unsafe_updateKeychainItemWithDescriptor:newItem:error:", v11, v12, a5);

  }
}

- (BOOL)_unsafe_updateKeychainItemWithDescriptor:(id)a3 newItem:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a4;
  objc_msgSend(a3, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v10, "removeObjectForKey:", *MEMORY[0x1E0CD6C98]);
  v11 = SecItemUpdateWithError();
  if (a5)
    *a5 = objc_retainAutorelease(0);

  return v11;
}

- (id)_unsafe_fetchKeychainItemsWithDescriptor:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  OSStatus v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  CFTypeID v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  AAFKeychainItem *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CFTypeRef result;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend(v32, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x1E0CD7018]);
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
  result = 0;
  v8 = SecItemCopyMatching((CFDictionaryRef)v6, &result);
  if (a4 && v8)
  {
    *a4 = (id)SecCopyLastError();
    _AAFLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AAFKeychainManager _unsafe_fetchKeychainItemsWithDescriptor:error:].cold.1((uint64_t)a4, v9, v10, v11, v12, v13, v14, v15);

  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (result)
  {
    v17 = CFGetTypeID(result);
    if (v17 == CFArrayGetTypeID())
    {
      v31 = v6;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v18 = (id)result;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v23;
              v25 = -[AAFKeychainItem initWithAttributes:]([AAFKeychainItem alloc], "initWithAttributes:", v24);

              -[AAFKeychainItem descriptor](v25, "descriptor");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "itemClass");

              if (!v27)
              {
                -[AAFKeychainItem descriptor](v25, "descriptor");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setItemClass:", objc_msgSend(v32, "itemClass"));

              }
              objc_msgSend(v16, "addObject:", v25, v31);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v20);
      }

      v6 = v31;
    }
  }
  v29 = (void *)objc_msgSend(v16, "copy", v31);

  return v29;
}

- (BOOL)_unsafe_deleteKeychainItemWithDescriptor:(id)a3 error:(id *)a4
{
  const __CFDictionary *v5;
  OSStatus v6;
  OSStatus v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a3, "attributes");
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = SecItemDelete(v5);
  v7 = v6;
  if (a4 && v6)
  {
    *a4 = (id)SecCopyLastError();
    _AAFLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAFKeychainManager _unsafe_deleteKeychainItemWithDescriptor:error:].cold.1((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);

  }
  return v7 == 0;
}

- (void)_unsafe_fetchKeychainItemWithDescriptor:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, a2, a3, "Error fetching keychain item - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_unsafe_fetchKeychainItemsWithDescriptor:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, a2, a3, "Error fetching keychain items - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_unsafe_deleteKeychainItemWithDescriptor:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, a2, a3, "Error deleting keychain items - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
