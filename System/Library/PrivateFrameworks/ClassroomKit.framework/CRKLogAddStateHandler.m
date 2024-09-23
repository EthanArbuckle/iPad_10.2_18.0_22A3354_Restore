@implementation CRKLogAddStateHandler

_DWORD *__CRKLogAddStateHandler_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  NSObject *v14;
  NSObject *v15;
  const void *v16;
  unint64_t v17;
  size_t v18;
  id v19;
  id v21;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v21);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v21;
    if (v4)
    {
      _CRKLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __CRKLogAddStateHandler_block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
      v12 = 0;
    }
    else
    {
      v13 = malloc_type_calloc(1uLL, objc_msgSend(v3, "length") + 200, 0xB21EA881uLL);
      v12 = v13;
      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      *v13 = 1;
      v13[1] = objc_msgSend(v3, "length");
      objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
      v14 = objc_claimAutoreleasedReturnValue();
      v5 = v14;
      if (v14)
      {
        v15 = objc_retainAutorelease(v14);
        v16 = (const void *)-[NSObject bytes](v15, "bytes");
        v17 = -[NSObject length](v15, "length");
        if (v17 >= 0x3F)
          v18 = 63;
        else
          v18 = v17;
        memcpy(v12 + 34, v16, v18);
      }
      v19 = objc_retainAutorelease(v3);
      memcpy(v12 + 50, (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
    }

    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

void __CRKLogAddStateHandler_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_218C99000, a2, a3, "Error serializing dictionary for State Capture: %{public}@", a5, a6, a7, a8, 2u);
}

@end
