@implementation MCLogAddStateHandlerWithName

_DWORD *__MCLogAddStateHandlerWithName_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _DWORD *v8;
  _DWORD *v9;
  NSObject *v10;
  NSObject *v11;
  const void *v12;
  unint64_t v13;
  size_t v14;
  id v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    _MCTransformStateValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v17;
    if (v6)
    {
      MCLogCategoryDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v6;
        _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_ERROR, "Error serializing state capture: %{public}@", buf, 0xCu);
      }
      v8 = 0;
    }
    else
    {
      v9 = malloc_type_calloc(1uLL, objc_msgSend(v5, "length") + 200, 0xC7D00C9FuLL);
      v8 = v9;
      if (!v9)
      {
LABEL_15:

        return v8;
      }
      *v9 = 1;
      v9[1] = objc_msgSend(v5, "length");
      objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
      v10 = objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (v10)
      {
        v11 = objc_retainAutorelease(v10);
        v12 = (const void *)-[NSObject bytes](v11, "bytes");
        v13 = -[NSObject length](v11, "length");
        if (v13 >= 0x3F)
          v14 = 63;
        else
          v14 = v13;
        memcpy(v8 + 34, v12, v14);
      }
      v15 = objc_retainAutorelease(v5);
      memcpy(v8 + 50, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    }

    goto LABEL_15;
  }
  return 0;
}

@end
