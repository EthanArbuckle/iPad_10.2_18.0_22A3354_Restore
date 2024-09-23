@implementation INCDecodeHashedRouteUIDs

void __INCDecodeHashedRouteUIDs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "INCDecodeHashedRouteUIDs_block_invoke";
      v22 = 2112;
      v23 = v6;
      _os_log_error_impl(&dword_1B727D000, v7, OS_LOG_TYPE_ERROR, "%s Decoding error: %@", buf, 0x16u);
    }
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1317, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __INCDecodeHashedRouteUIDs_block_invoke_15;
    v18[3] = &unk_1E6BC4500;
    v9 = v10;
    v19 = v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v18);
    v11 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v11 == objc_msgSend(v9, "count"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v12 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v17 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v21 = "INCDecodeHashedRouteUIDs_block_invoke";
        v22 = 2112;
        v23 = v17;
        v24 = 2114;
        v25 = v9;
        _os_log_error_impl(&dword_1B727D000, v12, OS_LOG_TYPE_ERROR, "%s Decoding error. Hashed route UIDs = %@, decoded route UIDs = %{public}@", buf, 0x20u);
      }
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1317, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = 0;

}

void __INCDecodeHashedRouteUIDs_block_invoke_15(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  v10 = *MEMORY[0x1E0CBD670];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315650;
      v12 = "INCDecodeHashedRouteUIDs_block_invoke";
      v13 = 2112;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      _os_log_debug_impl(&dword_1B727D000, v10, OS_LOG_TYPE_DEBUG, "%s %@ => %{public}@", (uint8_t *)&v11, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315650;
      v12 = "INCDecodeHashedRouteUIDs_block_invoke";
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_1B727D000, v10, OS_LOG_TYPE_ERROR, "%s Failed to convert decoded data %@ to a string for hashed route UID %@", (uint8_t *)&v11, 0x20u);
    }
    *a4 = 1;
  }

}

@end
