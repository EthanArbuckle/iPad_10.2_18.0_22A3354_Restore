@implementation HDAddStateHandler

_DWORD *__HDAddStateHandler_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  unsigned int v6;
  size_t v7;
  _DWORD *v8;
  _DWORD *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 32);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    v6 = objc_msgSend(v4, "length");
    v7 = v6 + 200;
    v8 = malloc_type_malloc(v7, 0xBD14D538uLL);
    v9 = v8;
    if (v8)
    {
      bzero(v8, v7);
      *v9 = 1;
      v9[1] = v6;
      objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
      __strlcpy_chk();
      objc_msgSend(v4, "getBytes:length:", v9 + 50, v6);
    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Error serializing dictionary into data for State Data: %{public}@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

@end
