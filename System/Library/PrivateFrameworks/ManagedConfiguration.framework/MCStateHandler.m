@implementation MCStateHandler

+ (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v10 = a3;
    _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_DEBUG, "Adding os_state handler: %{public}s", buf, 0xCu);
  }
  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  os_state_add_handler();

}

_DWORD *__53__MCStateHandler_addStateHandlerWithName_stateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  _DWORD *v11;
  unsigned int v12;
  size_t v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136446210;
    v17 = v4;
    _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEBUG, "Processing os_state handler: %{public}s", buf, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = objc_msgSend(v6, "length");
  if (v7)
  {
    v9 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136446466;
      v17 = v10;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_19ECC4000, v9, OS_LOG_TYPE_ERROR, "Error serializing state data for \"%{public}s\": %{public}@", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    v12 = v8;
    v13 = v8;
    v11 = malloc_type_calloc(1uLL, v8 + 200, 0x57B48BA3uLL);
    *v11 = 1;
    v11[1] = v12;
    __strlcpy_chk();
    memcpy(v11 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v13);
  }

  return v11;
}

@end
