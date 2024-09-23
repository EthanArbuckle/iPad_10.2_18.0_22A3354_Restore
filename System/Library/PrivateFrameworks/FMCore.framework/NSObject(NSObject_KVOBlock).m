@implementation NSObject(NSObject_KVOBlock)

- (id)addKVOBlockForKeyPath:()NSObject_KVOBlock options:handler:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  KVOBlockHelperForObject(a1, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertNewTokenForKeyPath:block:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addObserver:forKeyPath:options:context:", v10, v9, a4, objc_msgSend(v11, "context"));
  return v11;
}

- (void)removeKVOBlockForToken:()NSObject_KVOBlock
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  KVOBlockHelperForObject(a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "context");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v4, "keypath");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v8, "length"))
    {
      objc_msgSend(a1, "removeObserver:forKeyPath:context:", v5, v8, v7);
      objc_msgSend(v5, "removeHandlerForKey:", v4);
    }
    else
    {
      LogCategory_Unspecified();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NSObject(NSObject_KVOBlock) removeKVOBlockForToken:].cold.2((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);

    }
  }
  else
  {
    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NSObject(NSObject_KVOBlock) removeKVOBlockForToken:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (id)allKVOObservers
{
  void *v1;
  void *v2;

  KVOBlockHelperForObject(a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allKVOObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)addOneShotKVOBlockForKeyPath:()NSObject_KVOBlock options:handler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__NSObject_NSObject_KVOBlock__addOneShotKVOBlockForKeyPath_options_handler___block_invoke;
  v16[3] = &unk_1E82AAA70;
  v10 = v9;
  v16[4] = a1;
  v17 = v10;
  v18 = &v19;
  v11 = (void *)MEMORY[0x1CAA45B8C](v16);
  objc_msgSend(a1, "addKVOBlockForKeyPath:options:handler:", v8, a4, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v20[5];
  v20[5] = v12;

  v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)removeKVOBlockForToken:()NSObject_KVOBlock .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, a2, a3, "No context in removeKVOBlockForToken: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)removeKVOBlockForToken:()NSObject_KVOBlock .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, a2, a3, "No keyPath in removeKVOBlockForToken: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
