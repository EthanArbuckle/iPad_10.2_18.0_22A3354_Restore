@implementation MSVLogAddStateHandler

_DWORD *__MSVLogAddStateHandler_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  void *v12;
  void *v13;
  id v14;
  const void *v15;
  unint64_t v16;
  size_t v17;
  id v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a2 + 16);
  MSVNanoIDCreateWithCharacters(CFSTR("eilotrmapdnsIcufkMShjTRxgC4013bDNvwyUL2O856PB79AFKEWVzGJHYX"), 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 3)
  {
    v5 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v20 = 138543618;
      v21 = v6;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1A077D000, v5, OS_LOG_TYPE_DEFAULT, "MSVStateHandler callout [begin] name=%{public}@ id=%{public}@", (uint8_t *)&v20, 0x16u);
    }

    v7 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v20 = 138543618;
      v21 = v9;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_DEFAULT, "MSVStateHandler callout [end] name=%{public}@ id=%{public}@", (uint8_t *)&v20, 0x16u);
    }

    if (v7)
      goto LABEL_7;
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  v7 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!v7)
    goto LABEL_15;
LABEL_7:
  v10 = malloc_type_calloc(1uLL, objc_msgSend(v7, "length") + 200, 0x448D9139uLL);
  v11 = v10;
  if (v10)
  {
    *v10 = 1;
    v10[1] = objc_msgSend(v7, "length");
    objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_retainAutorelease(v12);
      v15 = (const void *)objc_msgSend(v14, "bytes");
      v16 = objc_msgSend(v14, "length");
      if (v16 >= 0x3F)
        v17 = 63;
      else
        v17 = v16;
      memcpy(v11 + 34, v15, v17);
    }
    v18 = objc_retainAutorelease(v7);
    memcpy(v11 + 50, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));

  }
LABEL_16:

  return v11;
}

uint64_t __MSVLogAddStateHandler_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _MSVTransformStateValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v12);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v3 && v2 && v5)
  {
    v7 = os_log_create("com.apple.amp.MediaServices", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v13[0] = CFSTR("0:value");
      v13[1] = CFSTR("1:transformedValue");
      v14[0] = v2;
      v14[1] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_FAULT, "Failure to serialize state dump: %{public}@", buf, 0xCu);

    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVLogStateHandle MSVLogAddStateHandler(__strong dispatch_queue_t _Nonnull, NSString *__strong _Nonnull, _MSVLogState  _Nullable (^__strong _Nonnull)(MSVLogStateHints, __strong _MSVLogStateEncode))_block_invoke");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("OSLog+MSVAdditions.m"), 65, CFSTR("Error serializing state capture: %@"), v6);

LABEL_9:
  return v4;
}

@end
