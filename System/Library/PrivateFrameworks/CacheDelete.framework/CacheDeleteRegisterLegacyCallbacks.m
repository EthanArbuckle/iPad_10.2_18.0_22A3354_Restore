@implementation CacheDeleteRegisterLegacyCallbacks

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (*(uint64_t (**)(void))(v2 + 16))();
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_error_impl(&dword_1A3662000, v4, OS_LOG_TYPE_ERROR, "%@ has a PURGEABLE property, but the callback is NULL", buf, 0xCu);
    }

    v3 = 0;
  }
  getRootVolume();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 2);
  v7 = objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke_216(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  uint8_t buf[4];
  _BYTE v22[18];
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "longLongValue");
    if (v6 == -1)
    {
      CDGetLogHandle((uint64_t)"client");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A3662000, v7, OS_LOG_TYPE_ERROR, "Boot volume not included in info dict, returning nil", buf, 2u);
      }
      v8 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v22 = 420;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v5;
      _os_log_error_impl(&dword_1A3662000, v9, OS_LOG_TYPE_ERROR, "%d num is not a number: %@", buf, 0x12u);
    }

    v6 = 0;
  }
  v10 = *(_QWORD *)(a1 + 32);
  CDGetLogHandle((uint64_t)"client");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v22 = v13;
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = v6;
      v23 = 1024;
      v24 = a2;
      _os_log_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEFAULT, "calling %@'s purge with %lld at urgency %d", buf, 0x1Cu);
    }

    v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CDGetLogHandle((uint64_t)"client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v22 = v15;
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = v14;
      _os_log_impl(&dword_1A3662000, v12, OS_LOG_TYPE_DEFAULT, "%@ returned: %lld", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v22 = v18;
      _os_log_error_impl(&dword_1A3662000, v12, OS_LOG_TYPE_ERROR, "%@ has a PURGE property, but the callback is NULL", buf, 0xCu);
    }
    v14 = 0;
  }

  getRootVolume();
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 2);
  v8 = objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v8;
}

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke_217(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");
  if (v6 == -1)
  {
    v10 = 0;
  }
  else
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v7, a2);
    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v19 = v15;
        _os_log_error_impl(&dword_1A3662000, v11, OS_LOG_TYPE_ERROR, "%@ has periodic property in CacheDelete.plist, but a NULL callback", buf, 0xCu);
      }

      v9 = 0;
    }
    getRootVolume();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9, CFSTR("CACHE_DELETE_VOLUME"), CFSTR("CACHE_DELETE_AMOUNT"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 2);
    v10 = objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

@end
